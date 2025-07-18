package main

import (
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"sort"
	"strings"
)

// Reporter 处理分析结果的报告和统计
type Reporter struct {
	OutputDir string
}

// NewReporter 创建报告生成器
func NewReporter(outputDir string) *Reporter {
	return &Reporter{
		OutputDir: outputDir,
	}
}

// SaveAnalysisResult 保存单个分析结果到文件
func (r *Reporter) SaveAnalysisResult(result *AnalysisResult, originalFilePath string) error {
	// 确保不修改原始文件，而是创建新的分析结果文件
	analysisPath := originalFilePath + ".analysis"

	// 序列化结果
	resultJSON, err := json.MarshalIndent(result, "", "  ")
	if err != nil {
		return fmt.Errorf("序列化分析结果失败: %v", err)
	}

	// 写入文件
	if err := os.WriteFile(analysisPath, resultJSON, 0644); err != nil {
		return fmt.Errorf("写入分析结果文件失败: %v", err)
	}

	return nil
}

// GenerateSummaryReport 生成汇总报告
func (r *Reporter) GenerateSummaryReport(stats *ErrorStatistics, totalFiles int) error {
	// 创建报告目录
	reportDir := filepath.Join(r.OutputDir, "analysis_reports")
	if err := os.MkdirAll(reportDir, 0755); err != nil {
		return fmt.Errorf("创建报告目录失败: %v", err)
	}

	// 创建汇总报告文件
	reportPath := filepath.Join(reportDir, "summary_report.json")

	// 计算正确率
	correctRate := float64(stats.CorrectCount+stats.EquivalentCount) / float64(totalFiles) * 100

	// 按错误类型排序错误计数
	sort.Slice(stats.ErrorCounts, func(i, j int) bool {
		return stats.ErrorCounts[i].Count > stats.ErrorCounts[j].Count
	})

	// 创建报告数据
	report := map[string]interface{}{
		"total_files":      totalFiles,
		"correct_count":    stats.CorrectCount,
		"equivalent_count": stats.EquivalentCount,
		"ambiguous_count":  stats.AmbiguousCount,
		"error_count":      totalFiles - stats.CorrectCount - stats.EquivalentCount - stats.AmbiguousCount,
		"correct_rate":     correctRate,
		"error_statistics": map[string]interface{}{
			"syntax_error_count":     stats.SyntaxErrorCount,
			"projection_error_count": stats.ProjectionErrorCount,
			"data_error_count":       stats.DataErrorCount,
			"order_error_count":      stats.OrderErrorCount,
			"join_error_count":       stats.JoinErrorCount,
			"condition_error_count":  stats.ConditionErrorCount,
			"other_error_count":      stats.OtherErrorCount,
		},
		"error_counts": stats.ErrorCounts,
	}

	// 序列化报告
	reportJSON, err := json.MarshalIndent(report, "", "  ")
	if err != nil {
		return fmt.Errorf("序列化报告失败: %v", err)
	}

	// 写入报告文件
	if err := os.WriteFile(reportPath, reportJSON, 0644); err != nil {
		return fmt.Errorf("写入报告文件失败: %v", err)
	}

	return nil
}

// PrintSummary 打印分析结果摘要
func (r *Reporter) PrintSummary(stats *ErrorStatistics, totalFiles int) {
	// 计算正确率
	correctRate := float64(stats.CorrectCount+stats.EquivalentCount+stats.AmbiguousCount+stats.ReferenceErrorCount) / float64(totalFiles) * 100
//My ops: 这里修改彩色标题
	// 彩色标题
	fmt.Printf("\n======================================\n")
	fmt.Printf("             SQL分析结果摘要             \n")
	fmt.Printf("======================================\n\n")

	// 基本统计信息
	fmt.Printf("总查询数: %d\n" totalFiles)


	fmt.Printf("正确数量:%d (精确匹配: %d, 语义等价: %d)\n",
		 stats.CorrectCount+stats.EquivalentCount,
		 stats.CorrectCount,  stats.EquivalentCount)

	fmt.Printf("模糊查询:%d\n", stats.AmbiguousCount)

	errorCount := totalFiles - stats.CorrectCount - stats.EquivalentCount - stats.AmbiguousCount
	fmt.Printf("错误数量: %d\n",  errorCount)

	fmt.Printf("总体正确率(排除模糊和参考答案错误):%.2f%%\n\n",  correctRate)

	// 错误类型统计 - 按频率排序
	fmt.Printf("错误类型统计(按频率排序)\n")
	fmt.Printf("--------------------------------------\n")

	// 按错误类型排序错误计数
	sort.Slice(stats.ErrorCounts, func(i, j int) bool {
		return stats.ErrorCounts[i].Count > stats.ErrorCounts[j].Count
	})

	// 打印错误类型统计，使用表格式式
	fmt.Printf("%-20s %10s %15s%s\n",  "错误类型", "数量", "百分比")
	fmt.Printf("----------------------------------------\n")

	for _, ec := range stats.ErrorCounts {
		percentage := float64(ec.Count) / float64(totalFiles) * 100
		fmt.Printf("%-20s %10d %15.2f%%\n",
			ec.Type,  ec.Count,  percentage)
	}

	// 详细错误统计
	fmt.Printf("\n详细错误分类统计\n")
	fmt.Printf("--------------------------------------\n")

	// 打印详细错误统计，使用表格式式
	fmt.Printf("%-20s %10s %15s\n", "错误类型", "数量", "百分比")
	fmt.Printf("----------------------------------------\n")

	// 添加单个错误类型的打印函数
	printErrorType := func(name string, count int) {
		percent := float64(count) / float64(totalFiles) * 100
		fmt.Printf("%-20s %10d %15.2f%%\n", name,  count, percent)
	}

	// 预测SQL的语法错误
	printErrorType("语法错误", stats.SyntaxErrorCount)
	// 参考答案的语法错误
	printErrorType("参考答案语法错误", stats.ReferenceErrorCount)
	// 投影错误（列选择错误）
	printErrorType("投影错误", stats.ProjectionErrorCount)
	// 行数错误（专门统计）
	printErrorType("行数错误", stats.RowErrorCount)
	// 数据不一致错误
	printErrorType("数据不一致", stats.DataErrorCount)
	// 执行错误（已计入语法错误，这里单独显示）
	printErrorType("执行错误", stats.ExecutionErrorCount)
	// 其他错误
	printErrorType("其他错误", stats.OtherErrorCount)

	// 报告保存路径
	reportPath := filepath.Join(r.OutputDir, "analysis_reports", "summary_report.json")
	fmt.Printf("\n%s报告已保存到:%s %s%s%s\n",
		Bold, ColorReset, ColorGreen, reportPath, ColorReset)
}

// ResultClassifier 负责将分析结果按类型分类并输出到不同目录
type ResultClassifier struct {
	baseDir string
}

// NewResultClassifier 创建一个新的结果分类器
func NewResultClassifier(baseDir string) *ResultClassifier {
	return &ResultClassifier{
		baseDir: baseDir,
	}
}

// ClassifyAndSaveResults 将分析结果分类并保存到对应目录
func (rc *ResultClassifier) ClassifyAndSaveResults(results []*AnalysisResult) error {
	// 创建所有需要的目录
	directories := []string{
		"correct_exact_match",     // 精确匹配的正确结果
		"correct_equivalent",      // 语义等价的正确结果
		"incorrect_projection",    // 投影错误
		"incorrect_row_count",     // 行数错误
		"incorrect_data_mismatch", // 数据不一致错误
		"incorrect_execution",     // 执行错误
		"incorrect_reference",     // 参考答案语法错误
		"incorrect_unknown",       // 未知错误
		"ambiguous_queries",       // 模糊查询（可能添加其他类型）
	}

	for _, dir := range directories {
		fullPath := filepath.Join(rc.baseDir, dir)
		if err := EnsureDirectoryExists(fullPath); err != nil {
			return fmt.Errorf("创建目录 %s 失败: %v", fullPath, err)
		}
	}

	// 按类型分类保存结果
	for _, result := range results {
		var category string

		if result.IsCorrect {
			// 根据错误类型判断是精确匹配还是语义等价
			if result.ErrorType == "精准匹配" {
				category = "correct_exact_match"
			} else if result.ErrorType == "语义匹配" {
				category = "correct_equivalent"
			} else {
				// 向后兼容，默认为精确匹配
				category = "correct_exact_match"
			}
		} else if result.ErrorType == "模糊查询" {
			category = "ambiguous_queries"
		} else {
			// 根据错误类型分类
			switch result.ErrorType {
			case "投影错误":
				category = "incorrect_projection"
			case "行数错误":
				category = "incorrect_row_count"
			case "数据不一致错误":
				category = "incorrect_data_mismatch"
			case "执行错误":
				category = "incorrect_execution"
			case "参考答案有语法错误":
				category = "incorrect_reference"
			default:
				category = "incorrect_unknown"
			}
		}

		// 保存结果到对应目录
		filename := fmt.Sprintf("%s_%d.json", strings.ToLower(category), result.ID)
		filePath := filepath.Join(rc.baseDir, category, filename)

		if err := rc.saveResultToFile(result, filePath); err != nil {
			fmt.Printf("保存结果 %d 到 %s 失败: %v\n", result.ID, filePath, err)
			continue
		}
	}

	return nil
}

// saveResultToFile 将单个分析结果保存到JSON文件
func (rc *ResultClassifier) saveResultToFile(result *AnalysisResult, filePath string) error {
	// 提取错误信息
	var gtError, predError interface{}
	if result.GTResult != nil && !result.GTResult.Success {
		gtError = result.GTResult.Error
	}
	if result.PredResult != nil && !result.PredResult.Success {
		predError = result.PredResult.Error
	}

	// 转换为期望的JSON格式
	outputData := map[string]interface{}{
		"id":            result.ID,
		"db_id":         result.DBName,
		"question":      result.Question,
		"thinking":      result.Thinking,
		"gt_sql":        result.GTSQL,
		"pred_sql":      result.PredSQL,
		"is_correct":    result.IsCorrect,
		"is_equivalent": result.IsEquivalent,
		"error_reason":  result.ErrorReason,
		"gt_result":     result.GTResult,
		"pred_result":   result.PredResult,
		"gt_error":      gtError,
		"pred_error":    predError,
	}

	// 将数据编码为JSON
	jsonData, err := json.MarshalIndent(outputData, "", "  ")
	if err != nil {
		return fmt.Errorf("JSON编码失败: %v", err)
	}

	// 写入文件
	return os.WriteFile(filePath, jsonData, 0644)
}

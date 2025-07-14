import json

def try_parse_json_string(s):
    try:
        return json.loads(s)
    except:
        return s

input_file = 'results/ds_test1/info.jsonl'
output_file = 'results/ds_test1/info.json'

results = []
with open(input_file, 'r', encoding='utf-8') as f:
    for line in f:
        item = json.loads(line)

        if "steps" in item:
            for step in item["steps"]:
                # 1. 尝试将 query_result 解析为 JSON 对象
                if "query_result" in step:
                    step["query_result"] = try_parse_json_string(step["query_result"])

                # 2. 把 reasoning 中的 \n 转换为实际换行符
                if "reasoning" in step and isinstance(step["reasoning"], str):
                    step["reasoning"] = step["reasoning"].replace("\\n", "\n").replace("\n", "\n")

        results.append(item)

with open(output_file, 'w', encoding='utf-8') as f:
    json.dump(results, f, ensure_ascii=False, indent=2)

print(f"格式化完成，输出文件为：{output_file}")

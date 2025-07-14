SELECT e.name AS name, 
       e.employee_id AS employee_id, 
       ar.check_in AS check_in, 
       ar.check_out AS check_out
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '客户服务部' 
  AND ar.date = '2024-10-13'
  AND (ar.check_out - ar.check_in) > INTERVAL '15 hours';	3457299966
SELECT e.name AS name, e.employee_id AS employee_id, ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE e.university = '清华大学' 
  AND ar.date = '2024-10-11' 
  AND ar.check_in > '09:00:00';	1044893251
SELECT COUNT(*) AS count 
FROM attendance_records 
WHERE employee_id = 'H03961' 
  AND date BETWEEN '2024-01-01' AND '2024-12-31' 
  AND check_in > '09:00:00';	3626797096
SELECT e.name AS name, ar.check_in AS check_in, pe.rating AS rating
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-24' 
  AND ar.check_in < '08:30:00' 
  AND pe.rating = 'A+';	207527642
SELECT 
    e.name AS employee_name,
    d.name AS department_name,
    ar.check_in AS check_in_time,
    ar.check_out AS check_out_time
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    ar.date = '2024-10-05';	4093748071
SELECT 
    e.name AS name,
    d.name AS department_name,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    ar.date = '2024-09-21'
ORDER BY 
    d.name;	4123999737
SELECT 
    (COUNT(CASE WHEN pe.status = '离职' AND (pe.end_date - pe.start_date) < 90 THEN 1 END) * 100.0 / COUNT(*) AS "离职比例"
FROM 
    employees e
LEFT JOIN 
    probation_employees pe ON e.employee_id = pe.employee_id;	560968712
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '客户服务部' 
    AND ar.date = '2024-10-08' 
    AND ar.check_in > '09:00:00';	2123418406
SELECT e.name AS name, e.hire_date AS hire_date
FROM employees e
JOIN probation_employees p ON e.employee_id = p.employee_id
WHERE p.status = '在职';	2685336973
SELECT 
    d.name AS department_name, 
    e.name AS employee_name, 
    ar.check_in AS check_in_time, 
    e.remaining_annual_leave AS remaining_leave_days
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    ar.date = '2024-09-22' 
    AND ar.check_in > '09:00:00' 
    AND e.remaining_annual_leave < 5;	1786804299
SELECT e.name, p.rating
FROM employees e
JOIN attendance_records a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE EXTRACT(YEAR FROM e.hire_date) = 2023
  AND a.date = '2024-10-05'
  AND p.evaluation_date = (
    SELECT MAX(evaluation_date) 
    FROM performance_evaluations 
    WHERE employee_id = e.employee_id
  );	187164736
SELECT 
    e.name AS name,
    e.hire_date AS hire_date,
    pe.rating AS rating
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    EXTRACT(YEAR FROM e.hire_date) = 2023
    AND ar.date = '2024-09-26'
    AND pe.evaluation_date = (
        SELECT MAX(evaluation_date) 
        FROM performance_evaluations 
        WHERE employee_id = e.employee_id
    );	16656251
SELECT COUNT(*) AS count 
FROM attendance_records 
WHERE employee_id = 'H05598' 
  AND date BETWEEN '2024-01-01' AND '2024-12-31' 
  AND check_out < '18:00:00';	3745687130
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN attendance_records a ON e.employee_id = a.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE a.date = '2024-09-28' AND a.check_in > '09:00:00';	2706374430
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '运营部' 
  AND ar.date = '2024-10-12' 
  AND ar.check_in > '09:00:00';	1934436050
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN attendance_records a ON e.employee_id = a.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE a.date = '2024-10-11' AND a.check_in > '09:00:00';	3074190923
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '销售部' 
    AND ar.date = '2024-09-21' 
    AND ar.check_in > '09:00:00';	511554832
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE pe.rating = 'C' AND pe.evaluation_date = '2023-12-11';	2699770862
SELECT e.name AS employee_name, d.name AS department_name
FROM attendance_records ar
JOIN employees e ON ar.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-09-22' AND ar.check_in > '09:00:00';	2054121283
SELECT 
    e.employee_id AS employee_id,
    e.name AS name,
    a.award_name AS award_name,
    p.rating AS rating
FROM 
    employees e
JOIN 
    awards a ON e.employee_id = a.employee_id
JOIN 
    performance_evaluations p ON e.employee_id = p.employee_id
WHERE 
    a.year = 2023 
    AND a.award_name = '创新奖' 
    AND p.rating = 'A+';	1458867293
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '客户服务部' 
    AND ar.date = '2024-10-09' 
    AND ar.check_in > '08:30:00';	3998131614
SELECT COUNT(DISTINCT e.employee_id) AS count
FROM employees e
JOIN probation_employees pe ON e.employee_id = pe.employee_id
JOIN awards a ON e.employee_id = a.employee_id
WHERE pe.status = 'active'
  AND pe.start_date <= '2023-12-31'
  AND pe.end_date >= '2023-01-01'
  AND a.award_name = '优秀员工'
  AND EXTRACT(YEAR FROM a.year) = 2023;	3232263409
SELECT e.name AS name, a.award_name AS award_name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
WHERE EXTRACT(YEAR FROM e.hire_date) = 2021
AND a.year = 2022;	3292642794
SELECT DISTINCT e.employee_id
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE ar.check_in IS NOT NULL AND ar.check_out IS NOT NULL
GROUP BY e.employee_id, ar.date
HAVING COUNT(*) > 1;	1309577663
SELECT d.name AS department_name, e.name AS employee_name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-09-24' 
  AND ar.check_in > '09:30:00' 
  AND e.remaining_annual_leave < 10;	3488243740
SELECT e.name AS employee_name, a.check_in AS check_in_time
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records a ON e.employee_id = a.employee_id
WHERE d.name = '销售部' 
  AND a.date = '2024-09-19' 
  AND a.check_in > '09:00:00';	651157477
SELECT d.name AS department_name, e.name AS employee_name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-09-26' 
  AND ar.check_in > '09:00:00' 
  AND pe.rating = 'C';	53102733
SELECT 
    e.name AS name,
    a.award_name AS award_name,
    p.rating AS rating
FROM 
    employees e
JOIN 
    awards a ON e.employee_id = a.employee_id
JOIN 
    performance_evaluations p ON e.employee_id = p.employee_id
WHERE 
    EXTRACT(YEAR FROM e.hire_date) = 2021
    AND a.year = 2021
    AND p.rating = 'B';	3108523290
SELECT e.name AS employee_name, ar.check_in AS check_in_time
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '销售部' 
  AND ar.date = '2024-10-03' 
  AND ar.check_in > '09:00:00';	840538968
SELECT e.name AS employee_name, pe.status AS probation_status
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN probation_employees pe ON e.employee_id = pe.employee_id
WHERE a.year = 2020 
  AND a.award_name = '优秀员工'
  AND pe.status = '在职'
  AND CURRENT_DATE <= pe.end_date;	3192644686
SELECT 
    e.name AS employee_name,
    a.award_name AS award_received,
    p.rating AS performance_rating
FROM 
    employees e
JOIN 
    awards a ON e.employee_id = a.employee_id
JOIN 
    performance_evaluations p ON e.employee_id = p.employee_id
WHERE 
    e.hire_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND a.year = 2023
    AND p.rating = 'A+';	1597119407
SELECT e.name, d.name AS department_name, ar.check_in, ar.check_out
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN probation_employees pe ON e.employee_id = pe.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE pe.status = '在职'
  AND ar.date = '2024-09-19';	3355699316
SELECT 
    e.employee_id AS employee_id,
    e.name AS name,
    e.hire_date AS hire_date,
    e.remaining_annual_leave AS remaining_annual_leave,
    (365 * (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM e.hire_date))) - e.remaining_annual_leave AS days_used_annual_leave
FROM 
    employees e;	1396580707
SELECT 
    e.name AS employee_name,
    ar.date AS attendance_date,
    ar.check_in AS check_in_time,
    ar.check_out AS check_out_time
FROM 
    employees e
JOIN 
    awards a ON e.employee_id = a.employee_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    a.year = 2022 
    AND a.award_name = '技术突破奖'
    AND (ar.check_out - ar.check_in) > INTERVAL '10 hours'
ORDER BY 
    e.name, 
    ar.date;	2385394779
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '质量控制部'
    AND ar.date = '2024-09-20'
    AND (ar.check_out - ar.check_in) > INTERVAL '8 hours';	3598287205
SELECT e.name AS employee_name
FROM employees e
JOIN attendance_records a ON e.employee_id = a.employee_id
WHERE e.university = '清华大学'
AND a.date = '2024-09-25'
AND a.check_in < '09:00:00';	1157360763
SELECT e.name
FROM employees e
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
JOIN attendance_records a ON e.employee_id = a.employee_id
WHERE pe.rating = 'A+'
GROUP BY e.name
ORDER BY AVG(EXTRACT(EPOCH FROM (a.check_out - a.check_in))/3600) DESC
LIMIT 1;	1456890377
SELECT 
    e.name AS employee_name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in_time
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '销售部' 
    AND ar.date = '2024-10-04' 
    AND ar.check_in > '09:00:00';	455172185
SELECT 
    e.name AS name,
    ar.check_in AS check_in,
    pe.rating AS rating
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-09-18'
    AND ar.check_in > '09:00:00'
    AND pe.rating = 'D';	4212530835
SELECT e.name AS employee_name, 
       ar.check_in AS check_in_time, 
       pe.rating AS performance_rating
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-25' 
  AND ar.check_in > '08:30:00' 
  AND pe.rating = 'B+';	1240612673
SELECT 
    i.id AS interview_id,
    i.employee_id AS employee_id,
    i.interview_date AS interview_date,
    i.interview_count AS interview_count
FROM 
    interviews i
WHERE 
    EXTRACT(YEAR FROM i.interview_date) = 2024
ORDER BY 
    i.interview_count DESC;	2857901445
SELECT 
    e.name AS employee_name,
    ar.check_in AS check_in_time,
    pe.rating AS performance_rating
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-10-10' 
  AND ar.check_in > '08:30:00' 
  AND pe.rating = 'A+';	71265646
SELECT 
    d.name AS department_name, 
    e.name AS employee_name, 
    ar.check_in AS check_in_time, 
    e.remaining_annual_leave AS remaining_leave_days
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    ar.date = '2024-09-27' 
    AND ar.check_in > '09:00:00' 
    AND e.remaining_annual_leave < 10;	2168264130
SELECT e.name AS employee_name, p.evaluation_date AS performance_evaluation_date
FROM employees e
JOIN performance_evaluations p ON e.employee_id = p.employee_id;	1505285087
SELECT 
    e.name AS name,
    d.name AS department_name,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    attendance_records ar
JOIN 
    employees e ON ar.employee_id = e.employee_id
JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    ar.date = '2024-10-07'
    AND ar.check_in > '09:00:00'
    AND ar.check_out < '17:00:00';	1736090929
SELECT 
    e.name AS name,
    d.name AS department_name,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    attendance_records ar
JOIN 
    employees e ON ar.employee_id = e.employee_id
JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    ar.date = '2024-10-05';	816170327
SELECT 
    e.department_id, 
    AVG(i.interview_count) AS avg_interview_count
FROM 
    employees e
JOIN 
    interviews i ON e.employee_id = i.employee_id
GROUP BY 
    e.department_id
ORDER BY 
    avg_interview_count DESC
LIMIT 1;	3913837113
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.date AS date,
    ar.check_in AS check_in,
    ar.check_out AS check_out,
    pe.rating AS rating
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-09-27' 
    AND pe.rating = 'A+';	578427607
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2024 
  AND a.award_name = '最佳团队奖'
  AND ar.date = '2024-10-09'
  AND ar.check_in > '09:00:00';	2435455132
SELECT e.name AS name, e.employee_id AS employee_id, ar.check_in AS check_in
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '质量控制部' 
  AND ar.date = '2024-10-14' 
  AND ar.check_in > '09:00:00';	801113743
SELECT 
    e.name AS name,
    ar.check_out AS check_out,
    pe.rating AS rating
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-09-24' 
    AND ar.check_out > '13:00:00' 
    AND pe.rating = 'B+';	879816496
SELECT e.name AS employee_name, d.name AS department_name
FROM attendance_records ar
JOIN employees e ON ar.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-10-08' AND ar.check_in > '09:00:00';	2367322111
SELECT 
    e.name AS employee_name, 
    d.name AS department_name, 
    a.award_name
FROM 
    employees e
JOIN 
    awards a ON e.employee_id = a.employee_id
JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    a.year = 2022;	247458622
SELECT 
    e.name AS name,
    ar.check_in AS check_in,
    pe.rating AS rating
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-10-12'
    AND ar.check_in > '09:00:00'
    AND pe.rating = 'D';	570267133
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    e.university = '清华大学'
    AND ar.date = '2024-10-13'
    AND ar.check_in < '09:30:00';	137546085
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '客户服务部' 
    AND ar.date = '2024-09-22';	4072264422
SELECT 
    e.name AS name,
    a.award_name AS award_name,
    p.rating AS rating
FROM 
    employees e
    JOIN awards a ON e.employee_id = a.employee_id
    JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE 
    a.year = 2023 
    AND a.award_name = '质量改进奖' 
    AND p.rating = 'A+';	4121529769
SELECT e.name, e.employee_id, ar.check_in, d.name AS department_name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-10-05'
  AND ar.check_in > '08:30:00'
  AND d.manager_id = 'H05487';	437939056
SELECT e.name AS employee_name, ar.check_in AS check_in_time, ar.check_out AS check_out_time
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '行政部' AND ar.date = '2024-10-02' AND (ar.check_out - ar.check_in) > INTERVAL '9 hours';	2108794903
SELECT d.name AS department_name, e.name AS employee_name
FROM employees e
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE pe.rating = 'D' AND pe.evaluation_date = '2023-03-31';	2803368869
SELECT name AS 员工姓名, car_plate AS 车牌号码 FROM employees WHERE employee_type = '正式员工';	408783378
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '质量控制部' 
    AND ar.date = '2024-09-19' 
    AND ar.check_in > '09:00:00';	1719343281
SELECT e.name AS employee_name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE e.employee_id IN (SELECT employee_id FROM awards WHERE year = 2022 AND award_name = '客户满意度奖')
AND ar.date = '2024-10-12' 
AND ar.check_in > '09:00:00';	2395193694
SELECT e.name, e.employee_id, ar.check_in, d.name AS department_name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id = 'D00002'
  AND ar.date = '2024-10-11'
  AND ar.check_in > '09:00:00';	2461283805
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE a.year = 2023 AND a.award_name = '领导力奖';	1004841644
SELECT e.name, a.check_in
FROM employees e
JOIN attendance_records a ON e.employee_id = a.employee_id
WHERE e.employee_id IN (SELECT employee_id FROM awards WHERE year = 2023 AND award_name = '领导力奖')
AND a.date = '2024-10-09' AND a.check_in > '09:00:00';	958025096
SELECT 
    e.name AS employee_name, 
    d.name AS department_name, 
    d.manager_id
FROM 
    employees e
JOIN 
    attendance_records a ON e.employee_id = a.employee_id
JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    e.employee_type = '实习生'
    AND a.date = '2024-10-02'
    AND a.check_in BETWEEN '09:00:00' AND '10:00:00';	4156394932
SELECT d.name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.name
ORDER BY AVG(EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM e.birth_date)) DESC
LIMIT 1;	5535555
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-09-16' 
    AND pe.rating = 'C';	1584866592
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '研发部' 
    AND ar.date = '2024-10-08'
    AND ar.check_in > '09:00:00';	4123927043
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '财务部' AND ar.date = '2024-09-20' AND ar.check_in > '09:00:00';	2642437739
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '人力资源部' 
    AND ar.date = '2024-10-05' 
    AND (ar.check_out - ar.check_in) > INTERVAL '8 hours';	1412040002
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.date AS date,
    ar.check_in AS check_in,
    ar.check_out AS check_out,
    pe.rating AS rating
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-10-14' 
    AND pe.rating = 'A+';	467771706
SELECT e.name AS employee_name, e.employee_id AS employee_id, ar.check_in AS check_in_time
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE d.name = '行政部' 
  AND ar.date = '2024-09-27' 
  AND ar.check_in > '09:00:00';	416599650
SELECT d.name AS department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.name;	2074887228
SELECT e.name
FROM employees e
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE pe.rating = 'A+'
ORDER BY e.hire_date DESC
LIMIT 1;	4204863942
WITH department_avg AS (
    SELECT 
        e.department_id,
        AVG(EXTRACT(EPOCH FROM (a.check_out - a.check_in))/3600) AS avg_hours
    FROM 
        employees e
    JOIN 
        attendance_records a ON e.employee_id = a.employee_id
    GROUP BY 
        e.department_id
),
employee_hours AS (
    SELECT 
        e.employee_id,
        e.name,
        e.department_id,
        AVG(EXTRACT(EPOCH FROM (a.check_out - a.check_in))/3600 AS total_hours
    FROM 
        employees e
    JOIN 
        attendance_records a ON e.employee_id = a.employee_id
    GROUP BY 
        e.employee_id, e.name, e.department_id
)
SELECT 
    eh.employee_id AS employee_id,
    eh.name AS name,
    eh.department_id AS department_id,
    eh.total_hours AS total_hours,
    da.avg_hours AS avg_hours,
    ABS(eh.total_hours - da.avg_hours) AS difference
FROM 
    employee_hours eh
JOIN 
    department_avg da ON eh.department_id = da.department_id
ORDER BY 
    difference DESC;	603993474
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in,
    ar.check_out AS check_out,
    (EXTRACT(EPOCH FROM (ar.check_out - ar.check_in))/3600) AS work_duration
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '研发部' 
    AND ar.date = '2024-10-05'
    AND (EXTRACT(EPOCH FROM (ar.check_out - ar.check_in))/3600 > 10
ORDER BY 
    work_duration DESC;	4133405205
SELECT e.name AS employee_name, d.name AS department_name, pe.rating AS performance_rating
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN departments d ON e.department_id = d.department_id
LEFT JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-10-12';	1822156377
SELECT e.name AS employee_name, a.check_in AS check_in_time
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records a ON e.employee_id = a.employee_id
WHERE d.name = '销售部' 
  AND a.date = '2024-10-11' 
  AND a.check_in > '09:00:00';	3941104083
SELECT 
    e.name AS name,
    d.name AS department_name,
    ar.check_in AS check_in,
    a.award_name AS award_name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN departments d ON e.department_id = d.department_id
JOIN awards a ON e.employee_id = a.employee_id
WHERE ar.date = '2024-09-26'
  AND ar.check_in > '09:00:00'
  AND a.year = 2024;	1448803792
SELECT e.name AS name, e.employee_id AS employee_id, ar.check_in AS check_in, pe.rating AS rating
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-10-05' 
  AND ar.check_in > '09:00:00' 
  AND pe.rating = 'A+';	2348295774
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '人力资源部' 
    AND ar.date = '2024-10-07' 
    AND ar.check_in > '09:00:00';	1351044911
SELECT 
    e.name AS name,
    d.name AS department_name,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    e.employee_type = '实习生'
    AND ar.date = '2024-10-11'
    AND ar.check_in < '09:00:00';	1269433479
SELECT e.name AS name, a.award_name AS award_name, p.rating AS rating
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE a.year = 2023 AND p.rating = 'A+';	2181400574
SELECT 
    e.department_id AS department_id,
    COUNT(DISTINCT pe.employee_id) AS core_talent_count
FROM 
    performance_evaluations pe
JOIN 
    employees e ON pe.employee_id = e.employee_id
WHERE 
    pe.rating IN ('A+', 'A')
    AND pe.evaluation_date >= CURRENT_DATE - INTERVAL '5 years'
    AND e.position IN ('主管', '经理')
GROUP BY 
    e.department_id;	2992677261
SELECT DISTINCT e.name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2024 AND a.award_name = '新人奖'
AND ar.date = '2024-10-08';	1583766775
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-10-02' 
  AND ar.check_in > '09:00:00' 
  AND pe.rating = 'A+';	2928703740
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE a.year = 2024 AND a.award_name = '新人奖';	2166514841
SELECT AVG(EXTRACT(DAY FROM AGE(mgmt.mgmt_date, e.hire_date))/365.0 AS average_years_to_management
FROM employees e
JOIN (
    SELECT employee_id, MIN(start_work_date) AS mgmt_date
    FROM employees
    WHERE position IN ('总监', '主管', '经理')
    GROUP BY employee_id
) mgmt ON e.employee_id = mgmt.employee_id;	2864760744
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '研发部'
    AND ar.date = '2024-10-06'
    AND (ar.check_out - ar.check_in) > INTERVAL '10 hours';	2860391364
SELECT e.name AS name, a.award_name AS award_name, p.rating AS rating
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE a.year = 2023 
  AND a.award_name = '技术突破奖'
  AND p.rating = 'A+';	1852490763
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-17'
AND pe.rating = 'D'
AND ar.check_in > '09:00:00';	2494653166
SELECT DISTINCT e.name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2024 
  AND a.award_name = '项目管理奖'
  AND ar.date = '2024-10-03';	3084451002
SELECT 
    e.name AS name,
    e.hire_date AS hire_date,
    a.award_name AS award_name
FROM 
    employees e
JOIN 
    awards a ON e.employee_id = a.employee_id
WHERE 
    a.award_name = '领导力奖' 
    AND a.year = 2023 
    AND e.hire_date > '2017-12-31';	408688532
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    e.university = '清华大学' 
    AND ar.date = '2024-09-16' 
    AND (ar.check_out - ar.check_in) > INTERVAL '8 hours';	4036648411
SELECT e.name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE a.year = 2023
  AND a.award_name = '领导力奖'
  AND p.evaluation_date = '2023-06-04'
  AND p.rating = 'D';	548473863
SELECT e.name AS employee_name, ar.check_in AS check_in_time
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '客户服务部' 
  AND ar.date = '2024-10-12' 
  AND ar.check_in > '09:00:00';	2286968533
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-21' 
  AND pe.rating = 'B'
  AND ar.check_in > '09:00:00';	3284637113
SELECT DISTINCT d.name AS department_name
FROM attendance_records ar
JOIN employees e ON ar.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-24' 
  AND ar.check_in > '09:00:00' 
  AND pe.rating = 'C';	773404511
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    e.department_id = 'D00009'
    AND ar.date = '2024-10-05'
    AND (ar.check_out - ar.check_in) > INTERVAL '9 hours';	2149393306
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '财务部'
    AND ar.date = '2024-10-06'
    AND ar.check_in > '09:00:00';	2477803619
SELECT e.name AS employee_name, d.name AS department_name, d.manager_id
FROM employees e
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE pe.rating = 'A+' AND EXTRACT(YEAR FROM pe.evaluation_date) = 2023;	821353235
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-28'
AND pe.rating = 'A'
AND ar.check_in > '08:00:00';	907163187
SELECT 
    ar.id AS attendance_id,
    ar.employee_id AS employee_id,
    ar.date AS attendance_date,
    ar.check_in AS check_in_time,
    ar.check_out AS check_out_time
FROM 
    attendance_records ar
WHERE 
    ar.employee_id IN (
        SELECT employee_id 
        FROM awards 
        WHERE award_name = '销售冠军' 
        AND year = 2023
    )
    AND ar.date = '2024-10-01';	811463423
WITH first_a_plus AS (
    SELECT 
        e.department_id,
        e.employee_id,
        e.name,
        MIN(p.evaluation_date - e.hire_date) AS time_to_first_a_plus
    FROM employees e
    JOIN performance_evaluations p ON e.employee_id = p.employee_id
    WHERE p.rating = 'A+'
    GROUP BY e.department_id, e.employee_id, e.name
),
min_time_by_dept AS (
    SELECT 
        department_id,
        MIN(time_to_first_a_plus) AS min_time
    FROM first_a_plus
    GROUP BY department_id
)
SELECT 
    f.department_id AS department_id,
    f.employee_id AS employee_id,
    f.name AS name,
    f.time_to_first_a_plus AS time_to_first_a_plus
FROM first_a_plus f
JOIN min_time_by_dept m ON f.department_id = m.department_id AND f.time_to_first_a_plus = m.min_time
ORDER BY f.department_id;	2913040945
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN attendance_records a ON e.employee_id = a.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE a.date = '2024-09-22' AND a.check_in > '09:00:00';	1736656854
SELECT 
    e.name AS name,
    a.award_name AS award_name,
    p.rating AS rating
FROM 
    employees e
    JOIN awards a ON e.employee_id = a.employee_id
    JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE 
    a.year = 2024 
    AND a.award_name = '优秀员工' 
    AND p.rating = 'A+';	2339817132
SELECT e.name AS employee_name, d.name AS department_name, p.rating AS performance_rating
FROM performance_evaluations p
JOIN employees e ON p.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE p.evaluation_date = '2023-10-29';	2218878981
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    e.university = '清华大学' 
    AND ar.date = '2024-09-17'
    AND (ar.check_out - ar.check_in) > INTERVAL '9 hours';	1785434408
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE pe.evaluation_date = '2022-06-16' AND pe.rating = 'C';	2274426817
SELECT e.name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE a.year = 2022 
  AND a.award_name = '优秀员工'
  AND p.evaluation_date = '2022-10-30'
  AND p.rating = 'A+';	1121061015
SELECT e.name AS name, a.check_in AS check_in
FROM employees e
JOIN attendance_records a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE a.date = '2024-09-15'
  AND a.check_in > '09:00:00'
  AND p.rating = 'B';	1822740611
SELECT e.name AS name, e.position AS position
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.name = '销售部';	3049098373
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-23'
  AND ar.check_in > '09:00:00'
  AND pe.rating = 'D';	2137629249
SELECT e.name AS name, e.employee_id AS employee_id
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE d.name = '客户服务部'
  AND p.rating = 'D'
  AND p.evaluation_date = '2024-10-14';	2240615465
SELECT 
    e.name AS name,
    e.hire_date AS hire_date,
    a.award_name AS award_name
FROM 
    employees e
JOIN 
    awards a ON e.employee_id = a.employee_id
WHERE 
    a.award_name = '领导力奖' 
    AND a.year = 2023 
    AND e.hire_date >= '2019-01-01';	1309270874
SELECT d.name AS department_name, e.name AS employee_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-20' 
  AND ar.check_in > '09:00:00' 
  AND pe.rating = 'A+';	2420332715
SELECT e.employee_id AS employee_id, e.name AS name
FROM employees e
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
JOIN awards a ON e.employee_id = a.employee_id
WHERE pe.rating IN ('B', 'B-', 'C+', 'C', 'C-')
GROUP BY e.employee_id, e.name
HAVING COUNT(a.id) > 0;	60966118
SELECT 
    e.name AS employee_name,
    ar.check_in AS check_in_time,
    pe.rating AS performance_rating
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-09-20'
    AND ar.check_in BETWEEN '08:00:00' AND '09:00:00'
    AND pe.rating = 'B';	1965264110
SELECT e.employee_id, e.name
FROM employees e
JOIN (
    SELECT employee_id, MAX(evaluation_date) as last_eval_date
    FROM performance_evaluations
    GROUP BY employee_id
) latest_eval ON e.employee_id = latest_eval.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id AND latest_eval.last_eval_date = pe.evaluation_date
WHERE pe.rating = 'B' AND pe.evaluation_date < '2024-01-01';	1436736406
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-19' 
  AND ar.check_in > '09:00:00'
  AND pe.rating = 'B+';	2263195811
SELECT 
    e.name AS employee_name,
    d.name AS department_name,
    ar.check_in,
    ar.check_out,
    (ar.check_out - ar.check_in) AS work_duration
FROM 
    attendance_records ar
JOIN 
    employees e ON ar.employee_id = e.employee_id
JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    ar.date = '2024-09-24'
    AND (ar.check_out - ar.check_in) > INTERVAL '12 hours';	1079007714
SELECT e.name, e.employee_id, ar.check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE e.university = '清华大学'
  AND ar.date = '2024-09-29'
  AND ar.check_in < '09:00:00';	2835428087
SELECT 
    e.name AS name,
    ar.check_in AS check_in,
    pe.rating AS rating
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-10-11' 
    AND ar.check_in > '09:00:00' 
    AND pe.rating = 'A';	2600324766
AMBIGUOUS_QUERY	1290741288
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    e.university = '厦门大学' 
    AND ar.date = '2024-09-23' 
    AND ar.check_in > '09:00:00'
ORDER BY 
    ar.check_in;	3714812669
SELECT 
    e.name AS name,
    ar.check_in AS check_in,
    pe.rating AS rating
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-09-19' 
    AND ar.check_in > '09:00:00' 
    AND pe.rating = 'D';	4217899403
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.date AS date,
    ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE e.university = '清华大学' 
  AND ar.date = '2024-10-11' 
  AND ar.check_in > '08:30:00';	1946117596
SELECT 
    e.name AS name,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-10-10'
    AND ar.check_in > '09:00:00'
    AND pe.rating = 'D'
    AND pe.evaluation_date = (
        SELECT MAX(evaluation_date)
        FROM performance_evaluations
        WHERE employee_id = e.employee_id
    );	1268105110
SELECT 
    e.name AS name,
    a.award_name AS award_name,
    p.rating AS rating
FROM 
    employees e
JOIN 
    awards a ON e.employee_id = a.employee_id
JOIN 
    performance_evaluations p ON e.employee_id = p.employee_id
WHERE 
    EXTRACT(YEAR FROM e.hire_date) = 2024
    AND a.year = 2024
    AND a.award_name = '新人奖'
    AND p.rating = 'A';	910719964
SELECT 
    e.name AS name,
    a.check_in AS check_in
FROM 
    employees e
JOIN 
    attendance_records a ON e.employee_id = a.employee_id
JOIN 
    performance_evaluations p ON e.employee_id = p.employee_id
WHERE 
    a.date = '2024-09-26'
    AND a.check_in BETWEEN '08:00:00' AND '09:00:00'
    AND p.rating = 'B+'
    AND p.evaluation_date = (
        SELECT MAX(evaluation_date)
        FROM performance_evaluations
        WHERE employee_id = e.employee_id
    );	4215983699
SELECT e.name
FROM employees e
WHERE e.employee_id IN (
    SELECT a.employee_id 
    FROM awards a 
    WHERE a.award_name = '创新奖' AND a.year = 2023
)
AND e.employee_id IN (
    SELECT ar.employee_id 
    FROM attendance_records ar 
    WHERE ar.date = '2024-09-25'
);	3022631781
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-24'
  AND ar.check_in > '09:00:00'
  AND pe.rating = 'D';	1326215630
SELECT d.name AS department_name, AVG(e.remaining_annual_leave) AS avg_annual_leave
FROM departments d
JOIN employees e ON d.department_id = e.department_id
WHERE d.manager_id = 'H03372'
GROUP BY d.name;	2739991096
SELECT 
    e.name AS employee_name,
    ar.date AS attendance_date,
    pe.rating AS performance_rating
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-10-12' 
    AND pe.rating = 'A+';	3094758858
SELECT e.name AS name, a.date AS date, a.check_in AS check_in
FROM employees e
JOIN awards aw ON e.employee_id = aw.employee_id
JOIN attendance_records a ON e.employee_id = a.employee_id
WHERE aw.year = 2023 
  AND aw.award_name = '质量改进奖'
  AND a.date = '2024-10-03'
  AND a.check_in > '09:00:00';	3240116959
SELECT e.name AS name, 
       e.employee_id AS employee_id, 
       d.name AS department_name, 
       p.rating AS rating
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE d.name = '财务部' 
  AND p.rating = 'A+' 
  AND p.evaluation_date <= '2024-09-15'
  AND e.hire_date <= '2024-09-15' 
  AND (e.start_work_date IS NULL OR e.start_work_date <= '2024-09-15')
ORDER BY p.evaluation_date DESC
LIMIT 100;	3253971302
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '质量控制部'
    AND ar.date = '2024-09-21'
    AND ar.check_in > '09:00:00';	3037862925
SELECT 
    e.name AS employee_name,
    ar.check_in AS check_in_time,
    ar.check_out AS check_out_time
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '销售部' 
    AND ar.date = '2024-09-25' 
    AND (ar.check_out - ar.check_in) > INTERVAL '8 hours';	1991610345
SELECT e.name AS name, a.award_name AS award_name, p.rating AS rating
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE a.year = 2022 
  AND a.award_name = '技术突破奖'
  AND p.evaluation_date > '2022-07-13';	3421802959
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '财务部' 
    AND ar.date = '2024-10-11' 
    AND ar.check_in > '09:00:00';	3350855518
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '研发部'
    AND ar.date = '2024-10-12' 
    AND ar.check_in > '09:00:00';	1481678835
SELECT DISTINCT d.name AS department_name
FROM departments d
JOIN employees e ON d.department_id = e.department_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE pe.rating = 'C' AND pe.evaluation_date = '2023-08-06';	1832961045
SELECT 
    e.name AS employee_name, 
    d.name AS department_name, 
    ar.check_in AS check_in, 
    ar.check_out AS check_out
FROM 
    attendance_records ar
JOIN 
    employees e ON ar.employee_id = e.employee_id
JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    ar.date = '2024-10-01' 
    AND (ar.check_out - ar.check_in) > INTERVAL '12 hours';	3794832374
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-10-09' 
  AND pe.rating = 'A+'
  AND ar.check_in > '09:00:00';	4131389571
SELECT e.name AS employee_name, ar.check_in AS check_in_time
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '人力资源部' 
  AND ar.date = '2024-09-24' 
  AND ar.check_in > '09:00:00';	2592420070
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '销售部' 
    AND ar.date = '2024-10-02' 
    AND ar.check_in > '09:00:00';	1526114356
SELECT 
    e.name AS name,
    ar.check_out AS check_out,
    pe.rating AS rating
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-10-11' 
    AND ar.check_out > '21:00:00' 
    AND pe.rating = 'B+';	906637391
SELECT e.name, d.name AS department_name, e.hire_date
FROM employees e
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE pe.rating = 'B' AND EXTRACT(YEAR FROM pe.evaluation_date) = 2022
ORDER BY e.hire_date;	3180358031
SELECT 
    e.name AS employee_name, 
    d.name AS department_name, 
    ar.check_in AS check_in_time, 
    ar.check_out AS check_out_time
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '客户服务部' 
    AND ar.date = '2024-09-22';	1427670664
SELECT d.name AS department_name, e.name AS employee_name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN departments d ON e.department_id = d.department_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-20'
  AND ar.check_in > '09:00:00'
  AND pe.rating = 'B';	2517372671
SELECT e.name
FROM attendance_records ar
JOIN employees e ON ar.employee_id = e.employee_id
WHERE ar.date = '2024-10-02'
ORDER BY ar.check_in ASC
LIMIT 1;	2374975326
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.date AS date,
    pe.rating AS rating
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    EXTRACT(YEAR FROM e.hire_date) = 2023
    AND ar.date = '2024-10-10'
    AND pe.rating = 'B+';	1399658957
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.date AS date,
    ar.check_in AS check_in
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '财务部' 
  AND ar.date = '2024-10-04' 
  AND ar.check_in > '09:00:00';	1337508734
SELECT e.name AS employee_name, a.date AS attendance_date, p.rating AS performance_rating
FROM employees e
JOIN attendance_records a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE a.date = '2024-09-17' AND p.rating = 'A+';	2509046712
SELECT d.name AS department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.employee_id IN (
    SELECT i.employee_id
    FROM interviews i
    GROUP BY i.employee_id
    ORDER BY COUNT(i.interview_count) DESC
    LIMIT 3
);	1196649212
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '财务部' 
    AND ar.date = '2024-10-04' 
    AND ar.check_in > '09:00:00';	3455582973
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE a.award_name = '优秀员工' AND a.year = 2023;	2169239057
SELECT COUNT(DISTINCT e.employee_id) AS count
FROM employees e
JOIN probation_employees pe ON e.employee_id = pe.employee_id
JOIN awards a ON e.employee_id = a.employee_id
WHERE pe.start_date <= '2023-12-31' 
  AND pe.end_date >= '2023-01-01'
  AND a.award_name = '客户满意度奖' 
  AND a.year = 2023;	329969630
SELECT e.name AS name, a.check_in AS check_in
FROM employees e
JOIN attendance_records a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE a.date = '2024-09-24' 
  AND a.check_in > '09:00:00' 
  AND p.rating = 'C';	1957766738
SELECT e.name AS employee_name, a.award_name AS award_name 
FROM employees e 
JOIN awards a ON e.employee_id = a.employee_id;	701997867
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '法务部'
    AND ar.date = '2024-10-13'::date
    AND ar.check_in < '08:30:00'::time;	906781191
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '质量控制部' 
    AND ar.date = '2024-09-17' 
    AND (ar.check_out::time - ar.check_in::time) > INTERVAL '9 hours';	388401260
SELECT 
    e.name AS name,
    d.name AS department_name,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    ar.date = '2024-09-26' 
    AND e.remaining_annual_leave > 10;	1988310183
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    d.name = '财务部'
    AND ar.date = '2024-10-09'
    AND ar.check_in > '09:00:00';	2363197929
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '客户服务部'
    AND ar.date = '2024-10-10'
    AND ar.check_in > '09:00:00';	935583315
SELECT 
    e.employee_id AS employee_id,
    e.name AS name,
    COUNT(DISTINCT a.id) AS active_projects_count
FROM 
    employees e
LEFT JOIN 
    awards a ON e.employee_id = a.employee_id
WHERE 
    a.award_name LIKE '%创新%' OR a.award_name LIKE '%孵化%'
GROUP BY 
    e.employee_id, e.name
ORDER BY 
    active_projects_count DESC;	3679145520
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-09-25' AND ar.check_in > '09:00:00';	1647521458
SELECT 
    e.name AS employee_name,
    e.employee_id AS employee_id,
    pe.rating AS performance_rating
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    d.name = '客户服务部' 
    AND pe.rating = 'A+'
    AND pe.evaluation_date <= '2024-09-28'
ORDER BY 
    pe.evaluation_date DESC;	2154404311
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '法务部' 
    AND ar.date = '2024-10-07' 
    AND ar.check_in > '09:00:00';	1956887122
SELECT 
    e.name AS employee_name, 
    d.name AS department_name, 
    ar.check_in AS check_in_time, 
    ar.check_out AS check_out_time
FROM 
    attendance_records ar
JOIN 
    employees e ON ar.employee_id = e.employee_id
JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    ar.date = '2024-10-14';	541499305
SELECT DISTINCT e.name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2021 
AND a.award_name = '优秀员工'
AND ar.date >= '2021-01-01';	607760760
SELECT AVG(e.remaining_annual_leave) AS avg_remaining_annual_leave
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
WHERE a.award_name = '领导力奖' 
  AND a.year = 2024
  AND e.hire_date > '2017-12-31';	3786409554
SELECT e.employee_id AS employee_identifier, e.name AS employee_name
FROM employees e
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
JOIN awards a ON e.employee_id = a.employee_id
WHERE e.university IS NOT NULL
  AND e.major IS NOT NULL
  AND pe.rating IN ('优秀', '卓越', '杰出')
GROUP BY e.employee_id, e.name
HAVING COUNT(DISTINCT pe.id) >= 1 AND COUNT(DISTINCT a.id) >= 1
LIMIT 100;	1833538335
SELECT e.name AS employee_name, d.name AS department_name
FROM performance_evaluations pe
JOIN employees e ON pe.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE pe.evaluation_date = '2023-12-07' AND pe.rating = 'B';	2571560082
SELECT 
    e.name AS name,
    d.name AS department_name,
    a.award_name AS award_name
FROM 
    employees e
JOIN 
    awards a ON e.employee_id = a.employee_id
JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    EXTRACT(YEAR FROM e.hire_date) = 2023
    AND a.year = 2023;	3184081384
SELECT e.name AS name, e.employee_id AS employee_id, ar.check_in AS check_in
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '销售部' AND ar.date = '2024-09-25' AND ar.check_in > '09:00:00';	3265054996
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '质量控制部' 
    AND ar.date = '2024-09-20' 
    AND ar.check_in > '09:00:00';	1987469456
SELECT e.name AS name, e.employee_id AS employee_id, ar.check_in AS check_in, ar.check_out AS check_out
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '客户服务部' 
  AND ar.date = '2024-09-29'
  AND (ar.check_out - ar.check_in) > INTERVAL '10 hours';	3475714298
SELECT 
    e.name AS name,
    a.check_in AS check_in,
    p.rating AS rating
FROM 
    employees e
JOIN 
    attendance_records a ON e.employee_id = a.employee_id
JOIN 
    performance_evaluations p ON e.employee_id = p.employee_id
WHERE 
    a.date = '2024-10-04'
    AND a.check_in > '08:30:00'
    AND p.rating = 'A+';	3158837504
SELECT e.employee_id, COUNT(CASE WHEN a.check_in > '09:00:00' THEN 1 ELSE NULL END) AS late_days
FROM employees e
LEFT JOIN attendance_records a ON e.employee_id = a.employee_id
GROUP BY e.employee_id;	1341335041
SELECT DISTINCT e.name AS name, e.employee_id AS employee_id
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-15' AND pe.rating = 'A+';	1248129462
SELECT e.name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE e.employee_id IN (SELECT employee_id FROM awards WHERE year = 2021 AND award_name = '最佳团队奖')
AND ar.date = '2024-09-19';	2929076718
SELECT 
    e.name AS employee_name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in_time,
    ar.check_out AS check_out_time
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '客户服务部' 
    AND ar.date = '2024-09-21';	860593492
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '财务部'
    AND ar.date = '2024-09-23'
    AND ar.check_in < '09:30:00';	803138423
SELECT e.name AS name, a.check_in AS check_in
FROM employees e
JOIN attendance_records a ON e.employee_id = a.employee_id
WHERE e.employee_type = '实习生'
AND a.date = '2024-10-09'
AND a.check_in > '09:00:00';	1392351924
SELECT 
    e.name AS name,
    ar.date AS date,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    employees e
JOIN 
    awards a ON e.employee_id = a.employee_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    a.year = 2023
    AND a.award_name = '项目管理奖'
    AND ar.date = '2024-09-23';	2647170145
SELECT 
    e.name AS name,
    a.award_name AS award_name,
    p.rating AS rating
FROM 
    employees e
JOIN 
    awards a ON e.employee_id = a.employee_id
JOIN 
    performance_evaluations p ON e.employee_id = p.employee_id
WHERE 
    EXTRACT(YEAR FROM e.hire_date) = 2022
    AND a.year = 2023
    AND p.rating = 'A+';	2581619009
SELECT 
    e.name AS employee_name, 
    d.name AS department_name, 
    ar.check_in AS check_in_time, 
    ar.check_out AS check_out_time
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '人力资源部' 
    AND ar.date = '2024-10-13';	2697889458
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '行政部' 
    AND ar.date = '2024-09-18' 
    AND ar.check_in > '09:00:00';	3387668548
SELECT 
    CASE 
        WHEN i.interview_count > 0 THEN '导师计划'
        WHEN e.position LIKE '%培训%' THEN '培训课程'
        WHEN e.department_id != e2.department_id THEN '轮岗经历'
        ELSE '其他因素'
    END AS factor,
    AVG(EXTRACT(DAY FROM (p.evaluation_date - e.hire_date))) AS contribution
FROM 
    employees e
LEFT JOIN 
    performance_evaluations p ON e.employee_id = p.employee_id
LEFT JOIN 
    interviews i ON e.employee_id = i.employee_id
LEFT JOIN 
    employees e2 ON e.employee_id = e2.employee_id AND e.department_id != e2.department_id
WHERE 
    e.employee_type IN ('实习生', '外包员工', '正式员工')
    AND p.rating IS NOT NULL
GROUP BY 
    factor
ORDER BY 
    contribution ASC;	1417292000
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '销售部' 
  AND ar.date = '2024-09-20' 
  AND ar.check_in > '08:00:00';	1597423542
WITH department_max_age AS (
    SELECT 
        e.department_id,
        MAX(EXTRACT(YEAR FROM AGE(CURRENT_DATE, e.birth_date))) AS max_age
    FROM employees e
    GROUP BY e.department_id
),
ranked_employees AS (
    SELECT 
        e.department_id,
        e.employee_id,
        e.name,
        EXTRACT(YEAR FROM AGE(CURRENT_DATE, e.birth_date)) AS age,
        RANK() OVER (PARTITION BY e.department_id ORDER BY EXTRACT(YEAR FROM AGE(CURRENT_DATE, e.birth_date)) DESC) AS age_rank
    FROM employees e
)
SELECT 
    r.department_id,
    r.employee_id,
    r.name,
    r.age AS max_age
FROM ranked_employees r
JOIN department_max_age d ON r.department_id = d.department_id AND r.age = d.max_age
WHERE r.age_rank = 1
ORDER BY r.department_id;	3397723976
SELECT e.name AS employee_name, ar.check_in AS check_in_time
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '人力资源部' 
  AND ar.date = '2024-09-30' 
  AND ar.check_in > '09:00:00';	339893232
SELECT e.name AS employee_name, ar.check_in AS check_in_time
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '研发部' 
  AND ar.date = '2024-09-18' 
  AND ar.check_in > '09:00:00';	244305078
SELECT e.name AS employee_name, ar.check_in AS check_in_time, pe.rating AS performance_rating
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-28' 
  AND ar.check_in > '09:30:00' 
  AND pe.rating = 'A+';	2030661443
SELECT 
    e.name AS name,
    ar.check_in AS check_in,
    pe.rating AS rating
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-09-17' 
    AND ar.check_in > '09:00:00' 
    AND pe.rating = 'B';	2290320497
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.date AS date,
    pe.rating AS rating
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-09-22' 
    AND pe.rating = 'D';	2134005508
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.date AS date,
    ar.check_in AS check_in,
    ar.check_out AS check_out,
    pe.rating AS rating
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-10-03' 
    AND pe.rating = 'A+';	3179866905
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '客户服务部'
    AND ar.date = '2024-10-07'
    AND ar.check_in > '09:00:00';	1447725797
SELECT 
    e.employee_id AS employee_id,
    ar.date AS date,
    ar.check_in AS check_in,
    ar.check_out AS check_out,
    (SELECT pe.rating 
     FROM performance_evaluations pe 
     WHERE pe.employee_id = e.employee_id 
     ORDER BY pe.evaluation_date DESC 
     LIMIT 1) AS rating
FROM 
    employees e
LEFT JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
ORDER BY 
    e.employee_id, ar.date DESC;	3166523944
SELECT e.name, a.award_name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN awards a ON e.employee_id = a.employee_id
WHERE ar.date = '2024-10-05' 
  AND ar.check_in > '09:00:00'
  AND a.year = 2021;	3133264714
SELECT e.name AS employee_name, e.employee_id AS employee_id, ar.check_in AS check_in_time
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '质量控制部' 
AND ar.date = '2024-09-25'
AND ar.check_in > '08:30:00';	2850698943
WITH quarterly_top_performers AS (
    SELECT 
        a.year AS year,
        CEILING(a.year::numeric / 3) AS quarter,
        a.employee_id,
        COUNT(*) AS award_count
    FROM awards a
    WHERE a.year >= EXTRACT(YEAR FROM CURRENT_DATE) - 3
    GROUP BY year, quarter, employee_id
    ORDER BY year, quarter, award_count DESC
),
attendance_analysis AS (
    SELECT 
        EXTRACT(YEAR FROM ar.date) AS year,
        EXTRACT(QUARTER FROM ar.date) AS quarter,
        ar.employee_id,
        AVG(EXTRACT(EPOCH FROM (ar.check_out - ar.check_in))/3600 AS avg_work_hours,
        STDDEV(EXTRACT(EPOCH FROM (ar.check_out - ar.check_in))/3600 AS stddev_work_hours
    FROM attendance_records ar
    WHERE ar.date >= CURRENT_DATE - INTERVAL '3 years'
    GROUP BY year, quarter, employee_id
)
SELECT 
    qtp.year AS year,
    qtp.quarter AS quarter,
    qtp.employee_id AS employee_id
FROM quarterly_top_performers qtp
JOIN attendance_analysis aa ON qtp.year = aa.year 
    AND qtp.quarter = aa.quarter 
    AND qtp.employee_id = aa.employee_id
WHERE aa.stddev_work_hours < 0.5
ORDER BY qtp.year, qtp.quarter;	2860363666
SELECT 
    e.employee_id AS employee_id,
    e.name AS name,
    a.award_name AS award_name,
    p.rating AS rating
FROM 
    employees e
JOIN 
    awards a ON e.employee_id = a.employee_id
JOIN 
    performance_evaluations p ON e.employee_id = p.employee_id
WHERE 
    a.year = 2023 
    AND p.rating = 'A+';	3284872060
SELECT e.name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2022 
  AND a.award_name = '质量改进奖'
  AND ar.date = '2024-10-04'
  AND ar.check_in > '09:00:00';	1370529433
SELECT 
    e.name AS employee_name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in_time
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '客户服务部'
    AND ar.date = '2024-10-03'
    AND ar.check_in > '09:00:00';	4101493476
SELECT e.name AS employee_name, ar.check_in AS check_in_time
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '人力资源部' 
  AND ar.date = '2024-10-02' 
  AND ar.check_in > '09:00:00';	1724137514
SELECT e.name AS name, p.rating AS rating
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE a.year = 2023 AND a.award_name = '优秀员工' AND p.rating = 'A+';	3595600525
SELECT DISTINCT d.name AS department_name
FROM departments d
JOIN employees e ON d.department_id = e.department_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE pe.evaluation_date = '2023-05-31' AND pe.rating = 'A+';	815548435
SELECT e.name AS name, ar.check_in AS check_in, pe.rating AS rating
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-10-02' 
  AND ar.check_in > '09:00:00' 
  AND pe.rating = 'A+';	2061849622
SELECT 
    ar.date AS attendance_date,
    ar.check_in AS check_in_time,
    ar.check_out AS check_out_time
FROM 
    attendance_records ar
JOIN 
    awards a ON ar.employee_id = a.employee_id
WHERE 
    a.year = 2021 
    AND a.award_name = '销售冠军'
    AND ar.date = '2024-09-18';	1250267679
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE pe.rating = 'A+' AND pe.evaluation_date = '2023-05-27';	1929429344
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE ar.date = '2024-09-16' AND ar.check_in > '09:00:00';	3689323727
SELECT e.name AS employee_name, d.name AS department_name 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id;	2977986068
SELECT 
    e.id AS employee_id,
    e.employee_id AS employee_code,
    e.name AS employee_name,
    e.birth_date AS birth_date,
    e.hire_date AS hire_date,
    e.start_work_date AS start_work_date,
    e.remaining_annual_leave AS annual_leave_days,
    e.department_id AS department_code,
    e.position AS job_title,
    e.phone_number AS contact_number,
    e.car_plate AS license_plate,
    e.university AS graduated_university,
    e.major AS academic_major,
    e.employee_type AS employment_type
FROM employees e
WHERE e.position = '助理'
ORDER BY e.hire_date ASC
LIMIT 1;	3402561235
SELECT e.name
FROM employees e
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE e.department_id = 'D00007'
  AND EXTRACT(YEAR FROM pe.evaluation_date) = 2024
  AND pe.rating = 'A';	3958686389
SELECT e.name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2022 
  AND a.award_name = '创新奖'
  AND ar.date = '2024-10-12'
  AND ar.check_in > '09:00:00';	3786147845
SELECT e.name AS employee_name, d.name AS department_name
FROM attendance_records ar
JOIN employees e ON ar.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-09-23' AND ar.check_in > '09:00:00';	1159542995
SELECT COUNT(DISTINCT a.employee_id) AS count
FROM awards a
JOIN performance_evaluations p ON a.employee_id = p.employee_id
WHERE a.year = 2023
  AND a.award_name = '质量改进奖'
  AND p.rating = 'A+';	3254827737
SELECT DISTINCT d.name AS department_name
FROM departments d
JOIN employees e ON d.department_id = e.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE ar.date = '2024-09-23'
  AND ar.check_in > '08:00:00'
  AND ar.check_out < '18:00:00'
ORDER BY d.name;	3909320290
SELECT DISTINCT d.name AS department_name, e.name AS employee_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN awards a ON e.employee_id = a.employee_id
JOIN interviews i ON e.employee_id = i.employee_id
WHERE a.year = 2023 AND a.award_name = '优秀员工奖'
AND i.interview_date = '2023-10-09'
AND i.interview_count > 0;	628072208
SELECT e.name AS employee_name, ar.check_in AS check_in_time
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-10-12' 
  AND ar.check_in < '09:00:00'
  AND pe.rating = 'B+';	3286899081
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-20' 
  AND pe.rating = 'A+'
  AND ar.check_in > '09:00:00';	2517269758
SELECT e.name AS name, a.award_name AS award_name, p.rating AS rating
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE a.year = 2021 AND a.award_name = '质量改进奖' AND p.rating = 'B+';	3866100328
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '客户服务部'
    AND ar.date = '2024-09-29'
    AND ar.check_in > '08:30:00';	3469101707
SELECT e.name AS employee_name, d.name AS department_name, d.manager_id
FROM attendance_records ar
JOIN employees e ON ar.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-09-16' AND ar.check_in > '08:30:00';	2797510377
SELECT 
    e.name AS name,
    e.position AS position,
    a.check_in AS check_in
FROM 
    employees e
JOIN 
    attendance_records a ON e.employee_id = a.employee_id
WHERE 
    a.date = '2024-10-01' 
    AND a.check_in > '09:00:00' 
    AND e.position = '顾问';	2587625643
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '客户服务部'
    AND ar.date = '2024-09-23'
    AND ar.check_in > '09:00:00';	2556819995
SELECT 
    a.year AS year,
    e.name AS name,
    a.award_name AS award_name,
    pe.rating AS status
FROM 
    awards a
JOIN 
    employees e ON a.employee_id = e.employee_id
LEFT JOIN 
    performance_evaluations pe ON a.employee_id = pe.employee_id
WHERE 
    a.award_name LIKE '%技术创新%' 
    AND a.year >= EXTRACT(YEAR FROM CURRENT_DATE) - 5
ORDER BY 
    a.year DESC;	2163155798
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '财务部'
    AND ar.date = '2024-10-06'
    AND ar.check_in > '09:00:00';	1599035554
SELECT e.name AS employee_name, d.name AS department_name
FROM attendance_records ar
JOIN employees e ON ar.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-10-04' AND ar.check_in > '09:00:00';	3248411469
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN attendance_records a ON e.employee_id = a.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE a.date = '2024-10-04';	2257279104
SELECT 
    e.employee_id AS employee_id,
    a.award_name AS award_name,
    p.rating AS rating,
    p.evaluation_date AS evaluation_date
FROM 
    employees e
JOIN 
    awards a ON e.employee_id = a.employee_id
JOIN 
    performance_evaluations p ON e.employee_id = p.employee_id
WHERE 
    a.year = 2023
    AND EXTRACT(YEAR FROM p.evaluation_date) = 2023;	2036213054
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN attendance_records a ON e.employee_id = a.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE a.date = '2024-10-10' AND a.check_in > '09:30:00';	2231439732
SELECT 
    e.name AS name,
    d.name AS department_name,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    ar.date = '2024-09-19';	1852561007
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '行政部'
    AND ar.date = '2024-10-03'
    AND ar.check_in > '09:00:00';	3057784484
SELECT d.department_id, AVG(e.remaining_annual_leave) AS avg_remaining_annual_leave
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id
ORDER BY avg_remaining_annual_leave DESC
LIMIT 1;	604055577
SELECT 
    e.name AS name,
    ar.check_in AS check_in,
    pe.rating AS rating
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-09-27' 
    AND ar.check_in < '10:00:00'
    AND pe.rating = 'A+';	1799658813
SELECT interview_date, interview_count 
FROM interviews 
WHERE interview_date BETWEEN '2024-01-01' AND '2024-12-31';	556306212
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-09-20' AND ar.check_in > '09:00:00';	3669286537
SELECT e.name, e.employee_id, d.name AS department_name, p.rating 
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE d.name = '研发部' 
AND p.rating = 'B+' 
AND p.evaluation_date <= '2024-09-29'
AND e.hire_date <= '2024-09-29'
AND (e.start_work_date <= '2024-09-29' OR e.start_work_date IS NULL)
ORDER BY p.evaluation_date DESC
LIMIT 100;	1975822937
SELECT 
    ar.id AS attendance_id,
    ar.employee_id AS employee_id,
    ar.date AS attendance_date,
    ar.check_in AS check_in_time,
    ar.check_out AS check_out_time
FROM 
    attendance_records ar
WHERE 
    ar.employee_id IN (
        SELECT employee_id 
        FROM awards 
        WHERE award_name = '销售冠军' AND year = 2022
    )
    AND ar.date = '2024-10-10';	1362951886
SELECT 
    e.name AS name,
    e.hire_date AS hire_date,
    a.award_name AS award_name
FROM 
    employees e
JOIN 
    awards a ON e.employee_id = a.employee_id
WHERE 
    a.award_name = '客户满意度奖'
    AND a.year = 2023
    AND e.hire_date > '2020-06-19';	2799760973
SELECT 
    e.name AS name,
    ar.check_in AS check_in,
    pe.rating AS rating
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-09-22' 
    AND ar.check_in > '09:00:00' 
    AND pe.rating = 'A+';	1692765210
SELECT DISTINCT d.name AS department_name 
FROM departments d 
JOIN employees e ON d.department_id = e.department_id 
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id 
WHERE pe.evaluation_date = '2022-06-20' AND pe.rating = 'C';	804998806
SELECT e.name AS name, a.award_name AS award_name, p.rating AS rating
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE a.year = 2024 AND a.award_name = '客户满意度奖' AND p.rating = 'C';	170694593
SELECT e.name, 
       AVG(EXTRACT(EPOCH FROM (ar.check_out - ar.check_in))/3600 AS avg_work_hours
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2023 
  AND a.award_name = '项目管理奖'
  AND ar.date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY e.name
HAVING AVG(EXTRACT(EPOCH FROM (ar.check_out - ar.check_in))/3600 > 10;	2091607073
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE pe.rating = 'D' AND pe.evaluation_date = '2023-03-09';	2894384990
AMBIGUOUS_QUERY	1149281173
SELECT 
    e.name AS name,
    d.name AS department_name,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    attendance_records ar
JOIN 
    employees e ON ar.employee_id = e.employee_id
JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    ar.date = '2024-10-08';	1884200158
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '人力资源部'
    AND ar.date = '2024-09-26'::date
    AND ar.check_in > '09:00:00'::time;	2557740373
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-28' 
  AND ar.check_in > '09:00:00' 
  AND pe.rating = 'A+';	3799739588
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '研发部' 
  AND ar.date = '2024-09-20'
  AND ar.check_in > '09:00:00'
ORDER BY ar.check_in;	1074403791
SELECT d.name AS department_name, e.name AS employee_name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN departments d ON e.department_id = d.department_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-10-13' 
  AND ar.check_in > '09:00:00'
  AND pe.rating = 'A+';	1640643914
SELECT 
    e.name AS name,
    a.award_name AS award_name,
    p.rating AS rating
FROM 
    employees e
    JOIN awards a ON e.employee_id = a.employee_id
    JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE 
    a.year = 2023 
    AND a.award_name = '销售冠军' 
    AND (p.rating = 'B' OR p.rating = 'B+' OR p.rating = 'A' OR p.rating = 'A+');	3875469036
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '财务部' 
    AND ar.date = '2024-09-17' 
    AND (ar.check_out - ar.check_in) > INTERVAL '9 hours';	1182082319
SELECT e.name AS employee_name,
       e.employee_id,
       ar.check_in,
       d.name AS department_name,
       d.manager_id
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-09-18'
  AND ar.check_in > '09:00:00';	219564979
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2023 
  AND a.award_name = '技术突破奖' 
  AND ar.date = '2024-09-23' 
  AND ar.check_in > '09:00:00';	2296352057
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '运营部' 
    AND ar.date = '2024-09-26';	3848854887
SELECT e.name
FROM employees e
WHERE e.employee_id IN (
    SELECT a.employee_id 
    FROM awards a 
    WHERE a.year = 2020 AND a.award_name = '优秀员工'
)
AND e.employee_id IN (
    SELECT p.employee_id 
    FROM performance_evaluations p 
    WHERE EXTRACT(YEAR FROM p.evaluation_date) = 2023 AND p.rating = 'C'
);	4144781586
SELECT 
    e.name AS name,
    ar.check_in::time AS check_in,
    pe.rating AS rating
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-10-03'
  AND pe.rating = 'C'
  AND ar.check_in::time > '09:00:00'::time;	543593806
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '法务部' 
    AND ar.date = '2024-10-12' 
    AND ar.check_in > '09:00:00';	3302179394
WITH yearly_hire_rates AS (
    SELECT 
        EXTRACT(YEAR FROM i.interview_date) AS year,
        e.department_id,
        COUNT(DISTINCT e.employee_id)::float / NULLIF(COUNT(DISTINCT i.employee_id), 0) AS hire_rate,
        RANK() OVER (PARTITION BY EXTRACT(YEAR FROM i.interview_date) 
            ORDER BY COUNT(DISTINCT e.employee_id)::float / NULLIF(COUNT(DISTINCT i.employee_id), 0) DESC) AS rank
    FROM 
        interviews i
    LEFT JOIN 
        employees e ON i.employee_id = e.employee_id
    WHERE 
        i.interview_date >= CURRENT_DATE - INTERVAL '5 years'
    GROUP BY 
        EXTRACT(YEAR FROM i.interview_date), e.department_id
)
SELECT 
    year AS interview_year,
    department_id AS top_department_id,
    hire_rate AS max_hire_rate
FROM 
    yearly_hire_rates
WHERE 
    rank = 1
ORDER BY 
    interview_year DESC;	1798514231
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    e.university = '清华大学' 
    AND ar.date = '2024-10-12';	2882208186
SELECT e.name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2023
  AND a.award_name = '领导力奖'
  AND ar.date = '2024-10-01'
  AND ar.check_in > '09:00:00';	2752876678
SELECT e.name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2023 
  AND a.award_name = '销售冠军'
  AND ar.date = '2024-09-22'
  AND ar.check_in > '09:00:00';	2550918549
SELECT e.name AS employee_name, ar.check_in AS check_in_time
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '人力资源部' 
  AND ar.date = '2024-10-10' 
  AND ar.check_in > '09:00:00';	2654497153
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE pe.rating = 'D' AND pe.evaluation_date = '2023-04-20';	776263740
WITH 
-- 获取近两年内有奖项的员工
awarded_employees AS (
    SELECT DISTINCT employee_id
    FROM awards
    WHERE year >= EXTRACT(YEAR FROM CURRENT_DATE) - 1
),
-- 获取近两年内有绩效提升的员工(假设A和A+代表提升)
improved_performance_employees AS (
    SELECT DISTINCT employee_id
    FROM performance_evaluations
    WHERE evaluation_date >= CURRENT_DATE - INTERVAL '2 years'
    AND rating IN ('A', 'A+')
),
-- 计算符合条件的员工总数
qualified_employees AS (
    SELECT COUNT(DISTINCT e.employee_id) AS count
    FROM employees e
    JOIN awarded_employees ae ON e.employee_id = ae.employee_id
    JOIN improved_performance_employees pe ON e.employee_id = pe.employee_id
),
-- 计算总员工数
total_employees AS (
    SELECT COUNT(*) AS count FROM employees
)
-- 计算比例
SELECT 
    (q.count * 100.0 / NULLIF(t.count, 0)) AS award_and_performance_ratio
FROM 
    qualified_employees q
CROSS JOIN 
    total_employees t;	1728657056
SELECT 
    e.employee_id AS employee_id,
    e.name AS employee_name,
    a.award_name AS award_name,
    p.rating AS performance_rating
FROM 
    employees e
JOIN 
    awards a ON e.employee_id = a.employee_id
JOIN 
    performance_evaluations p ON e.employee_id = p.employee_id
WHERE 
    e.hire_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND a.year = 2023
    AND p.rating = 'A+'
    AND a.award_name = '优秀员工奖';	4069271992
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE d.name = '客户服务部'
  AND ar.date = '2024-09-21'
  AND ar.check_in > '09:00:00';	2408826226
SELECT 
    e.employee_id, 
    COALESCE(SUM(EXTRACT(EPOCH FROM (ar.check_out - ar.check_in)), 0) AS total_work_seconds
FROM 
    employees e
LEFT JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
GROUP BY 
    e.employee_id;	2252548426
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '客户服务部' 
    AND ar.date = '2024-09-15' 
    AND ar.check_in > '09:00:00';	141603518
SELECT e.name AS name, ar.date AS date, ar.check_in AS check_in
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2021 
  AND a.award_name = '创新奖'
  AND ar.date = '2024-10-05'
  AND ar.check_in > '09:00:00';	3509550647
SELECT 
    e.name AS employee_name,
    a.award_name AS award_received,
    p.rating AS performance_rating
FROM 
    employees e
JOIN 
    awards a ON e.employee_id = a.employee_id
JOIN 
    performance_evaluations p ON e.employee_id = p.employee_id
WHERE 
    a.year = 2024 
    AND p.rating = 'C';	102704152
SELECT 
    e.name AS name,
    a.award_name AS award_name,
    p.rating AS rating
FROM 
    employees e
    JOIN awards a ON e.employee_id = a.employee_id
    JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE 
    a.year = 2024 
    AND a.award_name = '领导力奖' 
    AND p.rating = 'C';	4066261878
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '质量控制部'
    AND ar.date = '2024-09-19'
    AND ar.check_in > '09:00:00';	7133946
SELECT e.name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2024 AND a.award_name = '项目管理奖' AND ar.date = '2024-09-23';	2339648
SELECT 
    e.name AS employee_name, 
    d.name AS department_name, 
    p.rating AS performance_rating
FROM 
    employees e
JOIN 
    attendance_records a ON e.employee_id = a.employee_id
LEFT JOIN 
    departments d ON e.department_id = d.department_id
LEFT JOIN 
    performance_evaluations p ON e.employee_id = p.employee_id
WHERE 
    a.date = '2024-09-20';	1476916008
SELECT e.name AS employee_name, d.name AS department_name, d.manager_id
FROM attendance_records ar
JOIN employees e ON ar.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-09-26' AND ar.check_in > '09:30:00';	2848971755
SELECT e.name AS name, e.employee_id AS employee_id, ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE e.university = '清华大学' AND ar.date = '2024-10-03' AND ar.check_in > '09:00:00';	1510555187
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '研发部'
    AND ar.date = '2024-10-01'
    AND (ar.check_out - ar.check_in) > INTERVAL '10 hours';	1954114065
SELECT 
    e.name AS name,
    a.award_name AS award_name,
    p.rating AS rating
FROM 
    employees e
    JOIN awards a ON e.employee_id = a.employee_id
    JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE 
    a.year = 2023 
    AND a.award_name = '优秀员工'
    AND EXTRACT(YEAR FROM p.evaluation_date) = 2023;	3968556416
SELECT 
    d.cust_no AS customer_number,
    d.acct_bal AS deposit_balance,
    l.loan_balance AS loan_balance,
    l.loan_type AS loan_type
FROM 
    deposit_account_info d
JOIN 
    loan_detail_info l ON d.cust_no = l.cust_id
WHERE 
    d.data_dt = '2024-07-19' 
    AND d.acct_bal > 100000
    AND l.loan_balance > 500000
    AND l.dw_date = '2024-07-19';	2192717523

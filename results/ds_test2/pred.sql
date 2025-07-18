SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '客户服务部' 
AND ar.date = '2024-10-13'
AND (ar.check_out - ar.check_in) > INTERVAL '15 hours';	3457299966
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
    AND ar.date = '2024-10-11' 
    AND ar.check_in > '09:00:00';	1044893251
SELECT COUNT(*) AS count 
FROM attendance_records 
WHERE employee_id = 'H03961' 
  AND date BETWEEN '2024-01-01' AND '2024-12-31' 
  AND check_in > '09:00:00';	3626797096
SELECT 
    e.name AS name, 
    ar.check_in AS check_in, 
    pe.rating AS rating
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
    (COUNT(CASE WHEN status = '离职' AND (end_date - start_date) < 90 THEN 1 END) * 100.0 / 
    COUNT(*) AS "离职比例"
FROM probation_employees;	560968712
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
JOIN probation_employees pe ON e.employee_id = pe.employee_id
WHERE pe.status = '在职';	2685336973
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
LEFT JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
    AND pe.evaluation_date = (
        SELECT MAX(evaluation_date) 
        FROM performance_evaluations 
        WHERE employee_id = e.employee_id
    )
WHERE 
    EXTRACT(YEAR FROM e.hire_date) = 2023
    AND ar.date = '2024-09-26';	16656251
SELECT COUNT(*) AS count 
FROM attendance_records 
WHERE employee_id = 'H05598' 
  AND date BETWEEN '2024-01-01' AND '2024-12-31' 
  AND check_out < '18:00:00';	3745687130
SELECT e.name AS employee_name, d.name AS department_name
FROM attendance_records ar
JOIN employees e ON ar.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-09-28' AND ar.check_in > '09:00:00';	2706374430
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
    d.name = '运营部' 
    AND ar.date = '2024-10-12' 
    AND ar.check_in > '09:00:00';	1934436050
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-10-11' AND ar.check_in > '09:00:00';	3074190923
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '销售部' AND ar.date = '2024-09-21' AND ar.check_in > '09:00:00';	511554832
SELECT e.name AS employee_name, d.name AS department_name
FROM performance_evaluations pe
JOIN employees e ON pe.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE pe.rating = 'C' AND pe.evaluation_date = '2023-12-11';	2699770862
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN attendance_records a ON e.employee_id = a.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE a.date = '2024-09-22' AND a.check_in > '09:00:00';	2054121283
SELECT e.employee_id, e.name, a.award_name, p.rating 
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE a.year = 2023 
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
SELECT COUNT(DISTINCT a.employee_id) AS count
FROM awards a
JOIN probation_employees p ON a.employee_id = p.employee_id
WHERE a.year = 2023
AND a.award_name = '优秀员工'
AND p.status = 'active'
AND p.start_date <= '2023-12-31'
AND p.end_date >= '2023-01-01';	3232263409
SELECT e.name AS name, a.award_name AS award_name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
WHERE EXTRACT(YEAR FROM e.hire_date) = 2021
AND a.year = 2022;	3292642794
SELECT DISTINCT e.employee_id
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
GROUP BY e.employee_id, ar.date
HAVING COUNT(ar.id) > 1;	1309577663
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
WHERE d.name = '销售部' AND a.date = '2024-09-19' AND a.check_in > '09:00:00';	651157477
SELECT d.name AS department_name, e.name AS employee_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-26'
  AND ar.check_in > '09:00:00'
  AND pe.rating = 'C';	53102733
SELECT e.name AS name, a.award_name AS award_name, p.rating AS rating
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE EXTRACT(YEAR FROM e.hire_date) = 2021
  AND a.year = 2021
  AND p.rating = 'B';	3108523290
SELECT e.name AS employee_name, ar.check_in AS check_in_time
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '销售部' 
  AND ar.date = '2024-10-03' 
  AND ar.check_in > '09:00:00';	840538968
SELECT e.name AS name, pe.status AS status
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN probation_employees pe ON e.employee_id = pe.employee_id
WHERE a.year = 2020 
  AND a.award_name = '优秀员工'
  AND pe.end_date >= CURRENT_DATE
  AND pe.status = '在职';	3192644686
SELECT e.name AS name, a.award_name AS award_name, p.rating AS rating
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE EXTRACT(YEAR FROM e.hire_date) = 2023
AND a.year = 2023
AND p.rating = 'A+';	1597119407
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
JOIN 
    probation_employees pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-09-19' 
    AND pe.status = '在职';	3355699316
SELECT 
    e.employee_id AS employee_id,
    e.name AS name,
    e.hire_date AS hire_date,
    e.remaining_annual_leave AS remaining_annual_leave,
    (DATE_PART('year', CURRENT_DATE) - DATE_PART('year', e.hire_date)) * 15 - e.remaining_annual_leave AS days_used_annual_leave
FROM employees e;	1396580707
SELECT 
    e.name AS name,
    ar.date AS date,
    ar.check_in AS check_in,
    ar.check_out AS check_out
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    (SELECT DISTINCT employee_id FROM awards WHERE year = 2022 AND award_name = '技术突破奖') a 
    ON e.employee_id = a.employee_id
WHERE 
    (ar.check_out - ar.check_in) > INTERVAL '10 hours'
ORDER BY 
    e.name, ar.date;	2385394779
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
    e.department_id = 'D00010'
    AND ar.date = '2024-09-20'
    AND (ar.check_out - ar.check_in) > INTERVAL '8 hours';	3598287205
SELECT e.name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE e.university = '清华大学'
AND ar.date = '2024-09-25'
AND ar.check_in < '09:00:00';	1157360763
SELECT e.name
FROM employees e
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
JOIN attendance_records a ON e.employee_id = a.employee_id
WHERE pe.rating = 'A+'
GROUP BY e.name
ORDER BY AVG(EXTRACT(EPOCH FROM (a.check_out - a.check_in))/3600) DESC
LIMIT 1;	1456890377
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
    AND ar.date = '2024-10-04'
    AND ar.check_in > '09:00:00';	455172185
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
    ar.date = '2024-09-18' 
    AND ar.check_in > '09:00:00'
    AND pe.rating = 'D';	4212530835
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
    ar.date = '2024-09-25'
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
    i.interview_count;	2857901445
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
    ar.date = '2024-10-10' 
    AND ar.check_in > '08:30:00' 
    AND pe.rating = 'A+';	71265646
SELECT 
    d.name AS department_name, 
    e.name AS employee_name, 
    ar.check_in AS check_in, 
    e.remaining_annual_leave AS remaining_annual_leave
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
    e.department_id AS department_id, 
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
SELECT e.name AS employee_name, a.check_in AS check_in_time
FROM employees e
JOIN awards aw ON e.employee_id = aw.employee_id
JOIN attendance_records a ON e.employee_id = a.employee_id
WHERE aw.year = 2024 
  AND aw.award_name = '最佳团队奖'
  AND a.date = '2024-10-09'
  AND a.check_in > '09:00:00';	2435455132
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
SELECT e.name AS employee_name, d.name AS department_name, a.award_name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE a.year = 2022;	247458622
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
SELECT e.name, e.employee_id, ar.check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE e.university = '清华大学' 
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
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in,
    d.name AS department_name
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    ar.date = '2024-10-05' 
    AND ar.check_in > '08:30:00' 
    AND d.manager_id = 'H05487';	437939056
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
    d.name = '行政部' 
    AND ar.date = '2024-10-02'
    AND (ar.check_out - ar.check_in) > INTERVAL '9 hours';	2108794903
SELECT d.name AS department_name, e.name AS employee_name
FROM performance_evaluations pe
JOIN employees e ON pe.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE pe.evaluation_date = '2023-03-31' AND pe.rating = 'D';	2803368869
SELECT name AS 员工姓名, car_plate AS 车牌号码 FROM employees WHERE employee_type = '正式员工';	408783378
SELECT e.name AS name, e.employee_id AS employee_id, ar.check_in AS check_in
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '质量控制部'
AND ar.date = '2024-09-19'
AND ar.check_in > '09:00:00';	1719343281
SELECT e.name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2022 
  AND a.award_name = '客户满意度奖'
  AND ar.date = '2024-10-12'
  AND ar.check_in > '09:00:00';	2395193694
SELECT e.name, e.employee_id, ar.check_in, d.name AS department_name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-10-11' 
  AND ar.check_in > '09:00:00' 
  AND d.manager_id = 'H00842';	2461283805
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE a.year = 2023 AND a.award_name = '领导力奖';	1004841644
SELECT e.name, ar.check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE e.employee_id IN (
    SELECT employee_id 
    FROM awards 
    WHERE year = 2023 AND award_name = '领导力奖'
)
AND ar.date = '2024-10-09'
AND ar.check_in > '09:00:00';	958025096
SELECT 
    e.name AS employee_name, 
    d.name AS department_name, 
    d.manager_id
FROM 
    employees e
JOIN 
    probation_employees pe ON e.employee_id = pe.employee_id
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    pe.status = '在职'
    AND ar.date = '2024-10-02'
    AND ar.check_in BETWEEN '09:00:00' AND '10:00:00'
    AND e.employee_type = '实习生';	4156394932
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
SELECT e.name AS employee_name, ar.check_in AS check_in_time
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '财务部' 
  AND ar.date = '2024-09-20' 
  AND ar.check_in > '09:00:00';	2642437739
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
SELECT e.name AS name, e.employee_id AS employee_id, ar.check_in AS check_in
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
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
employee_total AS (
    SELECT 
        e.employee_id,
        e.name,
        e.department_id,
        SUM(EXTRACT(EPOCH FROM (a.check_out - a.check_in))/3600) AS total_hours,
        COUNT(*) AS record_count
    FROM 
        employees e
    JOIN 
        attendance_records a ON e.employee_id = a.employee_id
    GROUP BY 
        e.employee_id, e.name, e.department_id
    HAVING 
        COUNT(*) > 5  -- 确保有足够的数据点来计算有意义的差异
)
SELECT 
    et.employee_id AS employee_id,
    et.name AS name,
    et.department_id AS department_id,
    et.total_hours AS total_hours,
    da.avg_hours AS avg_hours,
    ABS(et.total_hours - da.avg_hours) AS difference
FROM 
    employee_total et
JOIN 
    department_avg da ON et.department_id = da.department_id
ORDER BY 
    difference DESC;	603993474
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in,
    ar.check_out AS check_out,
    (EXTRACT(EPOCH FROM (ar.check_out - ar.check_in))/3600)::numeric(10,2) AS work_duration
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '研发部'
    AND ar.date = '2024-10-05'
    AND ar.check_out IS NOT NULL
    AND ar.check_in IS NOT NULL
    AND (EXTRACT(EPOCH FROM (ar.check_out - ar.check_in))/3600) > 10
ORDER BY work_duration DESC;	4133405205
SELECT 
    e.name AS employee_name, 
    d.name AS department_name, 
    pe.rating AS performance_rating
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-10-12';	1822156377
SELECT e.name AS employee_name, a.check_in AS check_in_time
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records a ON e.employee_id = a.employee_id
WHERE d.name = '销售部' 
  AND a.date = '2024-10-11' 
  AND a.check_in > '09:00:00';	3941104083
SELECT e.name, d.name AS department_name, ar.check_in, a.award_name
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
SELECT e.name, e.employee_id, ar.check_in
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '人力资源部' AND ar.date = '2024-10-07' AND ar.check_in > '09:00:00';	1351044911
SELECT e.name, d.name AS department_name, ar.check_in
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE e.employee_type = '实习生'
  AND ar.date = '2024-10-11'
  AND ar.check_in < '09:00:00';	1269433479
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
    a.year = 2023 
    AND p.rating = 'A+'
    AND a.award_name = '优秀员工';	2181400574
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
    AND e.position IN ('经理', '主管', '总监')
GROUP BY 
    e.department_id;	2992677261
SELECT e.name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2024 
  AND a.award_name = '新人奖'
  AND ar.date = '2024-10-08'
GROUP BY e.name;	1583766775
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-10-02' 
  AND pe.rating = 'A+'
  AND ar.check_in > '09:00:00';	2928703740
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE a.year = 2024 AND a.award_name = '新人奖';	2166514841
SELECT AVG(EXTRACT(DAY FROM (e.start_work_date - e.hire_date))/365.0 AS average_years_to_management
FROM employees e
JOIN departments d ON e.employee_id = d.manager_id;	2864760744
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
    AND a.award_name = '技术突破奖'
    AND p.rating = 'A+';	1852490763
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-17'
  AND pe.rating = 'D'
  AND ar.check_in > '09:00:00'
ORDER BY ar.check_in DESC;	2494653166
SELECT e.name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2024 
  AND a.award_name = '项目管理奖'
  AND ar.date = '2024-10-03'
GROUP BY e.name;	3084451002
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
SELECT DISTINCT e.name
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
SELECT e.name AS name, a.check_in AS check_in
FROM employees e
JOIN attendance_records a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE a.date = '2024-09-21'
  AND p.rating IN ('B', 'B+')
  AND a.check_in > '09:00:00'
ORDER BY a.check_in;	3284637113
SELECT DISTINCT d.name AS department_name
FROM departments d
JOIN employees e ON d.department_id = e.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
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
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '行政部'
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
SELECT 
    e.name AS employee_name, 
    d.name AS department_name, 
    d.manager_id
FROM 
    employees e
JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    pe.rating = 'A+' 
    AND EXTRACT(YEAR FROM pe.evaluation_date) = 2023;	821353235
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
JOIN 
    awards a ON ar.employee_id = a.employee_id
WHERE 
    a.award_name = '销售冠军'
    AND a.year = 2023
    AND ar.date = '2024-10-01';	811463423
WITH first_a_plus AS (
    SELECT 
        e.department_id,
        e.employee_id,
        e.name,
        MIN(p.evaluation_date - e.hire_date) AS time_to_first_a_plus,
        RANK() OVER (PARTITION BY e.department_id ORDER BY MIN(p.evaluation_date - e.hire_date)) AS rank_in_dept
    FROM employees e
    JOIN performance_evaluations p ON e.employee_id = p.employee_id
    WHERE p.rating = 'A+'
    GROUP BY e.department_id, e.employee_id, e.name
)
SELECT 
    department_id,
    employee_id,
    name,
    time_to_first_a_plus
FROM first_a_plus
WHERE rank_in_dept = 1;	2913040945
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-09-22' AND ar.check_in > '09:00:00';	1736656854
SELECT e.name AS name, a.award_name AS award_name, p.rating AS rating
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE a.year = 2024 AND a.award_name = '优秀员工' AND p.rating = 'A+';	2339817132
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
FROM performance_evaluations pe
JOIN employees e ON pe.employee_id = e.employee_id
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
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-15'
  AND ar.check_in > '09:00:00'
  AND pe.rating = 'B';	1822740611
SELECT e.name AS employee_name, e.position AS job_position 
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
FROM attendance_records ar
JOIN employees e ON ar.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-20'
  AND ar.check_in > '09:00:00'
  AND pe.rating = 'A+';	2420332715
SELECT DISTINCT e.employee_id AS employee_id, e.name AS name
FROM employees e
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE pe.rating IN ('C', 'D')
AND (
    e.employee_id IN (SELECT employee_id FROM awards)
    OR e.employee_id IN (SELECT manager_id FROM departments)
    OR e.employee_id IN (
        SELECT employee_id 
        FROM employees 
        WHERE position LIKE '%Team Lead%' OR position LIKE '%Senior%'
    )
);	60966118
SELECT 
    e.name AS employee_name,
    ar.check_in AS check_in_time,
    pe.rating AS performance_rating
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-20'
  AND ar.check_in BETWEEN '08:00:00' AND '09:00:00'
  AND pe.rating = 'B';	1965264110
SELECT e.employee_id, e.name
FROM employees e
WHERE e.employee_id IN (
    SELECT pe.employee_id
    FROM performance_evaluations pe
    WHERE pe.rating = 'B'
    AND pe.evaluation_date = (
        SELECT MAX(pe2.evaluation_date)
        FROM performance_evaluations pe2
        WHERE pe2.employee_id = pe.employee_id
    )
    AND pe.evaluation_date < '2024-01-01'
);	1436736406
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
SELECT e.name AS name, e.employee_id AS employee_id, ar.check_in AS check_in
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
SELECT e.name AS name, e.employee_id AS employee_id, ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE e.university = '厦门大学' 
  AND ar.date = '2024-09-23'
  AND ar.check_in > '09:00:00'
ORDER BY ar.check_in;	3714812669
SELECT 
    e.name AS employee_name,
    a.check_in AS check_in_time,
    p.rating AS performance_rating
FROM 
    employees e
JOIN 
    attendance_records a ON e.employee_id = a.employee_id
JOIN 
    performance_evaluations p ON e.employee_id = p.employee_id
WHERE 
    a.date = '2024-09-19' 
    AND a.check_in > '09:00:00' 
    AND p.rating = 'D';	4217899403
SELECT e.name, e.employee_id, ar.date, ar.check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE e.university = '清华大学' AND ar.date = '2024-10-11' AND ar.check_in > '08:30:00';	1946117596
SELECT e.name AS employee_name, ar.check_in AS check_in_time
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-10-10' 
  AND ar.check_in > '09:00:00' 
  AND pe.rating = 'D';	1268105110
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
    e.hire_date >= '2024-01-01' AND e.hire_date <= '2024-12-31'
    AND a.award_name = '新人奖'
    AND a.year = 2024
    AND p.rating = 'A';	910719964
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-26'
  AND ar.check_in BETWEEN '08:00:00' AND '09:00:00'
  AND pe.rating = 'B+';	4215983699
SELECT e.name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE e.employee_id IN (SELECT employee_id FROM awards WHERE award_name = '创新奖' AND year = 2023)
AND ar.date = '2024-09-25';	3022631781
SELECT e.name AS employee_name, ar.check_in AS check_in_time
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
SELECT e.name AS employee_name, ar.date AS attendance_date, pe.rating AS performance_rating
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-10-12' AND pe.rating = 'A+';	3094758858
SELECT e.name AS name, ar.date AS date, ar.check_in AS check_in
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2023 
  AND a.award_name = '质量改进奖'
  AND ar.date = '2024-10-03'
  AND ar.check_in > '09:00:00';	3240116959
SELECT e.name, e.employee_id, d.name AS department_name, pe.rating 
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE d.name = '财务部' 
  AND pe.rating = 'A+'
  AND pe.evaluation_date <= '2024-09-15'
  AND (pe.evaluation_date = (
      SELECT MAX(evaluation_date) 
      FROM performance_evaluations 
      WHERE employee_id = e.employee_id 
        AND evaluation_date <= '2024-09-15'
  ))
  AND e.hire_date <= '2024-09-15'
  AND (e.start_work_date IS NULL OR e.start_work_date <= '2024-09-15')
  AND NOT EXISTS (
      SELECT 1 FROM probation_employees 
      WHERE employee_id = e.employee_id 
        AND status = '试用中' 
        AND '2024-09-15' BETWEEN start_date AND end_date
  );	3253971302
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
    d.name = '质量控制部'
    AND ar.date = '2024-09-21'
    AND ar.check_in > '09:00:00';	3037862925
SELECT e.name AS employee_name, 
       ar.check_in AS check_in_time, 
       ar.check_out AS check_out_time
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '销售部' 
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
SELECT e.name AS employee_name, d.name AS department_name, ar.check_in, ar.check_out
FROM attendance_records ar
JOIN employees e ON ar.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-10-01' 
AND (ar.check_out - ar.check_in) > INTERVAL '12 hours';	3794832374
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-10-09' 
  AND pe.rating = 'A+'
  AND ar.check_in > '09:00:00';	4131389571
SELECT e.name AS employee_name, a.check_in AS check_in_time
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records a ON e.employee_id = a.employee_id
WHERE d.name = '人力资源部' 
  AND a.date = '2024-09-24' 
  AND a.check_in > '09:00:00';	2592420070
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
    e.name AS employee_name,
    ar.check_out AS check_out_time,
    pe.rating AS performance_rating
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-10-11' 
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
    ar.check_in AS check_in, 
    ar.check_out AS check_out
FROM 
    attendance_records ar
    JOIN employees e ON ar.employee_id = e.employee_id
    JOIN departments d ON e.department_id = d.department_id
WHERE 
    ar.date = '2024-09-22' 
    AND d.name = '客户服务部';	1427670664
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
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    d.name = '财务部'
    AND ar.date = '2024-10-04'
    AND ar.check_in > '09:00:00';	1337508734
SELECT 
    e.name AS employee_name,
    ar.date AS attendance_date,
    pe.rating AS performance_rating
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-17' AND pe.rating = 'A+';	2509046712
SELECT d.name AS department_name
FROM (
    SELECT pe.employee_id, COUNT(*) AS extension_count
    FROM probation_employees pe
    GROUP BY pe.employee_id
    ORDER BY extension_count DESC
    LIMIT 3
) AS top_employees
JOIN employees e ON top_employees.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id;	1196649212
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
SELECT COUNT(DISTINCT a.employee_id) AS count
FROM awards a
JOIN probation_employees p ON a.employee_id = p.employee_id
WHERE a.year = 2023 
  AND a.award_name = '客户满意度奖'
  AND p.start_date <= '2023-12-31' 
  AND p.end_date >= '2023-01-01';	329969630
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
    ar.date = '2024-09-24'
    AND ar.check_in > '09:00:00'
    AND pe.rating = 'C';	1957766738
SELECT e.name AS name, a.award_name AS award_name 
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
    AND ar.date = '2024-10-13'
    AND ar.check_in < '08:30:00';	906781191
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
    AND (ar.check_out - ar.check_in) > INTERVAL '9 hours';	388401260
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
SELECT e.employee_id AS employee_id, 
       e.name AS employee_name, 
       COUNT(a.id) AS active_projects_count
FROM employees e
LEFT JOIN awards a ON e.employee_id = a.employee_id
WHERE a.award_name LIKE '%创新%' OR a.award_name LIKE '%孵化%'
GROUP BY e.employee_id, e.name
ORDER BY active_projects_count DESC;	3679145520
SELECT e.name AS employee_name, d.name AS department_name
FROM attendance_records ar
JOIN employees e ON ar.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-09-25' AND ar.check_in > '09:00:00';	1647521458
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    pe.rating AS rating
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE d.name = '客户服务部' 
AND pe.rating = 'A+'
AND pe.evaluation_date <= '2024-09-28'
AND (pe.evaluation_date = (
    SELECT MAX(pe2.evaluation_date) 
    FROM performance_evaluations pe2 
    WHERE pe2.employee_id = pe.employee_id 
    AND pe2.evaluation_date <= '2024-09-28'
))
ORDER BY e.employee_id;	2154404311
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
SELECT e.employee_id AS employee_id, e.name AS employee_name
FROM employees e
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
LEFT JOIN awards a ON e.employee_id = a.employee_id
WHERE e.university IS NOT NULL 
AND e.major IS NOT NULL
AND pe.rating IN ('优秀', '卓越')
AND (a.id IS NULL OR a.award_name LIKE '%关键%' OR a.award_name LIKE '%创新%' OR a.award_name LIKE '%突破%')
GROUP BY e.employee_id, e.name
LIMIT 100;	1833538335
SELECT e.name AS employee_name, d.name AS department_name
FROM performance_evaluations pe
JOIN employees e ON pe.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE pe.evaluation_date = '2023-12-07' AND pe.rating = 'B';	2571560082
SELECT e.name, d.name AS department_name, a.award_name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE EXTRACT(YEAR FROM e.hire_date) = 2023
AND a.year = 2023;	3184081384
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
    AND ar.date = '2024-09-25' 
    AND ar.check_in > '09:00:00';	3265054996
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
SELECT 
    e.name AS employee_name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in_time,
    ar.check_out AS check_out_time
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    e.department_id = 'D00006' 
    AND ar.date = '2024-09-29' 
    AND (ar.check_out - ar.check_in) > INTERVAL '10 hours';	3475714298
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
    ar.date = '2024-10-04'
    AND ar.check_in > '08:30:00'
    AND pe.rating = 'A+';	3158837504
SELECT e.employee_id, COALESCE(l.late_days, 0) AS late_days
FROM employees e
LEFT JOIN (
    SELECT employee_id, COUNT(*) AS late_days 
    FROM attendance_records 
    WHERE check_in > '09:00:00' 
    GROUP BY employee_id
) l ON e.employee_id = l.employee_id;	1341335041
SELECT DISTINCT e.name AS employee_name, e.employee_id AS employee_id
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-15' AND pe.rating = 'A+';	1248129462
SELECT e.name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE e.employee_id IN (SELECT a.employee_id FROM awards a WHERE a.year = 2021 AND a.award_name = '最佳团队奖')
AND ar.date = '2024-09-19';	2929076718
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
    AND ar.date = '2024-09-21';	860593492
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
    d.name = '财务部'
    AND ar.date = '2024-09-23'
    AND ar.check_in < '09:30:00';	803138423
SELECT e.name AS name, a.check_in AS check_in
FROM employees e
JOIN attendance_records a ON e.employee_id = a.employee_id
WHERE e.employee_type = '实习生'
  AND a.date = '2024-10-09'
  AND a.check_in > '09:00:00';	1392351924
SELECT e.name, ar.date, ar.check_in, ar.check_out
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2023 
  AND a.award_name = '项目管理奖'
  AND ar.date = '2024-09-23';	2647170145
SELECT e.name AS name, a.award_name AS award_name, p.rating AS rating
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE EXTRACT(YEAR FROM e.hire_date) = 2022
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
[最终SQL查询]
SELECT 
    CASE 
        WHEN i.interview_count > 0 THEN '导师计划' 
        WHEN pe.rating = '优秀' THEN '培训课程' 
        WHEN e.department_id != d.department_id THEN '轮岗经历' 
        ELSE '其他因素' 
    END AS factor,
    COUNT(*) AS contribution
FROM 
    employees e
LEFT JOIN 
    interviews i ON e.employee_id = i.employee_id
LEFT JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
LEFT JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    e.employee_type IN ('实习生', '外包员工') 
    OR e.position LIKE '%助理%' 
    OR e.position LIKE '%实习%'
GROUP BY 
    factor
ORDER BY 
    contribution DESC;	1417292000
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
    AND ar.date = '2024-09-20'
    AND ar.check_in > '08:00:00';	1597423542
SELECT 
    e.department_id, 
    e.employee_id, 
    e.name, 
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, e.birth_date)) AS max_age
FROM 
    employees e
JOIN (
    SELECT 
        department_id, 
        MIN(birth_date) AS oldest_birth_date
    FROM 
        employees
    GROUP BY 
        department_id
) oldest ON e.department_id = oldest.department_id AND e.birth_date = oldest.oldest_birth_date;	3397723976
SELECT e.name AS employee_name, ar.check_in AS check_in_time
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '人力资源部' 
  AND ar.date = '2024-09-30' 
  AND ar.check_in > '09:00:00';	339893232
SELECT 
    e.name AS employee_name,
    a.check_in AS check_in_time
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    attendance_records a ON e.employee_id = a.employee_id
WHERE 
    d.name = '研发部' 
    AND a.date = '2024-09-18' 
    AND a.check_in > '09:00:00';	244305078
SELECT e.name AS name, ar.check_in AS check_in, pe.rating AS rating
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
    pe.rating AS rating
FROM 
    employees e
LEFT JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
LEFT JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
ORDER BY 
    e.employee_id, 
    ar.date DESC;	3166523944
SELECT e.name, a.award_name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN awards a ON e.employee_id = a.employee_id
WHERE ar.date = '2024-10-05'
  AND ar.check_in > '09:00:00'
  AND a.year = 2021;	3133264714
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
    AND ar.date = '2024-09-25'
    AND ar.check_in > '08:30:00';	2850698943
WITH quarterly_top_performers AS (
    SELECT 
        a.year AS year,
        CEILING(a.year % 100 / 3.0) AS quarter,
        a.employee_id,
        COUNT(*) AS award_count,
        RANK() OVER (PARTITION BY a.year, CEILING(a.year % 100 / 3.0) ORDER BY COUNT(*) DESC) AS performance_rank
    FROM 
        awards a
    WHERE 
        a.year >= EXTRACT(YEAR FROM CURRENT_DATE) - 3
    GROUP BY 
        a.year, CEILING(a.year % 100 / 3.0), a.employee_id
),
attendance_stats AS (
    SELECT 
        EXTRACT(YEAR FROM ar.date) AS year,
        EXTRACT(QUARTER FROM ar.date) AS quarter,
        ar.employee_id,
        AVG(EXTRACT(EPOCH FROM (ar.check_out - ar.check_in))/3600) AS avg_hours_worked,
        STDDEV(EXTRACT(EPOCH FROM (ar.check_out - ar.check_in))/3600) AS stddev_hours
    FROM 
        attendance_records ar
    GROUP BY 
        year, quarter, ar.employee_id
)
SELECT 
    q.year AS year,
    q.quarter AS quarter,
    q.employee_id AS employee_id
FROM 
    quarterly_top_performers q
JOIN 
    attendance_stats a ON q.year = a.year AND q.quarter = a.quarter AND q.employee_id = a.employee_id
WHERE 
    q.performance_rank = 1
ORDER BY 
    q.year, q.quarter;	2860363666
SELECT e.employee_id AS employee_id, 
       e.name AS name, 
       a.award_name AS award_name, 
       p.rating AS rating
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE a.year = 2023 AND p.rating = 'A+';	3284872060
SELECT e.name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2022 
  AND a.award_name = '质量改进奖'
  AND ar.date = '2024-10-04'
  AND ar.check_in > '09:00:00';	1370529433
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
    employees e ON ar.employee_id = e.employee_id
JOIN 
    awards a ON e.employee_id = a.employee_id
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
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-09-16' AND ar.check_in > '09:00:00';	3689323727
SELECT e.name AS employee_name, d.name AS department_name 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id;	2977986068
SELECT 
    id AS 员工ID,
    employee_id AS 员工编号,
    name AS 姓名,
    birth_date AS 出生日期,
    hire_date AS 入职日期,
    start_work_date AS 开始工作日期,
    remaining_annual_leave AS 剩余年假天数,
    department_id AS 部门编号,
    position AS 职位,
    phone_number AS 电话号码,
    car_plate AS 车牌号,
    university AS 毕业院校,
    major AS 专业,
    employee_type AS 员工类型
FROM employees
WHERE position = '助理'
ORDER BY hire_date ASC
LIMIT 1;	3402561235
SELECT e.name AS employee_name
FROM employees e
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE e.department_id = 'D00007' 
  AND pe.rating = 'A' 
  AND EXTRACT(YEAR FROM pe.evaluation_date) = 2024;	3958686389
SELECT e.name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2022 
  AND a.award_name = '创新奖'
  AND ar.date = '2024-10-12'
  AND ar.check_in > '09:00:00';	3786147845
SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-09-23' AND ar.check_in > '09:00:00';	1159542995
SELECT COUNT(DISTINCT e.employee_id) AS count
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE a.year = 2023 
  AND a.award_name = '质量改进奖'
  AND p.rating = 'A+';	3254827737
SELECT DISTINCT d.name AS department_name
FROM departments d
JOIN employees e ON d.department_id = e.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE ar.date = '2024-09-23'
  AND ar.check_in > '08:00:00'
  AND ar.check_out < '18:00:00';	3909320290
SELECT DISTINCT d.name AS department_name, e.name AS employee_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN awards a ON e.employee_id = a.employee_id
JOIN interviews i ON e.employee_id = i.employee_id
WHERE a.year = 2023 AND a.award_name = '优秀员工'
AND i.interview_date = '2023-10-09';	628072208
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
    ar.date = '2024-10-12' 
    AND ar.check_in < '09:00:00'
    AND pe.rating = 'B+';	3286899081
SELECT e.name, ar.check_in
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-09-20'
  AND pe.rating = 'A+'
  AND ar.check_in > '09:00:00';	2517269758
SELECT 
    e.name AS name,
    a.award_name AS award_name,
    p.rating AS rating
FROM 
    employees e
    JOIN awards a ON e.employee_id = a.employee_id
    JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE 
    a.year = 2021 
    AND a.award_name = '质量改进奖' 
    AND p.rating = 'B+';	3866100328
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
SELECT 
    e.name AS employee_name, 
    d.name AS department_name, 
    d.manager_id
FROM 
    attendance_records ar
JOIN 
    employees e ON ar.employee_id = e.employee_id
JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    ar.date = '2024-09-16' 
    AND ar.check_in > '08:30:00';	2797510377
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
    AND e.position = '顾问'
    AND a.check_in > '09:00:00';	2587625643
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
    pe.status AS status
FROM 
    awards a
JOIN 
    employees e ON a.employee_id = e.employee_id
LEFT JOIN 
    probation_employees pe ON a.employee_id = pe.employee_id
WHERE 
    (a.award_name LIKE '%创新%' OR a.award_name LIKE '%技术%')
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
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE ar.date = '2024-09-20' AND ar.check_in > '09:00:00';	3669286537
SELECT 
    e.name AS name,
    e.employee_id AS employee_id,
    d.name AS department_name,
    p.rating AS rating
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE d.name = '研发部' AND p.rating = 'B+'
AND p.evaluation_date <= '2024-09-29'
AND (p.evaluation_date = (
    SELECT MAX(p2.evaluation_date) 
    FROM performance_evaluations p2 
    WHERE p2.employee_id = p.employee_id 
    AND p2.evaluation_date <= '2024-09-29'
))
ORDER BY e.name;	1975822937
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
SELECT e.name AS name, e.hire_date AS hire_date, a.award_name AS award_name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
WHERE a.award_name = '客户满意度奖'
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
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE p.evaluation_date = '2022-06-20' AND p.rating = 'C';	804998806
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
    AND a.award_name = '客户满意度奖' 
    AND p.rating = 'C';	170694593
SELECT e.name, 
       AVG(EXTRACT(EPOCH FROM (ar.check_out - ar.check_in))/3600) AS avg_work_hours
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2023 
  AND a.award_name = '项目管理奖'
  AND ar.date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY e.name, e.employee_id
HAVING AVG(EXTRACT(EPOCH FROM (ar.check_out - ar.check_in))/3600) > 10;	2091607073
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
SELECT e.name AS name, e.employee_id AS employee_id, ar.check_in AS check_in
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '人力资源部'
  AND ar.date = '2024-09-26'
  AND ar.check_in > '09:00:00';	2557740373
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
  AND ar.check_in > '09:00:00';	1074403791
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
SELECT 
    e.name AS employee_name,
    e.employee_id AS employee_id,
    ar.check_in AS check_in,
    d.name AS department_name,
    d.manager_id AS manager_id
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-09-18'
  AND ar.check_in > '09:00:00';	219564979
SELECT e.name, ar.check_in
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.award_name = '技术突破奖' 
  AND a.year = 2023
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
SELECT DISTINCT e.name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE a.year = 2020 
  AND a.award_name = '优秀员工'
  AND EXTRACT(YEAR FROM p.evaluation_date) = 2023
  AND p.rating = 'C';	4144781586
SELECT e.name AS employee_name, ar.check_in AS check_in_time, pe.rating AS performance_rating
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE ar.date = '2024-10-03' 
  AND pe.rating = 'C'
  AND ar.check_in > '09:00:00';	543593806
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
        EXTRACT(YEAR FROM i.interview_date) AS interview_year,
        e.department_id,
        COUNT(DISTINCT e.employee_id)::float / NULLIF(COUNT(DISTINCT i.employee_id), 0) AS department_hire_rate
    FROM 
        interviews i
    LEFT JOIN 
        employees e ON i.employee_id = e.employee_id
    WHERE 
        i.interview_date >= CURRENT_DATE - INTERVAL '5 years'
    GROUP BY 
        interview_year, e.department_id
),
ranked_departments AS (
    SELECT 
        interview_year AS year,
        department_id,
        department_hire_rate AS hire_rate,
        RANK() OVER (PARTITION BY interview_year ORDER BY department_hire_rate DESC) AS rank
    FROM 
        yearly_hire_rates
)
SELECT 
    year,
    department_id,
    hire_rate
FROM 
    ranked_departments
WHERE 
    rank = 1
ORDER BY 
    year DESC;	1798514231
SELECT e.name AS name, e.employee_id AS employee_id, ar.check_in AS check_in, ar.check_out AS check_out
FROM employees e
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE e.university = '清华大学' AND ar.date = '2024-10-12';	2882208186
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
FROM performance_evaluations pe
JOIN employees e ON pe.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE pe.rating = 'D' AND pe.evaluation_date = '2023-04-20';	776263740
SELECT 
    0.0 AS award_and_performance_ratio;	1728657056
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
    EXTRACT(YEAR FROM e.hire_date) = 2023
    AND a.year = 2023
    AND p.rating = 'A+'
    AND a.award_name LIKE '%优秀员工%';	4069271992
SELECT e.name AS name, ar.check_in AS check_in
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '客户服务部'
  AND ar.date = '2024-09-21'
  AND ar.check_in > '09:00:00';	2408826226
SELECT 
    e.employee_id, 
    COALESCE(SUM(EXTRACT(EPOCH FROM (a.check_out - a.check_in)) / 3600, 0) AS total_work_hours
FROM employees e
LEFT JOIN attendance_records a ON e.employee_id = a.employee_id
GROUP BY e.employee_id;	2252548426
SELECT e.name AS employee_name, e.employee_id AS employee_id, ar.check_in AS check_in_time
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE d.name = '客户服务部' AND ar.date = '2024-09-15' AND ar.check_in > '09:00:00';	141603518
SELECT 
    e.name AS name,
    ar.date AS date,
    ar.check_in AS check_in
FROM 
    employees e
JOIN 
    awards a ON e.employee_id = a.employee_id
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
WHERE 
    a.year = 2021 
    AND a.award_name = '创新奖'
    AND ar.date = '2024-10-05'
    AND ar.check_in > '09:00:00';	3509550647
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
    AND p.rating = 'C';	102704152
SELECT 
    e.name AS employee_name,
    a.award_name AS award_received,
    p.rating AS performance_rating
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
WHERE a.year = 2024
  AND a.award_name = '项目管理奖'
  AND ar.date = '2024-09-23';	2339648
SELECT 
    e.name AS employee_name, 
    d.name AS department_name, 
    pe.rating AS performance_rating
FROM 
    employees e
JOIN 
    attendance_records ar ON e.employee_id = ar.employee_id
LEFT JOIN 
    departments d ON e.department_id = d.department_id
LEFT JOIN 
    performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE 
    ar.date = '2024-09-20';	1476916008
SELECT e.name AS employee_name, d.name AS department_name, d.manager_id
FROM attendance_records ar
JOIN employees e ON ar.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE ar.date = '2024-09-26' AND ar.check_in > '09:30:00';	2848971755
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
    AND ar.date = '2024-10-03'
    AND ar.check_in > '09:00:00';	1510555187
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
    d.acct_bal > 100000 
    AND d.data_dt = '2024-07-19'
    AND l.loan_balance > 500000
    AND l.dw_date = '2024-07-19';	2192717523
SELECT 
    cust_no AS customer_number,
    wealth_bal AS wealth_balance
FROM financial_products 
WHERE currency = 'USD' 
  AND wealth_bal > 5000000 
  AND data_dt = '2024-07-02';	747211607
SELECT rs_type_name, rs_type_id 
FROM five_level_classification 
WHERE rs_type = '不良' AND data_dt = '2024-07-22';	218132520
SELECT 
    c.customer_name AS customer_name,
    o.occupation_name AS occupation_name,
    lr.description AS repayment_description
FROM 
    customer c
LEFT JOIN 
    occupation o ON c.occupation_id = o.id
LEFT JOIN 
    loan_application la ON c.id = la.customer_id
LEFT JOIN 
    loan_repayment lr ON la.id = lr.loan_application_id
WHERE 
    lr.repayment_amount IS NOT NULL 
    AND lr.description IS NOT NULL
ORDER BY 
    lr.repayment_amount DESC
LIMIT 100;	175056471
SELECT 
    customer_name AS "客户姓名",
    id_number AS "身份证号", 
    phone_number AS "手机号", 
    email AS "电子邮件", 
    address AS "住址"
FROM customer 
WHERE occupation_id IN (SELECT id FROM occupation WHERE occupation_name = '护士')
ORDER BY customer_name;	334027216
SELECT COUNT(DISTINCT d.cust_no) AS count
FROM deposit_account_info d
JOIN loan_detail_info l ON d.cust_no = l.cust_id
WHERE d.org_nm LIKE '%沈阳%' 
  AND d.cust_type = '2' 
  AND d.data_dt = '2024-07-19' 
  AND l.dw_date = '2024-07-19';	3272129262
SELECT DISTINCT 
    c.curr_code AS currency_code,
    c.curr_full_name AS currency_full_name,
    b.bank_name AS bank_organization_name,
    b.bank_level AS bank_hierarchy_level
FROM currency c
JOIN deposit_account_info d ON c.curr_code = d.cur_type
JOIN bank_orgnization b ON d.org_no = b.bank_id
WHERE c.data_dt = '2023-06-30' AND c.curr_class != 'CNY';	2889578956
SELECT deposit_id, deposit_name FROM deposit_type WHERE data_dt = '2024-07-22';	88302712
SELECT 
    d.card_no AS card_no,
    d.cust_nm AS cust_nm,
    d.residential_address AS residential_address
FROM 
    debit_card_information d
WHERE 
    DATE(d.open_date) = '2024-07-15' 
    AND d.current_bal > 2000;	1348647978
SELECT customer_id, credit_score 
FROM loan_credit 
WHERE credit_date = '2003-06-22' AND credit_score > 0.75;	1016905624
SELECT 
    c.gender AS gender,
    c.customer_name AS customer_name,
    SUM(lr.repayment_amount) AS repayment_amount
FROM 
    customer c
JOIN 
    loan_application la ON c.id = la.customer_id
JOIN 
    loan_repayment lr ON la.id = lr.loan_application_id
GROUP BY 
    c.gender, c.customer_name
ORDER BY 
    c.gender;	3611732895
SELECT la.loan_amount, c.customer_name AS cust_name
FROM loan_application la
JOIN customer c ON la.customer_id = c.id
ORDER BY la.loan_amount DESC
LIMIT 1;	1319754722
SELECT COUNT(DISTINCT f.cust_no) AS count
FROM financial_products f
WHERE f.wealth_bal > 1000000
AND EXISTS (
    SELECT 1 
    FROM debit_card_information d 
    WHERE d.cust_no = f.cust_no 
    AND d.card_state = '正常'
);	2123954700
SELECT 
    cust_name AS customer_name,
    ci_ref_acct AS account_reference_number, 
    act_mon_avg_bal AS actual_monthly_average_balance
FROM 
    deposit_account_info
WHERE 
    org_nm = '沈阳余淮支行'
    AND acct_type_code = '活期'
    AND data_dt = '2024-07-19'::timestamp
    AND act_mon_avg_bal > 50000;	4161720938
SELECT 
    c.customer_name AS customer_name,
    la.loan_amount AS loan_amount
FROM 
    loan_application la
JOIN 
    customer c ON la.customer_id = c.id
WHERE 
    la.loan_amount > 30000 
    AND la.status = 'PENDING';	1485816909
SELECT dt.deposit_type_name, COUNT(DISTINCT c.id) AS customer_count
FROM customer c
JOIN deposit_account_info dai ON dai.cert_code = c.id_number
JOIN deposit_type dt ON dai.acct_type_code = dt.deposit_type_id
WHERE c.id IN (
    SELECT c.id
    FROM customer c
    JOIN loan_application la ON c.id = la.customer_id
    GROUP BY c.id
    ORDER BY SUM(la.loan_amount) DESC
    LIMIT 20
)
GROUP BY dt.deposit_type_name;	864749016
SELECT curr_code, curr_full_name 
FROM currency 
WHERE curr_class = '外币' 
ORDER BY curr_code ASC;	3380354553
SELECT 
    c.id AS customer_id, 
    la.loan_amount AS loan_amount
FROM 
    customer c
LEFT JOIN 
    loan_application la ON c.id = la.customer_id
ORDER BY 
    la.loan_amount DESC NULLS LAST;	146146439
SELECT 
    cast_type,
    AVG(wealth_sta_m_avg_bal_a + wealth_sta_m_avg_bal_b) AS avg_monthly_balance
FROM financial_products
WHERE EXTRACT(YEAR FROM data_dt) = 2024 AND EXTRACT(MONTH FROM data_dt) = 7
GROUP BY cast_type;	2245911258
SELECT 
    reportid AS loan_report_id,
    cust_id AS customer_id,
    cust_type AS customer_type,
    iou_no AS iou_number,
    loan_type AS loan_type_code,
    loan_orgno AS lending_organization_code,
    vouch_type AS guarantee_type,
    currency_type AS currency_code,
    account_state AS account_status,
    loan_amount AS total_loan_amount,
    loan_balance AS outstanding_balance,
    blc_capital AS capital_balance,
    blc_inner AS internal_balance,
    blc_off AS external_balance,
    judgelevel AS risk_classification,
    loandate_s AS loan_start_date,
    loandate_e AS loan_end_date,
    dw_date AS data_warehouse_date
FROM loan_detail_info
WHERE loandate_s > '2024-04-01';	904046704
WITH age_group_avg AS (
    SELECT 
        CASE 
            WHEN EXTRACT(YEAR FROM AGE(c.birth_date)) BETWEEN 0 AND 20 THEN '0-20'
            WHEN EXTRACT(YEAR FROM AGE(c.birth_date)) BETWEEN 21 AND 40 THEN '21-40'
            WHEN EXTRACT(YEAR FROM AGE(c.birth_date)) BETWEEN 41 AND 60 THEN '41-60'
            ELSE '61+'
        END AS age_group,
        AVG(la.loan_amount) AS avg_loan_amount
    FROM 
        loan_application la
    JOIN 
        customer c ON la.customer_id = c.id
    GROUP BY 
        CASE 
            WHEN EXTRACT(YEAR FROM AGE(c.birth_date)) BETWEEN 0 AND 20 THEN '0-20'
            WHEN EXTRACT(YEAR FROM AGE(c.birth_date)) BETWEEN 21 AND 40 THEN '21-40'
            WHEN EXTRACT(YEAR FROM AGE(c.birth_date)) BETWEEN 41 AND 60 THEN '41-60'
            ELSE '61+'
        END
)
SELECT 
    c.customer_name AS customer_name,
    CASE 
        WHEN EXTRACT(YEAR FROM AGE(c.birth_date)) BETWEEN 0 AND 20 THEN '0-20'
        WHEN EXTRACT(YEAR FROM AGE(c.birth_date)) BETWEEN 21 AND 40 THEN '21-40'
        WHEN EXTRACT(YEAR FROM AGE(c.birth_date)) BETWEEN 41 AND 60 THEN '41-60'
        ELSE '61+'
    END AS age_group,
    la.loan_amount AS loan_amount,
    aga.avg_loan_amount AS avg_loan_amount
FROM 
    loan_application la
JOIN 
    customer c ON la.customer_id = c.id
JOIN 
    age_group_avg aga ON 
    CASE 
        WHEN EXTRACT(YEAR FROM AGE(c.birth_date)) BETWEEN 0 AND 20 THEN '0-20'
        WHEN EXTRACT(YEAR FROM AGE(c.birth_date)) BETWEEN 21 AND 40 THEN '21-40'
        WHEN EXTRACT(YEAR FROM AGE(c.birth_date)) BETWEEN 41 AND 60 THEN '41-60'
        ELSE '61+'
    END = aga.age_group
WHERE 
    la.loan_amount > aga.avg_loan_amount * 1.5;	2037290745
SELECT birth_date AS customer_birth_date, gender AS customer_gender FROM customer;	1073845704
SELECT DISTINCT 
    cust_id AS customer_id, 
    loan_balance AS outstanding_loan_amount
FROM loan_detail_info 
WHERE loan_balance > 500000 
AND dw_date = '2024-07-19' 
AND loan_orgno IN (
    SELECT bank_id 
    FROM bank_orgnization 
    WHERE (bank_name LIKE '%沈阳%' OR bank_parent IN (
        SELECT bank_id 
        FROM bank_orgnization 
        WHERE bank_name LIKE '%沈阳%' 
        AND bank_level = '分行'
        AND data_dt = '2024-07-19'
    ))
    AND data_dt = '2024-07-19'
);	1970903262
SELECT 
    ldi.reportid AS reportid,
    ldi.loan_balance AS loan_balance,
    c.curr_full_name AS curr_full_name,
    flc.rs_type_name AS rs_type_name
FROM 
    loan_detail_info ldi
LEFT JOIN 
    currency c ON ldi.currency_type = c.curr_code
LEFT JOIN 
    five_level_classification flc ON ldi.judgelevel = flc.rs_type_id
WHERE 
    ldi.loan_balance > 1000000;	2098164166
SELECT 
    ldi.cust_id AS customer_id,
    c.curr_full_name AS currency_full_name,
    ldi.loan_balance AS loan_balance_amount
FROM 
    loan_detail_info ldi
JOIN 
    currency c ON ldi.currency_type = c.curr_code
WHERE 
    ldi.loan_balance > 1000000
ORDER BY 
    ldi.loan_balance DESC;	3382000879
SELECT 
    customer_id, 
    COUNT(DISTINCT behavior_type) AS behavior_type_count
FROM 
    user_behavior
WHERE 
    behavior_date >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY 
    customer_id
ORDER BY 
    behavior_type_count DESC
LIMIT 5;	2579167658
SELECT 
    COALESCE(SUM(stm_overdu), 0) AS total_overdue_amount, 
    COUNT(DISTINCT xaccount) AS account_count 
FROM 
    credit_card_data 
WHERE 
    corporation = 'Corp3' 
    AND DATE(cycle_nbr) = '2024-07-03' 
    AND stm_overdu > 0;	1454085576
SELECT 
    reportid AS 报告ID,
    cust_id AS 客户编号,
    cust_type AS 客户类型,
    iou_no AS 借据编号,
    loan_type AS 贷款类型,
    loan_orgno AS 贷款机构编号,
    vouch_type AS 担保类型,
    currency_type AS 货币类型,
    account_state AS 账户状态,
    loan_amount AS 贷款金额,
    loan_balance AS 贷款余额,
    blc_capital AS 本金余额,
    blc_inner AS 内部余额,
    blc_off AS 外部余额,
    judgelevel AS 五级分类,
    loandate_s AS 贷款开始日期,
    loandate_e AS 贷款结束日期,
    dw_date AS 数据仓库日期
FROM loan_detail_info
WHERE cust_id = '1004';	1846154246
SELECT 
    c.customer_name AS customer_name,
    t.transfer_amount AS transfer_amount,
    t.transfer_date AS transfer_date
FROM 
    customer c
LEFT JOIN 
    transfer t ON c.id = t.source_customer_id OR c.id = t.target_customer_id;	3291969349
SELECT 
    c.id AS customer_id, 
    ub.behavior_type AS behavior_type, 
    lr.repayment_amount AS repayment_amount
FROM 
    customer c
LEFT JOIN 
    user_behavior ub ON c.id = ub.customer_id
LEFT JOIN 
    loan_application la ON c.id = la.customer_id
LEFT JOIN 
    loan_repayment lr ON la.id = lr.loan_application_id;	3977283654
SELECT 
    d.cust_name AS customer_name,
    d.acct_bal AS account_balance,
    dt.deposit_name AS deposit_type_name
FROM 
    deposit_account_info d
JOIN 
    deposit_type dt ON d.acct_type_code = dt.deposit_id
WHERE 
    d.data_dt = '2024-07-21'::timestamp 
    AND d.acct_bal > 50000;	2512363543
WITH customer_loans AS (
    SELECT 
        c.id,
        c.customer_name,
        c.province,
        COALESCE(SUM(l.loan_amount), 0) AS total_loan
    FROM 
        customer c
    LEFT JOIN 
        loan_detail_info l ON c.id_number = l.cust_id
    GROUP BY 
        c.id, c.customer_name, c.province
),
province_totals AS (
    SELECT 
        province,
        SUM(total_loan) AS province_total
    FROM 
        customer_loans
    GROUP BY 
        province
)
SELECT 
    cl.customer_name,
    cl.province,
    cl.total_loan,
    CASE 
        WHEN pt.province_total = 0 THEN 0 
        ELSE ROUND((cl.total_loan * 100.0 / pt.province_total), 2) 
    END AS percentage
FROM 
    customer_loans cl
JOIN 
    province_totals pt ON cl.province = pt.province
WHERE 
    cl.total_loan > 0;	4035425926
WITH province_occupation_stats AS (
    SELECT 
        c.province,
        o.occupation_name,
        COUNT(*) AS total_applications,
        SUM(CASE WHEN la.status = 'APPROVED' THEN 1 ELSE 0 END) AS approved_count,
        ROUND(SUM(CASE WHEN la.status = 'APPROVED' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS approval_rate
    FROM 
        loan_application la
    JOIN 
        customer c ON la.customer_id = c.id
    JOIN 
        occupation o ON c.occupation_id = o.id
    GROUP BY 
        c.province, o.occupation_name
),
ranked_occupations AS (
    SELECT 
        province,
        occupation_name,
        approval_rate,
        RANK() OVER (PARTITION BY province ORDER BY approval_rate DESC) AS rank
    FROM 
        province_occupation_stats
    WHERE 
        total_applications > 10  -- 确保有足够样本量
)
SELECT 
    province AS province,
    occupation_name AS occupation_name,
    approval_rate AS approval_rate
FROM 
    ranked_occupations
WHERE 
    rank = 1
ORDER BY 
    province;	82349614
WITH branch_total AS (
    SELECT 
        org_nm,
        SUM(acct_bal) AS total_balance
    FROM 
        deposit_account_info
    GROUP BY 
        org_nm
),
ranked_customers AS (
    SELECT 
        org_nm,
        cust_no,
        acct_bal,
        ROW_NUMBER() OVER (PARTITION BY org_nm ORDER BY acct_bal DESC) AS customer_rank
    FROM 
        deposit_account_info
)
SELECT 
    r.org_nm AS bank_nm,
    SUM(r.acct_bal) / b.total_balance AS top_10_ratio
FROM 
    ranked_customers r
JOIN 
    branch_total b ON r.org_nm = b.org_nm
WHERE 
    r.customer_rank <= 10
GROUP BY 
    r.org_nm, b.total_balance
ORDER BY 
    top_10_ratio DESC;	3816528329
SELECT cust_nm AS customer_name, tel_no AS phone_number 
FROM debit_card_information 
WHERE cust_nm LIKE '%Lee%';	3967240206
SELECT 
    c.id AS customer_id, 
    ub.behavior_type AS behavior_type, 
    lr.repayment_amount AS repayment_amount
FROM 
    customer c
LEFT JOIN 
    user_behavior ub ON c.id = ub.customer_id
LEFT JOIN 
    loan_application la ON c.id = la.customer_id
LEFT JOIN 
    loan_repayment lr ON la.id = lr.loan_application_id;	2555762315
SELECT DISTINCT lc.customer_id, la.id AS loan_application_id
FROM loan_credit lc
JOIN loan_application la ON lc.customer_id = la.customer_id
JOIN loan_repayment lr ON la.id = lr.loan_application_id
WHERE lc.credit_score > 0.75 
  AND DATE(lr.repayment_date) = '2021-11-10';	1472446382
SELECT 
    id AS repayment_id,
    loan_application_id AS application_id,
    repayment_amount AS amount,
    repayment_date AS payment_date,
    description AS repayment_description
FROM 
    loan_repayment 
WHERE 
    repayment_amount > 900;	837468015
SELECT 
    cust_no AS customer_number,
    cust_nm AS customer_name,
    card_no AS card_number,
    residential_address AS residential_address
FROM debit_card_information 
WHERE card_state = '正常' 
AND residential_address = '987 Willow Street' 
AND data_dt = '2024-07-09';	3614707278
SELECT 
    c.id AS cust_id, 
    COALESCE(ldi.loan_balance, 0) AS loan_balance
FROM 
    customer c
LEFT JOIN 
    loan_application la ON c.id = la.customer_id
LEFT JOIN 
    loan_detail_info ldi ON la.id::text = ldi.reportid;	3381297740
SELECT 
    lt.loan_type_name AS loan_type_name,
    COUNT(DISTINCT dci.cust_no) AS user_count
FROM 
    loan_detail_info ldi
JOIN 
    loan_type lt ON ldi.loan_type = lt.loan_type_code
JOIN 
    debit_card_information dci ON ldi.cust_id = dci.cust_id::integer
GROUP BY 
    lt.loan_type_name;	3209601254
SELECT lt.loan_type_name AS loan_type, COUNT(DISTINCT la.customer_id) AS customer_count
FROM loan_application la
JOIN loan_type lt ON la.loan_type_id = lt.id
GROUP BY lt.loan_type_name;	1181974520
SELECT 
    lc.credit_score AS credit_score,
    lc.description AS description
FROM 
    loan_credit lc
WHERE 
    lc.credit_date = '2011-04-13';	4290316983
SELECT 
    SUM(fp.wealth_bal) AS total_wealth_bal,
    SUM(fp.wealth_bal_t) AS total_wealth_bal_t
FROM 
    financial_products fp
JOIN 
    deposit_account_info dai ON fp.cust_no = dai.cust_no
WHERE 
    fp.data_dt = '2024-07-14' 
    AND dai.org_nm LIKE '%余淮支行%' 
    AND dai.bank_nm LIKE '%沈阳%'
    AND dai.cust_type = '2';	4121525980
SELECT customer_id, credit_score 
FROM loan_credit 
WHERE credit_date = '2003-06-22' AND credit_score > 0.75;	1634196262
SELECT 
    source_customer_id AS source_customer_id, 
    target_customer_id AS target_customer_id 
FROM transfer;	2019378478
SELECT loan_type_name FROM loan_type WHERE loan_type_code = 'MORTGAGE';	522536270
SELECT 
    cust_nm AS customer_name,
    card_no AS card_number
FROM 
    debit_card_information
WHERE 
    card_state = '正常'
    AND data_dt = '2024-07-05';	126227619
SELECT 
    bank_nm AS bank_name,
    cast_type AS customer_type,
    COUNT(*) AS product_count
FROM 
    financial_products
GROUP BY 
    bank_nm, cast_type
ORDER BY 
    bank_nm, cast_type;	2456368123
SELECT deposit_name, deposit_type_id FROM deposit_type ORDER BY deposit_name;	1564372003
SELECT 
    la.status AS loan_status,
    la.loan_amount AS loan_amount
FROM 
    loan_application la
JOIN 
    customer c ON la.customer_id = c.id;	2160477527
SELECT c.id AS customer_id
FROM customer c
JOIN loan_credit lc ON c.id = lc.customer_id
WHERE lc.credit_score = 0.77;	1462437870
SELECT 
    lt.description AS description,
    lr.repayment_amount AS repayment_amount
FROM 
    loan_type lt
LEFT JOIN 
    loan_application la ON lt.id = la.loan_type_id
LEFT JOIN 
    loan_repayment lr ON la.id = lr.loan_application_id;	4083934626
SELECT rs_type_id AS classification_code, rs_type_name AS classification_name 
FROM five_level_classification;	2872120818
SELECT 
    card_no AS card_number,
    closing_date AS card_closing_date
FROM 
    debit_card_information
WHERE 
    closing_date > '2024-07-05';	1283326851
SELECT 
    card_type_nm AS "卡种类名称",
    card_state AS "卡状态"
FROM 
    debit_card_information 
WHERE 
    card_type_nm IS NOT NULL;	531921010
SELECT cust_id, SUM(loan_balance) AS total_loan_balance
FROM loan_detail_info
WHERE dw_date = '2024-07-19' AND loan_balance > 100000
GROUP BY cust_id;	1418289021
SELECT 
    b.bank_name AS bank_nm,
    CORR(d.acct_bal, l.loan_balance) AS correlation_coefficient
FROM 
    bank_orgnization b
JOIN 
    deposit_account_info d ON b.bank_id = d.org_no
JOIN 
    loan_detail_info l ON b.bank_id = l.loan_orgno
GROUP BY 
    b.bank_name
HAVING 
    COUNT(*) > 1;	137242606
SELECT 
    DATE_TRUNC('month', COALESCE(t.transfer_date, l.apply_date)) AS month,
    COALESCE(SUM(t.transfer_amount), 0) AS transfer_amount_total,
    COALESCE(SUM(l.loan_amount), 0) AS loan_amount_total
FROM 
    transfer t
FULL OUTER JOIN 
    loan_application l ON DATE_TRUNC('month', t.transfer_date) = DATE_TRUNC('month', l.apply_date)
GROUP BY 
    DATE_TRUNC('month', COALESCE(t.transfer_date, l.apply_date))
ORDER BY 
    month;	2672242323
SELECT customer_name AS 客户姓名, phone_number AS 手机号码 
FROM customer 
WHERE province = '上海市';	2845015839
SELECT credit_score, credit_date FROM loan_credit WHERE customer_id = 533302;	1582007502
SELECT 
    id AS transaction_id,
    source_customer_id AS sender_customer_id,
    target_customer_id AS receiver_customer_id,
    transfer_amount AS amount,
    transfer_date AS transaction_date,
    description AS transaction_description
FROM 
    transfer
ORDER BY 
    transfer_amount DESC;	283689317
SELECT 
    customer_id,
    COUNT(DISTINCT behavior_type) AS unique_behavior_types
FROM 
    user_behavior
GROUP BY 
    customer_id;	1594346019
SELECT COUNT(DISTINCT d.cust_no) AS count
FROM deposit_account_info d
JOIN credit_card_data c ON d.cust_no = c.custr_nbr
JOIN bank_orgnization b ON d.org_no = b.bank_id
WHERE b.bank_name LIKE '%沈阳%'
AND d.data_dt = '2024-07-22'::timestamp
AND c.dw_date = '2024-07-22'::timestamp
AND d.acct_bal > 100000
AND c.stm_overdu > 5000;	3342713409
SELECT card_no AS "卡号", cust_nm AS "客户名称" 
FROM debit_card_information 
WHERE org_nm = '北京分行';	842726032
WITH monthly_applications AS (
    SELECT 
        customer_id,
        DATE_TRUNC('month', apply_date) AS month_period
    FROM 
        loan_application
    GROUP BY 
        customer_id, 
        DATE_TRUNC('month', apply_date)
),
consecutive_check AS (
    SELECT 
        customer_id,
        month_period,
        LEAD(month_period, 1) OVER (PARTITION BY customer_id ORDER BY month_period) AS next_month,
        LEAD(month_period, 2) OVER (PARTITION BY customer_id ORDER BY month_period) AS third_month
    FROM 
        monthly_applications
)
SELECT 
    COUNT(DISTINCT customer_id) AS customer_count
FROM 
    consecutive_check
WHERE 
    (third_month - month_period) = INTERVAL '2 months'
    AND (next_month - month_period) = INTERVAL '1 month';	236915033
SELECT cust_no, bank_nm 
FROM financial_products 
ORDER BY cust_no;	4229311898
SELECT occupation_code, occupation_name 
FROM occupation 
ORDER BY occupation_name;	258690623
SELECT COUNT(DISTINCT fp.cust_no) AS count
FROM financial_products fp
JOIN debit_card_information dbi ON fp.cust_no = dbi.cust_no
WHERE fp.wealth_bal > (dbi.current_bal * 10);	3376193292
SELECT 
    loan_orgno AS loan_institution_number,
    loan_balance AS outstanding_loan_balance
FROM 
    loan_detail_info
WHERE 
    loan_amount > 70000;	116553538
SELECT 
    lt.loan_type_name AS loan_type_name,
    ub.behavior_type AS behavior_type
FROM 
    loan_type lt
LEFT JOIN 
    loan_application la ON lt.id = la.loan_type_id
LEFT JOIN 
    user_behavior ub ON la.customer_id = ub.customer_id
GROUP BY 
    lt.loan_type_name, ub.behavior_type
ORDER BY 
    lt.loan_type_name, ub.behavior_type;	646950911
SELECT bank_level, COUNT(*) AS institution_count 
FROM bank_orgnization 
GROUP BY bank_level;	109259315
SELECT d.current_bal AS "活期余额", d.fixed_bal AS "定期余额"
FROM debit_card_information d
JOIN customer c ON d.cust_id = c.id_number
WHERE d.org_nm = '北京东单支行'
  AND c.customer_name = 'Olivia Lee'
  AND d.data_dt = '2024-07-15';	2700778328
SELECT 
    c.customer_name AS customer_name,
    lc.description AS description
FROM 
    customer c
JOIN 
    loan_credit lc ON c.id = lc.customer_id
WHERE 
    lc.credit_date = '2017-10-31' 
    AND lc.credit_score > 0.85
ORDER BY 
    lc.credit_score DESC;	4212764935
SELECT la.loan_amount
FROM loan_application la
JOIN loan_type lt ON la.loan_type_id = lt.id
WHERE lt.loan_type_code = 'CAR';	4269406178
SELECT lt.loan_type_name, 
       AVG(lr.repayment_amount) AS avg_repayment_amount, 
       COUNT(lr.id) AS repayment_count
FROM loan_repayment lr
JOIN loan_application la ON lr.loan_application_id = la.id
JOIN loan_type lt ON la.loan_type_id = lt.id
GROUP BY lt.loan_type_name;	1128360712
SELECT 
    acc_name1 AS account_name, 
    bank AS bank_name, 
    category AS account_category, 
    day_opened AS opening_date
FROM 
    credit_card_data
WHERE 
    corporation = 'Corp3'
ORDER BY 
    day_opened DESC;	2724005771
SELECT customer_name AS 客户姓名, address AS 客户住址 FROM customer;	3382134012
SELECT 
    l.loan_orgno AS loan_orgno, 
    SUM(l.loan_amount) AS total_loan_amount
FROM 
    loan_detail_info l
WHERE 
    EXTRACT(YEAR FROM l.dw_date) = 2023
GROUP BY 
    l.loan_orgno;	1545912595
SELECT 
    id AS repayment_id,
    loan_application_id AS application_id,
    repayment_amount AS amount,
    repayment_date AS payment_date,
    description AS repayment_description
FROM loan_repayment
ORDER BY ABS(repayment_amount - (SELECT AVG(repayment_amount) FROM loan_repayment))
LIMIT 1;	2397640501
SELECT DISTINCT c.id AS customer_id
FROM customer c
JOIN loan_credit lc ON c.id = lc.customer_id
JOIN financial_products fp ON c.id_number = fp.cust_no
WHERE lc.credit_score > 0.8
AND fp.data_dt >= '2024-07-01'
AND fp.data_dt < '2024-08-01';	561955406
SELECT 
    EXTRACT(YEAR FROM apply_date) AS year,
    EXTRACT(MONTH FROM apply_date) AS month,
    ROUND(COUNT(CASE WHEN status = 'APPROVED' THEN 1 END) * 100.0 / COUNT(*), 2) AS approval_rate
FROM loan_application
GROUP BY year, month
ORDER BY year, month;	1986127383
SELECT 
    bo.bank_name,
    COUNT(DISTINCT c.id) AS new_customer_count,
    AVG(la.loan_amount) AS avg_loan_amount
FROM 
    customer c
JOIN 
    user_behavior ub ON c.id = ub.customer_id
JOIN 
    loan_application la ON c.id = la.customer_id
LEFT JOIN 
    deposit_account_info dai ON c.id_number = dai.cert_code
LEFT JOIN 
    bank_orgnization bo ON dai.org_no = bo.bank_id
WHERE 
    ub.behavior_date BETWEEN '2024-01-01' AND '2024-03-31'
    AND ub.behavior_type = 'new_customer'
    AND la.apply_date BETWEEN '2024-01-01' AND '2024-03-31'
GROUP BY 
    bo.bank_name;	1657316021
SELECT bo.bank_name AS bank_nm, 
       AVG(la.loan_term) AS avg_loan_term_months, 
       AVG(la.loan_amount) AS avg_loan_amount_rmb
FROM loan_application la
JOIN customer c ON la.customer_id = c.id
JOIN deposit_account_info dai ON c.id_number = dai.cert_code
JOIN bank_orgnization bo ON dai.org_no = bo.bank_id
WHERE bo.bank_level = '2'
GROUP BY bo.bank_name;	2162181589
SELECT 
    customer_id AS customer_id,
    credit_score AS credit_score,
    credit_date AS credit_date
FROM loan_credit;	2307971258
SELECT cust_id, loan_balance 
FROM loan_detail_info 
WHERE loandate_e::date < '2026-01-01';	2557946358
SELECT apply_date AS apply_date, loan_amount AS loan_amount FROM loan_application;	3214990589
SELECT 
    la.customer_id AS customer_id,
    la.loan_amount AS loan_amount
FROM 
    loan_application la
JOIN 
    loan_type lt ON la.loan_type_id = lt.id
WHERE 
    lt.loan_type_code = 'MORTGAGE'
    AND la.status = 'APPROVED'
ORDER BY 
    la.loan_amount DESC;	140188268
SELECT 
    org_nm AS branch_name, 
    bank_nm AS parent_bank, 
    SUM(acct_bal) AS total_balance
FROM 
    deposit_account_info
GROUP BY 
    org_nm, bank_nm
ORDER BY 
    total_balance DESC
LIMIT 5;	2839950527
SELECT 
    id AS repayment_id,
    loan_application_id AS application_id,
    repayment_amount AS amount,
    repayment_date AS payment_date,
    description AS repayment_description
FROM 
    loan_repayment 
WHERE 
    description = '严琳';	2833646672
SELECT rs_type, COUNT(*) AS count 
FROM five_level_classification 
GROUP BY rs_type;	508839263
SELECT rs_type, COUNT(*) AS count 
FROM five_level_classification 
GROUP BY rs_type;	3720034566
SELECT 
    bo.bank_name AS bank_name,
    fp.cust_no AS cust_no,
    fp.wealth_bal AS wealth_bal
FROM 
    financial_products fp
JOIN 
    bank_orgnization bo ON fp.bank_no = bo.bank_id
ORDER BY 
    bo.bank_name, fp.cust_no;	1167041688
SELECT loan_type_name AS loan_type_name, description AS description 
FROM loan_type 
ORDER BY loan_type_code;	1532873158
SELECT b1.bank_name, b2.bank_name AS parent_name 
FROM bank_orgnization b1
JOIN bank_orgnization b2 ON b1.bank_parent = b2.bank_id
WHERE b1.bank_level = '2';	2367133121
WITH ranked_loans AS (
    SELECT 
        c.province,
        c.customer_name,
        la.loan_amount,
        DENSE_RANK() OVER (PARTITION BY c.province ORDER BY la.loan_amount DESC) as rank
    FROM 
        customer c
    JOIN 
        loan_application la ON c.id = la.customer_id
)
SELECT 
    province AS 省份,
    customer_name AS 客户姓名,
    loan_amount AS 贷款金额
FROM 
    ranked_loans
WHERE 
    rank <= 3
ORDER BY 
    省份, 
    贷款金额 DESC;	2982430979
SELECT 
    id AS 转账记录ID,
    source_customer_id AS 源客户ID,
    target_customer_id AS 目标客户ID,
    transfer_amount AS 转账金额,
    transfer_date AS 转账日期,
    description AS 转账描述
FROM 
    transfer 
WHERE 
    source_customer_id = 376252;	4126585093
SELECT 
    c.customer_name AS customer_name,
    c.gender AS gender,
    o.occupation_name AS occupation_name
FROM 
    customer c
LEFT JOIN 
    occupation o ON c.occupation_id = o.id;	1577554550
SELECT 
    COUNT(DISTINCT cust_no) AS customer_count,
    SUM(wealth_bal_f) AS total_non_guaranteed_wealth_balance
FROM 
    financial_products
WHERE 
    (bank_nm = '沈阳余淮支行' OR org_nm = '沈阳余淮支行')
    AND wealth_bal_f > 0
    AND data_dt >= '2024-07-01' 
    AND data_dt < '2024-08-01';	1654794343
SELECT DISTINCT customer_id 
FROM loan_credit 
WHERE credit_score > 0.8;	2092588313
SELECT 
    c1.customer_name AS source_customer_name,
    c2.customer_name AS target_customer_name,
    t.transfer_amount
FROM 
    transfer t
JOIN 
    customer c1 ON t.source_customer_id = c1.id
JOIN 
    customer c2 ON t.target_customer_id = c2.id
WHERE 
    t.transfer_amount > 5000;	2021025668
SELECT DISTINCT c.id AS customer_id
FROM customer c
JOIN loan_application la ON c.id = la.customer_id
WHERE EXTRACT(YEAR FROM la.apply_date) = 2019 
AND la.status = 'APPROVED';	891116215
SELECT 
    d.card_type, 
    d.card_type_nm, 
    COUNT(DISTINCT d.cust_no) AS customer_count, 
    AVG(f.wealth_bal) AS avg_wealth_bal
FROM 
    debit_card_information d
LEFT JOIN 
    financial_products f ON d.cust_no = f.cust_no
GROUP BY 
    d.card_type, d.card_type_nm;	3533102799
SELECT 
    c.customer_name AS customer_name,
    la.loan_amount AS loan_amount
FROM 
    loan_application la
JOIN 
    customer c ON la.customer_id = c.id
ORDER BY 
    la.apply_date ASC;	2160175524
SELECT 
    COALESCE(SUM(acct_bal), 0) AS total_acct_bal,
    COALESCE(SUM(act_year_avg_bal), 0) AS total_act_year_avg_bal
FROM deposit_account_info
WHERE data_dt = '2024-07-19' AND cust_type = 'P';	305358980
SELECT 
    c.customer_name AS customer_name,
    o.occupation_name AS occupation_name
FROM 
    loan_repayment lr
    JOIN loan_application la ON lr.loan_application_id = la.id
    JOIN customer c ON la.customer_id = c.id
    JOIN occupation o ON c.occupation_id = o.id
WHERE 
    lr.repayment_amount < 500;	3219483220
SELECT cust_name AS customer_name, acct_bal AS account_balance 
FROM deposit_account_info 
WHERE data_dt = '2023-07-19';	3553634354
SELECT 
    dai.cust_no AS customer_id,
    dai.acct_bal AS max_deposit_balance,
    la.loan_amount AS latest_loan_amount,
    la.apply_date AS latest_loan_date
FROM deposit_account_info dai
JOIN customer c ON dai.cust_no = c.id_number
JOIN loan_application la ON c.id = la.customer_id
WHERE dai.cust_no = (
    SELECT cust_no
    FROM deposit_account_info
    GROUP BY cust_no
    ORDER BY MAX(acct_bal) DESC
    LIMIT 1
)
ORDER BY la.apply_date DESC
LIMIT 1;	1610907085
SELECT o.occupation_name, COUNT(c.id) AS customer_count 
FROM customer c 
JOIN occupation o ON c.occupation_id = o.id 
GROUP BY o.occupation_name;	1410414363
SELECT c.customer_name, t.transfer_amount
FROM transfer t
JOIN customer c ON t.source_customer_id = c.id
WHERE t.transfer_date = '2016-06-11' 
AND t.transfer_amount > 5000
ORDER BY t.transfer_amount DESC;	3954115529
SELECT 
    ldi.cust_id AS customer_id,
    ldi.loan_balance AS loan_balance,
    ldi.loan_type AS loan_type,
    c.curr_full_name AS currency_full_name
FROM 
    loan_detail_info ldi
JOIN 
    currency c ON ldi.currency_type = c.curr_code
WHERE 
    ldi.loandate_s > '2024-07-01' 
    AND ldi.loan_balance > 1000000
ORDER BY 
    ldi.loan_balance DESC;	1086674624
SELECT 
    id AS 行为ID,
    customer_id AS 客户ID,
    behavior_type AS 行为类型,
    behavior_date AS 行为日期,
    description AS 行为描述
FROM 
    user_behavior 
WHERE 
    behavior_date = '2018-06-26';	1680159550
SELECT 
    id AS repayment_id,
    loan_application_id AS application_id,
    repayment_amount AS amount,
    repayment_date AS payment_date,
    description AS payment_description
FROM 
    loan_repayment
WHERE 
    EXTRACT(DOW FROM repayment_date) IN (0, 6);	2548352227
SELECT 
    dt.deposit_name AS deposit_name,
    lt.loan_type_name AS loan_type_name,
    COUNT(DISTINCT c.id) AS customer_count
FROM 
    customer c
INNER JOIN deposit_account_info dai ON c.id_number = dai.cert_code
INNER JOIN deposit_type dt ON dai.acct_type_code = dt.deposit_id AND dai.data_dt = dt.data_dt
INNER JOIN loan_application la ON c.id = la.customer_id
INNER JOIN loan_type lt ON la.loan_type_id = lt.id
GROUP BY 
    dt.deposit_name, 
    lt.loan_type_name
ORDER BY 
    customer_count DESC;	1833243393
SELECT c.customer_name, lr.repayment_amount 
FROM loan_repayment lr
JOIN loan_application la ON lr.loan_application_id = la.id
JOIN customer c ON la.customer_id = c.id
WHERE lr.repayment_date = '2021-11-10' 
AND lr.repayment_amount > 20
ORDER BY lr.repayment_amount DESC;	3824204712
SELECT 
    lt.loan_type_name,
    AVG(lc.credit_score) AS average_credit_score
FROM 
    loan_type lt
JOIN 
    loan_application la ON lt.id = la.loan_type_id
JOIN 
    loan_credit lc ON la.customer_id = lc.customer_id
GROUP BY 
    lt.loan_type_name;	3260667731
SELECT loan_type_name, loan_type_code FROM loan_type WHERE loan_type_code IS NOT NULL;	732762958
SELECT ls.loan_status_name, COUNT(*) AS count
FROM loan_application la
JOIN loan_status ls ON la.status = ls.loan_status_code
GROUP BY ls.loan_status_name;	330418458
SELECT 
    customer_id AS customer_id,
    description AS credit_description
FROM loan_credit;	245397134
SELECT 
    d.cust_nm AS customer_name,
    d.cust_id AS id_number,
    d.tel_no AS phone_number,
    d.card_no AS debit_card_number,
    d.current_bal AS current_balance
FROM 
    debit_card_information d
WHERE 
    d.org_no = 'BANK_00201'
    AND DATE(d.open_date) = '2024-07-15';	2669572809
SELECT 
    cust_type AS customer_type,
    SUM(loan_amount) AS total_loan_amount
FROM 
    loan_detail_info
GROUP BY 
    cust_type
ORDER BY 
    cust_type;	2085255506
SELECT 
    reportid AS reportid,
    cust_id AS cust_id,
    cust_type AS cust_type,
    iou_no AS iou_no,
    loan_type AS loan_type,
    loan_orgno AS loan_orgno,
    vouch_type AS vouch_type,
    currency_type AS currency_type,
    account_state AS account_state,
    loan_amount AS loan_amount,
    loan_balance AS loan_balance,
    blc_capital AS blc_capital,
    blc_inner AS blc_inner,
    blc_off AS blc_off,
    judgelevel AS judgelevel,
    loandate_s AS loandate_s,
    loandate_e AS loandate_e,
    dw_date AS dw_date,
    (loan_balance / NULLIF(loan_amount, 0)) * 100 AS balance_ratio
FROM 
    loan_detail_info
WHERE 
    loan_amount > 0
ORDER BY 
    balance_ratio DESC
LIMIT 10;	1984536651
SELECT 
    la.customer_id AS customer_id,
    SUM(la.loan_amount) AS total_loan_amount
FROM 
    loan_application la
JOIN 
    loan_type lt ON la.loan_type_id = lt.id
WHERE 
    lt.loan_type_code = 'MORTGAGE'
    AND la.status = 'REJECTED'
    AND EXTRACT(YEAR FROM la.apply_date) = 2019
GROUP BY 
    la.customer_id;	258245311
SELECT 
    bank_level AS "银行等级", 
    bank_id AS "银行ID", 
    bank_name AS "银行名称", 
    bank_parent AS "上级银行", 
    data_dt AS "数据日期" 
FROM bank_orgnization;	1895651034
SELECT 
    ldi.reportid AS reportid,
    ldi.cust_id AS cust_id,
    ldi.loan_balance AS loan_balance,
    ldi.blc_capital AS blc_capital,
    c.curr_full_name AS curr_full_name,
    flc.rs_type_name AS rs_type_name
FROM 
    loan_detail_info ldi
LEFT JOIN 
    currency c ON ldi.currency_type = c.curr_code
LEFT JOIN 
    five_level_classification flc ON ldi.judgelevel = flc.rs_type
WHERE 
    ldi.dw_date = '2024-07-22' 
    AND ldi.blc_capital > 10000;	134489693
SELECT card_state AS card_status, open_date AS account_opening_date 
FROM debit_card_information 
WHERE card_state = '正常';	2899938404
SELECT 
    c.customer_name AS customer_name,
    t.transfer_amount AS transfer_amount,
    t.transfer_date AS transfer_date
FROM 
    transfer t
JOIN 
    customer c ON t.source_customer_id = c.id OR t.target_customer_id = c.id
WHERE 
    t.transfer_date = '2023-06-30'
ORDER BY 
    t.transfer_amount DESC;	1614542471
SELECT bank_name AS "银行名称", bank_level AS "银行层级" 
FROM bank_orgnization 
WHERE data_dt = '2023-06-30';	2860028194
SELECT cust_no, SUM(wealth_bal_f) AS total_wealth_bal_f FROM financial_products WHERE data_dt = '2024-07-02' AND wealth_bal_f > 0 GROUP BY cust_no ORDER BY total_wealth_bal_f DESC;	2112082105
SELECT SUM(loan_amount) AS sum
FROM loan_application
WHERE EXTRACT(YEAR FROM apply_date) = 2019
AND status = 'REJECTED';	1900105170
SELECT 
    org_nm AS branch_name, 
    SUM(acct_bal) AS total_balance
FROM 
    deposit_account_info
WHERE 
    bank_nm LIKE '%杭州%' 
    AND data_dt = '2024-07-21' 
    AND cust_type = '2'
GROUP BY 
    org_nm;	3724611031
SELECT 
    la.customer_id AS loan_application_id,
    COALESCE(SUM(lr.repayment_amount), 0) AS total_repayment,
    COUNT(DISTINCT ub.id) AS behavior_count,
    COALESCE(AVG(lr.repayment_amount), 0) AS avg_repayment_amount
FROM 
    loan_application la
LEFT JOIN 
    loan_repayment lr ON la.id = lr.loan_application_id
LEFT JOIN 
    user_behavior ub ON la.customer_id = ub.customer_id
GROUP BY 
    la.customer_id;	3179484363
SELECT 
    bank_name AS "银行名称", 
    bank_level AS "机构层级", 
    data_dt AS "数据日期" 
FROM bank_orgnization;	3200437107
WITH top_10_percent_depositors AS (
    SELECT 
        cust_name AS customer_name,
        acct_bal AS deposit_balance,
        cert_code AS id_number,
        NTILE(10) OVER (ORDER BY acct_bal DESC) AS percentile
    FROM deposit_account_info
),
customer_with_occupation AS (
    SELECT 
        c.id,
        c.customer_name,
        c.occupation_id,
        c.id_number
    FROM customer c
)
SELECT 
    d.customer_name AS customer_name,
    d.deposit_balance AS deposit_balance,
    co.occupation_id AS occupation_id
FROM top_10_percent_depositors d
JOIN customer_with_occupation co ON d.id_number = co.id_number
LEFT JOIN loan_application l ON co.id = l.customer_id
WHERE d.percentile = 1 AND l.id IS NULL;	2071923254
SELECT 
    dai.org_nm AS branch_name,
    ROUND(COUNT(CASE WHEN la.status = 'APPROVED' THEN 1 END) * 100.0 / COUNT(*), 2) AS approval_rate_percentage
FROM 
    loan_application la
JOIN 
    deposit_account_info dai ON la.customer_id = CAST(dai.cust_no AS integer)
GROUP BY 
    dai.org_nm;	3565838054
SELECT 
    cust_name AS customer_name,
    acct_bal AS account_balance
FROM 
    deposit_account_info
WHERE 
    data_dt >= '2023-07-01' AND data_dt <= '2023-07-31';	1893298039
SELECT 
    d.org_nm AS bank_name,
    d.cust_name AS cust_name,
    d.acct_bal AS account_balance,
    d.cur_type AS currency_type
FROM 
    deposit_account_info d
WHERE 
    d.data_dt = '2023-06-30'::timestamp
    AND d.acct_bal > 100000
    AND d.cur_type IN (SELECT curr_code FROM currency WHERE curr_full_name LIKE '%Dollar%' OR curr_full_name LIKE '%USD%');	2315630941
SELECT 
    d.cust_name AS customer_name,
    d.acct_type_code AS account_type,
    d.acct_bal AS account_balance,
    c.curr_full_name AS currency_full_name
FROM 
    deposit_account_info d
JOIN 
    currency c ON d.cur_type = c.curr_code
WHERE 
    d.data_dt = '2024-07-19' 
    AND d.acct_bal > 100000;	870110560
SELECT 
    cust_nm AS customer_name,
    card_no AS card_number
FROM 
    debit_card_information 
WHERE 
    card_state = '正常' 
    AND open_date > '2024-07-01' 
ORDER BY 
    open_date DESC;	1308562229
SELECT deposit_name, deposit_type_id 
FROM deposit_type 
ORDER BY deposit_name;	1986404179
WITH customer_transfer_counts AS (
    SELECT 
        source_customer_id,
        COUNT(*) AS transfer_count
    FROM transfer
    GROUP BY source_customer_id
    ORDER BY transfer_count DESC
    LIMIT 10
),
customer_amount_counts AS (
    SELECT 
        t.source_customer_id,
        t.transfer_amount,
        COUNT(*) AS amount_count,
        RANK() OVER (PARTITION BY t.source_customer_id ORDER BY COUNT(*) DESC) AS amount_rank
    FROM transfer t
    JOIN customer_transfer_counts c ON t.source_customer_id = c.source_customer_id
    GROUP BY t.source_customer_id, t.transfer_amount
)
SELECT 
    c.source_customer_id,
    c.transfer_count,
    a.transfer_amount AS most_common_amount
FROM customer_transfer_counts c
JOIN customer_amount_counts a ON c.source_customer_id = a.source_customer_id
WHERE a.amount_rank = 1
ORDER BY c.transfer_count DESC;	2032902123
[最终SQL查询]
SELECT 
    COUNT(DISTINCT c.id) AS customer_count,
    COALESCE(SUM(ldi.loan_balance), 0) AS total_loan_balance
FROM 
    customer c
LEFT JOIN 
    credit_card_data ccd ON c.id_number = ccd.custr_nbr
LEFT JOIN 
    loan_detail_info ldi ON c.id_number = ldi.cust_id
WHERE 
    c.province = '上海市'
    AND ccd.acct_sts IS NULL  -- 假设NULL表示正常状态，基于之前的查询结果
    AND ldi.account_state = '正常';	3109098948
SELECT 
    d.reportid AS report_id,
    d.loan_balance AS loan_balance_amount,
    f.rs_type_name AS five_level_classification_name,
    t.loan_type_name AS loan_type_name
FROM 
    loan_detail_info d
JOIN 
    five_level_classification f ON d.judgelevel = f.rs_type_id
JOIN 
    loan_type t ON d.loan_type = t.loan_type_code
WHERE 
    d.loan_balance > 15000 
    AND d.dw_date = '2024-07-22';	188271146
SELECT COUNT(DISTINCT c.id) AS customer_count
FROM customer c
WHERE EXISTS (
    SELECT 1 FROM loan_application la1
    JOIN loan_type lt1 ON la1.loan_type_id = lt1.id
    WHERE la1.customer_id = c.id AND lt1.loan_type_code = 'MORTGAGE'
)
AND EXISTS (
    SELECT 1 FROM loan_application la2
    JOIN loan_type lt2 ON la2.loan_type_id = lt2.id
    WHERE la2.customer_id = c.id AND lt2.loan_type_code = 'CAR'
)
AND (
    SELECT MAX(la1.loan_amount)
    FROM loan_application la1
    JOIN loan_type lt1 ON la1.loan_type_id = lt1.id
    WHERE la1.customer_id = c.id AND lt1.loan_type_code = 'MORTGAGE'
) > (
    SELECT MAX(la2.loan_amount)
    FROM loan_application la2
    JOIN loan_type lt2 ON la2.loan_type_id = lt2.id
    WHERE la2.customer_id = c.id AND lt2.loan_type_code = 'CAR'
);	7209425
SELECT 
    d.cust_nm AS cust_nm,
    SUM(d.current_bal) AS total_balance
FROM 
    debit_card_information d
WHERE 
    d.org_nm LIKE '%杭州上城区支行%' 
    AND d.data_dt = '2024-07-19'
GROUP BY 
    d.cust_nm
ORDER BY 
    total_balance DESC;	1065176696
SELECT 
    vouch_type,
    AVG(loan_amount) AS avg_loan_amount,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY loan_amount) AS median_loan_amount,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY loan_amount) - PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY loan_amount) AS iqr_loan_amount
FROM loan_detail_info
GROUP BY vouch_type;	953680810
SELECT SUM(t.transfer_amount) AS sum
FROM transfer t
JOIN customer c1 ON t.source_customer_id = c1.id
JOIN loan_credit lc1 ON c1.id = lc1.customer_id AND lc1.credit_score > 0.8
JOIN customer c2 ON t.target_customer_id = c2.id
JOIN loan_credit lc2 ON c2.id = lc2.customer_id AND lc2.credit_score > 0.8
WHERE t.transfer_date = '2020-11-03';	2393859347
SELECT COUNT(DISTINCT c.id) AS count
FROM loan_application la
JOIN customer c ON la.customer_id = c.id
JOIN occupation o ON c.occupation_id = o.id
WHERE la.loan_amount > 50000 AND o.occupation_name = '护士';	749612150
SELECT c.id AS cust_id, la.loan_amount AS loan_amount
FROM loan_application la
JOIN customer c ON la.customer_id = c.id
WHERE la.apply_date BETWEEN '2024-07-01' AND '2024-07-31';	3260359700
SELECT 
    EXTRACT(YEAR FROM apply_date) || '-' || LPAD(EXTRACT(MONTH FROM apply_date)::text, 2, '0') AS month,
    COUNT(*) AS total_applications,
    SUM(CASE WHEN status = 'APPROVED' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS approval_rate
FROM loan_application
GROUP BY EXTRACT(YEAR FROM apply_date), EXTRACT(MONTH FROM apply_date)
ORDER BY EXTRACT(YEAR FROM apply_date), EXTRACT(MONTH FROM apply_date);	2869045188
SELECT bank_nm AS bank_name, SUM(wealth_bal) AS total_wealth_bal 
FROM financial_products 
WHERE data_dt = '2024-07-02' AND cast_type = '对公' 
GROUP BY bank_nm;	2139894777
SELECT 
    c.customer_name AS customer_name,
    COALESCE(ls.loan_status_name, 'No Application') AS status
FROM 
    customer c
LEFT JOIN 
    loan_application la ON c.id = la.customer_id
LEFT JOIN 
    loan_status ls ON la.status = ls.loan_status_code;	2426521027
SELECT 
    lt.loan_type_name AS loan_type_name,
    COUNT(DISTINCT la.customer_id) AS customer_count,
    SUM(la.loan_amount) AS total_loan_amount
FROM 
    loan_application la
JOIN 
    loan_type lt ON la.loan_type_id = lt.id
GROUP BY 
    lt.loan_type_name;	3310012060
SELECT 
    CASE 
        WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.birth_date)) BETWEEN 0 AND 20 THEN '0-20'
        WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.birth_date)) BETWEEN 21 AND 40 THEN '21-40'
        WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.birth_date)) BETWEEN 41 AND 60 THEN '41-60'
        ELSE '61+'
    END AS age_group,
    ROUND(COUNT(*) FILTER (WHERE la.status = 'approved') * 100.0 / COUNT(*), 2) AS approval_rate
FROM 
    loan_application la
JOIN 
    customer c ON la.customer_id = c.id
GROUP BY 
    age_group
ORDER BY 
    age_group;	1454101538
SELECT repayment_amount, repayment_date 
FROM loan_repayment 
WHERE loan_application_id = 323803;	1355579742
SELECT c.id AS customer_id, lc.credit_score
FROM customer c
JOIN loan_credit lc ON c.id = lc.customer_id
WHERE c.province = '浙江省' AND c.address LIKE '%杭州上城区%' AND lc.credit_date <= '2023-06-30'
ORDER BY lc.credit_score DESC
LIMIT 1;	2730549341
SELECT 
    id AS 还款记录ID,
    loan_application_id AS 贷款申请ID,
    repayment_amount AS 还款金额,
    repayment_date AS 还款日期,
    description AS 还款描述
FROM 
    loan_repayment 
WHERE 
    repayment_date < '2020-02-25';	1021718263
SELECT 
    t.transfer_amount AS transfer_amount,
    t.transfer_date AS transfer_date
FROM 
    transfer t
JOIN 
    customer c ON t.source_customer_id = c.id OR t.target_customer_id = c.id
WHERE 
    c.customer_name = '关飞';	405520388
SELECT 
    c.customer_name AS customer_name,
    c.id_number AS id_number,
    ls.loan_status_name AS loan_status_name
FROM 
    customer c
LEFT JOIN 
    loan_application la ON c.id = la.customer_id
LEFT JOIN 
    loan_status ls ON la.status = ls.loan_status_code
GROUP BY 
    c.customer_name, c.id_number, ls.loan_status_name;	1969682603
SELECT 
    id AS behavior_id,
    customer_id AS customer_identifier,
    behavior_type AS behavior_category,
    behavior_date AS behavior_timestamp,
    description AS behavior_description
FROM 
    user_behavior
WHERE 
    behavior_type LIKE '%ILL%';	797442197
SELECT 
    id AS transfer_id,
    source_customer_id AS source_customer_id,
    target_customer_id AS target_customer_id,
    transfer_amount AS transfer_amount,
    transfer_date AS transfer_date,
    description AS transfer_description
FROM 
    transfer
ORDER BY 
    transfer_amount ASC;	3086691704
SELECT 
    id AS behavior_id,
    customer_id AS user_id,
    behavior_type AS action_type,
    behavior_date AS action_date,
    description AS behavior_description
FROM 
    user_behavior
WHERE 
    description IS NOT NULL;	1652118460
SELECT current_bal
FROM debit_card_information d
JOIN bank_orgnization b ON d.bank_no = b.bank_id
WHERE d.cust_nm = 'James Taylor' 
  AND b.bank_name LIKE '%杭州上城区支行%'
  AND d.data_dt = '2024-07-09';	729818388
SELECT 
    id AS loan_type_id,
    loan_type_code AS type_code,
    loan_type_name AS type_name,
    description AS type_description
FROM 
    loan_type 
WHERE 
    description LIKE '%Loan%';	3319537046
SELECT 
    c.curr_num AS curr_code, 
    cu.curr_full_name, 
    COUNT(*) AS account_count
FROM 
    credit_card_data c
LEFT JOIN 
    currency cu ON c.curr_num = cu.curr_code
GROUP BY 
    c.curr_num, cu.curr_full_name;	981960336
SELECT AVG(wealth_f_m_avg_bal_a) AS avg_guaranteed_balance
FROM financial_products
WHERE wealth_f_m_avg_bal_a IS NOT NULL;	446364127
SELECT lt.loan_type_name, lt.description
FROM loan_application la
JOIN loan_type lt ON la.loan_type_id = lt.id
WHERE la.status = 'APPROVED';	1464013698
SELECT 
    c.customer_name AS customer_name,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.birth_date)) AS age,
    la.loan_amount AS loan_amount
FROM loan_application la
JOIN customer c ON la.customer_id = c.id
WHERE EXTRACT(YEAR FROM la.apply_date) = 2023
ORDER BY age DESC
LIMIT 5;	2417924945
SELECT COUNT(DISTINCT lc.customer_id) AS high_credit_customer_count
FROM loan_credit lc
JOIN customer c ON lc.customer_id = c.id
JOIN debit_card_information dci ON dci.cust_id = c.id_number
JOIN bank_orgnization bo ON bo.bank_id = dci.org_no
WHERE lc.credit_score > 0.75
  AND bo.bank_name = '杭州上城区支行'
  AND bo.data_dt = '2023-06-30'
  AND dci.data_dt = '2023-06-30'
  AND lc.credit_date <= '2023-06-30'
  AND c.province = '浙江省'
  AND c.address LIKE '%上城区%'
  AND EXISTS (
    SELECT 1 FROM deposit_account_info dai 
    WHERE dai.cert_code = c.id_number 
    AND dai.data_dt = '2023-06-30'
  );	3366689482
SELECT rs_type, COUNT(*) AS count 
FROM five_level_classification 
WHERE data_dt = '2024-07-22' 
GROUP BY rs_type;	3973811473
SELECT f.rs_type_name, COUNT(ub.id) AS behavior_count
FROM five_level_classification f
LEFT JOIN loan_detail_info l ON f.rs_type_id = l.judgelevel
LEFT JOIN customer c ON l.cust_id = c.id_number
LEFT JOIN user_behavior ub ON c.id = ub.customer_id
GROUP BY f.rs_type_name;	1905559813
SELECT 
    id AS transfer_id,
    source_customer_id AS source_customer_id,
    target_customer_id AS target_customer_id,
    transfer_amount AS transfer_amount,
    transfer_date AS transfer_date,
    description AS transfer_description
FROM 
    transfer
ORDER BY 
    transfer_date;	6017603
SELECT 
    d.card_type AS card_type_code,
    d.card_type_nm AS card_type_name,
    d.card_state AS card_status
FROM debit_card_information d
JOIN bank_orgnization b ON d.org_no = b.bank_id
WHERE d.cust_nm = 'James Taylor'
AND b.bank_name LIKE '%杭州上城区支行%'
AND d.data_dt BETWEEN '2024-07-01' AND '2024-07-31';	2286869285
SELECT SUM(wealth_bal) AS sum 
FROM financial_products 
WHERE currency = 'USD' AND data_dt = '2024-07-02';	1590803091
SELECT 
    c.id AS customer_id, 
    COUNT(ub.id) AS behavior_count, 
    MAX(lc.credit_score) AS latest_credit_score
FROM 
    customer c
LEFT JOIN 
    user_behavior ub ON c.id = ub.customer_id
LEFT JOIN 
    loan_credit lc ON c.id = lc.customer_id
GROUP BY 
    c.id
ORDER BY 
    c.id;	3414285101
SELECT t.transfer_amount, 
       c1.customer_name AS source_customer_name, 
       c2.customer_name AS target_customer_name
FROM transfer t
JOIN customer c1 ON t.source_customer_id = c1.id
JOIN customer c2 ON t.target_customer_id = c2.id
WHERE t.transfer_date = '2023-06-30' 
AND t.transfer_amount > 1000;	3246518573
SELECT 
    id AS customer_id,
    customer_name AS customer_name,
    id_number AS identification_number,
    phone_number AS phone_number,
    email AS email_address,
    address AS home_address,
    birth_date AS date_of_birth,
    gender AS gender,
    occupation_id AS occupation_id,
    province AS province
FROM 
    customer 
WHERE 
    customer_name = '饶丽';	104815069
SELECT card_no, cust_nm 
FROM debit_card_information 
WHERE card_state = '正常' AND data_dt = '2024-07-14';	3801446621
SELECT 
    ldi.cust_id AS cust_id,
    ldi.loan_balance AS loan_balance,
    flc.rs_type_name AS rs_type_name,
    c.curr_full_name AS curr_full_name
FROM 
    loan_detail_info ldi
JOIN 
    five_level_classification flc ON ldi.judgelevel = flc.rs_type_id
JOIN 
    currency c ON ldi.currency_type = c.curr_code
WHERE 
    ldi.dw_date = '2024-07-19' 
    AND ldi.loan_balance > 500000
ORDER BY 
    ldi.loan_balance DESC;	368801370
SELECT COUNT(DISTINCT c.id) AS count
FROM customer c
JOIN deposit_account_info d ON c.id_number = d.cert_code
WHERE c.province = '辽宁' 
  AND c.gender = '男'
  AND d.acct_bal > 100000
  AND d.data_dt = '2024-07-19';	852089580
SELECT 
    id AS loan_type_id, 
    loan_type_code AS type_code, 
    loan_type_name AS type_name, 
    description AS type_description 
FROM loan_type 
WHERE loan_type_code = 'CAR';	1377442693
SELECT 
    c.customer_name AS customer_name,
    la.loan_amount AS loan_amount
FROM 
    customer c
JOIN 
    loan_application la ON c.id = la.customer_id
WHERE 
    la.loan_amount > 10000;	2349708736
SELECT 
    c.customer_name,
    COALESCE(SUM(d.acct_bal), 0) AS total_deposit,
    COALESCE(AVG(lc.credit_score), 0) AS avg_credit_score,
    COALESCE(COUNT(lr.id), 0) AS loan_repayment_score,
    (COALESCE(SUM(d.acct_bal), 0) * 0.5 + 
    COALESCE(AVG(lc.credit_score), 0) * 100000 * 0.3 + 
    COALESCE(COUNT(lr.id), 0) * 1000 * 0.2) AS composite_score
FROM 
    customer c
LEFT JOIN 
    deposit_account_info d ON c.id_number = d.cert_code
LEFT JOIN 
    loan_credit lc ON c.id = lc.customer_id
LEFT JOIN 
    loan_application la ON c.id = la.customer_id
LEFT JOIN 
    loan_repayment lr ON la.id = lr.loan_application_id
GROUP BY 
    c.id, c.customer_name
ORDER BY 
    composite_score DESC
LIMIT 20;	3911124385
SELECT occupation_code, description 
FROM occupation 
WHERE occupation_name LIKE '%护士%';	3773516021
SELECT 
    ub.customer_id AS customer_id,
    ub.behavior_type AS behavior_type,
    lc.credit_score AS credit_score
FROM 
    user_behavior ub
LEFT JOIN 
    loan_credit lc ON ub.customer_id = lc.customer_id 
    AND lc.credit_date = (
        SELECT MAX(credit_date) 
        FROM loan_credit 
        WHERE customer_id = ub.customer_id 
        AND credit_date <= '2021-08-31'
    )
WHERE 
    ub.behavior_date BETWEEN '2021-08-01' AND '2021-08-31';	1642595147
SELECT 
    lt.loan_type_name AS loan_type_name,
    ls.loan_status_name AS loan_status_name,
    ls.description AS description
FROM 
    loan_type lt
CROSS JOIN 
    loan_status ls;	2547804030
SELECT 
    bank_nm AS bank_nm,
    SUM(wealth_bal) AS total_wealth_bal
FROM 
    financial_products
WHERE 
    cast_type = '对公' 
    AND data_dt = '2024-07-02'
GROUP BY 
    bank_nm;	1574302461
SELECT 
    c.id AS customer_id, 
    lt.loan_type_name AS loan_type_name, 
    la.loan_amount AS loan_amount, 
    la.loan_term AS loan_term, 
    la.apply_date AS apply_date, 
    la.status AS status
FROM 
    loan_application la
JOIN 
    loan_type lt ON la.loan_type_id = lt.id
JOIN 
    customer c ON la.customer_id = c.id
WHERE 
    lt.loan_type_name = '住房贷款'
    AND la.apply_date BETWEEN '2019-01-01' AND '2019-12-31'
    AND la.status = 'REJECTED';	576649992
SELECT 
    cust_no AS customer_number,
    wealth_bal_f AS non_principal_protected_wealth_balance
FROM 
    financial_products
WHERE 
    data_dt = '2024-07-19' 
    AND wealth_bal_f > 100000
ORDER BY 
    wealth_bal_f DESC;	278921693
SELECT customer_name AS 客户姓名, email AS 客户邮箱 FROM customer;	2923698873
WITH quarterly_stats AS (
    SELECT 
        c.customer_name,
        EXTRACT(QUARTER FROM la.apply_date) AS quarter,
        EXTRACT(YEAR FROM la.apply_date) AS year,
        COUNT(*) AS total_applications,
        SUM(CASE WHEN la.status = 'APPROVED' THEN 1 ELSE 0 END) AS approved_count,
        ROUND(SUM(CASE WHEN la.status = 'APPROVED' THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(*), 0), 2) AS success_rate
    FROM 
        loan_application la
    JOIN 
        customer c ON la.customer_id = c.id
    GROUP BY 
        c.customer_name, 
        EXTRACT(QUARTER FROM la.apply_date), 
        EXTRACT(YEAR FROM la.apply_date)
),
with_prev_quarter AS (
    SELECT 
        customer_name,
        quarter,
        year,
        success_rate,
        LAG(success_rate) OVER (PARTITION BY customer_name ORDER BY year, quarter) AS prev_quarter_rate,
        success_rate - LAG(success_rate) OVER (PARTITION BY customer_name ORDER BY year, quarter) AS rate_change
    FROM 
        quarterly_stats
)
SELECT 
    customer_name,
    quarter,
    success_rate,
    prev_quarter_rate,
    rate_change
FROM 
    with_prev_quarter
ORDER BY 
    customer_name, 
    year, 
    quarter;	2256662449
SELECT cust_name, acct_bal
FROM deposit_account_info
WHERE data_dt = '2024-07-19' AND cur_type = 'USD'
ORDER BY acct_bal DESC;	956063573
SELECT 
    customer_name AS customer_name,
    id_number AS id_number,
    phone_number AS phone_number,
    email AS email
FROM 
    customer
WHERE 
    birth_date > '1980-01-01';	568233943
SELECT 
    c.customer_name AS customer_name,
    o.occupation_name AS occupation_name,
    la.loan_amount AS loan_amount
FROM 
    loan_application la
JOIN 
    customer c ON la.customer_id = c.id
JOIN 
    occupation o ON c.occupation_id = o.id
ORDER BY 
    la.loan_amount DESC
LIMIT 5;	665248378
SELECT 
    cust_type AS customer_type, 
    loan_balance AS outstanding_loan_amount 
FROM 
    loan_detail_info;	1030650241
SELECT 
    0 AS total_current_bal,
    0 AS total_fixed_bal
FROM debit_card_information
WHERE org_nm = '杭州上城区支行' 
AND data_dt = '2023-06-30'
GROUP BY org_nm;	1979307069
AMBIGUOUS_QUERY	645950570
SELECT 
    id AS customer_id,
    customer_name AS customer_full_name,
    id_number AS identification_number,
    phone_number AS contact_phone,
    email AS email_address,
    address AS residential_address,
    birth_date AS date_of_birth,
    gender AS gender,
    occupation_id AS occupation_code,
    province AS province_of_residence
FROM customer 
WHERE id_number = 'c839d762-6392-4005-8386-ed4e2c50997a';	3312818819
SELECT credit_score AS credit_score, description AS description 
FROM loan_credit 
WHERE credit_date = '2003-06-22';	527420496
SELECT cust_name AS customer_name, acct_bal AS account_balance
FROM deposit_account_info 
WHERE data_dt = '2024-07-21' 
  AND org_nm LIKE '%杭州%' 
  AND acct_bal > 50000;	2918505586
SELECT 
    ldi.cust_id AS customer_id,
    ldi.loan_balance AS outstanding_loan_amount,
    COALESCE(dai.acct_bal, 0) AS deposit_account_balance
FROM 
    loan_detail_info ldi
LEFT JOIN 
    deposit_account_info dai ON ldi.cust_id = dai.cert_code 
    AND dai.data_dt = (SELECT MAX(data_dt) FROM deposit_account_info)
WHERE 
    ldi.loan_balance > 10000
ORDER BY 
    ldi.loan_balance DESC;	1280121870
SELECT 
    f.rs_type_name AS rs_type_name,
    COUNT(DISTINCT ld.cust_id) AS user_count,
    SUM(ld.loan_balance) AS total_balance
FROM 
    five_level_classification f
LEFT JOIN 
    loan_detail_info ld ON f.rs_type_id = ld.judgelevel
GROUP BY 
    f.rs_type_name;	2006837077
SELECT deposit_name FROM deposit_type WHERE data_dt = '2024-07-22';	938785076
SELECT 
    id AS transaction_id,
    source_customer_id AS sender_customer_id,
    target_customer_id AS receiver_customer_id,
    transfer_amount AS amount,
    transfer_date AS transaction_date,
    description AS transaction_description
FROM 
    transfer
WHERE 
    transfer_amount > 500;	182531082
SELECT 
    c.customer_name AS customer_name,
    c.id_number AS id_number,
    lc.credit_score AS credit_score
FROM 
    customer c
JOIN 
    loan_credit lc ON c.id = lc.customer_id
WHERE 
    c.province = '河北省' 
    AND lc.credit_score > 0.8
ORDER BY 
    lc.credit_score DESC;	1098966204
SELECT 
    CASE 
        WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.birth_date)) BETWEEN 20 AND 30 THEN '20-30岁'
        WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.birth_date)) BETWEEN 31 AND 40 THEN '31-40岁'
        WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.birth_date)) BETWEEN 41 AND 50 THEN '41-50岁'
        ELSE '51岁以上'
    END AS age_group,
    lt.loan_type_name AS loan_type_name,
    COUNT(*) AS total_applications,
    ROUND(100.0 * SUM(CASE WHEN la.status = 'APPROVED' THEN 1 ELSE 0 END) / COUNT(*), 2) AS success_rate
FROM 
    customer c
JOIN 
    loan_application la ON c.id = la.customer_id
JOIN 
    loan_type lt ON la.loan_type_id = lt.id
GROUP BY 
    age_group, lt.loan_type_name
ORDER BY 
    age_group, lt.loan_type_name;	2906434348
SELECT ls.loan_status_name AS loan_status_name, o.occupation_name AS occupation_name
FROM loan_status ls 
JOIN loan_application la ON ls.loan_status_code = la.status 
JOIN customer c ON la.customer_id = c.id 
JOIN occupation o ON c.occupation_id = o.id 
WHERE o.occupation_code = 'NURSE' AND ls.loan_status_code = 'APPROVED';	4018894094
SELECT 
    o.occupation_name,
    COUNT(DISTINCT c.id) AS customer_count,
    AVG(la.loan_amount) AS avg_loan_amount
FROM 
    occupation o
LEFT JOIN 
    customer c ON o.id = c.occupation_id
LEFT JOIN 
    loan_application la ON c.id = la.customer_id
GROUP BY 
    o.occupation_name
HAVING 
    COUNT(DISTINCT c.id) > 100;	2317494329
SELECT 
    f.cust_no AS customer_number,
    f.org_nm AS branch_name,
    f.currency AS currency_type,
    f.wealth_bal_f AS non_principal_guaranteed_amount
FROM 
    financial_products f
JOIN 
    bank_orgnization b ON f.org_no = b.bank_id
WHERE 
    b.bank_name = '沈阳余淮支行'
    AND f.currency = 'SGD'
    AND f.wealth_bal_f > 0
    AND f.data_dt = '2024-07-14';	2459941756
SELECT id_number AS identity_number, phone_number AS mobile_number FROM customer;	627241378
SELECT cust_nm AS customer_name, open_date AS account_opening_date 
FROM debit_card_information 
WHERE open_date >= '2024-07-05';	3818857737
WITH top_wealth_customers AS (
    SELECT cust_no, wealth_bal,
           NTILE(10) OVER (ORDER BY wealth_bal DESC) AS percentile_rank
    FROM financial_products
    WHERE data_dt = (SELECT MAX(data_dt) FROM financial_products)
SELECT DISTINCT t.cust_no
FROM top_wealth_customers t
JOIN user_behavior u ON t.cust_no = u.customer_id::character varying
WHERE t.percentile_rank = 1
  AND u.behavior_type = '登录'
  AND u.behavior_date >= CURRENT_DATE - INTERVAL '30 days';	1788527678
SELECT 
    c.id AS customer_id,
    lc.credit_score AS credit_score,
    ub.description AS description
FROM customer c
LEFT JOIN loan_credit lc ON c.id = lc.customer_id AND lc.credit_date = '2023-12-10'
LEFT JOIN user_behavior ub ON c.id = ub.customer_id AND ub.behavior_date = '2023-12-10'
WHERE (lc.credit_score IS NOT NULL OR ub.description IS NOT NULL)
ORDER BY c.id, lc.credit_score DESC;	1240825133
SELECT bank_id AS "机构编号", bank_name AS "机构名称" FROM bank_orgnization;	1225880496
SELECT 
    lr.repayment_amount AS repayment_amount,
    la.loan_amount AS loan_amount
FROM 
    loan_repayment lr
JOIN 
    loan_application la ON lr.loan_application_id = la.id
WHERE 
    lr.repayment_date = '2024-01-20';	1895296880
SELECT 
    c.curr_code AS currency_code,
    c.curr_full_name AS currency_full_name,
    COUNT(t.id) AS transfer_count
FROM 
    currency c
LEFT JOIN 
    transfer t ON t.description LIKE '%' || c.curr_code || '%' 
    AND t.transfer_date <= '2023-06-30'
WHERE 
    c.curr_d_class_en != 'CNY'
    AND c.data_dt = '2023-06-30'
GROUP BY 
    c.curr_code, c.curr_full_name;	1454533076
SELECT repayment_amount FROM loan_repayment WHERE loan_application_id = 742969 AND repayment_date = '2021-11-10';	3316681947
SELECT dt.deposit_type_name, 
       AVG(ld.loan_amount) AS avg_loan_amount, 
       STDDEV(ld.loan_amount) AS stddev_loan_amount
FROM deposit_type dt
JOIN deposit_account_info dai ON dt.deposit_id = dai.acct_type_code
JOIN customer c ON dai.cert_code = c.id_number
JOIN loan_detail_info ld ON c.id::text = ld.cust_id
WHERE ld.loan_amount IS NOT NULL
GROUP BY dt.deposit_type_name;	2982717712
SELECT 
    c.customer_name AS customer_name,
    o.occupation_name AS occupation_name,
    lr.repayment_date AS repayment_date
FROM 
    customer c
JOIN 
    occupation o ON c.occupation_id = o.id
JOIN 
    loan_application la ON c.id = la.customer_id
JOIN 
    loan_repayment lr ON la.id = lr.loan_application_id;	279794629
SELECT 
    lt.loan_type_name, 
    AVG(la.loan_amount) AS avg_loan_amount, 
    AVG(dai.acct_bal) AS avg_account_balance
FROM 
    loan_type lt
LEFT JOIN 
    loan_application la ON lt.id = la.loan_type_id
LEFT JOIN 
    deposit_account_info dai ON la.customer_id = CAST(dai.cust_no AS integer)
GROUP BY 
    lt.loan_type_name;	2733048479
SELECT COUNT(DISTINCT u.customer_id) AS count
FROM user_behavior u
JOIN loan_application l ON u.customer_id = l.customer_id
WHERE l.apply_date = '2019-01-10' 
  AND l.status = 'REJECTED'
  AND u.behavior_type = 'LOGIN'
  AND u.behavior_date = '2017-10-24';	1486729335
SELECT c.customer_name, la.loan_amount
FROM customer c
JOIN loan_application la ON c.id = la.customer_id
JOIN loan_credit lc ON c.id = lc.customer_id
WHERE EXTRACT(YEAR FROM la.apply_date) = 2019
  AND lc.credit_score > 0.8
ORDER BY la.loan_amount DESC;	760463294
SELECT 
    reportid AS "报告ID",
    cust_id AS "客户ID",
    cust_type AS "客户类型",
    iou_no AS "借据编号",
    loan_type AS "贷款类型",
    loan_orgno AS "贷款机构编号",
    vouch_type AS "担保类型",
    currency_type AS "货币类型",
    account_state AS "账户状态",
    loan_amount AS "贷款金额",
    loan_balance AS "贷款余额",
    blc_capital AS "本金余额",
    blc_inner AS "内部余额",
    blc_off AS "外部余额",
    judgelevel AS "五级分类等级",
    loandate_s AS "贷款起始日期",
    loandate_e AS "贷款到期日期",
    dw_date AS "数据更新时间"
FROM 
    loan_detail_info
WHERE 
    loan_balance > 500000
ORDER BY 
    loan_balance DESC;	84990606
SELECT customer_id, credit_score 
FROM loan_credit 
WHERE credit_score > 0.75 
  AND credit_date = '2003-06-22';	2524485514
SELECT customer_name, birth_date 
FROM customer 
WHERE birth_date > '1989-12-31' 
ORDER BY birth_date;	3030054295
SELECT 
    lc1.customer_id AS customer_id,
    (lc1.credit_score - lc2.credit_score) AS score_increase,
    lc1.credit_score AS current_score
FROM 
    loan_credit lc1
JOIN 
    loan_credit lc2 ON lc1.customer_id = lc2.customer_id 
    AND lc1.credit_date > lc2.credit_date
WHERE 
    lc1.credit_date >= CURRENT_DATE - INTERVAL '1 year'
    AND lc2.credit_date = (
        SELECT MAX(credit_date) 
        FROM loan_credit lc3 
        WHERE lc3.customer_id = lc1.customer_id 
        AND lc3.credit_date < lc1.credit_date
    )
ORDER BY 
    score_increase DESC
LIMIT 5;	2842932086
SELECT behavior_type, COUNT(DISTINCT customer_id) AS user_count 
FROM user_behavior 
GROUP BY behavior_type;	2650630480
SELECT 
    d.deposit_name,
    COUNT(DISTINCT a1.cust_no) AS original_customers,
    COUNT(DISTINCT a2.cust_no) AS retained_customers,
    ROUND(COUNT(DISTINCT a2.cust_no) * 100.0 / 
          NULLIF(COUNT(DISTINCT a1.cust_no), 0), 2) AS retention_rate
FROM 
    deposit_account_info a1
JOIN 
    deposit_type d ON a1.acct_type_code = d.deposit_id
LEFT JOIN 
    deposit_account_info a2 ON a1.cust_no = a2.cust_no 
    AND a1.acct_type_code = a2.acct_type_code
    AND a2.data_dt >= CURRENT_DATE - INTERVAL '1 year'
WHERE 
    a1.data_dt BETWEEN CURRENT_DATE - INTERVAL '2 years' AND CURRENT_DATE - INTERVAL '1 year'
GROUP BY 
    d.deposit_name
ORDER BY 
    retention_rate DESC;	3532447015
SELECT SUM(t.transfer_amount) AS total_transfer_amount
FROM bank_orgnization b
JOIN customer c ON b.bank_name = c.province
JOIN transfer t ON c.id = t.source_customer_id
WHERE b.bank_name = '沈阳分行' AND t.transfer_date = '2024-07-19';	2513228683
SELECT s.store_name, s.manager_name, SUM(ss.profit) AS max_profit
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
WHERE ss.date = '2023-05-06'
GROUP BY s.store_name, s.manager_name
ORDER BY max_profit DESC
LIMIT 1;	3023054014
SELECT profit AS profit, sales_quantity AS sales_quantity FROM salesstatistics;	252107871
AMBIGUOUS_QUERY	2902085248
SELECT 
    e.name AS name,
    e.position AS position,
    s.store_name AS store_name,
    so.total_amount AS total_amount
FROM 
    employees e
JOIN 
    salesorders so ON e.employee_id = so.employee_id
JOIN 
    stores s ON so.store_id = s.store_id
WHERE 
    so.order_date = '2023-05-05'
    AND s.store_name = '数码广场店'
    AND so.total_amount > 7000;	1743968577
SELECT 
    statistic_id AS "统计ID",
    store_id AS "店铺ID", 
    product_id AS "产品ID", 
    employee_id AS "员工ID", 
    date AS "销售日期", 
    sales_quantity AS "销售数量", 
    sales_amount AS "销售金额", 
    profit AS "利润"
FROM salesstatistics
ORDER BY profit DESC
LIMIT 1;	3620145899
SELECT 
    s.store_name,
    e.name AS employee_name,
    ss.sales_amount AS total_sales,
    p.product_name
FROM 
    salesstatistics ss
JOIN 
    stores s ON ss.store_id = s.store_id
JOIN 
    employees e ON ss.employee_id = e.employee_id
JOIN 
    products p ON ss.product_id = p.product_id
WHERE 
    ss.date BETWEEN '2023-05-01' AND '2023-05-31'
    AND p.supplier_name = '苹果官方旗舰店'
    AND ss.sales_amount > 10000
ORDER BY 
    ss.sales_amount DESC;	2283742907
SELECT p.product_name AS product_name, p.supplier_name AS supplier_name
FROM products p
JOIN orderdetails od ON p.product_id = od.product_id
JOIN salesorders so ON od.order_id = so.order_id
JOIN stores s ON so.store_id = s.store_id
WHERE s.store_name = '电子城旗舰店';	3238938312
SELECT s.store_name, e.name AS employee_name, e.position
FROM salesorders so
JOIN employees e ON so.employee_id = e.employee_id
JOIN stores s ON so.store_id = s.store_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE so.order_date = '2023-05-09' AND p.product_name = 'iPad Air';	2878333594
SELECT s.store_name, s.manager_name
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
WHERE so.order_date = '2023-05-05'
GROUP BY s.store_name, s.manager_name
HAVING SUM(so.total_amount) > 10000;	754309478
SELECT e.name AS name, SUM(so.total_amount) AS total_amount
FROM salesorders so
JOIN employees e ON so.employee_id = e.employee_id
WHERE so.order_date = '2023-05-07'
GROUP BY e.employee_id, e.name
HAVING SUM(so.total_amount) > 10000;	711957819
SELECT s.store_name, e.name AS employee_name, SUM(ss.profit) AS total_profit
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
JOIN employees e ON ss.employee_id = e.employee_id
WHERE ss.product_id = 'f5e347cb-f674-4e33-834c-4d0760682240'
  AND ss.date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY s.store_name, e.name, s.store_id, e.employee_id
HAVING SUM(ss.profit) > 5000;	1769127756
SELECT DISTINCT e.employee_id, e.name
FROM employees e
JOIN salesorders so ON e.employee_id = so.employee_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE p.product_name = 'Nintendo Switch'
  AND so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
  AND so.total_amount > 5000;	435444064
SELECT p.product_name, MAX(ss.sales_amount) AS max_sales_amount
FROM salesstatistics ss
JOIN products p ON ss.product_id = p.product_id
GROUP BY p.product_name
ORDER BY max_sales_amount DESC
LIMIT 1;	2637911653
SELECT 
    od.order_detail_id AS order_detail_id,
    p.product_name AS product_name,
    so.total_amount AS total_amount
FROM 
    orderdetails od
JOIN 
    products p ON od.product_id = p.product_id
JOIN 
    salesorders so ON od.order_id = so.order_id;	424774041
SELECT e.name AS name, s.store_name AS store_name
FROM employees e
JOIN stores s ON e.store_id = s.store_id;	1958922267
SELECT 
    s.store_name AS store_name,
    s.manager_name AS manager_name,
    SUM(so.total_amount) AS total_sales_amount
FROM 
    stores s
JOIN 
    salesorders so ON s.store_id = so.store_id
WHERE 
    so.order_date = '2023-05-08'
GROUP BY 
    s.store_name, s.manager_name;	1850407582
SELECT s.order_id AS order_id, e.name AS name
FROM salesorders s
JOIN employees e ON s.employee_id = e.employee_id
WHERE s.total_amount > 7000;	3887504470
SELECT 
    s.store_name AS store_name,
    e.name AS employee_name,
    SUM(ss.sales_amount) AS total_sales,
    p.product_name AS product_name
FROM 
    salesstatistics ss
JOIN 
    employees e ON ss.employee_id = e.employee_id
JOIN 
    stores s ON ss.store_id = s.store_id
JOIN 
    products p ON ss.product_id = p.product_id
WHERE 
    ss.date BETWEEN '2023-05-01' AND '2023-05-31'
    AND p.supplier_name = '苹果官方旗舰店'
GROUP BY 
    s.store_name, e.name, p.product_name, e.employee_id
HAVING 
    SUM(ss.sales_amount) > 10000
ORDER BY 
    total_sales DESC;	3068871934
AMBIGUOUS_QUERY	2869270561
SELECT 
    order_id AS "订单ID",
    store_id AS "店铺ID",
    employee_id AS "员工ID",
    order_date AS "订单日期",
    total_amount AS "订单总金额"
FROM 
    salesorders 
WHERE 
    order_id = 'b8b62bfe-a35d-4ff5-9bc9-654b5f67fed2';	3219161296
SELECT e.name, SUM(so.total_amount) AS total_sales
FROM employees e
JOIN salesorders so ON e.employee_id = so.employee_id
GROUP BY e.name;	4084880534
SELECT 
    product_name AS product_name,
    sale_price AS sale_price,
    purchase_price AS purchase_price
FROM products;	758163770
SELECT e.name AS employee_name, s.manager_name AS store_manager_name
FROM employees e
JOIN salesorders so ON e.employee_id = so.employee_id
JOIN stores s ON e.store_id = s.store_id
WHERE so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY e.employee_id, e.name, s.manager_name
HAVING SUM(so.total_amount) > 10000;	2553064409
AMBIGUOUS_QUERY	2558715347
SELECT 
    s.store_name AS store_name,
    e.name AS employee_name,
    p.product_name AS product_name,
    ss.profit AS profit
FROM 
    salesstatistics ss
JOIN 
    stores s ON ss.store_id = s.store_id
JOIN 
    employees e ON ss.employee_id = e.employee_id
JOIN 
    products p ON ss.product_id = p.product_id
WHERE 
    ss.date = '2023-05-07' 
    AND p.product_name = 'Apple Watch Series 7';	2334672967
SELECT DISTINCT s.store_name, s.manager_name
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE so.order_date = '2023-05-05'
AND so.total_amount > 10000
AND p.sale_price > 5000;	3673770320
SELECT 
    od.order_detail_id AS order_detail_id,
    p.product_name AS product_name,
    od.quantity AS quantity
FROM 
    orderdetails od
JOIN 
    products p ON od.product_id = p.product_id;	1434650665
SELECT 
    order_id AS "订单编号",
    store_id AS "门店编号",
    employee_id AS "员工编号",
    order_date AS "订单日期",
    total_amount AS "订单总金额"
FROM 
    salesorders
WHERE 
    store_id = '0887d06a-27a8-46b4-98d6-514702e698da';	4072489559
SELECT s.employee_id, e.name
FROM salesstatistics s
JOIN employees e ON s.employee_id = e.employee_id
WHERE s.date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY s.employee_id, e.name
HAVING SUM(s.sales_quantity) > (
    SELECT COALESCE(SUM(od.quantity), 0)
    FROM salesorders so
    JOIN orderdetails od ON so.order_id = od.order_id
    WHERE so.employee_id = s.employee_id
    AND so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
);	3987499786
SELECT s.store_name, e.name AS employee_name, SUM(so.total_amount) AS total_sales_amount
FROM salesorders so
JOIN employees e ON so.employee_id = e.employee_id
JOIN stores s ON so.store_id = s.store_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE so.order_date = '2023-05-01' AND p.product_name = 'iPad Air'
GROUP BY s.store_name, e.name;	3272650586
SELECT 
    p.product_name AS product_name,
    SUM(od.quantity) AS total_quantity,
    so.order_date AS order_date
FROM 
    products p
JOIN 
    orderdetails od ON p.product_id = od.product_id
JOIN 
    salesorders so ON od.order_id = so.order_id
GROUP BY 
    p.product_name, so.order_date
ORDER BY 
    p.product_name, so.order_date;	1170763492
SELECT s.store_name, s.manager_name, SUM(so.total_amount) AS total_sales
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
WHERE so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY s.store_name, s.manager_name
ORDER BY total_sales DESC
LIMIT 1;	3307597619
AMBIGUOUS_QUERY	2824509879
SELECT s.store_name, s.manager_name, SUM(so.total_amount) AS total_sales
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
WHERE so.order_date = '2023-05-07'
GROUP BY s.store_name, s.manager_name
ORDER BY total_sales DESC
LIMIT 1;	348511856
SELECT DISTINCT s.store_name, e.name AS employee_name, so.total_amount
FROM salesorders so
JOIN employees e ON so.employee_id = e.employee_id
JOIN stores s ON so.store_id = s.store_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE so.order_date = '2023-05-01'
AND p.product_name = '索尼WH-1000XM4'
AND so.total_amount > 8000;	3403500771
SELECT 
    purchase_price AS "进货价格",
    sale_price AS "销售价格"
FROM 
    products
WHERE 
    product_id = '[需要查询的商品ID]';	1837973022
SELECT 
    product_id AS product_identifier,
    unit_price AS sales_unit_price,
    quantity AS sold_quantity
FROM 
    orderdetails;	1041289855
SELECT e.name AS employee_name, s.store_name AS store_name
FROM employees e
JOIN salesorders so ON e.employee_id = so.employee_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
JOIN stores s ON e.store_id = s.store_id
WHERE so.order_date = '2023-05-06'
AND p.product_name = 'Apple Watch Series 7';	2902800338
SELECT s.store_name, 
       SUM(ss.sales_quantity) AS total_quantity, 
       SUM(ss.sales_amount) AS total_sales
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
GROUP BY s.store_name
ORDER BY total_quantity DESC
LIMIT 1;	2465572579
SELECT DISTINCT e.name AS employee_name, p.category_name AS product_category
FROM employees e
JOIN salesorders so ON e.employee_id = so.employee_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
  AND so.total_amount > 10000
ORDER BY e.name, p.category_name;	4232056788
SELECT 
    e.name AS employee_name, 
    s.store_name AS store_name, 
    SUM(so.total_amount) AS total_amount
FROM 
    employees e
JOIN 
    stores s ON e.store_id = s.store_id
JOIN 
    salesorders so ON e.employee_id = so.employee_id
GROUP BY 
    e.name, 
    s.store_name;	3813879652
SELECT s.store_name, s.manager_name, SUM(so.total_amount) AS total_sales_amount
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
WHERE so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY s.store_name, s.manager_name;	1308038325
SELECT p.product_name, SUM(od.quantity) AS total_quantity
FROM orderdetails od
JOIN products p ON od.product_id = p.product_id
JOIN salesorders so ON od.order_id = so.order_id
WHERE so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY p.product_name
HAVING SUM(od.quantity) > 5
ORDER BY total_quantity DESC;	3746071071
SELECT 
    p.product_name AS product_name,
    SUM(od.quantity) AS total_quantity,
    p.sale_price AS sale_price
FROM 
    products p
JOIN 
    orderdetails od ON p.product_id = od.product_id
GROUP BY 
    p.product_id, p.product_name, p.sale_price;	2561670271
SELECT 
    s.store_name AS store_name,
    e.name AS sales_manager_name,
    ss.profit AS profit
FROM 
    salesstatistics ss
JOIN 
    stores s ON ss.store_id = s.store_id
JOIN 
    employees e ON ss.employee_id = e.employee_id
JOIN 
    products p ON ss.product_id = p.product_id
WHERE 
    ss.date = '2023-05-01' 
    AND p.product_name = '佳能EOS R6'
    AND e.position = '销售经理';	3159630797
SELECT store_name AS "门店名称", phone AS "联系电话", address AS "地址" FROM stores;	4216280203
SELECT so.order_id AS order_id, p.product_name AS product_name
FROM salesorders so
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE so.total_amount < 5000;	731373976
SELECT 
    s.store_name,
    e.name AS employee_name,
    SUM(ss.sales_quantity) AS total_sales_quantity,
    SUM(ss.profit) AS total_profit
FROM 
    salesstatistics ss
JOIN 
    stores s ON ss.store_id = s.store_id
JOIN 
    employees e ON ss.employee_id = e.employee_id
WHERE 
    ss.date >= '2023-05-01' AND ss.date <= '2023-05-31'
GROUP BY 
    s.store_name, e.name
ORDER BY 
    total_sales_quantity DESC
LIMIT 1;	170942591
SELECT s.store_name, SUM(ss.profit) AS total_profit
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
JOIN products p ON ss.product_id = p.product_id
WHERE p.product_name LIKE '%小米电视4A%'
  AND ss.date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY s.store_name;	3730467553
SELECT e.name AS employee_name, SUM(ss.profit) AS total_profit
FROM salesstatistics ss
JOIN employees e ON ss.employee_id = e.employee_id
JOIN stores s ON ss.store_id = s.store_id
JOIN products p ON ss.product_id = p.product_id
WHERE ss.date = '2023-05-06'
AND s.store_name = '智慧街店'
AND p.product_name = '小米电视4A'
GROUP BY e.name;	2909047140
SELECT store_name AS "门店名称", phone AS "联系电话" FROM stores;	2998787786
SELECT DISTINCT s.store_name, s.manager_name
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
WHERE ss.date = '2023-05-08'
GROUP BY s.store_name, s.manager_name
HAVING SUM(ss.profit) > 1000;	3020408935
SELECT 
    p.category_name AS category_name,
    SUM(od.quantity) AS total_sales
FROM 
    orderdetails od
JOIN 
    products p ON od.product_id = p.product_id
GROUP BY 
    p.category_name;	3729612424
SELECT 
    s.store_name AS store_name,
    e.name AS employee_name
FROM 
    stores s 
JOIN 
    employees e ON s.store_id = e.store_id;	1558062721
SELECT order_id 
FROM salesorders 
WHERE total_amount > (SELECT AVG(total_amount) FROM salesorders);	3748358677
AMBIGUOUS_QUERY	281510090
SELECT 
    e.name AS employee_name,
    s.order_date AS order_date,
    s.total_amount AS order_total_amount
FROM 
    employees e
LEFT JOIN 
    salesorders s ON e.employee_id = s.employee_id;	930082852
SELECT e.name, SUM(so.total_amount) AS total_sales
FROM employees e
JOIN salesorders so ON e.employee_id = so.employee_id
GROUP BY e.employee_id, e.name;	874677465
SELECT 
    e.name AS employee_name,
    SUM(ss.sales_quantity) AS total_sales_quantity,
    SUM(ss.profit) AS total_profit
FROM 
    employees e
JOIN 
    salesstatistics ss ON e.employee_id = ss.employee_id
GROUP BY 
    e.name;	1675790879
SELECT DISTINCT s.store_name
FROM stores s
JOIN salesorders so ON s.store_id = so.store_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE p.product_name = '佳能EOS R6'
  AND so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
  AND so.total_amount > 10000;	1635802249
SELECT s.store_name, s.manager_name, SUM(so.total_amount) AS total_sales
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
WHERE so.order_date = '2023-05-05'
GROUP BY s.store_name, s.manager_name
ORDER BY total_sales DESC
LIMIT 1;	2425848754
SELECT 
    s.store_name AS store_name,
    SUM(ss.sales_quantity) AS total_quantity,
    SUM(ss.sales_amount) AS total_amount
FROM 
    salesstatistics ss
JOIN 
    stores s ON ss.store_id = s.store_id
GROUP BY 
    s.store_name;	2746220287
SELECT s.store_name, s.manager_name, SUM(ss.sales_quantity) AS total_sales_quantity
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
WHERE ss.date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY s.store_name, s.manager_name
ORDER BY total_sales_quantity DESC
LIMIT 1;	4181874210
AMBIGUOUS_QUERY	1518878415
SELECT 
    order_detail_id AS "订单详情ID", 
    unit_price AS "销售单价" 
FROM 
    orderdetails 
WHERE 
    product_id = '0001e06a-4fec-48a9-a5a2-efa3b0c4ba1b';	729031894
SELECT 
    s.store_name AS store_name,
    SUM(ss.sales_amount) AS sales_amount,
    ss.date AS date
FROM 
    salesstatistics ss
JOIN 
    stores s ON ss.store_id = s.store_id
GROUP BY 
    s.store_name, ss.date
ORDER BY 
    s.store_name, ss.date;	415457057
SELECT p.product_name
FROM products p
JOIN salesstatistics ss ON p.product_id = ss.product_id
JOIN stores s ON ss.store_id = s.store_id
WHERE s.store_name = '未来城店' AND p.purchase_price > 4000;	2711834209
SELECT s.store_name, s.manager_name, SUM(so.total_amount) AS total_sales
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
WHERE so.order_date = '2023-05-09'
GROUP BY s.store_name, s.manager_name
HAVING SUM(so.total_amount) > 10000;	1625040088
SELECT s.store_name, s.manager_name, SUM(so.total_amount) AS total_sales
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
WHERE so.order_date = '2023-05-02'
GROUP BY s.store_name, s.manager_name
ORDER BY total_sales DESC
LIMIT 1;	3394370453
SELECT 
    s.store_name AS store_name,
    s.manager_name AS manager_name
FROM 
    salesorders so
JOIN 
    stores s ON so.store_id = s.store_id
WHERE 
    so.order_date = '2023-05-09'
GROUP BY 
    s.store_name, s.manager_name
HAVING 
    SUM(so.total_amount) > 1000;	1323956071
SELECT DISTINCT e.name AS employee_name, p.category_name AS product_category
FROM employees e
JOIN salesorders so ON e.employee_id = so.employee_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
AND so.order_id IN (
    SELECT so2.order_id
    FROM salesorders so2
    JOIN orderdetails od2 ON so2.order_id = od2.order_id
    WHERE so2.order_date BETWEEN '2023-05-01' AND '2023-05-31'
    GROUP BY so2.order_id
    HAVING SUM(od2.quantity * od2.unit_price) > 10000
);	3696477446
SELECT s.store_name, SUM(ss.profit) AS total_profit 
FROM stores s 
JOIN salesstatistics ss ON s.store_id = ss.store_id 
GROUP BY s.store_name;	4263762934
SELECT 
    s.store_name AS store_name,
    e.name AS employee_name,
    SUM(ss.sales_amount) AS sales_amount,
    p.product_name AS product_name
FROM 
    salesstatistics ss
JOIN 
    stores s ON ss.store_id = s.store_id
JOIN 
    employees e ON ss.employee_id = e.employee_id
JOIN 
    products p ON ss.product_id = p.product_id
WHERE 
    ss.date BETWEEN '2023-05-01' AND '2023-05-31'
    AND p.supplier_name = '索尼官方旗舰店'
GROUP BY 
    s.store_name, e.name, p.product_name
HAVING 
    SUM(ss.sales_amount) > 10000
ORDER BY 
    sales_amount DESC;	1452830768
SELECT 
    so.order_id AS order_id,
    so.total_amount AS total_amount,
    od.product_id AS product_id,
    od.quantity AS quantity
FROM 
    salesorders so
JOIN 
    orderdetails od ON so.order_id = od.order_id
WHERE 
    so.total_amount > 5000;	4210000185
AMBIGUOUS_QUERY	2309159488
SELECT 
    s.sales_quantity AS sales_quantity,
    st.store_name AS store_name
FROM 
    salesstatistics s
JOIN 
    stores st ON s.store_id = st.store_id
WHERE 
    s.date BETWEEN '2023-05-01' AND '2023-05-31';	3856696435
SELECT 
    product_name AS product_name,
    sale_price AS sale_price,
    purchase_price AS purchase_price
FROM 
    products;	3385775144
SELECT s.store_name, SUM(ss.sales_quantity) AS total_sales_quantity
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
JOIN products p ON ss.product_id = p.product_id
WHERE p.category_name = '智能手表'
  AND p.supplier_name = '索尼官方旗舰店'
  AND ss.date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY s.store_name
HAVING SUM(ss.sales_quantity) > 10;	898352649
SELECT s.store_name, s.manager_name, AVG(so.total_amount) AS avg_order_amount
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
WHERE so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY s.store_name, s.manager_name
HAVING AVG(so.total_amount) > 10000;	1057968799
SELECT 
    s.store_name AS store_name,
    e.name AS employee_name,
    p.product_name AS product_name,
    ss.sales_quantity AS sales_quantity,
    ss.sales_amount AS sales_amount,
    ss.profit AS profit
FROM 
    salesstatistics ss
    JOIN stores s ON ss.store_id = s.store_id
    JOIN employees e ON ss.employee_id = e.employee_id
    JOIN products p ON ss.product_id = p.product_id
WHERE 
    ss.date = '2023-05-02' 
    AND p.product_name = 'iPad Air';	1042797521
AMBIGUOUS_QUERY	2349214824
SELECT 
    s.store_name,
    SUM(ss.sales_quantity) AS total_sales_quantity,
    SUM(ss.sales_amount) AS total_sales_amount
FROM 
    salesstatistics ss
JOIN 
    stores s ON ss.store_id = s.store_id
WHERE 
    ss.date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY 
    s.store_name
ORDER BY 
    total_sales_quantity DESC
LIMIT 1;	1437353225
SELECT s.store_name, e.name AS employee_name, SUM(so.total_amount) AS total_sales_amount
FROM salesorders so
JOIN employees e ON so.employee_id = e.employee_id
JOIN stores s ON so.store_id = s.store_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE so.order_date = '2023-05-09' 
AND p.product_name = 'Apple Watch Series 7'
GROUP BY s.store_name, e.name;	2159290753
SELECT quantity AS sales_quantity, unit_price AS product_unit_price FROM orderdetails;	3028653636
SELECT DISTINCT s.store_name, e.name AS employee_name, e.position
FROM salesorders so
JOIN employees e ON so.employee_id = e.employee_id
JOIN stores s ON so.store_id = s.store_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE p.product_name = 'Nintendo Switch'
  AND so.order_date BETWEEN '2023-05-01' AND '2023-05-31';	699540097
SELECT 
    statistic_id AS statistic_id,
    store_id AS store_id,
    product_id AS product_id,
    employee_id AS employee_id,
    date AS sales_date,
    sales_quantity AS quantity_sold,
    sales_amount AS total_amount,
    profit AS profit_amount
FROM 
    salesstatistics
WHERE 
    sales_quantity > 1;	1931659377
SELECT s.store_name, SUM(ss.profit) AS total_profit
FROM salesstatistics ss
JOIN products p ON ss.product_id = p.product_id
JOIN stores s ON ss.store_id = s.store_id
WHERE p.product_name LIKE '%Nintendo Switch%'
  AND ss.date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY s.store_name
HAVING SUM(ss.profit) > 0;	3746361325
SELECT order_date, total_amount AS total_sales FROM salesorders;	716876897
SELECT 
    s.store_name, 
    SUM(so.total_amount) AS total_sales, 
    COUNT(so.order_id) AS total_orders
FROM 
    stores s
LEFT JOIN 
    salesorders so ON s.store_id = so.store_id
GROUP BY 
    s.store_name;	2607128675
SELECT 
    order_detail_id AS "订单详情ID",
    order_id AS "订单ID",
    product_id AS "产品ID",
    quantity AS "销售数量",
    unit_price AS "单价"
FROM 
    orderdetails 
WHERE 
    quantity = 2;	285217611
SELECT s.store_name, e.name AS employee_name, e.position
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
JOIN employees e ON ss.employee_id = e.employee_id
JOIN products p ON ss.product_id = p.product_id
WHERE ss.date = '2023-05-01' AND p.product_name = '戴尔灵越15';	780164755
SELECT e.name AS name, e.position AS position, s.store_name AS store_name
FROM employees e
JOIN stores s ON e.store_id = s.store_id;	936656745
SELECT s.store_name, e.name AS employee_name, SUM(ss.profit) AS total_profit
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
JOIN employees e ON ss.employee_id = e.employee_id
JOIN products p ON ss.product_id = p.product_id
WHERE ss.date = '2023-05-03' AND p.product_name = '佳能EOS R6'
GROUP BY s.store_name, e.name;	1245782625
AMBIGUOUS_QUERY	1283619082
SELECT s.store_name, e.name AS employee_name, ss.sales_quantity
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
JOIN employees e ON ss.employee_id = e.employee_id
JOIN products p ON ss.product_id = p.product_id
WHERE ss.date = '2023-05-06' 
  AND p.product_name = '华为Mate 40 Pro'
  AND ss.sales_quantity > 1;	1656453304
SELECT 
    od.order_detail_id AS order_detail_id,
    p.product_name AS product_name,
    od.quantity AS quantity
FROM 
    orderdetails od
JOIN 
    products p ON od.product_id = p.product_id;	366199293
SELECT e.name AS name, e.position AS position, s.phone AS phone
FROM employees e
JOIN stores s ON e.store_id = s.store_id;	3334478107
SELECT s.store_name, e.name AS employee_name, ss.sales_quantity AS quantity
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
JOIN employees e ON ss.employee_id = e.employee_id
JOIN products p ON ss.product_id = p.product_id
WHERE ss.date = '2023-05-05'
  AND p.product_name = '戴尔灵越15'
  AND ss.sales_quantity > 1;	4270219527
SELECT 
    so.order_id AS order_id,
    so.total_amount AS total_amount,
    od.product_id AS product_id,
    od.quantity AS quantity
FROM salesorders so
JOIN orderdetails od ON so.order_id = od.order_id
WHERE so.total_amount > 5000
ORDER BY so.total_amount DESC;	1514093143
SELECT 
    e.name AS employee_name,
    s.order_id AS order_id,
    s.total_amount AS order_total_amount
FROM 
    employees e
JOIN 
    salesorders s ON e.employee_id = s.employee_id;	2669644548
SELECT 
    statistic_id AS statistic_id,
    date AS sales_date
FROM 
    salesstatistics 
WHERE 
    profit > 3000;	805828737
SELECT s.store_name, e.name AS employee_name, so.total_amount
FROM salesorders so
JOIN employees e ON so.employee_id = e.employee_id
JOIN stores s ON so.store_id = s.store_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE so.order_date = '2023-05-01'
  AND p.product_name = 'Apple Watch Series 7'
  AND so.total_amount > 7000;	3997676800
SELECT 
    product_name AS product_name,
    remaining_quantity AS remaining_quantity,
    category_name AS category_name
FROM 
    products;	4161491201
SELECT DISTINCT e.employee_id, e.name, e.position
FROM employees e
JOIN salesorders so ON e.employee_id = so.employee_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE so.order_date = '2023-05-07'
AND p.category_name = '相机'
AND so.total_amount > 15000;	1127435173
AMBIGUOUS_QUERY	2902593996
SELECT s.store_name, s.manager_name, SUM(so.total_amount) AS total_sales
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
WHERE so.order_date = '2023-05-08'
GROUP BY s.store_name, s.manager_name
ORDER BY total_sales DESC
LIMIT 1;	3388599532
SELECT e.name AS employee_name, ss.sales_quantity, ss.sales_amount
FROM salesstatistics ss
JOIN employees e ON ss.employee_id = e.employee_id
JOIN stores s ON ss.store_id = s.store_id
JOIN products p ON ss.product_id = p.product_id
WHERE ss.date = '2023-05-03'
AND s.store_name = '数字大道店'
AND p.product_name = 'Nintendo Switch';	4098005311
SELECT DISTINCT s.store_name, e.name AS employee_name
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
JOIN employees e ON ss.employee_id = e.employee_id
JOIN products p ON ss.product_id = p.product_id
WHERE ss.date = '2023-05-05'
AND p.product_name = '戴森V11'
AND ss.profit > 500;	923028298
SELECT s.store_name, s.manager_name
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
WHERE so.order_date = '2023-05-09'
GROUP BY s.store_name, s.manager_name
HAVING SUM(so.total_amount) > 2000;	1361891626
SELECT s.store_name, s.manager_name
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
WHERE so.order_date = '2023-05-01'
GROUP BY s.store_name, s.manager_name
HAVING SUM(so.total_amount) > 10000;	1630147030
AMBIGUOUS_QUERY	3263175989
AMBIGUOUS_QUERY	378330460
SELECT store_name AS "门店名称", address AS "门店地址", phone AS "联系电话" FROM stores;	4052285642
SELECT 
    s.store_name AS store_name,
    e.name AS name,
    so.total_amount AS total_amount
FROM 
    salesorders so
JOIN 
    stores s ON so.store_id = s.store_id
JOIN 
    employees e ON so.employee_id = e.employee_id
WHERE 
    so.order_date = '2023-05-02' 
    AND so.total_amount > 2000;	1549729846
SELECT 
    s.store_id,
    SUM(ss.sales_quantity) AS total_sales_quantity,
    SUM(ss.profit) AS total_profit
FROM 
    salesstatistics ss
JOIN 
    stores s ON ss.store_id = s.store_id
GROUP BY 
    s.store_id;	3935894550
SELECT s.store_name, SUM(ss.profit) AS profit, s.manager_name
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
WHERE ss.date = '2023-05-07'
GROUP BY s.store_name, s.manager_name
HAVING SUM(ss.profit) > 1000;	3331362186
SELECT s.store_name, s.manager_name, SUM(ss.sales_quantity) AS sales_quantity
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
WHERE ss.date = '2023-05-08'
GROUP BY s.store_name, s.manager_name
ORDER BY sales_quantity DESC
LIMIT 1;	1128623969
SELECT 
    s.store_id, 
    SUM(ss.profit) AS total_profit
FROM 
    salesstatistics ss
JOIN 
    stores s ON ss.store_id = s.store_id
WHERE 
    ss.date = '2023-05-09'
GROUP BY 
    s.store_id
ORDER BY 
    total_profit DESC
LIMIT 1;	2501471268
SELECT s.store_name, e.name AS employee_name, SUM(so.total_amount) AS total_sales
FROM stores s
JOIN employees e ON s.store_id = e.store_id
JOIN salesorders so ON e.employee_id = so.employee_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE p.product_name = '佳能EOS R6'
AND so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY s.store_name, e.name
HAVING SUM(so.total_amount) > 5000;	1462073315
SELECT DISTINCT s.store_name, e.name AS employee_name, e.position
FROM salesorders so
JOIN employees e ON so.employee_id = e.employee_id
JOIN stores s ON so.store_id = s.store_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE p.product_name = 'iPad Air'
  AND so.order_date BETWEEN '2023-05-01' AND '2023-05-31';	1581647710
SELECT category_name, sale_price FROM products;	801232665
SELECT s.store_name, COUNT(DISTINCT e.employee_id) AS sales_manager_count
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
JOIN employees e ON s.store_id = e.store_id AND e.position = '销售经理'
WHERE so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY s.store_name
HAVING SUM(so.total_amount) > 10000;	456965504
SELECT 
    p.product_name AS product_name,
    p.remaining_quantity AS remaining_quantity,
    COALESCE(SUM(od.quantity), 0) AS sold_quantity
FROM 
    products p
LEFT JOIN 
    orderdetails od ON p.product_id = od.product_id
GROUP BY 
    p.product_id, p.product_name, p.remaining_quantity;	3382493010
SELECT 
    order_id AS order_id,
    order_date AS order_date,
    total_amount AS total_amount
FROM salesorders;	571189478
SELECT s.store_name, e.name AS employee_name, p.product_name, od.quantity AS sales_quantity
FROM salesorders so
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
JOIN stores s ON so.store_id = s.store_id
JOIN employees e ON so.employee_id = e.employee_id
WHERE so.order_date = '2023-05-06'
  AND p.product_name = '华为Mate 40 Pro'
  AND od.quantity > 1;	3197967117
SELECT 
    s.store_name AS store_name,
    e.name AS name,
    e.position AS position
FROM 
    employees e
JOIN 
    stores s ON e.store_id = s.store_id
ORDER BY 
    s.store_name, e.name;	426781097
SELECT e.name AS employee_name, SUM(ss.sales_amount) AS total_sales_amount
FROM salesstatistics ss
JOIN employees e ON ss.employee_id = e.employee_id
JOIN stores s ON ss.store_id = s.store_id
JOIN products p ON ss.product_id = p.product_id
WHERE ss.date = '2023-05-01'
  AND s.store_name = '创客空间店'
  AND p.product_name = '华为Mate 40 Pro'
GROUP BY e.name;	3095201302
SELECT DISTINCT s.store_name, e.name AS employee_name, e.position
FROM salesorders so
JOIN employees e ON so.employee_id = e.employee_id
JOIN stores s ON so.store_id = s.store_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE p.product_name = '戴森V11'
AND so.order_date BETWEEN '2023-05-01' AND '2023-05-31';	3814813462
SELECT 
    od.order_detail_id AS order_detail_id,
    p.product_name AS product_name,
    od.quantity AS quantity
FROM 
    orderdetails od
JOIN 
    products p ON od.product_id = p.product_id;	609043667
SELECT DISTINCT e.employee_id, e.name 
FROM employees e
JOIN salesstatistics ss ON e.employee_id = ss.employee_id
JOIN products p ON ss.product_id = p.product_id
WHERE ss.date = '2023-05-06' 
  AND ss.sales_quantity > 1
  AND p.supplier_name = '戴尔官方旗舰店';	1259543351
SELECT product_name AS product_name, sale_price AS sale_price FROM products;	3115466033
SELECT manager_name, phone FROM stores;	1445435683
SELECT so.total_amount, s.store_name
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
WHERE so.employee_id = 'd7a2363e-d8fb-498a-a892-4249d6f17b0d'
AND so.order_date = '2023-05-07';	1024575513
SELECT s.store_name, SUM(so.total_amount) AS total_sales
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
JOIN employees e ON so.employee_id = e.employee_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE p.product_name = 'Apple Watch Series 7'
  AND so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY s.store_name
HAVING SUM(so.total_amount) > 10000;	1356118157
SELECT s.store_name, SUM(so.total_amount) AS total_sales
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
WHERE so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY s.store_name;	2779355161
SELECT store_name, manager_name FROM stores;	3800488480
SELECT 
    product_name AS product_name,
    sale_price AS sale_price,
    remaining_quantity AS remaining_quantity
FROM 
    products;	52927163
AMBIGUOUS_QUERY	4140737645
SELECT DISTINCT s.store_name, e.name AS employee_name, so.total_amount
FROM salesorders so
JOIN employees e ON so.employee_id = e.employee_id
JOIN stores s ON so.store_id = s.store_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE so.order_date = '2023-05-08'
  AND p.product_name = '索尼WH-1000XM4'
  AND so.total_amount > 15000;	3812947992
SELECT s.store_name, s.manager_name, SUM(ss.sales_quantity) AS max_sales_quantity
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
WHERE ss.date = '2023-05-09'
GROUP BY s.store_name, s.manager_name
ORDER BY max_sales_quantity DESC
LIMIT 1;	2237439168
SELECT SUM(profit) AS total_profit FROM salesstatistics;	3083869006
AMBIGUOUS_QUERY	106112262
SELECT s.store_name, SUM(ss.sales_quantity) AS total_sales_quantity
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
JOIN employees e ON ss.employee_id = e.employee_id
WHERE e.name = '黄萍'
  AND ss.date >= '2023-05-01' 
  AND ss.date <= '2023-05-31'
GROUP BY s.store_name
ORDER BY total_sales_quantity DESC
LIMIT 1;	886303610
SELECT s.store_name, e.name AS employee_name, ss.profit
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
JOIN employees e ON ss.employee_id = e.employee_id
JOIN products p ON ss.product_id = p.product_id
WHERE ss.date = '2023-05-08' AND p.product_name = 'Nintendo Switch';	1529918379
SELECT s.store_name, e.name AS employee_name, SUM(so.total_amount) AS total_amount
FROM salesorders so
JOIN employees e ON so.employee_id = e.employee_id
JOIN stores s ON so.store_id = s.store_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE so.order_date = '2023-05-05' 
  AND p.product_id = 'f5e347cb-f674-4e33-834c-4d0760682240'
GROUP BY s.store_name, e.name;	3470071233
SELECT e.name AS name, e.position AS position, p.product_name AS product_name
FROM employees e
JOIN salesorders so ON e.employee_id = so.employee_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
JOIN stores s ON so.store_id = s.store_id
WHERE so.order_date = '2023-05-05'
AND p.supplier_name = '小米官方旗舰店'
AND s.store_name = '智能生活馆';	616988720
SELECT s.store_name, s.manager_name
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
WHERE ss.date = '2023-05-07'
GROUP BY s.store_name, s.manager_name
ORDER BY SUM(ss.profit) DESC
LIMIT 1;	4131869213
SELECT 
    s.store_name AS store_name,
    e.name AS employee_name,
    p.product_name AS product_name,
    ss.profit AS profit
FROM 
    salesstatistics ss
JOIN 
    stores s ON ss.store_id = s.store_id
JOIN 
    employees e ON ss.employee_id = e.employee_id
JOIN 
    products p ON ss.product_id = p.product_id
WHERE 
    ss.date = '2023-05-09' 
    AND p.product_name = '索尼WH-1000XM4';	2632379040
AMBIGUOUS_QUERY	1347772939
SELECT s.store_name, SUM(so.total_amount) AS total_amount
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
WHERE so.order_date = '2023-05-03'
GROUP BY s.store_name;	2314844420
SELECT 
    order_detail_id AS "订单详情ID", 
    order_id AS "订单ID", 
    product_id AS "产品ID", 
    quantity AS "销售数量", 
    unit_price AS "单价" 
FROM 
    orderdetails 
WHERE 
    quantity > 1;	1029843679
AMBIGUOUS_QUERY	973958071
SELECT 
    s.order_id AS order_id,
    s.total_amount AS total_amount,
    st.store_name AS store_name
FROM salesorders s
JOIN stores st ON s.store_id = st.store_id
WHERE s.order_date = '2023-05-05';	3235376159
SELECT p.product_name AS product_name, od.order_id AS order_id
FROM orderdetails od
JOIN products p ON od.product_id = p.product_id
WHERE od.quantity > 1;	590339570
SELECT 
    order_id AS "订单编号",
    order_date AS "订单日期",
    total_amount AS "订单总金额"
FROM 
    salesorders
WHERE 
    order_date BETWEEN '2023-05-01' AND '2023-05-31';	947155024
SELECT 
    employee_id, 
    SUM(sales_quantity) AS sum 
FROM 
    salesstatistics 
GROUP BY 
    employee_id;	143868964
SELECT 
    p.category_name AS category_name,
    p.remaining_quantity AS remaining_quantity
FROM 
    products p
ORDER BY 
    p.category_name;	801054820
SELECT 
    e.name AS employee_name, 
    SUM(ss.sales_quantity) AS total_sales, 
    s.store_name AS store_name
FROM 
    employees e
JOIN 
    salesstatistics ss ON e.employee_id = ss.employee_id
JOIN 
    stores s ON e.store_id = s.store_id
GROUP BY 
    e.name, s.store_name;	956049949
SELECT order_id, product_id FROM orderdetails;	1812261268
AMBIGUOUS_QUERY	573573963
AMBIGUOUS_QUERY	2726627092
SELECT DISTINCT e.name AS name
FROM employees e
JOIN salesorders so ON e.employee_id = so.employee_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE so.order_date = '2023-05-09'
AND p.product_name = 'Apple Watch Series 7'
AND p.supplier_name = '任天堂官方旗舰店';	3682087832
SELECT s.total_amount, st.store_name
FROM salesorders s
JOIN stores st ON s.store_id = st.store_id
WHERE s.order_date = '2023-05-06';	994704464
AMBIGUOUS_QUERY	2258930244
SELECT e.name AS employee_name, s.store_name, p.product_name, SUM(so.total_amount) AS total_sales_amount
FROM employees e
JOIN salesorders so ON e.employee_id = so.employee_id
JOIN stores s ON so.store_id = s.store_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE s.store_name = '智慧街店' 
  AND p.product_name = '佳能EOS R6'
  AND so.order_date = '2023-05-07'
GROUP BY e.name, s.store_name, p.product_name;	251367692
SELECT 
    s.store_name, 
    SUM(od.quantity) AS total_quantity, 
    SUM(od.quantity * od.unit_price) AS total_sales
FROM 
    salesorders so
    JOIN orderdetails od ON so.order_id = od.order_id
    JOIN stores s ON so.store_id = s.store_id
GROUP BY 
    s.store_name;	4178948313
SELECT s.store_name, e.name AS employee_name, SUM(so.total_amount) AS total_amount
FROM salesorders so
JOIN employees e ON so.employee_id = e.employee_id
JOIN stores s ON so.store_id = s.store_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE so.order_date = '2023-05-05' 
  AND p.product_name = '佳能EOS R6'
GROUP BY s.store_name, e.name;	635779591
SELECT 
    product_id AS "产品ID",
    product_name AS "产品名称",
    category_name AS "类别名称",
    purchase_price AS "采购价格",
    sale_price AS "销售价格",
    remaining_quantity AS "剩余库存量",
    supplier_name AS "供应商名称",
    description AS "产品描述"
FROM 
    products
WHERE 
    sale_price > 15000;	2326522926
SELECT 
    s.store_name AS store_name,
    e.name AS employee_name,
    p.product_name AS product_name,
    ss.sales_quantity AS sales_quantity
FROM 
    salesstatistics ss
    JOIN stores s ON ss.store_id = s.store_id
    JOIN employees e ON ss.employee_id = e.employee_id
    JOIN products p ON ss.product_id = p.product_id
WHERE 
    ss.date = '2023-05-08'
    AND p.product_name = '索尼WH-1000XM4'
    AND ss.sales_quantity > 1;	845825777
SELECT 
    s.store_name AS store_name,
    e.name AS employee_name,
    p.product_name AS product_name,
    ss.sales_amount AS sales_amount
FROM 
    salesstatistics ss
    JOIN stores s ON ss.store_id = s.store_id
    JOIN employees e ON ss.employee_id = e.employee_id
    JOIN products p ON ss.product_id = p.product_id
WHERE 
    ss.date = '2023-05-01'
    AND ss.sales_amount > 1000
    AND p.supplier_name = '戴森官方旗舰店';	1519890808
AMBIGUOUS_QUERY	624803127
SELECT s.store_name, SUM(so.total_amount) AS total_sales
FROM stores s
JOIN salesorders so ON s.store_id = so.store_id
GROUP BY s.store_name;	4067103855
AMBIGUOUS_QUERY	2670659765
SELECT 
    s.order_id AS order_id,
    s.order_date AS order_date,
    e.name AS employee_name
FROM 
    salesorders s
JOIN 
    employees e ON s.employee_id = e.employee_id;	4067388605
SELECT product_name AS product_name, supplier_name AS supplier_name FROM products;	383590974
SELECT sale_price AS sale_price, supplier_name AS supplier_name FROM products;	4056403376
SELECT 
    od.order_detail_id AS order_detail_id,
    p.product_name AS product_name,
    od.unit_price AS unit_price
FROM 
    orderdetails od
JOIN 
    products p ON od.product_id = p.product_id;	3670992366
SELECT s.store_name, s.phone
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
WHERE ss.date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY s.store_name, s.phone
HAVING SUM(ss.sales_amount) > 3000;	2335581270
SELECT store_name, manager_name FROM stores;	2535524828
SELECT e.name AS employee_name, s.phone AS store_phone
FROM employees e
JOIN stores s ON e.store_id = s.store_id;	120259515
SELECT e.name AS employee_name, ss.sales_quantity, ss.profit
FROM salesstatistics ss
JOIN employees e ON ss.employee_id = e.employee_id
JOIN stores s ON ss.store_id = s.store_id
JOIN products p ON ss.product_id = p.product_id
WHERE ss.date = '2023-05-09'
AND s.store_name = '创新路专卖店'
AND p.product_name = 'iPad Air';	1670319692
SELECT 
    e.name AS name,
    e.position AS position,
    s.store_name AS store_name,
    so.total_amount AS total_amount
FROM 
    employees e
JOIN 
    salesorders so ON e.employee_id = so.employee_id
JOIN 
    stores s ON so.store_id = s.store_id
WHERE 
    so.order_date = '2023-05-07'
    AND s.store_name = '未来城店'
    AND so.total_amount > 15000;	4086419825
SELECT product_name, (sale_price - purchase_price) AS price_difference FROM products;	3256730396
SELECT s.store_name, s.manager_name
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
WHERE so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY s.store_name, s.manager_name
HAVING SUM(so.total_amount) > 10000;	2107889479
SELECT 
    s.store_name, 
    SUM(ss.profit) AS total_profit, 
    SUM(ss.sales_quantity) AS total_sales_quantity
FROM 
    salesstatistics ss
JOIN 
    stores s ON ss.store_id = s.store_id
GROUP BY 
    s.store_name;	595252998
SELECT 
    order_id AS "订单ID",
    store_id AS "门店ID",
    employee_id AS "员工ID",
    order_date AS "订单日期",
    total_amount AS "订单总金额"
FROM 
    salesorders
WHERE 
    store_id = '64921abb-1d54-4e03-a15e-ea42f058f31c';	2271451016
SELECT DISTINCT s.store_name, e.name AS employee_name, p.product_name, so.total_amount
FROM salesorders so
JOIN employees e ON so.employee_id = e.employee_id
JOIN stores s ON so.store_id = s.store_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE so.order_date = '2023-05-06' 
  AND p.product_name = '小米电视4A'
  AND so.total_amount > 10000;	3431877623
SELECT DISTINCT s.store_name
FROM stores s
JOIN salesstatistics ss ON s.store_id = ss.store_id
JOIN products p ON ss.product_id = p.product_id
WHERE p.product_name = 'Nintendo Switch'
  AND ss.date BETWEEN '2023-05-01' AND '2023-05-31'
  AND ss.profit > 1000;	1818716672
SELECT 
    s.store_name AS store_name,
    e.name AS employee_name,
    ss.sales_quantity AS quantity,
    ss.sales_amount AS total_amount
FROM 
    salesstatistics ss
JOIN 
    stores s ON ss.store_id = s.store_id
JOIN 
    employees e ON ss.employee_id = e.employee_id
JOIN 
    products p ON ss.product_id = p.product_id
WHERE 
    ss.date = '2023-05-09' 
    AND p.product_name = '索尼WH-1000XM4';	3062953566
AMBIGUOUS_QUERY	3908942610
SELECT s.store_name, s.manager_name, SUM(so.total_amount) AS total_sales
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
WHERE so.order_date = '2023-05-03'
GROUP BY s.store_name, s.manager_name
ORDER BY total_sales DESC
LIMIT 1;	208218356
SELECT s.store_name, s.manager_name, SUM(ss.sales_quantity) AS total_sales_quantity
FROM salesstatistics ss
JOIN stores s ON ss.store_id = s.store_id
WHERE ss.date = '2023-05-03'
GROUP BY s.store_name, s.manager_name
ORDER BY total_sales_quantity DESC
LIMIT 1;	4174482566
SELECT s.store_name, e.name AS employee_name, so.total_amount
FROM salesorders so
JOIN employees e ON so.employee_id = e.employee_id
JOIN stores s ON so.store_id = s.store_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE so.order_date = '2023-05-01' AND p.product_name = 'iPad Air';	1762340720
SELECT 
    s.store_id, 
    SUM(so.total_amount) AS total_sales
FROM 
    stores s
LEFT JOIN 
    salesorders so ON s.store_id = so.store_id
GROUP BY 
    s.store_id;	1734342716
SELECT 
    e.position AS position,
    COUNT(so.order_id) AS order_count
FROM 
    employees e
LEFT JOIN 
    salesorders so ON e.employee_id = so.employee_id
GROUP BY 
    e.position;	3698654694
AMBIGUOUS_QUERY	3114650274
SELECT s.store_name, s.manager_name, SUM(so.total_amount) AS total_sales
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
WHERE so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY s.store_name, s.manager_name
HAVING SUM(so.total_amount) > 10000;	2085424302
SELECT DISTINCT s.store_name
FROM stores s
JOIN salesorders so ON s.store_id = so.store_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE so.order_date = '2023-05-02'
AND p.supplier_name = '华为官方旗舰店'
GROUP BY s.store_name, so.order_id
HAVING SUM(od.quantity * od.unit_price) > 10000;	662177839
AMBIGUOUS_QUERY	3976972213
AMBIGUOUS_QUERY	783788015
SELECT s.store_name, s.manager_name, SUM(so.total_amount) AS total_sales
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
WHERE so.order_date = '2023-05-04'
GROUP BY s.store_name, s.manager_name
ORDER BY total_sales DESC
LIMIT 1;	2306528451
SELECT 
    s.store_name AS store_name,
    e.name AS employee_name,
    e.position AS position
FROM 
    salesstatistics ss
    JOIN stores s ON ss.store_id = s.store_id
    JOIN employees e ON ss.employee_id = e.employee_id
    JOIN products p ON ss.product_id = p.product_id
WHERE 
    p.product_name = '华为Mate 40 Pro' 
    AND ss.date = '2023-05-01';	1834111948
SELECT e.name AS employee_name, s.manager_name AS store_manager_name
FROM salesstatistics ss
JOIN employees e ON ss.employee_id = e.employee_id
JOIN stores s ON e.store_id = s.store_id
WHERE ss.date = '2023-05-06' AND ss.sales_amount > 10000;	1718600359
SELECT s.store_name, e.name AS employee_name, so.total_amount
FROM salesorders so
JOIN employees e ON so.employee_id = e.employee_id
JOIN stores s ON so.store_id = s.store_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE p.product_name LIKE '%戴尔灵越15%'
  AND p.category_name = '笔记本电脑'
  AND so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
  AND so.total_amount > 5000
GROUP BY s.store_name, e.name, so.total_amount
HAVING SUM(od.quantity * od.unit_price) > 5000;	2900121322
SELECT 
    product_id AS product_id,
    remaining_quantity AS remaining_quantity,
    sale_price AS sale_price
FROM products;	1605466649
SELECT s.store_name, COUNT(e.employee_id) AS employee_count
FROM stores s
LEFT JOIN employees e ON s.store_id = e.store_id
GROUP BY s.store_name;	330758085
SELECT 
    e.name AS employee_name,
    e.position AS position,
    ss.sales_quantity AS quantity
FROM 
    salesstatistics ss
JOIN 
    employees e ON ss.employee_id = e.employee_id
JOIN 
    stores s ON ss.store_id = s.store_id
JOIN 
    products p ON ss.product_id = p.product_id
WHERE 
    s.store_id = 'a69d5215-fe2e-4ad9-85e1-62e385a8c721' -- 科技中心店的store_id
    AND p.product_id = '35710343-90e8-47c1-9546-5abcff309bbd' -- 戴森V11的product_id
    AND ss.date = '2023-05-05'
    AND ss.sales_quantity > 1;	1887568974
SELECT s.order_id AS order_id, s.total_amount AS total_amount
FROM salesorders s
JOIN stores st ON s.store_id = st.store_id
WHERE st.store_name = '数码广场店';	1544829110
SELECT 
    ra.assessment_id AS assessment_id,
    ra.risk_level AS risk_level,
    ra.impact_score AS impact_score,
    re.event_type AS event_type,
    re.event_description AS event_description
FROM 
    risk_assessments ra
JOIN 
    risk_events re ON ra.event_id = re.event_id
WHERE 
    ra.risk_level = '高' 
    AND ra.impact_score > 8;	1389319035
SELECT DISTINCT re.event_id
FROM risk_events re
LEFT JOIN risk_assessments ra ON re.event_id = ra.event_id
LEFT JOIN alerts a ON re.event_id = a.event_id
LEFT JOIN rule_configurations rc ON a.rule_id = rc.rule_id
WHERE re.event_type LIKE '%Compliance%' 
   OR re.event_type LIKE '%合规%' 
   OR re.event_description LIKE '%Compliance%' 
   OR re.event_description LIKE '%合规%'
   OR ra.risk_level LIKE '%Compliance%'
   OR ra.risk_level LIKE '%合规%'
   OR rc.rule_name LIKE '%Compliance%'
   OR rc.rule_name LIKE '%合规%'
   OR rc.rule_description LIKE '%Compliance%'
   OR rc.rule_description LIKE '%合规%';	955757206
SELECT re.event_description, al.audit_result AS status
FROM risk_events re
JOIN alerts a ON re.event_id = a.event_id
JOIN audit_logs al ON a.alert_id = al.alert_id
WHERE a.alert_content LIKE '%欺诈%' OR a.alert_content LIKE '%嫌疑%'
LIMIT 100;	1687223871
SELECT 
    report_type AS report_type, 
    AVG(severity) AS avg_severity
FROM 
    risk_reports
JOIN 
    risk_events ON risk_reports.event_id = risk_events.event_id
WHERE 
    approval_status = '已批准'
GROUP BY 
    report_type;	948809000
SELECT 
    risk_level, 
    COUNT(*) AS customer_count, 
    AVG(credit_score) AS avg_credit_score 
FROM 
    customers 
GROUP BY 
    risk_level;	2131857844
SELECT 
    ri.indicator_id AS indicator_id,
    ri.indicator_name AS indicator_name,
    rml.monitoring_date AS monitoring_date,
    rml.actual_value AS actual_value
FROM 
    risk_indicators ri
LEFT JOIN 
    risk_monitoring_logs rml ON ri.indicator_id = rml.indicator_id
WHERE 
    rml.monitoring_date >= '2023-10-01' 
    AND rml.monitoring_date < '2023-11-01';	1810509227
SELECT 
    report_id AS "报告ID",
    report_date AS "报告日期",
    author AS "作者",
    event_id AS "关联风险事件ID"
FROM 
    risk_reports 
WHERE 
    approval_status = '已批准';	2704266530
SELECT 
    c.risk_level AS risk_level,
    t.transaction_type AS transaction_type,
    CASE 
        WHEN t.amount < 1000 THEN '0-999'
        WHEN t.amount >= 1000 AND t.amount < 5000 THEN '1000-4999'
        WHEN t.amount >= 5000 AND t.amount < 10000 THEN '5000-9999'
        ELSE '10000+'
    END AS amount_range,
    COUNT(*) AS transaction_count,
    AVG(t.risk_score) AS avg_risk_score
FROM 
    transactions t
JOIN 
    customers c ON t.customer_id = c.customer_id
GROUP BY 
    c.risk_level, 
    t.transaction_type, 
    CASE 
        WHEN t.amount < 1000 THEN '0-999'
        WHEN t.amount >= 1000 AND t.amount < 5000 THEN '1000-4999'
        WHEN t.amount >= 5000 AND t.amount < 10000 THEN '5000-9999'
        ELSE '10000+'
    END
ORDER BY 
    c.risk_level, 
    t.transaction_type, 
    amount_range;	3816194798
AMBIGUOUS_QUERY	3476903471
SELECT 
    r.report_id AS report_id,
    r.report_type AS report_type,
    e.event_description AS event_description,
    a.risk_level AS risk_level
FROM 
    risk_reports r
JOIN 
    risk_events e ON r.event_id = e.event_id
LEFT JOIN 
    risk_assessments a ON e.event_id = a.event_id
WHERE 
    r.author = '周婷';	451357687
SELECT 
    report_id AS report_id,
    report_date AS report_date,
    author AS author,
    approval_status AS approval_status
FROM 
    risk_reports
WHERE 
    report_date >= '2023-01-01';	880512967
SELECT 
    re.event_id AS event_id,
    re.event_description AS event_description,
    ra.risk_level AS risk_level,
    ra.impact_score AS impact_score,
    ra.probability_score AS probability_score,
    ra.mitigation_plan AS mitigation_plan
FROM 
    risk_events re
JOIN 
    risk_assessments ra ON re.event_id = ra.event_id
WHERE 
    re.event_description LIKE '%系统%';	4205370122
SELECT 
    ri.indicator_id,
    ri.indicator_name,
    current_log.actual_value AS current_value,
    past_log.actual_value AS past_value,
    CASE 
        WHEN past_log.actual_value = 0 THEN NULL
        ELSE ROUND(((current_log.actual_value - past_log.actual_value) / past_log.actual_value * 100), 2)
    END AS change_percentage
FROM 
    risk_indicators ri
LEFT JOIN 
    (SELECT indicator_id, actual_value 
     FROM risk_monitoring_logs 
     WHERE monitoring_date = (SELECT MAX(monitoring_date) FROM risk_monitoring_logs)) current_log
    ON ri.indicator_id = current_log.indicator_id
LEFT JOIN 
    (SELECT indicator_id, actual_value 
     FROM risk_monitoring_logs 
     WHERE monitoring_date = (SELECT MAX(monitoring_date) FROM risk_monitoring_logs WHERE monitoring_date <= CURRENT_DATE - INTERVAL '30 days')) past_log
    ON ri.indicator_id = past_log.indicator_id
WHERE 
    current_log.actual_value IS NOT NULL 
    AND past_log.actual_value IS NOT NULL;	2721513399
SELECT 
    re.event_id AS event_id,
    re.event_description AS event_description,
    ra.risk_level AS risk_level,
    ra.mitigation_plan AS mitigation_plan
FROM 
    risk_events re
JOIN 
    risk_assessments ra ON re.event_id = ra.event_id
WHERE 
    ra.risk_level = '高' 
    AND ra.assessor = '曾强';	1697295436
SELECT DISTINCT c.customer_name
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
WHERE t.transaction_type = '投资' AND t.risk_score > 60;	2228217319
SELECT 
    event_id AS event_id,
    created_at AS creation_time,
    status AS current_status
FROM 
    risk_events;	1939667217
SELECT c.customer_name, t.risk_score 
FROM customers c 
JOIN transactions t ON c.customer_id = t.customer_id 
WHERE c.credit_score < 600;	2175309220
SELECT t.amount AS transaction_amount, c.customer_name AS customer_name
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE t.status = '成功'
AND t.transaction_date >= '2023-12-01'
AND t.transaction_date < '2024-01-01';	1016775966
SELECT alert_type AS "预警类型", alert_content AS "预警内容" FROM alerts;	629791557
SELECT 
    report_id AS report_identifier,
    report_type AS report_category,
    approved_by AS approver_name
FROM risk_reports;	4191869630
SELECT 
    transaction_type,
    COUNT(*) AS total_count,
    ROUND(SUM(CASE WHEN status = '成功' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS success_rate,
    AVG(risk_score) AS avg_risk_score
FROM 
    transactions
GROUP BY 
    transaction_type;	3240782233
SELECT 
    a.alert_id AS alert_id,
    a.alert_content AS alert_content,
    r.rule_description AS rule_description
FROM 
    alerts a
JOIN 
    rule_configurations r ON a.rule_id = r.rule_id;	1390189932
SELECT 
    c.customer_id AS customer_id,
    c.customer_name AS customer_name,
    t.status AS status
FROM 
    customers c
LEFT JOIN (
    SELECT 
        customer_id, 
        status,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY transaction_date DESC) AS rn
    FROM 
        transactions
) t ON c.customer_id = t.customer_id AND t.rn = 1;	2842460105
SELECT 
    ri.indicator_id,
    ri.indicator_name,
    AVG(rml.actual_value) AS avg_value,
    STDDEV(rml.actual_value) AS std_dev,
    (STDDEV(rml.actual_value) / NULLIF(AVG(rml.actual_value), 0)) AS coefficient_of_variation
FROM 
    risk_indicators ri
LEFT JOIN 
    risk_monitoring_logs rml ON ri.indicator_id = rml.indicator_id
GROUP BY 
    ri.indicator_id, ri.indicator_name;	3963285376
SELECT DISTINCT c.customer_id, c.customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM transactions t
    WHERE t.customer_id = c.customer_id
    AND t.transaction_date >= CURRENT_DATE - INTERVAL '1 year'
    AND t.risk_score > 70  -- 假设高风险定义为risk_score > 70
    AND t.status = 'REJECTED'  -- 假设未通过审核的状态为'REJECTED'
    AND t.amount > 500000
);	2546181421
SELECT AVG(impact_score) AS average_impact_score FROM risk_assessments WHERE mitigation_plan IS NULL;	2755620243
SELECT alert_id AS "预警ID", alert_content AS "预警内容", status AS "预警状态" FROM alerts;	3751427783
SELECT 
    c.customer_name AS customer_name,
    (COUNT(CASE WHEN t.risk_score > 50 AND t.transaction_date >= CURRENT_DATE - INTERVAL '90 days' THEN 1 END) * 2 +
    COUNT(CASE WHEN a.status = '未处理' THEN 1 END) * 3 +
    (1000.0 / NULLIF(c.credit_score, 0)) AS risk_index
FROM 
    customers c
LEFT JOIN 
    transactions t ON c.customer_id = t.customer_id
LEFT JOIN 
    alerts a ON c.customer_id = a.assigned_to
GROUP BY 
    c.customer_id, c.customer_name, c.credit_score
ORDER BY 
    risk_index DESC
LIMIT 10;	2897506811
SELECT 
    event_type AS event_type,
    COUNT(*) AS occurrence_count,
    AVG(severity) AS avg_severity
FROM 
    risk_events
WHERE 
    occurrence_time >= '2023-01-01' 
    AND occurrence_time < '2024-01-01'
GROUP BY 
    event_type
ORDER BY 
    occurrence_count DESC;	1765860698
SELECT 
    rr.report_id AS report_id,
    rr.report_type AS report_type,
    rr.report_date AS report_date,
    rr.report_content AS report_content,
    rr.author AS author,
    rr.approval_status AS approval_status,
    rr.approved_by AS approved_by,
    re.event_id AS event_id,
    re.event_type AS event_type,
    re.event_description AS event_description
FROM 
    risk_reports rr
JOIN 
    risk_events re ON rr.event_id = re.event_id
WHERE 
    rr.report_content LIKE '%合规风险%';	2186954842
SELECT 
    indicator_id AS indicator_id,
    update_frequency AS update_frequency,
    data_source AS data_source
FROM 
    risk_indicators;	1001861352
SELECT 
    re.event_id AS event_id,
    re.event_type AS event_type,
    re.status AS status,
    rr.report_content AS report_content,
    rr.report_date AS report_date
FROM 
    risk_events re
LEFT JOIN (
    SELECT 
        event_id, 
        report_content, 
        report_date,
        ROW_NUMBER() OVER (PARTITION BY event_id ORDER BY report_date DESC) as rn
    FROM 
        risk_reports
) rr ON re.event_id = rr.event_id AND rr.rn = 1
WHERE 
    re.status IN ('处理中', '未处理');	3688441488
SELECT 
    rc.rule_type,
    COUNT(a.alert_id) / COUNT(DISTINCT rc.rule_id) AS avg_alert_count,
    MAX(rc.updated_at) AS last_update_time
FROM 
    rule_configurations rc
LEFT JOIN 
    alerts a ON rc.rule_id = a.rule_id
GROUP BY 
    rc.rule_type;	2337622346
SELECT event_type, COUNT(*) AS event_count 
FROM risk_events 
GROUP BY event_type 
ORDER BY event_count DESC;	1820971007
SELECT DISTINCT c.customer_id AS customer_id, 
                c.customer_name AS customer_name, 
                c.credit_score AS credit_score
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
WHERE c.credit_score < 700 
  AND t.transaction_date >= '2023-01-01' 
  AND t.transaction_date < '2024-01-01';	3328333298
SELECT 
    re.event_id AS event_id, 
    re.event_type AS event_type, 
    rr.report_id AS report_id
FROM 
    risk_events re
LEFT JOIN 
    risk_reports rr ON re.event_id = rr.event_id;	547790744
SELECT COUNT(*) AS count 
FROM risk_reports 
WHERE approval_status = '已拒绝' 
AND report_date BETWEEN '2023-01-01' AND '2023-12-31';	3644288071
SELECT 
    assessment_id AS assessment_id, 
    mitigation_plan AS mitigation_plan, 
    assessor AS assessor 
FROM risk_assessments;	3802320452
WITH latest_monitoring AS (
    SELECT 
        indicator_id,
        MAX(monitoring_date) AS latest_date
    FROM risk_monitoring_logs
    GROUP BY indicator_id
)
SELECT 
    rml.log_id AS log_id,
    rml.actual_value AS actual_value,
    rml.is_exceeding_threshold AS is_exceeding_threshold
FROM risk_monitoring_logs rml
JOIN latest_monitoring lm ON rml.indicator_id = lm.indicator_id AND rml.monitoring_date = lm.latest_date
ORDER BY rml.monitoring_date DESC;	3489018825
SELECT 
    rc.rule_id AS rule_id,
    rc.rule_name AS rule_name,
    COUNT(a.alert_id) AS alert_count
FROM 
    rule_configurations rc
LEFT JOIN 
    alerts a ON rc.rule_id = a.rule_id
GROUP BY 
    rc.rule_id, rc.rule_name;	2505821643
SELECT 
    re.event_id AS event_id,
    re.event_description AS event_description,
    t.transaction_id AS transaction_id,
    t.amount AS amount
FROM 
    risk_events re
JOIN 
    transactions t ON re.event_id = t.event_id
WHERE 
    re.event_type = '信用风险'
    AND t.status = '成功';	3072597279
SELECT risk_level, COUNT(*) AS customer_count FROM customers GROUP BY risk_level;	260033616
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY t.amount) AS median_transaction_amount
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
WHERE c.registration_date < '2019-01-01' AND c.risk_level = '高';	2369245761
SELECT rc.rule_name, re.event_description
FROM alerts a
JOIN rule_configurations rc ON a.rule_id = rc.rule_id
JOIN risk_events re ON a.event_id = re.event_id
WHERE a.alert_level = '高';	1787317276
SELECT 
    event_id AS event_identifier,
    created_at AS creation_timestamp,
    status AS current_status
FROM 
    risk_events;	1447865488
WITH monthly_event_counts AS (
    SELECT 
        DATE_TRUNC('month', occurrence_time) AS month,
        event_type,
        COUNT(*) AS event_count
    FROM 
        risk_events
    GROUP BY 
        DATE_TRUNC('month', occurrence_time),
        event_type
)
SELECT 
    current.month AS month,
    current.event_type AS event_type,
    current.event_count AS event_count,
    previous.event_count AS previous_month_count,
    CASE 
        WHEN previous.event_count = 0 THEN NULL
        ELSE ROUND((current.event_count - previous.event_count) * 100.0 / previous.event_count, 2)
    END AS month_over_month_growth
FROM 
    monthly_event_counts current
LEFT JOIN 
    monthly_event_counts previous
    ON current.event_type = previous.event_type
    AND current.month = previous.month + INTERVAL '1 month'
ORDER BY 
    current.month, current.event_type;	3560291801
SELECT 
    EXTRACT(MONTH FROM transaction_date) AS month,
    AVG(amount) AS avg_amount,
    COUNT(*) AS transaction_count
FROM transactions
GROUP BY EXTRACT(MONTH FROM transaction_date)
ORDER BY month;	2152701139
SELECT 
    r.report_id AS 报告ID,
    r.report_type AS 报告类型,
    r.approved_by AS 审批人,
    e.event_description AS 事件描述,
    e.severity AS 事件严重程度
FROM 
    risk_reports r
JOIN 
    risk_events e ON r.event_id = e.event_id
WHERE 
    r.approval_status = '已批准';	558233205
SELECT 
    c.customer_name AS customer_name,
    c.risk_level AS risk_level,
    t.status AS status
FROM 
    customers c
LEFT JOIN 
    transactions t ON c.customer_id = t.customer_id;	3381293646
SELECT DISTINCT c.customer_name AS customer_name, t.transaction_type AS transaction_type, t.status AS transaction_status
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
WHERE c.risk_level = '高';	3077667667
SELECT 
    report_id AS "报告ID",
    report_type AS "报告类型", 
    report_date AS "报告日期", 
    report_content AS "报告内容", 
    author AS "作者", 
    approval_status AS "审批状态", 
    approved_by AS "审批人", 
    event_id AS "关联事件ID"
FROM risk_reports 
WHERE author = '孙宇' AND approval_status = '待审批';	2339616488
SELECT a.alert_content AS alert_content, re.event_description AS event_description
FROM alerts a
JOIN risk_events re ON a.event_id = re.event_id
WHERE a.status = '未处理';	1797007792
SELECT 
    risk_level,
    COUNT(*) AS customer_count
FROM 
    customers
WHERE 
    risk_level IN ('中', '高')
GROUP BY 
    risk_level;	298505495
SELECT 
    c.customer_id AS customer_id,
    c.customer_name AS customer_name,
    COUNT(t.transaction_id) AS transaction_count,
    AVG(t.risk_score) AS avg_risk_score
FROM 
    customers c
LEFT JOIN 
    transactions t ON c.customer_id = t.customer_id
GROUP BY 
    c.customer_id, c.customer_name;	612300483
SELECT DATE_TRUNC('month', registration_date) AS registration_month, COUNT(*) AS high_risk_customer_count 
FROM customers 
WHERE risk_level = '高' 
GROUP BY registration_month 
ORDER BY registration_month;	3872938276
SELECT 
    ri.indicator_name AS indicator_name,
    rml.monitoring_date AS monitoring_date,
    rml.actual_value AS actual_value,
    a.alert_id AS alert_id,
    a.alert_level AS alert_level,
    a.alert_content AS alert_content,
    al.audit_result AS audit_result,
    al.audit_comments AS audit_comments
FROM 
    risk_indicators ri
JOIN 
    risk_monitoring_logs rml ON ri.indicator_id = rml.indicator_id
LEFT JOIN 
    rule_configurations rc ON ri.indicator_id = rc.indicator_id
LEFT JOIN 
    alerts a ON rc.rule_id = a.rule_id
LEFT JOIN 
    audit_logs al ON a.alert_id = al.alert_id
WHERE 
    rml.is_exceeding_threshold = true
ORDER BY 
    rml.monitoring_date DESC;	4293195588
SELECT 
    risk_level, 
    COUNT(*) AS customer_count, 
    AVG(credit_score) AS avg_credit_score 
FROM 
    customers 
GROUP BY 
    risk_level;	3735769324
SELECT 
    a.alert_type AS alert_type,
    MAX(EXTRACT(EPOCH FROM (al.audit_time - a.alert_time))) AS max_processing_time
FROM 
    alerts a
JOIN 
    audit_logs al ON a.alert_id = al.alert_id
WHERE 
    a.status = '已解决' 
    AND al.audit_type = '风险事件审核'
GROUP BY 
    a.alert_type
ORDER BY 
    max_processing_time DESC;	3555900229
SELECT 
    c.customer_name AS customer_name,
    t.amount AS transaction_amount,
    t.transaction_date AS transaction_date
FROM 
    customers c
JOIN 
    transactions t ON c.customer_id = t.customer_id
WHERE 
    t.transaction_date >= '2023-11-01' 
    AND t.transaction_date < '2023-12-01'
    AND t.amount > 100000
ORDER BY 
    t.transaction_date;	390806390
SELECT SUM(threshold_value) AS sum FROM risk_indicators WHERE indicator_name LIKE '%财务%';	2736578842
SELECT customer_name AS "客户名称", credit_score AS "信用评分" FROM customers;	453782697
SELECT 
    c.customer_id AS customer_id,
    c.customer_name AS customer_name,
    t.transaction_id AS transaction_id,
    t.transaction_date AS transaction_date,
    t.risk_score AS risk_score
FROM 
    customers c
JOIN (
    SELECT 
        customer_id,
        transaction_id,
        transaction_date,
        risk_score,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY transaction_date DESC) AS rn
    FROM 
        transactions
) t ON c.customer_id = t.customer_id AND t.rn = 1;	605680231
SELECT 
    log_id AS "日志ID",
    actual_value AS "实际值"
FROM 
    risk_monitoring_logs
WHERE 
    is_exceeding_threshold = true;	591035595
SELECT 
    t.transaction_id AS transaction_id,
    t.transaction_date AS transaction_date,
    t.amount AS amount,
    t.risk_score AS risk_score,
    (SELECT AVG(t2.risk_score) 
     FROM transactions t2
     JOIN customers c2 ON t2.customer_id = c2.customer_id
     WHERE c2.risk_level = '高') AS avg_risk_score
FROM 
    transactions t
JOIN 
    customers c ON t.customer_id = c.customer_id
WHERE 
    c.risk_level = '高';	154773295
SELECT 
    t.transaction_id AS transaction_id,
    t.risk_score AS risk_score
FROM 
    transactions t
JOIN 
    customers c ON t.customer_id = c.customer_id;	2894945358
SELECT report_type AS report_type, COUNT(*) AS count 
FROM risk_reports 
WHERE approval_status = '已拒绝' 
GROUP BY report_type;	3936841885
SELECT 
    customer_id AS "客户ID",
    customer_name AS "客户名称",
    credit_score AS "信用评分",
    risk_level AS "风险等级"
FROM 
    customers
WHERE 
    risk_level = '高' 
    AND credit_score < 600;	2451684746
SELECT 
    c.risk_level AS risk_level,
    AVG(t.amount) AS avg_transaction_amount,
    COUNT(t.transaction_id) / NULLIF(COUNT(DISTINCT c.customer_id), 0) AS avg_transactions_per_customer
FROM 
    customers c
LEFT JOIN 
    transactions t ON c.customer_id = t.customer_id AND t.transaction_date >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY 
    c.risk_level;	1650691143
SELECT 
    r.report_id AS 报告ID,
    r.report_type AS 报告类型,
    r.report_date AS 报告日期,
    r.report_content AS 报告内容,
    r.author AS 作者,
    r.approval_status AS 审批状态,
    r.approved_by AS 审批人,
    r.event_id AS 事件ID
FROM 
    risk_reports r
JOIN 
    risk_events e ON r.event_id = e.event_id
WHERE 
    e.event_type = '流动性风险';	3897186376
SELECT 
    COUNT(DISTINCT c.customer_id) AS customer_count, 
    SUM(t.amount) AS total_transaction_amount
FROM 
    customers c
JOIN 
    transactions t ON c.customer_id = t.customer_id
WHERE 
    c.credit_score BETWEEN 600 AND 800;	1076275288
SELECT report_content 
FROM risk_reports 
WHERE approved_by = '王思远' 
  AND report_date BETWEEN '2023-03-01' AND '2023-03-31';	1120727301
SELECT 
    re.event_id AS event_id,
    rr.report_id AS report_id,
    rr.approval_status AS approval_status
FROM 
    risk_events re
LEFT JOIN 
    risk_reports rr ON re.event_id = rr.event_id
WHERE 
    re.event_type = '合规风险';	1080125465
SELECT 
    transaction_id AS "交易ID",
    customer_id AS "客户ID",
    transaction_type AS "交易类型",
    amount AS "交易金额",
    transaction_date AS "交易日期",
    status AS "交易状态",
    risk_score AS "风险评分",
    event_id AS "关联事件ID"
FROM 
    transactions
WHERE 
    transaction_date >= '2023-06-01' 
    AND transaction_date < '2023-07-01';	136539419
SELECT 
    re.event_id AS event_id,
    re.event_type AS event_type,
    re.event_description AS event_description,
    al.audit_id AS audit_id,
    al.audit_type AS audit_type,
    al.audit_result AS audit_result
FROM 
    risk_events re
JOIN 
    audit_logs al ON re.event_id = al.event_id
WHERE 
    re.severity = 3;	3750047672
SELECT 
    ri.indicator_name AS indicator_name,
    ri.threshold_value AS threshold_value,
    rml.actual_value AS actual_value
FROM 
    risk_indicators ri
JOIN 
    risk_monitoring_logs rml ON ri.indicator_id = rml.indicator_id
WHERE 
    rml.is_exceeding_threshold = true;	3909298542
SELECT 
    c.customer_id AS customer_id, 
    c.customer_name AS customer_name, 
    c.credit_score AS credit_score, 
    t.status AS status
FROM 
    customers c
LEFT JOIN 
    transactions t ON c.customer_id = t.customer_id;	2762771801
SELECT 
    re.event_id AS event_id,
    re.event_description AS event_description,
    a.alert_level AS alert_level,
    a.alert_content AS alert_content
FROM 
    risk_events re
INNER JOIN 
    alerts a ON re.event_id = a.event_id
WHERE 
    a.alert_level = '高';	2830564670
SELECT 
    re.event_id AS event_id,
    re.event_description AS event_description,
    a.alert_id AS alert_id,
    a.alert_time AS alert_time
FROM 
    risk_events re
LEFT JOIN 
    alerts a ON re.event_id = a.event_id
ORDER BY 
    a.alert_time;	942591775
SELECT 
    c.risk_level,
    NULL AS avg_transaction_amount,
    NULL AS avg_transaction_count
FROM 
    customers c
GROUP BY 
    c.risk_level;	3295587616
SELECT 
    customer_id AS "客户ID",
    customer_name AS "客户名称",
    credit_score AS "信用评分"
FROM 
    customers
WHERE 
    risk_level = '高' 
    AND credit_score < 700;	3932804573
SELECT 
    c.customer_id AS customer_id,
    c.credit_score AS credit_score,
    t.transaction_id AS transaction_id,
    t.status AS status
FROM customers c
JOIN (
    SELECT 
        customer_id,
        transaction_id,
        status,
        transaction_date,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY transaction_date DESC) AS rn
    FROM transactions
    WHERE status = '失败'
) t ON c.customer_id = t.customer_id AND t.rn = 1
ORDER BY c.customer_id;	862533692
SELECT 
    ra.assessment_id AS assessment_id,
    ra.event_id AS event_id,
    c.customer_id AS customer_id,
    c.customer_name AS customer_name,
    c.credit_score AS credit_score
FROM risk_assessments ra
JOIN risk_events re ON ra.event_id = re.event_id
JOIN transactions t ON re.event_id = t.event_id
JOIN customers c ON t.customer_id = c.customer_id
WHERE ra.risk_level = '高' AND c.credit_score > 700;	2759801136
SELECT 
    customer_id AS "客户ID",
    customer_name AS "客户名称", 
    customer_type AS "客户类型",
    credit_score AS "信用评分",
    risk_level AS "风险等级",
    registration_date AS "注册日期",
    last_update_date AS "最后更新日期"
FROM customers 
WHERE customer_type = '企业' 
ORDER BY credit_score DESC 
LIMIT 10;	1448319074
SELECT 
    month,
    new_rules,
    active_rules_count / EXTRACT(MONTH FROM month) AS avg_active_rules
FROM (
    SELECT 
        DATE_TRUNC('month', created_at) AS month,
        COUNT(*) AS new_rules,
        SUM(COUNT(CASE WHEN is_active THEN 1 END)) OVER (ORDER BY DATE_TRUNC('month', created_at)) AS active_rules_count
    FROM 
        rule_configurations
    GROUP BY 
        DATE_TRUNC('month', created_at)
) AS monthly_stats
ORDER BY 
    month;	2148910450
SELECT author AS report_author, approval_status AS approval_status
FROM risk_reports 
WHERE approval_status = 'approved';	3303778848
SELECT 
    c.customer_name AS customer_name,
    t.amount AS amount,
    t.status AS transaction_status
FROM 
    customers c
JOIN 
    transactions t ON c.customer_id = t.customer_id;	2919479377
SELECT 
    re.event_id AS event_id,
    ra.assessment_id AS assessment_id, 
    ra.risk_level AS risk_level
FROM 
    risk_events re
LEFT JOIN 
    risk_assessments ra ON re.event_id = ra.event_id;	3408098582
SELECT 
    ri.indicator_id AS indicator_id,
    ri.indicator_name AS indicator_name,
    ri.threshold_value AS threshold_value,
    AVG(rml.actual_value) AS avg_actual_value
FROM 
    risk_indicators ri
LEFT JOIN 
    risk_monitoring_logs rml ON ri.indicator_id = rml.indicator_id
GROUP BY 
    ri.indicator_id, ri.indicator_name, ri.threshold_value
ORDER BY 
    ri.indicator_id;	3536942222
SELECT 
    r.report_id AS report_id,
    r.report_type AS report_type,
    r.report_content AS report_content,
    e.event_type AS event_type,
    e.event_description AS event_description
FROM 
    risk_reports r
JOIN 
    risk_events e ON r.event_id = e.event_id
WHERE 
    r.approval_status = '已批准';	3025435441
SELECT DISTINCT 
    c.customer_id AS customer_id,
    c.customer_name AS customer_name,
    DATE(t.transaction_date) AS transaction_date
FROM 
    customers c
JOIN 
    transactions t ON c.customer_id = t.customer_id
JOIN 
    alerts a ON t.event_id = a.event_id
WHERE 
    t.risk_score >= 90
    AND a.alert_level = '高'
    AND DATE(t.transaction_date) = DATE(a.alert_time)
ORDER BY 
    transaction_date, customer_id;	3761432717
SELECT 
    t.transaction_id AS transaction_id,
    c.customer_name AS customer_name
FROM 
    transactions t
JOIN 
    customers c ON t.customer_id = c.customer_id
WHERE 
    t.risk_score > 70
ORDER BY 
    t.risk_score DESC;	3404778014
SELECT 
    re.event_description AS event_description,
    ra.assessment_date AS assessment_date
FROM 
    risk_events re
JOIN 
    risk_assessments ra ON re.event_id = ra.event_id
WHERE 
    ra.risk_level = '高';	3200534548
SELECT 
    c.customer_name AS customer_name,
    t.status AS transaction_status
FROM 
    customers c
JOIN 
    transactions t ON c.customer_id = t.customer_id
WHERE 
    c.risk_level = 'high' 
    AND t.status = 'failed'
ORDER BY 
    t.transaction_date DESC;	698660188
SELECT 
    re.event_id AS event_id,
    COUNT(t.transaction_id) AS transaction_count
FROM 
    risk_events re
LEFT JOIN 
    transactions t ON re.event_id = t.event_id
GROUP BY 
    re.event_id;	756643276
SELECT 
    t.transaction_id AS transaction_id,
    t.amount AS amount,
    t.transaction_date AS transaction_date,
    c.customer_name AS customer_name,
    c.risk_level AS risk_level
FROM 
    transactions t
JOIN 
    customers c ON t.customer_id = c.customer_id
WHERE 
    c.risk_level = '高'
    AND t.amount > 500000
    AND t.transaction_date >= '2023-01-01' 
    AND t.transaction_date < '2023-04-01';	1961596891
SELECT 
    re.event_id AS event_id,
    re.event_description AS event_description,
    re.severity AS severity,
    ra.risk_level AS risk_level,
    ra.mitigation_plan AS mitigation_plan
FROM 
    risk_events re
JOIN 
    risk_assessments ra ON re.event_id = ra.event_id
WHERE 
    EXTRACT(YEAR FROM re.occurrence_time) = 2023
    AND re.severity IN (4, 5);	1488802626
SELECT 
    log_id AS "日志ID",
    notes AS "备注信息"
FROM 
    risk_monitoring_logs
WHERE 
    is_exceeding_threshold = false;	3027811751
SELECT 
    r.report_id AS report_id,
    r.report_type AS report_type,
    r.author AS author,
    re.event_type AS event_type,
    re.severity AS severity,
    al.audit_result AS audit_result,
    al.audit_comments AS audit_comments
FROM 
    risk_reports r
LEFT JOIN 
    risk_events re ON r.event_id = re.event_id
LEFT JOIN 
    (SELECT 
        a.event_id,
        a.audit_result,
        a.audit_comments,
        ROW_NUMBER() OVER (PARTITION BY a.event_id ORDER BY a.audit_time DESC) AS rn
     FROM 
        audit_logs a
     WHERE 
        a.audit_type = 'REPORT') al ON r.event_id = al.event_id AND al.rn = 1
WHERE 
    r.approval_status = '待审批'
ORDER BY 
    r.report_date DESC;	1296190191
SELECT 
    customer_id AS "客户ID",
    customer_name AS "客户名称",
    credit_score AS "信用评分",
    risk_level AS "风险等级"
FROM 
    customers
WHERE 
    EXTRACT(YEAR FROM registration_date) = 2021
    AND risk_level = '高'
    AND credit_score < 550;	2631012035
AMBIGUOUS_QUERY	2342271424
SELECT event_type, COUNT(*) AS event_count 
FROM risk_events 
GROUP BY event_type;	2292865545
SELECT 
    c.customer_name AS customer_name,
    rc.rule_name AS rule_name,
    COUNT(a.alert_id) AS trigger_count
FROM 
    customers c
JOIN 
    transactions t ON c.customer_id = t.customer_id
JOIN 
    alerts a ON t.event_id = a.event_id
JOIN 
    rule_configurations rc ON a.rule_id = rc.rule_id
WHERE 
    c.risk_level = '高'
GROUP BY 
    c.customer_name, rc.rule_name
ORDER BY 
    c.customer_name, trigger_count DESC;	3057920994
SELECT 
  EXTRACT(YEAR FROM occurrence_time) || '-' || LPAD(EXTRACT(MONTH FROM occurrence_time)::text, 2, '0') AS month,
  event_type AS event_type,
  COUNT(*) AS event_count,
  AVG(severity) AS avg_severity,
  ROUND(SUM(CASE WHEN status = 'RESOLVED' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS resolution_rate
FROM risk_events
GROUP BY month, event_type
ORDER BY month, event_type;	1563461822
SELECT 
    rml.monitoring_date AS monitoring_date,
    rml.actual_value AS actual_value,
    ri.threshold_value AS threshold_value
FROM risk_monitoring_logs rml
JOIN risk_indicators ri ON rml.indicator_id = ri.indicator_id;	2699040253
SELECT 
    c.risk_level AS risk_level,
    t.transaction_type AS transaction_type,
    AVG(t.amount) AS avg_transaction_amount
FROM 
    customers c
JOIN 
    transactions t ON c.customer_id = t.customer_id
GROUP BY 
    c.risk_level, t.transaction_type;	2609391365
SELECT COUNT(*) AS count FROM rule_configurations WHERE is_active = true;	1646275357
SELECT 
    customer_id AS "客户ID",
    customer_name AS "客户名称",
    risk_level AS "风险等级",
    credit_score AS "信用评分"
FROM customers;	3640375109
SELECT 
    COUNT(*) AS indicator_count,
    AVG(CASE 
        WHEN update_frequency = '每日' THEN 86400
        WHEN update_frequency = '每周' THEN 604800
        WHEN update_frequency = '每月' THEN 2592000
        WHEN update_frequency = '每季' THEN 7776000
        WHEN update_frequency = '每年' THEN 31536000
        ELSE NULL
    END) AS avg_update_frequency_seconds
FROM risk_indicators
WHERE threshold_value > 50;	1137138067
SELECT customer_name AS "客户名称", registration_date AS "注册日期" FROM customers;	674388735
SELECT 
    ri.indicator_id AS indicator_id,
    ri.indicator_name AS indicator_name,
    rml.log_id AS log_id,
    rml.actual_value AS actual_value,
    rml.is_exceeding_threshold AS is_exceeding_threshold
FROM 
    risk_indicators ri
JOIN 
    risk_monitoring_logs rml ON ri.indicator_id = rml.indicator_id;	2598937105
SELECT 
    ri.indicator_id AS indicator_id,
    ri.indicator_name AS indicator_name,
    ri.data_source AS data_source,
    AVG(rml.actual_value) AS avg_value,
    STDDEV(rml.actual_value) AS stddev_value
FROM 
    risk_monitoring_logs rml
JOIN 
    risk_indicators ri ON rml.indicator_id = ri.indicator_id
GROUP BY 
    ri.indicator_id, ri.indicator_name, ri.data_source;	62865185
SELECT 
    audit_id AS "审核记录ID",
    audit_result AS "审核结果",
    auditor AS "审核人"
FROM 
    audit_logs 
WHERE 
    audit_result = '拒绝';	185839438
SELECT alert_type AS "预警类型", alert_content AS "预警内容" FROM alerts;	3165460471
SELECT 
    a.alert_id AS alert_id,
    a.alert_type AS alert_type,
    a.alert_content AS alert_content,
    re.event_description AS event_description,
    al.audit_result AS audit_result,
    al.audit_comments AS audit_comments
FROM 
    alerts a
LEFT JOIN 
    risk_events re ON a.event_id = re.event_id
LEFT JOIN 
    (SELECT 
        alert_id,
        audit_result,
        audit_comments,
        ROW_NUMBER() OVER (PARTITION BY alert_id ORDER BY audit_time DESC) AS rn
     FROM 
        audit_logs) al ON a.alert_id = al.alert_id AND al.rn = 1
WHERE 
    a.status = '未处理';	3849483796
SELECT AVG(EXTRACT(EPOCH FROM (NOW() - alert_time))/3600 AS average_alert_time 
FROM alerts 
WHERE status != 'processed' OR status IS NULL;	1990473038
SELECT 
    c.customer_id,
    c.customer_name,
    c.risk_level,
    (COUNT(DISTINCT ra.assessment_id) * COALESCE(AVG(ra.impact_score + ra.probability_score), 0)) + 
    (COUNT(DISTINCT a.alert_id) * 2) AS risk_index
FROM 
    customers c
LEFT JOIN 
    transactions t ON c.customer_id = t.customer_id
LEFT JOIN 
    risk_assessments ra ON t.event_id = ra.event_id
LEFT JOIN 
    alerts a ON t.event_id = a.event_id
GROUP BY 
    c.customer_id, c.customer_name, c.risk_level;	3119334868
SELECT event_type, COUNT(*) AS event_count 
FROM risk_events 
WHERE status = '未处理' 
GROUP BY event_type;	2458967882
SELECT 
    t.transaction_id AS transaction_id,
    t.customer_id AS customer_id,
    t.transaction_type AS transaction_type,
    t.amount AS amount,
    t.transaction_date AS transaction_date,
    t.status AS status,
    t.risk_score AS risk_score,
    t.event_id AS event_id
FROM 
    customers c
JOIN 
    transactions t ON c.customer_id = t.customer_id
WHERE 
    c.risk_level = '低' 
    AND c.credit_score > 700;	4081376750
SELECT 
    a.alert_id AS alert_id,
    a.alert_type AS alert_type,
    a.alert_content AS alert_content,
    a.alert_level AS alert_level,
    a.event_id AS event_id,
    re.event_type AS event_type,
    re.severity AS event_severity
FROM 
    alerts a
JOIN 
    risk_events re ON a.event_id = re.event_id
WHERE 
    a.status = '未处理' 
    AND a.alert_level = '高';	2952805928
SELECT a.alert_content AS alert_content, a.status AS alert_status
FROM alerts a
JOIN rule_configurations rc ON a.rule_id = rc.rule_id
WHERE rc.rule_description LIKE '%合规%' OR rc.rule_description LIKE '%违规%' OR rc.rule_type LIKE '%合规%' OR rc.rule_type LIKE '%违规%';	790231894
SELECT 
    t.customer_id AS customer_id,
    c.risk_level AS risk_level,
    SUM(t.amount) AS total_transaction_amount
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE t.risk_score > 70
GROUP BY t.customer_id, c.risk_level;	76184048
SELECT report_content 
FROM risk_reports 
WHERE report_type = '月度风险报告' AND approval_status = '已拒绝';	291950371
SELECT event_type, COUNT(*) AS event_count 
FROM risk_events 
GROUP BY event_type;	2809252635
SELECT 
    c.customer_name AS customer_name,
    t.amount AS amount,
    t.transaction_date AS transaction_date
FROM 
    customers c
JOIN 
    transactions t ON c.customer_id = t.customer_id
WHERE 
    t.transaction_type = '转账'
    AND t.amount > 200000
    AND t.transaction_date::date = '2023-05-04';	184311181
SELECT 
    a.alert_id AS alert_id,
    a.alert_content AS alert_content,
    a.alert_level AS alert_level,
    a.assigned_to AS assigned_to,
    re.event_description AS event_description
FROM 
    alerts a
JOIN 
    risk_events re ON a.event_id = re.event_id
WHERE 
    a.status = '未处理' 
    AND a.alert_level = '高';	1539184065
SELECT 
    report_id AS "报告ID",
    report_content AS "报告内容"
FROM 
    risk_reports 
WHERE 
    report_date BETWEEN '2023-04-01' AND '2023-04-30' 
    AND approved_by = '高志远';	3408938184
SELECT 
    transaction_type,
    SUM(CASE WHEN status = '成功' THEN 1 ELSE 0 END) AS success_count,
    SUM(CASE WHEN status = '失败' THEN 1 ELSE 0 END) AS failure_count
FROM 
    transactions
GROUP BY 
    transaction_type;	547284006
SELECT 
    re.event_id AS event_id,
    latest_ra.risk_level AS risk_level
FROM 
    risk_events re
LEFT JOIN (
    SELECT 
        event_id, 
        risk_level,
        ROW_NUMBER() OVER (PARTITION BY event_id ORDER BY assessment_date DESC) as rn
    FROM 
        risk_assessments
) latest_ra ON re.event_id = latest_ra.event_id AND latest_ra.rn = 1;	2791172353
SELECT 
    c.customer_name,
    COUNT(DISTINCT ra.assessment_id) AS high_risk_assessment_count,
    COUNT(DISTINCT t.transaction_id) AS large_transaction_count
FROM 
    customers c
    LEFT JOIN transactions t ON c.customer_id = t.customer_id
    LEFT JOIN risk_events re ON t.event_id = re.event_id
    LEFT JOIN risk_assessments ra ON re.event_id = ra.event_id AND ra.risk_level = '高' AND ra.assessment_date >= CURRENT_DATE - INTERVAL '1 year'
WHERE 
    (t.amount > 500000 AND t.transaction_date >= CURRENT_DATE - INTERVAL '1 year')
    OR ra.assessment_id IS NOT NULL
GROUP BY 
    c.customer_name
HAVING
    COUNT(DISTINCT ra.assessment_id) > 0
    AND COUNT(DISTINCT t.transaction_id) > 0;	616009086
AMBIGUOUS_QUERY	2755424699
SELECT event_id, severity AS max_severity FROM risk_events;	3357225905
SELECT 
    c.risk_level AS risk_level,
    COUNT(DISTINCT c.customer_id) AS customer_count,
    AVG(t.amount) AS avg_transaction_amount
FROM 
    customers c
LEFT JOIN 
    transactions t ON c.customer_id = t.customer_id
GROUP BY 
    c.risk_level;	2507883319
SELECT 
    a.audit_time AS audit_time,
    a.audit_result AS audit_result
FROM 
    audit_logs a
JOIN 
    alerts al ON a.alert_id = al.alert_id
WHERE 
    a.auditor = '张强'
ORDER BY 
    a.audit_time DESC;	2171757699
SELECT 
    rml.log_id AS log_id,
    rml.actual_value AS actual_value,
    rml.is_exceeding_threshold AS is_exceeding_threshold,
    ri.indicator_name AS indicator_name
FROM 
    risk_monitoring_logs rml
JOIN 
    risk_indicators ri ON rml.indicator_id = ri.indicator_id;	1791933892
SELECT 
    ri.indicator_name AS indicator_name,
    COUNT(*) AS exceed_count,
    AVG((rml.actual_value - ri.threshold_value) / ri.threshold_value * 100) AS avg_exceed_percentage
FROM 
    risk_monitoring_logs rml
JOIN 
    risk_indicators ri ON rml.indicator_id = ri.indicator_id
WHERE 
    rml.is_exceeding_threshold = true
    AND rml.monitoring_date >= '2023-01-01' 
    AND rml.monitoring_date < '2024-01-01'
GROUP BY 
    ri.indicator_name;	4281611752
SELECT 
    alert_id AS "预警ID",
    alert_content AS "预警内容",
    status AS "处理状态"
FROM 
    alerts
WHERE 
    alert_time >= '2023-01-01' 
    AND alert_time < '2024-01-01';	2403947927
SELECT 
    ri.indicator_id AS indicator_id,
    ri.indicator_name AS indicator_name,
    rml.monitoring_date AS monitoring_date,
    rml.actual_value AS actual_value
FROM risk_indicators ri
JOIN risk_monitoring_logs rml ON ri.indicator_id = rml.indicator_id
JOIN (
    SELECT 
        indicator_id,
        MAX(monitoring_date) AS latest_date
    FROM risk_monitoring_logs
    GROUP BY indicator_id
) latest ON rml.indicator_id = latest.indicator_id AND rml.monitoring_date = latest.latest_date;	3007794799
SELECT 
    ri.indicator_name AS indicator_name,
    ri.threshold_value AS threshold_value,
    COUNT(CASE WHEN rml.is_exceeding_threshold = true THEN 1 END) AS times_exceeded,
    COUNT(rml.log_id) AS total_checks,
    ROUND(COUNT(CASE WHEN rml.is_exceeding_threshold = true THEN 1 END) * 100.0 / NULLIF(COUNT(rml.log_id), 0), 2) AS exceed_percentage
FROM 
    risk_indicators ri
LEFT JOIN 
    risk_monitoring_logs rml ON ri.indicator_id = rml.indicator_id 
    AND rml.monitoring_date >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY 
    ri.indicator_name, ri.threshold_value
HAVING 
    COUNT(rml.log_id) > 0
ORDER BY 
    times_exceeded DESC
LIMIT 10;	3478580962
SELECT risk_level, COUNT(*) AS customer_count FROM customers GROUP BY risk_level;	2835641813
SELECT 
    c.customer_id AS customer_id,
    t.risk_score AS risk_score,
    t.status AS transaction_status
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id;	3556405805
SELECT 
    ra.assessment_id AS assessment_id, 
    ra.risk_level AS risk_level, 
    t.transaction_id AS transaction_id, 
    t.risk_score AS risk_score
FROM 
    risk_assessments ra
JOIN 
    risk_events re ON ra.event_id = re.event_id
JOIN 
    transactions t ON re.event_id = t.event_id
WHERE 
    ra.risk_level = '高风险' 
    AND t.risk_score < 50;	1912282533
SELECT transaction_type, COUNT(*) AS success_count 
FROM transactions 
WHERE status = '成功' 
GROUP BY transaction_type 
ORDER BY success_count DESC;	966675168
SELECT t.transaction_id AS transaction_id, t.amount AS amount, t.status AS transaction_status
FROM transactions t
JOIN risk_events re ON t.event_id = re.event_id
WHERE t.status = '失败' AND re.status = '已解决';	1657330121
SELECT 
    t.transaction_id AS transaction_id,
    c.customer_name AS customer_name
FROM 
    transactions t
JOIN 
    customers c ON t.customer_id = c.customer_id
WHERE 
    t.status = '处理中';	2427884877
SELECT 
    t.transaction_id AS transaction_id,
    t.amount AS amount,
    re.event_description AS event_description
FROM 
    transactions t
JOIN 
    risk_events re ON t.event_id = re.event_id
WHERE 
    t.amount > 1000;	2050953540
SELECT 
    t.transaction_id AS transaction_id,
    t.amount AS amount,
    t.transaction_date AS transaction_date,
    c.customer_name AS customer_name,
    re.event_type AS event_type,
    re.event_description AS event_description
FROM 
    transactions t
JOIN 
    customers c ON t.customer_id = c.customer_id
JOIN 
    risk_events re ON t.event_id = re.event_id
WHERE 
    t.amount > 100000
    AND c.risk_level = '高'
    AND t.transaction_date >= CURRENT_DATE - INTERVAL '1 year';	2088100618
SELECT assessment_id AS assessment_identifier, mitigation_plan AS risk_mitigation_plan
FROM risk_assessments
WHERE mitigation_plan IS NOT NULL AND mitigation_plan != '';	4242999593
SELECT 
    t.transaction_id AS transaction_identifier,
    t.risk_score AS transaction_risk_score
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE c.risk_level = '高';	4243946175
SELECT 
    rml.actual_value AS actual_value,
    ri.indicator_name AS indicator_name
FROM 
    risk_monitoring_logs rml
JOIN 
    risk_indicators ri ON rml.indicator_id = ri.indicator_id
WHERE 
    rml.actual_value < ri.threshold_value;	1679294343
SELECT 
    r.report_content AS report_content,
    e.event_type AS event_type,
    e.status AS status
FROM 
    risk_reports r
JOIN 
    risk_events e ON r.event_id = e.event_id
WHERE 
    r.approval_status = '已拒绝';	1824329950
SELECT DISTINCT 
    c.customer_name AS company_name, 
    c.credit_score AS credit_score, 
    c.registration_date AS registration_date, 
    MAX(t.transaction_date) AS last_transaction_date
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
WHERE EXTRACT(YEAR FROM c.registration_date) = 2021
  AND c.credit_score > 700
  AND t.transaction_date >= CURRENT_DATE - INTERVAL '1 year'
  AND c.customer_type = 'ENTERPRISE'
GROUP BY c.customer_name, c.credit_score, c.registration_date;	888703769
SELECT 
    a.alert_id AS alert_id,
    a.alert_type AS alert_type,
    a.alert_content AS alert_content,
    a.event_id AS event_id,
    re.event_type AS event_type,
    t.transaction_id AS transaction_id,
    t.amount AS amount
FROM 
    alerts a
LEFT JOIN 
    risk_events re ON a.event_id = re.event_id
LEFT JOIN 
    transactions t ON a.event_id = t.event_id
WHERE 
    a.assigned_to = '陈强';	411280576
SELECT 
    report_id AS "报告ID",
    report_type AS "报告类型", 
    report_date AS "报告日期",
    report_content AS "报告内容",
    author AS "作者",
    approval_status AS "审批状态",
    approved_by AS "审批人",
    event_id AS "关联事件ID"
FROM 
    risk_reports 
WHERE 
    report_content LIKE '%合规%';	452369014
SELECT 
    EXTRACT(MONTH FROM re.occurrence_time) AS month,
    COUNT(DISTINCT re.event_id) AS event_count,
    AVG(re.severity) AS avg_severity,
    COUNT(DISTINCT a.alert_id) AS alert_count
FROM 
    risk_events re
LEFT JOIN 
    alerts a ON re.event_id = a.event_id
GROUP BY 
    EXTRACT(MONTH FROM re.occurrence_time)
ORDER BY 
    month;	865900816
SELECT indicator_name AS "风险指标名称", threshold_value AS "阈值"
FROM risk_indicators;	92424187
WITH latest_monitoring AS (
    SELECT 
        indicator_id,
        MAX(monitoring_date) AS latest_date
    FROM 
        risk_monitoring_logs
    GROUP BY 
        indicator_id
)
SELECT 
    ri.indicator_name AS indicator_name,
    rml.log_id AS log_id,
    rml.indicator_id AS indicator_id,
    rml.monitoring_date AS monitoring_date,
    rml.actual_value AS actual_value,
    rml.is_exceeding_threshold AS is_exceeding_threshold,
    rml.notes AS notes
FROM 
    risk_monitoring_logs rml
JOIN 
    latest_monitoring lm ON rml.indicator_id = lm.indicator_id AND rml.monitoring_date = lm.latest_date
JOIN 
    risk_indicators ri ON rml.indicator_id = ri.indicator_id
ORDER BY 
    ri.indicator_name;	2998508313
SELECT 
    t.transaction_id AS transaction_id,
    t.amount AS amount,
    c.customer_name AS customer_name,
    c.customer_type AS customer_type
FROM 
    transactions t
JOIN 
    customers c ON t.customer_id = c.customer_id
WHERE 
    t.amount > 100000;	1024168357
SELECT 
    report_id AS "报告ID",
    report_type AS "报告类型", 
    report_date AS "报告日期",
    report_content AS "报告内容",
    author AS "作者",
    approval_status AS "审批状态",
    approved_by AS "审批人",
    event_id AS "关联事件ID"
FROM 
    risk_reports
WHERE 
    approval_status = '已批准';	2422412797
SELECT transaction_type, AVG(risk_score) AS avg_risk_score 
FROM transactions 
GROUP BY transaction_type;	3918852865
SELECT 
    re.event_type,
    AVG(EXTRACT(EPOCH FROM (MAX(a.audit_time) - re.created_at)/3600 AS avg_total_time_hours,
    AVG(EXTRACT(EPOCH FROM (MIN(a.audit_time) - re.created_at))/3600) AS avg_unprocessed_time_hours,
    AVG(EXTRACT(EPOCH FROM (MAX(a.audit_time) - MIN(a.audit_time))/3600)) AS avg_processing_time_hours
FROM 
    risk_events re
JOIN 
    audit_logs a ON re.event_id = a.event_id
WHERE 
    re.status IN ('未处理', '处理中', '已解决')
GROUP BY 
    re.event_type;	2671276850
SELECT 
    a.alert_type,
    COUNT(*) AS alert_count,
    AVG(EXTRACT(EPOCH FROM (al.audit_time - a.alert_time)))/3600 AS avg_processing_time
FROM 
    alerts a
LEFT JOIN 
    audit_logs al ON a.alert_id = al.alert_id
GROUP BY 
    a.alert_type;	3873676880
SELECT 
    event_type AS event_type,
    AVG(EXTRACT(EPOCH FROM (updated_at - created_at))/86400 AS avg_resolution_days
FROM 
    risk_events
WHERE 
    status = '已解决'
GROUP BY 
    event_type;	3957865555
SELECT a.alert_content AS alert_content, re.status AS status
FROM alerts a
JOIN risk_events re ON a.event_id = re.event_id
WHERE a.rule_id IS NOT NULL;	4127521896
SELECT 
    c.customer_name,
    COUNT(DISTINCT t.transaction_id) AS high_risk_transactions,
    COUNT(DISTINCT a.alert_id) AS high_level_alerts
FROM 
    customers c
JOIN 
    transactions t ON c.customer_id = t.customer_id
JOIN 
    risk_events re ON t.event_id = re.event_id
JOIN 
    alerts a ON re.event_id = a.event_id
WHERE 
    t.risk_score > 80
    AND EXTRACT(YEAR FROM t.transaction_date) = 2023
    AND a.alert_level = '高'
GROUP BY 
    c.customer_id, c.customer_name
HAVING 
    COUNT(DISTINCT t.transaction_id) > 0 
    AND COUNT(DISTINCT a.alert_id) > 0;	4089186720
SELECT 
    e.event_id AS event_id,
    e.severity AS severity,
    r.risk_level AS risk_level
FROM 
    risk_events e
LEFT JOIN 
    risk_assessments r ON e.event_id = r.event_id;	907497664
AMBIGUOUS_QUERY	4046233588
SELECT customer_type, COUNT(*) AS customer_count FROM customers GROUP BY customer_type;	950586637
SELECT 
    ra.assessment_id AS assessment_id,
    re.event_description AS event_description
FROM 
    risk_assessments ra
JOIN 
    risk_events re ON ra.event_id = re.event_id;	1374953478
AMBIGUOUS_QUERY	3381418272
SELECT 
    c.customer_id AS customer_id,
    c.customer_name AS customer_name,
    c.risk_level AS risk_level,
    latest_transaction.transaction_date AS transaction_date,
    latest_transaction.amount AS amount,
    latest_transaction.risk_score AS risk_score
FROM 
    customers c
JOIN (
    SELECT 
        t.customer_id,
        t.transaction_date,
        t.amount,
        t.risk_score,
        ROW_NUMBER() OVER (PARTITION BY t.customer_id ORDER BY t.transaction_date DESC) AS rn
    FROM 
        transactions t
) latest_transaction ON c.customer_id = latest_transaction.customer_id AND latest_transaction.rn = 1
WHERE 
    c.risk_level = '高';	2179442925
SELECT 
    transaction_type, 
    COUNT(*) AS transaction_count, 
    SUM(CASE WHEN status = 'SUCCESS' THEN 1 ELSE 0 END) AS success_count 
FROM 
    transactions 
GROUP BY 
    transaction_type;	1859945760
SELECT 
    ra.event_id AS event_id,
    re.event_type AS event_type,
    ra.risk_level AS risk_level,
    ra.mitigation_plan AS mitigation_plan,
    ra.assessor AS assessor
FROM 
    risk_assessments ra
JOIN 
    risk_events re ON ra.event_id = re.event_id
WHERE 
    ra.risk_level = '高';	2798341435
SELECT 
    customer_id AS "客户ID",
    customer_name AS "客户名称",
    credit_score AS "信用评分"
FROM 
    customers
WHERE 
    risk_level = '高' 
    AND credit_score < 700;	2480313897
SELECT 
    customer_id AS "客户ID",
    customer_name AS "客户名称",
    customer_type AS "客户类型",
    credit_score AS "信用评分",
    risk_level AS "风险等级",
    registration_date AS "注册日期",
    last_update_date AS "最后更新日期"
FROM 
    customers 
WHERE 
    risk_level = '高' 
    AND credit_score < 600;	4249746696
SELECT 
    c.customer_id AS customer_id, 
    c.risk_level AS risk_level, 
    SUM(t.amount) AS total_amount
FROM 
    customers c
JOIN 
    transactions t ON c.customer_id = t.customer_id
WHERE 
    t.status = '成功'
GROUP BY 
    c.customer_id, c.risk_level;	3634061359
SELECT 
    r.report_id AS report_id,
    r.report_type AS report_type,
    r.approval_status AS approval_status,
    e.event_type AS event_type,
    e.event_description AS event_description
FROM 
    risk_reports r
JOIN 
    risk_events e ON r.event_id = e.event_id
WHERE 
    r.approval_status = '已批准';	1094205818
SELECT author, COUNT(*) AS report_count 
FROM risk_reports 
GROUP BY author 
ORDER BY report_count DESC 
LIMIT 1;	4008892599
SELECT 
    event_id AS event_identifier,
    event_type AS event_category,
    reporter AS reported_by
FROM 
    risk_events
WHERE 
    status != 'processed' OR status IS NULL;	1522060162
SELECT 
    customer_name AS customer_name,
    last_update_date AS last_update_date
FROM 
    customers
WHERE 
    registration_date > '2021-01-01'
ORDER BY 
    last_update_date DESC;	2054103027
SELECT 
    r.report_id AS report_id,
    r.report_type AS report_type,
    r.report_date AS report_date,
    r.report_content AS report_content,
    r.author AS author,
    r.approval_status AS approval_status,
    r.approved_by AS approved_by,
    r.event_id AS event_id,
    e.event_type AS event_type,
    e.event_description AS event_description
FROM 
    risk_reports r
JOIN 
    risk_events e ON r.event_id = e.event_id
WHERE 
    r.approved_by = '高志远';	3283769605
SELECT 
    ri.indicator_id AS indicator_id,
    ri.indicator_name AS indicator_name,
    ri.threshold_value AS threshold_value,
    rml.actual_value AS actual_value,
    rml.monitoring_date AS last_update_time
FROM 
    risk_indicators ri
LEFT JOIN 
    (SELECT 
        indicator_id,
        actual_value,
        monitoring_date,
        ROW_NUMBER() OVER (PARTITION BY indicator_id ORDER BY monitoring_date DESC) AS rn
     FROM 
        risk_monitoring_logs) rml
ON 
    ri.indicator_id = rml.indicator_id AND rml.rn = 1
ORDER BY 
    ri.indicator_id;	747719750
SELECT 
    rml.log_id AS log_id,
    rml.actual_value AS actual_value,
    ri.indicator_name AS indicator_name
FROM 
    risk_monitoring_logs rml
JOIN 
    risk_indicators ri ON rml.indicator_id = ri.indicator_id;	334580003
SELECT AVG(impact_score) AS avg_impact, AVG(probability_score) AS avg_probability FROM risk_assessments;	388467912
SELECT 
    re.event_id AS event_id,
    re.event_description AS event_description,
    ra.assessor AS assessor
FROM 
    risk_events re
JOIN 
    risk_assessments ra ON re.event_id = ra.event_id
WHERE 
    ra.assessor IS NOT NULL;	3589660339
SELECT SUM(amount) AS sum FROM transactions WHERE transaction_type = '退款';	1785182803
SELECT 
    ri.indicator_id AS indicator_id,
    ri.indicator_name AS indicator_name,
    ri.indicator_description AS indicator_description,
    ri.measurement_unit AS measurement_unit,
    ri.threshold_value AS threshold_value,
    ri.data_source AS data_source,
    ri.update_frequency AS update_frequency,
    rml.actual_value AS actual_value,
    rml.monitoring_date AS monitoring_date
FROM 
    risk_indicators ri
LEFT JOIN 
    (SELECT 
        indicator_id,
        actual_value,
        monitoring_date,
        ROW_NUMBER() OVER (PARTITION BY indicator_id ORDER BY monitoring_date DESC) AS rn
     FROM 
        risk_monitoring_logs) rml
ON 
    ri.indicator_id = rml.indicator_id AND rml.rn = 1
ORDER BY 
    ri.indicator_id;	3949045999
SELECT 
    r.event_type AS event_type,
    AVG(EXTRACT(EPOCH FROM (a.assessment_date - r.occurrence_time))/3600) AS avg_mitigation_time
FROM 
    risk_events r
JOIN 
    risk_assessments a ON r.event_id = a.event_id
GROUP BY 
    r.event_type;	1365503712
SELECT event_type, COUNT(*) AS event_count 
FROM risk_events 
GROUP BY event_type;	454781039
SELECT 
    ra.assessment_id AS assessment_id,
    re.event_description AS event_description,
    ra.assessor AS assessor
FROM 
    risk_assessments ra
JOIN 
    risk_events re ON ra.event_id = re.event_id;	312146930
SELECT 
    log_id AS "日志ID",
    indicator_id AS "指标ID",
    monitoring_date AS "监控日期",
    actual_value AS "实际值",
    is_exceeding_threshold AS "是否超过阈值",
    notes AS "备注",
    (SELECT COUNT(*) FROM risk_monitoring_logs WHERE is_exceeding_threshold = true) AS "超过阈值记录总数"
FROM risk_monitoring_logs 
WHERE is_exceeding_threshold = true;	3050678212
SELECT 
    re.event_id AS event_id,
    ra.assessment_id AS assessment_id,
    ra.mitigation_plan AS mitigation_plan
FROM 
    risk_events re
LEFT JOIN 
    risk_assessments ra ON re.event_id = ra.event_id;	2500244814
SELECT 
    report_id AS "报告ID",
    report_type AS "报告类型",
    report_date AS "报告日期",
    author AS "作者"
FROM 
    risk_reports
WHERE 
    approval_status = '已批准';	2753692877
SELECT 
    customer_id AS customer_id,
    customer_name AS customer_name,
    customer_type AS customer_type,
    credit_score AS credit_score,
    risk_level AS risk_level,
    registration_date AS registration_date,
    last_update_date AS last_update_date
FROM customers
WHERE risk_level = '高' 
AND credit_score > (SELECT AVG(credit_score) FROM customers);	2701292510
SELECT 
    alert_id AS "预警ID",
    alert_content AS "预警内容",
    assigned_to AS "处理人"
FROM alerts;	3788454929
SELECT 
    event_id AS event_id,
    event_description AS event_description,
    severity AS severity,
    created_at AS created_at,
    occurrence_time AS resolved_date,
    (occurrence_time - created_at) AS resolution_time
FROM 
    risk_events 
WHERE 
    status = 'RESOLVED'
ORDER BY 
    resolution_time DESC
LIMIT 10;	1494274200
SELECT 
    rc.rule_id AS rule_id,
    rc.rule_name AS rule_name,
    rc.rule_description AS rule_description,
    rc.rule_type AS rule_type,
    rc.rule_condition AS rule_condition,
    rc.rule_action AS rule_action,
    rc.is_active AS is_active,
    rc.created_at AS created_at,
    rc.updated_at AS updated_at,
    ri.indicator_id AS indicator_id,
    ri.indicator_name AS indicator_name
FROM 
    rule_configurations rc
JOIN 
    risk_indicators ri ON rc.indicator_id = ri.indicator_id
WHERE 
    rc.is_active = true;	2741655674
SELECT risk_level, COUNT(*) AS customer_count FROM customers GROUP BY risk_level;	4006191467
SELECT 
    event_id AS event_id,
    event_description AS event_description,
    reporter AS reporter
FROM 
    risk_events 
WHERE 
    status != 'processed';	1366443289
SELECT created_at
FROM risk_events
WHERE severity >= 3;	2713864982
SELECT 
    assessment_id AS assessment_id,
    mitigation_plan AS mitigation_plan,
    assessor AS assessor
FROM 
    risk_assessments;	4176420377
SELECT 
    a.alert_id AS alert_id,
    a.alert_content AS alert_content,
    a.alert_level AS alert_level,
    re.event_description AS event_description,
    al.audit_comments AS audit_comments,
    al.audit_time AS audit_time
FROM 
    alerts a
LEFT JOIN 
    risk_events re ON a.event_id = re.event_id
LEFT JOIN 
    (SELECT 
        alert_id, 
        audit_comments, 
        audit_time,
        ROW_NUMBER() OVER (PARTITION BY alert_id ORDER BY audit_time DESC) AS rn
     FROM 
        audit_logs
     WHERE 
        alert_id IS NOT NULL
    ) al ON a.alert_id = al.alert_id AND al.rn = 1
WHERE 
    a.status != 'resolved' 
    AND a.alert_level = 'high'
    AND (re.event_description IS NOT NULL OR al.audit_comments IS NOT NULL);	2609744326
SELECT 
    ra.assessment_id AS assessment_id,
    ra.risk_level AS risk_level,
    ra.mitigation_plan AS mitigation_plan,
    re.event_id AS event_id,
    re.event_type AS event_type,
    re.event_description AS event_description
FROM 
    risk_assessments ra
JOIN 
    risk_events re ON ra.event_id = re.event_id
WHERE 
    ra.risk_level = '高';	1472140605
SELECT 
    c.customer_id AS customer_id, 
    c.customer_name AS customer_name, 
    t.amount AS transaction_amount
FROM 
    customers c
JOIN 
    transactions t ON c.customer_id = t.customer_id
WHERE 
    c.risk_level = '高'
    AND t.amount > 100000
    AND t.transaction_date >= CURRENT_DATE - INTERVAL '1 year';	4016844576
SELECT 
    assessment_id AS assessment_identifier,
    event_id AS event_identifier
FROM 
    risk_assessments
WHERE 
    impact_score > 8 
    AND risk_level = '高';	1206095116
SELECT 
    re.event_id AS event_id,
    rr.report_type AS report_type,
    rr.report_content AS report_content
FROM 
    risk_events re
LEFT JOIN 
    risk_reports rr ON re.event_id = rr.event_id;	747204718
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
JOIN non_performing_loans n ON f.institution_id = n.institution_id
WHERE r.report_type = '季度报告'
  AND r.approval_status = '需修改'
  AND EXTRACT(YEAR FROM r.report_date) = 2023
  AND EXTRACT(QUARTER FROM r.report_date) = 3
  AND n.npl_ratio > 2
  AND EXTRACT(YEAR FROM n.report_date) = 2023
  AND EXTRACT(QUARTER FROM n.report_date) = 3;	380031248
SELECT 
    report_id AS "报告ID",
    institution_id AS "机构ID", 
    report_date AS "报告日期", 
    report_type AS "报告类型", 
    submission_date AS "提交日期", 
    approval_status AS "审批状态", 
    comments AS "备注"
FROM 
    regulatory_reports 
WHERE 
    submission_date = '2023-11-01';	796615861
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN capital_adequacy_ratio c ON f.institution_id = c.institution_id
JOIN non_performing_loans n ON f.institution_id = n.institution_id
WHERE EXTRACT(YEAR FROM c.report_date) = 2023 AND EXTRACT(MONTH FROM c.report_date) = 6
  AND EXTRACT(YEAR FROM n.report_date) = 2023 AND EXTRACT(MONTH FROM n.report_date) = 6
  AND c.total_car < 12
  AND n.npl_ratio > 2;	226307394
SELECT 
    fi.institution_name
FROM 
    risk_exposure re
JOIN 
    financial_institution_info fi ON re.institution_id = fi.institution_id
ORDER BY 
    (re.market_risk_exposure / re.total_risk_exposure) DESC
LIMIT 1;	2186232166
SELECT 
    fi.institution_name AS institution_name,
    rr.report_id AS report_id,
    rr.report_type AS report_type,
    rr.approval_status AS approval_status,
    fi.registered_capital AS registered_capital
FROM 
    financial_institution_info fi
JOIN 
    regulatory_reports rr ON fi.institution_id = rr.institution_id
WHERE 
    rr.report_type = '季度报告'
    AND rr.approval_status = '需修改'
    AND rr.report_date BETWEEN '2023-07-01' AND '2023-09-30'
    AND fi.registered_capital > 50000000;	3832687129
SELECT 
    f.institution_name, 
    (c.risk_weighted_assets / b.total_assets) AS rwa_density
FROM 
    financial_institution_info f
JOIN 
    capital_adequacy_ratio c ON f.institution_id = c.institution_id
JOIN 
    balance_sheet b ON f.institution_id = b.institution_id
WHERE 
    c.report_date = b.report_date
    AND c.risk_weighted_assets IS NOT NULL
    AND b.total_assets > 0
ORDER BY 
    rwa_density DESC
LIMIT 1;	3593789396
SELECT 
    liquidity_coverage_ratio AS "流动性覆盖率", 
    net_stable_funding_ratio AS "净稳定资金比例"
FROM liquidity_ratio
ORDER BY report_date DESC
LIMIT 100;	3734281326
SELECT DISTINCT fi.institution_id
FROM financial_institution_info fi
JOIN compliance_records cr ON fi.institution_id = cr.institution_id
WHERE cr.record_date BETWEEN '2023-12-01' AND '2023-12-31'
AND cr.status != 'resolved';	2976622725
SELECT 
    bs.institution_id,
    bs.loans_and_advances AS total_loans,
    bs.deposits AS total_deposits
FROM 
    balance_sheet bs
WHERE 
    EXTRACT(YEAR FROM bs.report_date) = 2024;	3196242817
SELECT 
    balance_sheet_id AS "资产负债表ID",
    institution_id AS "金融机构ID", 
    report_date AS "报告日期",
    total_assets AS "总资产金额",
    total_liabilities AS "总负债金额",
    total_equity AS "所有者权益总额",
    cash_and_equivalents AS "现金及等价物金额",
    loans_and_advances AS "贷款与垫款总额",
    deposits AS "存款总额"
FROM balance_sheet
WHERE report_date = '2039-06-08';	1889616376
SELECT COUNT(DISTINCT institution_id) AS count 
FROM non_performing_loans 
WHERE npl_ratio > 3;	453935379
SELECT 
    net_interest_income AS net_interest_income,
    non_interest_income AS non_interest_income
FROM income_statement
WHERE report_date = '2023-03-01';	44191459
SELECT npl_ratio AS non_performing_loan_ratio 
FROM non_performing_loans;	584013962
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
JOIN non_performing_loans n ON f.institution_id = n.institution_id
WHERE r.report_date BETWEEN '2023-01-01' AND '2023-12-31'
  AND r.report_type = '季度报告'
  AND r.approval_status = '需修改'
  AND n.report_date BETWEEN '2023-01-01' AND '2023-12-31'
  AND n.npl_ratio > 1;	2733428482
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
WHERE r.report_date = '2023-10-01'
  AND r.report_type = '半年度报告'
  AND r.approval_status = '待审核';	951459633
SELECT institution_name, registered_capital 
FROM financial_institution_info 
WHERE institution_type != '银行' 
ORDER BY registered_capital DESC 
LIMIT 5;	1829456676
SELECT COUNT(DISTINCT n.institution_id) AS count
FROM non_performing_loans n
JOIN (
    SELECT b.institution_id
    FROM balance_sheet b
    WHERE b.report_date = (SELECT MAX(report_date) FROM balance_sheet WHERE institution_id = b.institution_id)
    GROUP BY b.institution_id
    ORDER BY MAX(b.total_assets) DESC
    LIMIT 500
) AS top_assets ON n.institution_id = top_assets.institution_id
WHERE n.npl_ratio < 1 AND n.provision_coverage_ratio > 200
AND n.report_date = (SELECT MAX(report_date) FROM non_performing_loans WHERE institution_id = n.institution_id);	1953695337
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN capital_adequacy_ratio c ON f.institution_id = c.institution_id
JOIN regulatory_reports r ON f.institution_id = r.institution_id
WHERE c.core_tier_1_ratio < 10
  AND c.report_date = '2023-12-01'
  AND r.approval_status = '待审核'
  AND r.report_date = '2023-12-01';	1414930652
SELECT 
    i.institution_name
FROM 
    income_statement i1
JOIN 
    income_statement i2 ON i1.institution_id = i2.institution_id 
    AND EXTRACT(YEAR FROM i1.report_date) = EXTRACT(YEAR FROM i2.report_date) + 1
JOIN 
    financial_institution_info i ON i1.institution_id = i.institution_id
WHERE 
    i1.report_date >= CURRENT_DATE - INTERVAL '2 years'
    AND i2.report_date >= CURRENT_DATE - INTERVAL '3 years'
    AND i2.report_date < CURRENT_DATE - INTERVAL '2 years'
GROUP BY 
    i.institution_name
ORDER BY 
    (SUM(i1.net_interest_income + i1.non_interest_income) - SUM(i2.net_interest_income + i2.non_interest_income)) / NULLIF(SUM(i2.net_interest_income + i2.non_interest_income), 0) DESC,
    (SUM(i1.net_profit) - SUM(i2.net_profit)) / NULLIF(SUM(i2.net_profit), 0) ASC
LIMIT 1;	364214965
SELECT 
    report_id AS "报告ID",
    approval_status AS "审批状态"
FROM 
    regulatory_reports 
WHERE 
    report_date = '2023-07-01';	419882166
SELECT fi.institution_id, fi.institution_name
FROM financial_institution_info fi
JOIN capital_adequacy_ratio car ON fi.institution_id = car.institution_id
WHERE car.core_tier_1_ratio > (SELECT AVG(core_tier_1_ratio) FROM capital_adequacy_ratio)
  AND car.tier_1_ratio > (SELECT AVG(tier_1_ratio) FROM capital_adequacy_ratio)
  AND car.total_car > (SELECT AVG(total_car) FROM capital_adequacy_ratio);	3742684421
SELECT 
    record_id AS "记录ID",
    institution_id AS "机构ID", 
    record_date AS "记录日期", 
    compliance_type AS "合规类型", 
    description AS "描述", 
    severity AS "严重程度", 
    status AS "状态", 
    resolution_date AS "解决日期"
FROM compliance_records
WHERE status = '已解决' AND EXTRACT(YEAR FROM record_date) = 2023;	2448874069
SELECT report_type, COUNT(*) AS submission_count 
FROM regulatory_reports 
WHERE report_date BETWEEN '2023-07-01' AND '2023-09-30' 
GROUP BY report_type 
ORDER BY submission_count DESC 
LIMIT 1;	3679648301
SELECT 
    tier_1_ratio,
    COUNT(*) AS institution_count
FROM 
    capital_adequacy_ratio
GROUP BY 
    tier_1_ratio
ORDER BY 
    tier_1_ratio;	293590145
SELECT 
    fi.institution_name AS institution_name,
    lr.report_date AS report_date
FROM 
    liquidity_ratio lr
JOIN 
    financial_institution_info fi ON lr.institution_id = fi.institution_id
WHERE 
    lr.liquidity_coverage_ratio > 100;	685587392
WITH al_ratio AS (
    SELECT 
        b.institution_id,
        f.institution_name,
        b.report_date,
        (b.total_liabilities / b.total_assets) AS asset_liability_ratio
    FROM 
        balance_sheet b
    JOIN 
        financial_institution_info f ON b.institution_id = f.institution_id
    WHERE 
        b.report_date >= CURRENT_DATE - INTERVAL '2 years'
),
al_volatility AS (
    SELECT 
        institution_id,
        institution_name,
        STDDEV(asset_liability_ratio) AS al_volatility
    FROM 
        al_ratio
    GROUP BY 
        institution_id, institution_name
    HAVING 
        COUNT(*) > 1
    ORDER BY 
        al_volatility DESC
    LIMIT 5
),
lcr_trend AS (
    SELECT 
        l.institution_id,
        (MAX(l.liquidity_coverage_ratio) - MIN(l.liquidity_coverage_ratio)) / NULLIF(MIN(l.liquidity_coverage_ratio), 0) * 100 AS lcr_change_percentage
    FROM 
        liquidity_ratio l
    WHERE 
        l.report_date >= CURRENT_DATE - INTERVAL '2 years'
    GROUP BY 
        l.institution_id
)
SELECT 
    v.institution_name,
    v.al_volatility,
    COALESCE(t.lcr_change_percentage, 0) AS lcr_change_percentage
FROM 
    al_volatility v
LEFT JOIN 
    lcr_trend t ON v.institution_id = t.institution_id;	727742801
SELECT 
    record_id AS "记录ID",
    institution_id AS "机构ID", 
    record_date AS "记录日期",
    resolution_date AS "解决日期",
    description AS "描述",
    severity AS "严重程度",
    status AS "状态",
    compliance_type AS "合规类型"
FROM compliance_records
WHERE record_date BETWEEN '2023-03-01' AND '2023-03-31';	3429671168
SELECT 
    cr.institution_id AS institution_id,
    cr.record_date AS record_date,
    cr.description AS description,
    cr.severity AS severity
FROM compliance_records cr
WHERE EXTRACT(YEAR FROM cr.record_date) = 2024
ORDER BY cr.record_date DESC;	3200376501
SELECT DISTINCT report_type 
FROM regulatory_reports 
WHERE report_date = '2023-10-01';	1891907399
SELECT 
    record_id AS "记录ID",
    institution_id AS "机构ID", 
    record_date AS "记录日期", 
    compliance_type AS "合规类型", 
    description AS "问题描述", 
    severity AS "严重等级", 
    status AS "处理状态", 
    resolution_date AS "解决日期"
FROM 
    compliance_records 
WHERE 
    severity = '中' 
    AND record_date >= '2023-01-01' 
    AND record_date < '2024-01-01';	11596427
SELECT 
    record_id AS 记录ID,
    institution_id AS 机构ID, 
    record_date AS 记录日期,
    compliance_type AS 合规类型,
    description AS 描述,
    severity AS 严重程度,
    status AS 状态,
    resolution_date AS 解决日期
FROM compliance_records 
WHERE record_date = '2023-10-01';	3129849565
SELECT DISTINCT fi.institution_id
FROM financial_institution_info fi
JOIN liquidity_ratio lr ON fi.institution_id = lr.institution_id
WHERE lr.liquidity_coverage_ratio > (SELECT AVG(liquidity_coverage_ratio) FROM liquidity_ratio)
  AND lr.net_stable_funding_ratio > (SELECT AVG(net_stable_funding_ratio) FROM liquidity_ratio)
  AND lr.loan_to_deposit_ratio < (SELECT AVG(loan_to_deposit_ratio) FROM liquidity_ratio);	3154891263
SELECT 
    fi.institution_name AS institution_name,
    rr.report_type AS report_type,
    rr.submission_date AS submission_date
FROM 
    regulatory_reports rr
JOIN 
    financial_institution_info fi ON rr.institution_id = fi.institution_id
WHERE 
    rr.approval_status = '需修改'
    AND rr.report_date BETWEEN '2023-07-01' AND '2023-09-30'
ORDER BY 
    rr.submission_date DESC;	1874414819
SELECT 
    fi.institution_name
FROM financial_institution_info fi
JOIN capital_adequacy_ratio car ON fi.institution_id = car.institution_id
JOIN non_performing_loans npl ON fi.institution_id = npl.institution_id AND car.report_date = npl.report_date
WHERE car.total_car <= (SELECT PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY total_car) FROM capital_adequacy_ratio)
AND npl.npl_ratio < (SELECT AVG(npl_ratio) FROM non_performing_loans);	495816064
SELECT 
    registered_capital AS "注册资本",
    institution_type AS "机构类型"
FROM financial_institution_info;	4161304037
SELECT establishment_date, legal_representative FROM financial_institution_info;	1631317162
SELECT 
    record_id AS 记录ID,
    institution_id AS 机构ID,
    record_date AS 记录日期,
    compliance_type AS 合规类型,
    description AS 描述,
    severity AS 严重程度,
    status AS 状态,
    resolution_date AS 解决日期
FROM 
    compliance_records
WHERE 
    status = '已解决';	2784626903
SELECT DISTINCT f.institution_name AS institution_name, 
       r.approval_status AS approval_status, 
       n.npl_ratio AS npl_ratio
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
JOIN non_performing_loans n ON f.institution_id = n.institution_id
WHERE r.approval_status = '需修改'
  AND n.npl_ratio > 1
  AND r.report_date BETWEEN '2023-07-01' AND '2023-07-31'
  AND n.report_date BETWEEN '2023-07-01' AND '2023-07-31';	1450759690
SELECT 
    b.institution_id
FROM 
    balance_sheet b
WHERE 
    b.deposits > 0
ORDER BY 
    ABS(b.loans_and_advances / NULLIF(b.deposits, 0) - 1 ASC
LIMIT 1;	862814083
SELECT fi.institution_id
FROM financial_institution_info fi
WHERE fi.institution_id IN (
    SELECT DISTINCT npl.institution_id 
    FROM non_performing_loans npl
    WHERE npl.total_loans > 100000000000
);	2681992996
SELECT cash_and_equivalents AS cash_and_equivalents_amount 
FROM balance_sheet 
WHERE report_date = '2026-04-27';	3797835240
SELECT DISTINCT fi.institution_id
FROM financial_institution_info fi
JOIN capital_adequacy_ratio car ON fi.institution_id = car.institution_id
WHERE car.core_tier_1_ratio < 9;	788537141
SELECT 
    f.institution_name AS institution_name,
    r.report_type AS report_type,
    r.approval_status AS approval_status,
    n.npl_ratio AS npl_ratio
FROM 
    financial_institution_info f
JOIN 
    regulatory_reports r ON f.institution_id = r.institution_id
JOIN 
    non_performing_loans n ON f.institution_id = n.institution_id
WHERE 
    r.report_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND r.report_type = '季度报告'
    AND r.approval_status = '已拒绝'
    AND n.report_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND n.npl_ratio > 2;	2511418954
SELECT COUNT(DISTINCT re.institution_id) AS count
FROM risk_exposure re
JOIN (
    SELECT car.institution_id
    FROM capital_adequacy_ratio car
    JOIN balance_sheet bs ON car.institution_id = bs.institution_id 
        AND car.report_date = bs.report_date
    ORDER BY (car.risk_weighted_assets / bs.total_assets) DESC
    LIMIT 10
) top_10 ON re.institution_id = top_10.institution_id
WHERE re.market_risk_exposure > (SELECT AVG(market_risk_exposure) FROM risk_exposure);	133973236
SELECT NULL AS average_branch_count;	580723534
SELECT DISTINCT f.institution_id, f.institution_name
FROM financial_institution_info f
JOIN risk_exposure r ON f.institution_id = r.institution_id
JOIN capital_adequacy_ratio c ON f.institution_id = c.institution_id
WHERE (r.market_risk_exposure / NULLIF(r.total_risk_exposure, 0)) > 0.2
AND c.core_tier_1_ratio < 8.5;	627590872
SELECT 
    fi.institution_name AS institution_name,
    car.core_tier_1_ratio AS core_tier_1_ratio,
    car.tier_1_ratio AS tier_1_ratio,
    car.total_car AS total_car
FROM 
    capital_adequacy_ratio car
JOIN 
    financial_institution_info fi ON car.institution_id = fi.institution_id
WHERE 
    car.report_date = '2023-12-01'
    AND car.core_tier_1_ratio < 10
    AND car.total_car < 12;	3208012990
SELECT COUNT(*) AS count FROM compliance_records WHERE severity = '高' AND EXTRACT(YEAR FROM record_date) = 2023;	377707744
SELECT f.institution_name
FROM balance_sheet b
JOIN financial_institution_info f ON b.institution_id = f.institution_id
ORDER BY (b.cash_and_equivalents / b.total_assets) DESC
LIMIT 1;	2467976254
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN risk_exposure r ON f.institution_id = r.institution_id
WHERE (r.market_risk_exposure / NULLIF(r.total_risk_exposure, 0)) > 0.4;	416448494
SELECT 
    f.institution_name AS institution_name,
    r.approval_status AS approval_status,
    r.comments AS comments
FROM 
    regulatory_reports r
JOIN 
    financial_institution_info f ON r.institution_id = f.institution_id
WHERE 
    r.report_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND r.approval_status IS NOT NULL
ORDER BY 
    CASE 
        WHEN r.approval_status = '已批准' THEN 1
        WHEN r.approval_status = '已审核' THEN 2
        ELSE 3
    END,
    LENGTH(r.comments) DESC
LIMIT 30;	1582694445
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN capital_adequacy_ratio c ON f.institution_id = c.institution_id
WHERE c.core_tier_1_ratio < 8 
  AND c.report_date BETWEEN '2023-01-01' AND '2023-12-31';	3631241992
SELECT 
    re.institution_id AS institution_id,
    re.credit_risk_exposure AS credit_risk_exposure,
    re.operational_risk_exposure AS operational_risk_exposure
FROM 
    risk_exposure re
WHERE 
    re.report_date BETWEEN '2024-01-01' AND '2024-01-31';	3632342709
SELECT 
    record_id AS "记录ID",
    institution_id AS "机构ID", 
    record_date AS "记录日期",
    resolution_date AS "解决日期",
    description AS "描述",
    severity AS "严重程度",
    status AS "状态",
    compliance_type AS "合规类型"
FROM 
    compliance_records
WHERE 
    record_date = '2023-04-02';	2274602916
SELECT 
    n.report_date AS report_date,
    AVG(n.npl_ratio) AS npl_ratio,
    AVG(c.total_car) AS total_car
FROM 
    non_performing_loans n
JOIN 
    capital_adequacy_ratio c ON n.institution_id = c.institution_id AND n.report_date = c.report_date
GROUP BY 
    n.report_date
ORDER BY 
    n.report_date ASC;	3547022021
SELECT 
    npl.institution_id AS institution_id,
    npl.provision_coverage_ratio AS provision_coverage_ratio
FROM 
    non_performing_loans npl
WHERE 
    npl.provision_coverage_ratio > 150;	4106988075
SELECT 
    transaction_id AS "交易ID",
    institution_id AS "机构ID",
    transaction_date AS "交易日期",
    related_party AS "关联方名称",
    transaction_type AS "交易类型",
    transaction_amount AS "交易金额(元)",
    approval_status AS "审批状态"
FROM related_party_transactions
WHERE transaction_date = '2023-12-22';	1714782457
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN liquidity_ratio l ON f.institution_id = l.institution_id
JOIN non_performing_loans n ON f.institution_id = n.institution_id
WHERE l.liquidity_coverage_ratio > 110
AND n.npl_ratio < 1.5;	663454855
SELECT DISTINCT 
    r.institution_id AS institution_id,
    f.institution_name AS institution_name,
    r.report_type AS report_type,
    r.approval_status AS approval_status,
    n.npl_ratio AS npl_ratio
FROM 
    regulatory_reports r
JOIN 
    financial_institution_info f ON r.institution_id = f.institution_id
JOIN 
    non_performing_loans n ON r.institution_id = n.institution_id 
    AND DATE_PART('year', r.report_date) = 2023 
    AND DATE_PART('year', n.report_date) = 2023
WHERE 
    r.report_type = '季度报告' 
    AND r.approval_status = '需修改' 
    AND n.npl_ratio > 2;	1930062711
SELECT 
    i.institution_id,
    AVG(i.net_profit / (i.net_interest_income + i.non_interest_income)) AS avg_net_profit_margin
FROM 
    income_statement i
WHERE 
    i.report_date >= CURRENT_DATE - INTERVAL '2 years'
    AND (i.net_interest_income + i.non_interest_income) > 0  -- 避免除以零
GROUP BY 
    i.institution_id
ORDER BY 
    avg_net_profit_margin DESC
LIMIT 5;	166707732
SELECT 
    fi.institution_type AS institution_type, 
    AVG(npl.npl_ratio) AS avg_npl_ratio
FROM 
    non_performing_loans npl
JOIN 
    financial_institution_info fi ON npl.institution_id = fi.institution_id
WHERE 
    EXTRACT(YEAR FROM npl.report_date) = 2023
GROUP BY 
    fi.institution_type;	833967887
SELECT 
    COUNT(DISTINCT re.institution_id) AS count
FROM 
    risk_exposure re
JOIN 
    capital_adequacy_ratio car ON re.institution_id = car.institution_id 
    AND re.report_date = car.report_date
JOIN 
    (SELECT 
        institution_id, 
        report_date, 
        market_risk_exposure,
        LAG(market_risk_exposure) OVER (PARTITION BY institution_id ORDER BY report_date) AS prev_market_risk
    FROM 
        risk_exposure) re_prev 
    ON re.institution_id = re_prev.institution_id 
    AND re.report_date = re_prev.report_date
JOIN 
    (SELECT 
        institution_id, 
        report_date, 
        total_car,
        LAG(total_car) OVER (PARTITION BY institution_id ORDER BY report_date) AS prev_total_car
    FROM 
        capital_adequacy_ratio) car_prev 
    ON car.institution_id = car_prev.institution_id 
    AND car.report_date = car_prev.report_date
WHERE 
    re_prev.prev_market_risk IS NOT NULL
    AND car_prev.prev_total_car IS NOT NULL
    AND (re.market_risk_exposure - re_prev.prev_market_risk) / re_prev.prev_market_risk > 0.5
    AND (car.total_car - car_prev.prev_total_car) < 1.0;	4204116228
SELECT 
    institution_id AS institution_id,
    total_assets AS total_assets,
    total_liabilities AS total_liabilities
FROM balance_sheet;	771560804
SELECT DISTINCT 
    f.institution_name AS institution_name, 
    r.approval_status AS approval_status, 
    rpt.transaction_amount AS transaction_amount
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
JOIN related_party_transactions rpt ON f.institution_id = rpt.institution_id
WHERE r.report_date BETWEEN '2023-07-01' AND '2023-07-31'
  AND r.approval_status = '需修改'
  AND rpt.transaction_amount > 5000000;	1414769749
SELECT AVG(car.total_car) AS avg
FROM capital_adequacy_ratio car
WHERE car.institution_id IN (
    SELECT DISTINCT institution_id 
    FROM balance_sheet 
    WHERE total_assets > 1000000000000
);	2946947084
SELECT 
    risk_exposure_id AS exposure_record_id,
    institution_id AS financial_institution_id,
    report_date AS risk_report_date,
    credit_risk_exposure AS credit_exposure_amount,
    market_risk_exposure AS market_exposure_amount,
    operational_risk_exposure AS operational_exposure_amount,
    total_risk_exposure AS total_exposure_amount
FROM 
    risk_exposure
WHERE 
    report_date = '2023-10-01';	68375114
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN related_party_transactions r ON f.institution_id = r.institution_id
JOIN regulatory_reports rr ON f.institution_id = rr.institution_id
WHERE r.transaction_date = '2023-06-01'
  AND r.transaction_amount > 5000000
  AND rr.approval_status = '已批准';	1086344523
SELECT 
    CORR(b.total_assets, c.total_car) AS correlation_coefficient
FROM 
    balance_sheet b
JOIN 
    capital_adequacy_ratio c ON b.institution_id = c.institution_id AND b.report_date = c.report_date
WHERE 
    b.total_assets IS NOT NULL 
    AND c.total_car IS NOT NULL;	1266365033
SELECT 
    f.institution_name,
    COUNT(CASE WHEN r.approval_status != 'approved' THEN 1 END) * 100.0 / COUNT(*) AS unapproved_ratio
FROM 
    related_party_transactions r
JOIN 
    financial_institution_info f ON r.institution_id = f.institution_id
WHERE 
    EXTRACT(YEAR FROM r.transaction_date) = 2023
GROUP BY 
    f.institution_id, f.institution_name
HAVING 
    COUNT(CASE WHEN r.approval_status != 'approved' THEN 1 END) * 100.0 / COUNT(*) > 20
ORDER BY 
    unapproved_ratio DESC;	152560977
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
JOIN non_performing_loans n ON f.institution_id = n.institution_id
WHERE r.report_date = '2023-07-01'
  AND r.report_type = '季度报告'
  AND r.approval_status = '需修改'
  AND n.report_date = '2023-07-01'
  AND n.npl_ratio > 2;	3829846580
SELECT 
    r.institution_id AS institution_id,
    r.approval_status AS approval_status,
    c.compliance_type AS compliance_type,
    c.severity AS severity_level,
    c.status AS compliance_status
FROM 
    regulatory_reports r
LEFT JOIN 
    compliance_records c ON r.institution_id = c.institution_id
    AND EXTRACT(YEAR FROM r.report_date) = 2023
    AND EXTRACT(YEAR FROM c.record_date) = 2023
WHERE 
    EXTRACT(YEAR FROM r.report_date) = 2023
GROUP BY 
    r.institution_id, r.approval_status, c.compliance_type, c.severity, c.status
ORDER BY 
    r.institution_id, c.severity DESC;	3809349460
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
JOIN non_performing_loans n ON f.institution_id = n.institution_id
WHERE r.report_type = '半年度报告'
  AND n.npl_ratio > 2
  AND EXTRACT(YEAR FROM r.report_date) = 2023
  AND EXTRACT(MONTH FROM r.report_date) = 10
  AND ABS(r.report_date - n.report_date) <= 30;	3887529815
SELECT 
    lr.institution_id AS institution_id,
    lr.liquidity_coverage_ratio AS liquidity_coverage_ratio,
    lr.net_stable_funding_ratio AS net_stable_funding_ratio
FROM 
    liquidity_ratio lr
WHERE 
    lr.report_date BETWEEN '2023-05-01' AND '2023-05-31';	1095324516
SELECT 
    i.institution_id, 
    COALESCE(SUM(s.non_interest_income), 0) AS total_non_interest_income
FROM 
    financial_institution_info i
LEFT JOIN 
    income_statement s ON i.institution_id = s.institution_id AND s.report_date = '2023-03-01'
GROUP BY 
    i.institution_id;	2608079409
SELECT 
    risk_exposure_id AS "风险暴露ID",
    institution_id AS "机构ID",
    report_date AS "报告日期",
    credit_risk_exposure AS "信用风险暴露",
    market_risk_exposure AS "市场风险暴露",
    operational_risk_exposure AS "操作风险暴露",
    total_risk_exposure AS "总风险暴露"
FROM 
    risk_exposure 
WHERE 
    report_date = '2023-02-01';	1384996686
SELECT COUNT(*) AS count 
FROM related_party_transactions 
WHERE transaction_type = '资产转移' 
  AND transaction_amount > 500000000 
  AND EXTRACT(YEAR FROM transaction_date) = 2023;	2903384914
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
JOIN related_party_transactions t ON f.institution_id = t.institution_id
WHERE r.report_date BETWEEN '2023-08-01' AND '2023-08-31'
  AND r.approval_status = '需修改'
  AND t.transaction_date BETWEEN '2023-08-01' AND '2023-08-31'
  AND t.transaction_amount > 5000000;	1640671061
SELECT DISTINCT i.institution_id, i.institution_name
FROM financial_institution_info i
JOIN regulatory_reports r ON i.institution_id = r.institution_id
JOIN income_statement s ON i.institution_id = s.institution_id
WHERE r.report_date BETWEEN '2023-01-01' AND '2023-12-31'
  AND r.report_type = '季度报告'
  AND r.approval_status = '已拒绝'
  AND s.report_date BETWEEN '2023-01-01' AND '2023-03-31'
  AND s.net_profit > 10000000;	3904574419
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
WHERE r.report_date = '2023-07-01'
  AND r.report_type = '季度报告'
  AND r.approval_status = '需修改';	493525183
SELECT 
    record_id AS "记录ID",
    institution_id AS "机构ID", 
    record_date AS "记录日期",
    compliance_type AS "合规类型",
    description AS "描述",
    severity AS "严重程度",
    status AS "状态",
    resolution_date AS "解决日期"
FROM compliance_records
WHERE compliance_type = '内控管理';	3146074594
SELECT DISTINCT 
    f.institution_name AS institution_name, 
    r.report_type AS report_type, 
    r.approval_status AS approval_status, 
    n.npl_ratio AS npl_ratio
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
JOIN non_performing_loans n ON f.institution_id = n.institution_id
WHERE r.report_date BETWEEN '2023-01-01' AND '2023-10-31'
  AND r.report_type = '半年度报告'
  AND r.approval_status = '待审核'
  AND n.npl_ratio > 1
  AND n.report_date BETWEEN '2023-01-01' AND '2023-10-31';	2337714646
SELECT 
    fi.institution_type,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY npl.npl_ratio) AS median_npl_ratio
FROM 
    financial_institution_info fi
JOIN 
    non_performing_loans npl ON fi.institution_id = npl.institution_id
GROUP BY 
    fi.institution_type;	2791588181
SELECT 
    car_id AS "资本充足率ID",
    institution_id AS "金融机构ID", 
    report_date AS "报告日期",
    core_tier_1_ratio AS "核心一级资本充足率(%)",
    tier_1_ratio AS "一级资本充足率(%)",
    total_car AS "总资本充足率(%)",
    risk_weighted_assets AS "风险加权资产(元)"
FROM capital_adequacy_ratio 
WHERE core_tier_1_ratio < 8;	833263523
SELECT 
    f.institution_id AS institution_id,
    f.institution_name AS institution_name,
    f.registered_capital AS registered_capital,
    r.report_type AS report_type,
    r.approval_status AS approval_status
FROM 
    financial_institution_info f
JOIN 
    regulatory_reports r ON f.institution_id = r.institution_id
WHERE 
    r.report_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND r.report_type = '半年度报告'
    AND r.approval_status = '待审核'
    AND f.registered_capital > 50000000
ORDER BY 
    f.institution_id;	3179741002
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN related_party_transactions r ON f.institution_id = r.institution_id
WHERE r.transaction_date = '2023-06-01'
  AND r.transaction_amount > 5000000
  AND r.approval_status = '待审批';	2065261887
SELECT DISTINCT fi.institution_id
FROM financial_institution_info fi
JOIN liquidity_ratio lr ON fi.institution_id = lr.institution_id
JOIN (
    SELECT 
        AVG(loan_to_deposit_ratio) AS avg_loan_to_deposit,
        AVG(liquidity_coverage_ratio) AS avg_liquidity_coverage
    FROM liquidity_ratio
) AS industry_avg
ON lr.loan_to_deposit_ratio > industry_avg.avg_loan_to_deposit
AND lr.liquidity_coverage_ratio < industry_avg.avg_liquidity_coverage;	2360476437
SELECT f.institution_name
FROM financial_institution_info f
JOIN income_statement i ON f.institution_id = i.institution_id
WHERE i.report_date = '2023-04-01' AND i.net_interest_income > 1000000000;	1635102268
SELECT 
    r.institution_id AS institution_id,
    r.report_id AS report_id,
    r.report_type AS report_type,
    r.approval_status AS approval_status,
    n.npl_ratio AS npl_ratio
FROM 
    regulatory_reports r
JOIN 
    non_performing_loans n ON r.institution_id = n.institution_id
WHERE 
    r.report_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND n.report_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND r.report_type = '季度报告'
    AND r.approval_status = '需修改'
    AND n.npl_ratio > 1.0;	890576370
SELECT 
    fi.institution_name AS institution_name,
    re.total_risk_exposure AS total_risk_exposure,
    car.core_tier_1_ratio AS core_tier_1_ratio
FROM 
    financial_institution_info fi
JOIN 
    risk_exposure re ON fi.institution_id = re.institution_id
JOIN 
    capital_adequacy_ratio car ON fi.institution_id = car.institution_id
WHERE 
    re.report_date = '2023-10-01' 
    AND car.report_date = '2023-10-01'
    AND re.total_risk_exposure > 300000000000 
    AND car.core_tier_1_ratio < 8;	1878253672
SELECT 
    COUNT(DISTINCT re1.institution_id) AS count
FROM 
    risk_exposure re1
JOIN 
    risk_exposure re2 ON re1.institution_id = re2.institution_id
WHERE 
    re1.report_date >= CURRENT_DATE - INTERVAL '1 year'
    AND re2.report_date = (
        SELECT MAX(re3.report_date) 
        FROM risk_exposure re3 
        WHERE re3.institution_id = re1.institution_id 
        AND re3.report_date < CURRENT_DATE - INTERVAL '1 year'
    )
    AND ABS(
        (re1.market_risk_exposure/NULLIF(re1.credit_risk_exposure,0)) - 
        (re2.market_risk_exposure/NULLIF(re2.credit_risk_exposure,0))
    ) / NULLIF(re2.market_risk_exposure/NULLIF(re2.credit_risk_exposure,0), 0) > 0.1;	860852233
SELECT DISTINCT f.institution_id
FROM financial_institution_info f
JOIN balance_sheet b ON f.institution_id = b.institution_id
WHERE b.loans_and_advances > b.deposits;	3387337626
SELECT 
    fi.institution_name AS institution_name,
    rr.report_date AS report_date,
    rr.approval_status AS approval_status
FROM 
    regulatory_reports rr
JOIN 
    financial_institution_info fi ON rr.institution_id = fi.institution_id
WHERE 
    rr.report_date >= '2023-01-01' 
    AND rr.report_date <= '2023-12-31'
    AND rr.report_type = '季度报告'
    AND rr.approval_status = '已拒绝';	1310122613
SELECT fi.institution_name
FROM financial_institution_info fi
JOIN income_statement i ON fi.institution_id = i.institution_id
WHERE i.report_date = '2023-04-01'
AND i.non_interest_income > 200000000;	663309404
SELECT r.institution_id, COUNT(*) AS transaction_count 
FROM related_party_transactions r
WHERE r.transaction_date >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY r.institution_id
ORDER BY transaction_count DESC 
LIMIT 1;	3052564664
SELECT 
    fi.institution_name,
    (re.credit_risk_exposure / re.total_risk_exposure * 100) AS credit_risk_percentage
FROM 
    risk_exposure re
JOIN 
    financial_institution_info fi ON re.institution_id = fi.institution_id
ORDER BY 
    credit_risk_percentage DESC
LIMIT 1;	3564915606
SELECT DISTINCT institution_id 
FROM risk_exposure 
WHERE report_date >= '2023-01-01' AND report_date <= '2023-12-31';	197691923
SELECT DISTINCT f.institution_id 
FROM financial_institution_info f
JOIN capital_adequacy_ratio c ON f.institution_id = c.institution_id
WHERE c.report_date BETWEEN '2023-11-01' AND '2023-11-30' 
AND c.risk_weighted_assets > 120000000000;	4129983532
SELECT 
    severity,
    AVG(resolution_date - record_date) AS avg_resolution_time
FROM 
    compliance_records
WHERE 
    resolution_date IS NOT NULL
GROUP BY 
    severity
ORDER BY 
    severity;	2233736633
SELECT COUNT(DISTINCT institution_id) AS count 
FROM liquidity_ratio 
WHERE liquidity_coverage_ratio > 100 AND net_stable_funding_ratio > 100;	2305237654
SELECT 
    AVG(npl.npl_ratio) AS average_npl_ratio,
    AVG(npl.provision_coverage_ratio) AS average_provision_coverage_ratio,
    AVG(car.total_car) AS average_total_car
FROM 
    (SELECT institution_id 
     FROM balance_sheet 
     GROUP BY institution_id
     ORDER BY MAX(total_assets) DESC 
     LIMIT 1000) top_institutions
JOIN 
    non_performing_loans npl ON top_institutions.institution_id = npl.institution_id
JOIN 
    capital_adequacy_ratio car ON top_institutions.institution_id = car.institution_id AND npl.report_date = car.report_date;	2186326450
SELECT 
    f.institution_name AS institution_name,
    r.report_type AS report_type,
    n.npl_ratio AS npl_ratio
FROM 
    financial_institution_info f
    JOIN regulatory_reports r ON f.institution_id = r.institution_id
    JOIN non_performing_loans n ON f.institution_id = n.institution_id
WHERE 
    r.report_date = '2023-07-01'
    AND r.report_type = '季度报告'
    AND n.report_date = '2023-07-01'
    AND n.npl_ratio > 1.5
ORDER BY 
    n.npl_ratio DESC;	2638456489
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
JOIN non_performing_loans n ON f.institution_id = n.institution_id
WHERE r.report_type = '年度报告'
  AND r.approval_status = '已批准'
  AND DATE(r.report_date) = '2024-01-01'
  AND n.npl_ratio > 1
  AND DATE(n.report_date) = '2024-01-01';	3113756288
SELECT 
    lr.liquidity_coverage_ratio AS liquidity_ratio,
    lr.net_stable_funding_ratio AS stable_funding_ratio,
    lr.loan_to_deposit_ratio AS loan_deposit_ratio
FROM liquidity_ratio lr
JOIN balance_sheet bs ON lr.institution_id = bs.institution_id AND lr.report_date = bs.report_date
WHERE lr.liquidity_coverage_ratio IS NOT NULL 
  AND lr.net_stable_funding_ratio IS NOT NULL 
  AND lr.loan_to_deposit_ratio IS NOT NULL
  AND bs.loans_and_advances IS NOT NULL
  AND bs.deposits IS NOT NULL;	1220868379
SELECT fi.institution_name
FROM financial_institution_info fi
JOIN non_performing_loans npl ON fi.institution_id = npl.institution_id
WHERE npl.report_date BETWEEN '2023-12-01' AND '2023-12-31'
AND npl.npl_ratio > 1.5;	576576905
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN liquidity_ratio l ON f.institution_id = l.institution_id
WHERE l.loan_to_deposit_ratio > 75 AND l.liquidity_coverage_ratio < 120;	4037291156
SELECT 
    report_id AS "报告ID",
    institution_id AS "机构ID", 
    report_date AS "报告日期", 
    report_type AS "报告类型", 
    submission_date AS "提交日期", 
    approval_status AS "审批状态", 
    comments AS "备注"
FROM regulatory_reports
WHERE report_type = '半年度报告';	163054391
SELECT 
    record_id AS "记录ID",
    institution_id AS "机构ID",
    record_date AS "记录日期",
    compliance_type AS "合规类型",
    description AS "问题描述",
    severity AS "严重程度",
    status AS "状态",
    resolution_date AS "解决日期"
FROM compliance_records 
WHERE status = '已解决' AND resolution_date IS NOT NULL 
ORDER BY (resolution_date - record_date) DESC 
LIMIT 5;	3390154129
SELECT 
    rr.institution_id AS institution_id,
    rr.report_id AS report_id,
    rr.report_type AS report_type,
    rr.approval_status AS approval_status,
    npl.npl_ratio AS npl_ratio
FROM 
    regulatory_reports rr
JOIN 
    non_performing_loans npl ON rr.institution_id = npl.institution_id
WHERE 
    rr.report_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND rr.report_type = '季度报告'
    AND rr.approval_status = '已拒绝'
    AND npl.report_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND npl.npl_ratio > 2;	1510688156
SELECT 
    fi.institution_name AS institution_name,
    rr.report_id AS report_id,
    rr.report_date AS report_date,
    rr.comments AS comments
FROM 
    regulatory_reports rr
JOIN 
    financial_institution_info fi ON rr.institution_id = fi.institution_id
WHERE 
    rr.report_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND rr.report_type = '季度报告'
    AND rr.approval_status = '已拒绝';	776982448
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN liquidity_ratio l ON f.institution_id = l.institution_id
WHERE l.loan_to_deposit_ratio BETWEEN 0.6 AND 0.8;	3735593182
SELECT fii.institution_id
FROM capital_adequacy_ratio car
JOIN financial_institution_info fii ON car.institution_id = fii.institution_id
ORDER BY ABS(car.core_tier_1_ratio - car.total_car) ASC
LIMIT 1;	1403047777
SELECT 
    b.institution_id AS institution_id,
    b.total_liabilities AS total_liabilities,
    f.registered_capital AS registered_capital
FROM 
    balance_sheet b
JOIN 
    financial_institution_info f ON b.institution_id = f.institution_id
WHERE 
    EXTRACT(YEAR FROM b.report_date) = 2024;	2008864858
SELECT 
    CORR(re.credit_risk_exposure, npl.npl_ratio) AS correlation_coefficient
FROM 
    risk_exposure re
JOIN 
    non_performing_loans npl 
    ON re.institution_id = npl.institution_id 
    AND re.report_date = npl.report_date
WHERE 
    re.credit_risk_exposure IS NOT NULL 
    AND npl.npl_ratio IS NOT NULL;	4061107202
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
JOIN capital_adequacy_ratio c ON f.institution_id = c.institution_id
WHERE r.approval_status = 'approved'
  AND r.report_type = '年度报告'
  AND EXTRACT(YEAR FROM r.report_date) = 2023
  AND EXTRACT(YEAR FROM c.report_date) = 2023
  AND c.total_car > 10;	1821132508
SELECT 
    npl_ratio AS "不良贷款率",
    institution_id AS "机构ID"
FROM 
    non_performing_loans 
WHERE 
    report_date = '2023-06-01';	1128459706
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN risk_exposure r ON f.institution_id = r.institution_id
WHERE r.market_risk_exposure > 20000000000
AND r.report_date BETWEEN '2023-05-01' AND '2023-05-31';	4259113020
SELECT 
    fi.institution_name AS institution_name,
    rr.report_date AS report_date,
    rr.approval_status AS approval_status
FROM 
    regulatory_reports rr
JOIN 
    financial_institution_info fi ON rr.institution_id = fi.institution_id
WHERE 
    rr.report_date >= '2024-01-01' 
    AND rr.report_date <= '2024-12-31'
    AND rr.report_type = '年度报告'
    AND rr.approval_status = '已批准';	3886257211
SELECT 
    car_id AS "资本充足率ID",
    institution_id AS "机构ID",
    report_date AS "报告日期",
    core_tier_1_ratio AS "核心一级资本充足率(%)",
    tier_1_ratio AS "一级资本充足率(%)",
    total_car AS "总资本充足率(%)",
    risk_weighted_assets AS "风险加权资产(元)"
FROM capital_adequacy_ratio
WHERE report_date = '2023-11-01';	1168290373
SELECT 
    CORR(lr.net_stable_funding_ratio, car.core_tier_1_ratio) AS correlation
FROM 
    liquidity_ratio lr
JOIN 
    capital_adequacy_ratio car ON lr.institution_id = car.institution_id AND lr.report_date = car.report_date
WHERE 
    lr.net_stable_funding_ratio IS NOT NULL 
    AND car.core_tier_1_ratio IS NOT NULL;	2077067574
SELECT 
    fi.institution_name AS institution_name,
    rr.report_date AS report_date
FROM 
    regulatory_reports rr
JOIN 
    financial_institution_info fi ON rr.institution_id = fi.institution_id
WHERE 
    rr.report_date BETWEEN '2024-01-01' AND '2024-12-31'
    AND rr.report_type = '年度报告'
    AND rr.approval_status = '已批准';	2225198432
SELECT 
    car_id AS "资本充足率ID",
    institution_id AS "机构ID",
    report_date AS "报告日期",
    core_tier_1_ratio AS "核心一级资本充足率",
    tier_1_ratio AS "一级资本充足率",
    total_car AS "总资本充足率",
    risk_weighted_assets AS "风险加权资产"
FROM 
    capital_adequacy_ratio
WHERE 
    report_date = '2023-11-01';	1600202324
SELECT 
    core_tier_1_ratio AS "核心一级资本充足率", 
    tier_1_ratio AS "一级资本充足率", 
    total_car AS "资本充足率", 
    risk_weighted_assets AS "风险加权资产", 
    report_date AS "报告日期"
FROM 
    capital_adequacy_ratio 
WHERE 
    institution_id = 2162;	1999653381
SELECT 
    n.institution_id, 
    n.total_loans AS total_loans_2023, 
    n.npl_amount AS total_npl_amount_2023
FROM 
    non_performing_loans n
WHERE 
    EXTRACT(YEAR FROM n.report_date) = 2023;	4241341417
SELECT 
    CORR(re.market_risk_exposure / NULLIF(re.total_risk_exposure, 0), 
         i.non_interest_income / NULLIF((i.net_interest_income + i.non_interest_income), 0)) AS correlation
FROM 
    risk_exposure re
JOIN 
    income_statement i ON re.institution_id = i.institution_id AND re.report_date = i.report_date
WHERE 
    re.total_risk_exposure > 0 
    AND (i.net_interest_income + i.non_interest_income) > 0;	885949604
SELECT 
    f.institution_id AS institution_id, 
    n.provision_coverage_ratio AS provision_coverage_ratio
FROM 
    non_performing_loans n
JOIN 
    financial_institution_info f ON n.institution_id = f.institution_id
ORDER BY 
    n.provision_coverage_ratio DESC
LIMIT 1;	2230661366
SELECT 
    COALESCE(lr.institution_id, car.institution_id) AS institution_id,
    COALESCE(lr.report_date, car.report_date) AS report_date,
    lr.liquidity_coverage_ratio AS liquidity_coverage_ratio,
    lr.net_stable_funding_ratio AS net_stable_funding_ratio,
    lr.loan_to_deposit_ratio AS loan_to_deposit_ratio,
    car.core_tier_1_ratio AS core_tier_1_ratio,
    car.tier_1_ratio AS tier_1_ratio,
    car.total_car AS total_car
FROM 
    liquidity_ratio lr
FULL OUTER JOIN 
    capital_adequacy_ratio car 
    ON lr.institution_id = car.institution_id 
    AND lr.report_date = car.report_date
WHERE 
    (EXTRACT(YEAR FROM lr.report_date) = 2023 AND EXTRACT(MONTH FROM lr.report_date) = 6)
    OR 
    (EXTRACT(YEAR FROM car.report_date) = 2023 AND EXTRACT(MONTH FROM car.report_date) = 6)
ORDER BY 
    institution_id;	2148224764
SELECT f.institution_name
FROM financial_institution_info f
JOIN income_statement i ON f.institution_id = i.institution_id
WHERE i.report_date = '2023-04-01'
ORDER BY i.operating_expenses DESC;	1163520286
SELECT 
    i.institution_id, 
    SUM(s.non_interest_income) AS total_non_interest_income, 
    SUM(s.net_profit) AS total_net_profit
FROM 
    financial_institution_info i
JOIN 
    income_statement s ON i.institution_id = s.institution_id
WHERE 
    EXTRACT(YEAR FROM s.report_date) = 2023
GROUP BY 
    i.institution_id;	3770945123
SELECT DISTINCT 
    fi.institution_name AS institution_name, 
    rr.report_type AS report_type, 
    rr.approval_status AS approval_status, 
    npl.npl_ratio AS npl_ratio
FROM financial_institution_info fi
JOIN regulatory_reports rr ON fi.institution_id = rr.institution_id
JOIN non_performing_loans npl ON fi.institution_id = npl.institution_id
WHERE rr.report_date BETWEEN '2023-01-01' AND '2023-12-31'
  AND rr.report_type = '季度报告'
  AND rr.approval_status = '已拒绝'
  AND npl.report_date BETWEEN '2023-01-01' AND '2023-12-31'
  AND npl.npl_ratio > 2;	3353540268
SELECT DISTINCT fi.institution_name
FROM financial_institution_info fi
JOIN capital_adequacy_ratio car ON fi.institution_id = car.institution_id
WHERE EXTRACT(YEAR FROM car.report_date) = 2023
  AND EXTRACT(MONTH FROM car.report_date) = 12
  AND car.core_tier_1_ratio < 9;	2078748822
SELECT DISTINCT fi.institution_id
FROM financial_institution_info fi
JOIN liquidity_ratio lr ON fi.institution_id = lr.institution_id
WHERE lr.report_date BETWEEN '2023-11-01' AND '2023-11-30'
AND lr.liquidity_coverage_ratio < 110;	953035312
SELECT 
    r.market_risk_exposure AS market_risk_exposure,
    n.provision_coverage_ratio AS provision_coverage_ratio
FROM 
    risk_exposure r
JOIN 
    non_performing_loans n 
    ON r.institution_id = n.institution_id 
    AND r.report_date = n.report_date
WHERE 
    r.report_date = '2023-03-01';	2823110481
SELECT 
    legal_representative AS "法人代表",
    contact_number AS "联系电话"
FROM financial_institution_info;	1671662541
SELECT f.institution_name, COUNT(DISTINCT r.related_party) AS distinct_related_parties
FROM financial_institution_info f
JOIN related_party_transactions r ON f.institution_id = r.institution_id
WHERE r.transaction_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY f.institution_id, f.institution_name
ORDER BY distinct_related_parties DESC
LIMIT 1;	2071522801
SELECT 
    SUBSTRING(fi.address FROM '^[^市]+市') AS region, 
    AVG(lr.liquidity_coverage_ratio) AS avg_liquidity_coverage_ratio
FROM financial_institution_info fi
JOIN liquidity_ratio lr ON fi.institution_id = lr.institution_id
GROUP BY SUBSTRING(fi.address FROM '^[^市]+市')
ORDER BY avg_liquidity_coverage_ratio DESC
LIMIT 1;	205800859
SELECT 
    EXTRACT(QUARTER FROM report_date) AS quarter,
    AVG(LENGTH(comments)) AS avg_word_count
FROM regulatory_reports
WHERE report_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY EXTRACT(QUARTER FROM report_date)
ORDER BY quarter;	3274370781
SELECT 
    fi.institution_name AS institution_name,
    npl.provision_coverage_ratio AS provision_coverage_ratio
FROM 
    non_performing_loans npl
JOIN 
    financial_institution_info fi ON npl.institution_id = fi.institution_id
ORDER BY 
    npl.provision_coverage_ratio DESC
LIMIT 1;	1230704489
SELECT 
    legal_representative AS "法定代表人",
    contact_number AS "联系方式"
FROM financial_institution_info;	1986352436
SELECT 
    fi.institution_name AS institution_name,
    rr.report_date AS report_date,
    rr.submission_date AS submission_date
FROM 
    regulatory_reports rr
JOIN 
    financial_institution_info fi ON rr.institution_id = fi.institution_id
WHERE 
    rr.report_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND rr.report_type = '季度报告'
    AND rr.approval_status = '需修改';	171565062
SELECT 
    fi.institution_name AS institution_name,
    car.total_car AS total_car,
    npl.npl_ratio AS npl_ratio
FROM 
    financial_institution_info fi
JOIN 
    capital_adequacy_ratio car ON fi.institution_id = car.institution_id
JOIN 
    non_performing_loans npl ON fi.institution_id = npl.institution_id
WHERE 
    car.total_car > 12 
    AND npl.npl_ratio < 2;	1038814840
SELECT fi.institution_id
FROM financial_institution_info fi
JOIN liquidity_ratio lr ON fi.institution_id = lr.institution_id
WHERE lr.net_stable_funding_ratio > (SELECT AVG(net_stable_funding_ratio) FROM liquidity_ratio)
  AND lr.loan_to_deposit_ratio < (SELECT AVG(loan_to_deposit_ratio) FROM liquidity_ratio)
ORDER BY (lr.net_stable_funding_ratio / (SELECT MAX(net_stable_funding_ratio) FROM liquidity_ratio) + 
         (1 - lr.loan_to_deposit_ratio / (SELECT MAX(loan_to_deposit_ratio) FROM liquidity_ratio))) DESC
LIMIT 10;	1181628181
SELECT fi.institution_name
FROM financial_institution_info fi
JOIN risk_exposure re ON fi.institution_id = re.institution_id
WHERE re.report_date BETWEEN '2023-01-01' AND '2023-12-31'
AND re.credit_risk_exposure > 50000000000;	3568939453
SELECT DISTINCT fi.institution_name
FROM financial_institution_info fi
JOIN non_performing_loans npl ON fi.institution_id = npl.institution_id
WHERE npl.npl_ratio > 2;	716682341
SELECT 
    car_id AS "资本充足率ID",
    institution_id AS "机构ID", 
    report_date AS "报告日期",
    core_tier_1_ratio AS "核心一级资本充足率",
    tier_1_ratio AS "一级资本充足率",
    total_car AS "总资本充足率",
    risk_weighted_assets AS "风险加权资产"
FROM capital_adequacy_ratio
WHERE report_date = '2023-05-01';	2344870041
SELECT 
    fi.institution_id,
    cr.severity,
    COUNT(*) AS severity_count
FROM compliance_records cr
JOIN financial_institution_info fi ON cr.institution_id = fi.institution_id
WHERE EXTRACT(YEAR FROM cr.record_date) = 2023
GROUP BY fi.institution_id, cr.severity
ORDER BY fi.institution_id, severity_count DESC;	79705771
SELECT 
    fi.institution_name AS institution_name,
    rr.report_date AS report_date,
    rr.comments AS comments
FROM 
    regulatory_reports rr
JOIN 
    financial_institution_info fi ON rr.institution_id = fi.institution_id
WHERE 
    rr.report_date >= '2023-01-01' 
    AND rr.report_date <= '2023-12-31'
    AND rr.report_type = '季度报告'
    AND rr.approval_status = '已拒绝';	3897795864
SELECT 
    r.institution_id AS institution_id,
    r.transaction_id AS transaction_id,
    r.transaction_amount AS transaction_amount
FROM related_party_transactions r
JOIN financial_institution_info f ON r.institution_id = f.institution_id;	3910780788
SELECT 
    fi.institution_name AS institution_name,
    rr.report_type AS report_type,
    SUM(rpt.transaction_amount) AS total_transaction_amount
FROM 
    financial_institution_info fi
JOIN 
    regulatory_reports rr ON fi.institution_id = rr.institution_id
JOIN 
    related_party_transactions rpt ON fi.institution_id = rpt.institution_id
WHERE 
    rr.report_date = '2023-10-01'
    AND rr.report_type = '半年度报告'
GROUP BY 
    fi.institution_name, rr.report_type
HAVING 
    SUM(rpt.transaction_amount) > 10000000;	463284912
SELECT 
    fi.institution_name AS institution_name,
    rr.report_id AS report_id,
    rr.report_date AS report_date,
    rr.comments AS comments
FROM 
    regulatory_reports rr
JOIN 
    financial_institution_info fi ON rr.institution_id = fi.institution_id
WHERE 
    rr.report_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND rr.report_type = '季度报告'
    AND rr.approval_status = '已拒绝';	3023341474
SELECT 
    fi.institution_name AS institution_name,
    rr.report_type AS report_type,
    rr.approval_status AS approval_status,
    rr.submission_date AS submission_date
FROM 
    financial_institution_info fi
JOIN 
    regulatory_reports rr ON fi.institution_id = rr.institution_id
WHERE 
    rr.report_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND rr.report_type = '季度报告'
    AND rr.approval_status = '已拒绝';	100349185
SELECT 
    n.npl_ratio AS non_performing_loan_ratio,
    f.address AS institution_address
FROM 
    non_performing_loans n
JOIN 
    financial_institution_info f ON n.institution_id = f.institution_id
WHERE 
    f.address IS NOT NULL;	1713055268
SELECT 
    report_id AS "报告ID",
    institution_id AS "机构ID",
    report_date AS "报告提交日期",
    report_type AS "报告类型",
    approval_status AS "审批状态"
FROM 
    regulatory_reports
WHERE 
    EXTRACT(YEAR FROM report_date) = 2024;	1241000114
SELECT 
    f.institution_type, 
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY l.liquidity_coverage_ratio) AS median_liquidity_coverage_ratio
FROM 
    financial_institution_info f
JOIN 
    liquidity_ratio l ON f.institution_id = l.institution_id
GROUP BY 
    f.institution_type;	2918395057
SELECT 
    r.institution_id AS institution_id,
    r.report_id AS report_id,
    r.report_type AS report_type,
    r.approval_status AS approval_status,
    c.core_tier_1_ratio AS core_tier_1_ratio
FROM 
    regulatory_reports r
JOIN 
    capital_adequacy_ratio c ON r.institution_id = c.institution_id
WHERE 
    r.report_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND r.report_type = '季度报告'
    AND r.approval_status = '已拒绝'
    AND c.report_date = '2023-06-01'
    AND c.core_tier_1_ratio < 8;	3292170043
SELECT AVG(npl.npl_ratio) AS average_npl_ratio
FROM (
    SELECT institution_id, report_date, total_car
    FROM capital_adequacy_ratio
    WHERE report_date BETWEEN '2023-07-01' AND '2023-09-30'
    ORDER BY total_car DESC
    LIMIT 10
) AS top_car
JOIN non_performing_loans npl ON top_car.institution_id = npl.institution_id 
    AND top_car.report_date = npl.report_date;	759134662
SELECT f.institution_name
FROM financial_institution_info f
JOIN (
    SELECT institution_id, COUNT(*) AS unresolved_count
    FROM compliance_records
    WHERE status != 'RESOLVED' OR status IS NULL
    GROUP BY institution_id
    ORDER BY unresolved_count DESC
    LIMIT 1
) c ON f.institution_id = c.institution_id;	4264132838
SELECT 
    transaction_id AS "交易ID",
    institution_id AS "机构ID", 
    transaction_date AS "交易日期",
    related_party AS "关联方",
    transaction_type AS "交易类型",
    transaction_amount AS "交易金额",
    approval_status AS "审批状态"
FROM 
    related_party_transactions
WHERE 
    transaction_amount > 5000000 
    AND EXTRACT(YEAR FROM transaction_date) = 2023;	2605714275
SELECT DISTINCT r.institution_id
FROM risk_exposure r
WHERE (r.market_risk_exposure / NULLIF(r.total_risk_exposure, 0)) > 0.25;	1937284507
SELECT 
    f.institution_name AS institution_name,
    r.transaction_amount AS transaction_amount,
    r.transaction_type AS transaction_type
FROM 
    related_party_transactions r
JOIN 
    financial_institution_info f ON r.institution_id = f.institution_id
WHERE 
    r.transaction_date BETWEEN '2023-08-01' AND '2023-08-31'
    AND r.transaction_amount > 5000000
    AND r.approval_status = '待审批';	2934397812
SELECT DISTINCT f.institution_id, f.institution_name
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
JOIN income_statement i ON f.institution_id = i.institution_id
WHERE r.report_date BETWEEN '2023-01-01' AND '2023-12-31'
  AND r.report_type = '季度报告'
  AND r.approval_status = '需修改'
  AND i.report_date BETWEEN '2023-01-01' AND '2023-03-31'
  AND i.net_profit > 50000000;	508885744
SELECT DISTINCT fi.institution_name
FROM financial_institution_info fi
JOIN non_performing_loans npl ON fi.institution_id = npl.institution_id
JOIN capital_adequacy_ratio car ON fi.institution_id = car.institution_id AND npl.report_date = car.report_date
WHERE npl.npl_ratio > (SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY npl_ratio) FROM non_performing_loans)
AND npl.provision_coverage_ratio > (SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY provision_coverage_ratio) FROM non_performing_loans)
AND car.total_car > (SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total_car) FROM capital_adequacy_ratio);	1632272828
SELECT related_party AS largest_transaction_party 
FROM related_party_transactions 
ORDER BY transaction_amount DESC 
LIMIT 1;	1799492050
SELECT DISTINCT f.institution_name AS institution_name
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
WHERE r.report_date = '2023-10-01' AND r.approval_status = '待审核';	2216482912
SELECT fi.institution_name
FROM financial_institution_info fi
JOIN risk_exposure re ON fi.institution_id = re.institution_id
WHERE re.report_date BETWEEN '2023-05-01' AND '2023-05-31'
AND re.total_risk_exposure > 15000000000;	1256154419
SELECT 
    f.institution_id AS institution_id,
    f.institution_name AS institution_name,
    f.registered_capital AS registered_capital
FROM 
    financial_institution_info f
JOIN 
    regulatory_reports r ON f.institution_id = r.institution_id
WHERE 
    r.report_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND r.report_type = '季度报告'
    AND r.approval_status = '需修改'
    AND f.registered_capital > 50000000;	4262674456
SELECT 
    re.institution_id AS institution_id,
    re.report_date AS report_date,
    re.market_risk_exposure AS market_risk_exposure,
    re.credit_risk_exposure AS credit_risk_exposure
FROM 
    risk_exposure re
WHERE 
    re.report_date BETWEEN '2023-11-01' AND '2023-11-30';	710647517
SELECT 
    institution_id, 
    total_risk_exposure AS total_exposure,
    credit_risk_exposure AS credit_exposure
FROM risk_exposure 
WHERE report_date = '2023-09-01';	58767252
SELECT 
    f.institution_name AS institution_name,
    r.transaction_amount AS transaction_amount,
    r.approval_status AS approval_status
FROM 
    related_party_transactions r
JOIN 
    financial_institution_info f ON r.institution_id = f.institution_id
WHERE 
    r.transaction_amount > 5000000
    AND r.approval_status = '已批准'
    AND r.transaction_date >= '2023-05-01'
    AND r.transaction_date < '2023-06-01';	637645661
SELECT institution_id 
FROM capital_adequacy_ratio 
WHERE risk_weighted_assets > 800000000000;	3688064451
SELECT COUNT(DISTINCT f.institution_id) AS count
FROM financial_institution_info f
JOIN balance_sheet b ON f.institution_id = b.institution_id
WHERE f.registered_capital < 1000000000 AND b.total_assets > 100000000000;	3547661219
SELECT 
    fi.institution_name AS institution_name,
    car.total_car AS total_car,
    npl.npl_ratio AS npl_ratio
FROM 
    financial_institution_info fi
JOIN 
    capital_adequacy_ratio car ON fi.institution_id = car.institution_id
JOIN 
    non_performing_loans npl ON fi.institution_id = npl.institution_id
WHERE 
    car.report_date BETWEEN '2023-07-01' AND '2023-09-30'
    AND npl.report_date BETWEEN '2023-07-01' AND '2023-09-30'
    AND car.total_car < 12
    AND npl.npl_ratio > 2;	162610329
SELECT 
    r.report_date AS report_date,
    r.approval_status AS approval_status
FROM 
    regulatory_reports r
JOIN 
    financial_institution_info f ON r.institution_id = f.institution_id;	1552788455
SELECT f.institution_name
FROM financial_institution_info f
JOIN balance_sheet b ON f.institution_id = b.institution_id
WHERE EXTRACT(YEAR FROM b.report_date) = 2024
ORDER BY b.total_assets DESC
LIMIT 1;	116844122
SELECT 
    compliance_type,
    AVG(resolution_date - record_date) AS avg_resolution_time
FROM 
    compliance_records
WHERE 
    severity = '严重' 
    AND EXTRACT(YEAR FROM record_date) = 2023
    AND resolution_date IS NOT NULL
GROUP BY 
    compliance_type
ORDER BY 
    avg_resolution_time DESC
LIMIT 1;	4240691021
SELECT 
    f.institution_name AS institution_name,
    r.report_type AS report_type,
    rpt.transaction_amount AS transaction_amount
FROM 
    financial_institution_info f
    JOIN regulatory_reports r ON f.institution_id = r.institution_id
    JOIN related_party_transactions rpt ON f.institution_id = rpt.institution_id
WHERE 
    r.report_date = '2023-10-01'
    AND r.report_type = '半年度报告'
    AND rpt.transaction_amount > 5000000;	1677817776
[最终SQL查询]
SELECT AVG(non_interest_income) AS avg FROM income_statement WHERE report_date BETWEEN '2023-01-01' AND '2023-12-31';	1301409349
SELECT 
    report_date AS report_date,
    npl_amount AS non_performing_loan_amount
FROM 
    non_performing_loans
WHERE 
    report_date BETWEEN '2023-06-01' AND '2023-06-30';	948022455
SELECT DISTINCT institution_id
FROM non_performing_loans
WHERE provision_coverage_ratio < 200;	3714986713
SELECT AVG(c.total_car) AS average_capital_adequacy_ratio
FROM (
    SELECT i.institution_id
    FROM income_statement i
    JOIN financial_institution_info f ON i.institution_id = f.institution_id
    WHERE i.report_date BETWEEN '2023-10-01' AND '2023-12-31'
    ORDER BY i.net_profit DESC
    LIMIT 10
) top_institutions
JOIN capital_adequacy_ratio c ON top_institutions.institution_id = c.institution_id
WHERE c.report_date BETWEEN '2023-10-01' AND '2023-12-31';	3771907244
SELECT DISTINCT fii.institution_name
FROM financial_institution_info fii
JOIN compliance_records cr ON fii.institution_id = cr.institution_id
WHERE cr.description LIKE '%客户投诉%';	1867865451
SELECT 
    institution_id,
    net_interest_income AS net_interest_income,
    non_interest_income AS non_interest_income
FROM 
    income_statement
WHERE 
    report_date BETWEEN '2023-07-01' AND '2023-07-31'
ORDER BY 
    institution_id;	246993905
SELECT 
    rr.institution_id AS institution_id,
    rr.report_id AS report_id,
    rr.report_type AS report_type,
    rr.approval_status AS approval_status,
    npl.npl_ratio AS npl_ratio
FROM 
    regulatory_reports rr
JOIN 
    non_performing_loans npl ON rr.institution_id = npl.institution_id
WHERE 
    rr.report_type = '季度报告'
    AND rr.approval_status = '已拒绝'
    AND EXTRACT(YEAR FROM rr.report_date) = 2023
    AND EXTRACT(YEAR FROM npl.report_date) = 2023
    AND npl.npl_ratio > 1;	1509764635
SELECT 
    npl_amount AS "不良贷款金额", 
    provision_coverage_ratio AS "拨备覆盖率百分比"
FROM non_performing_loans
WHERE report_date = '2023-03-01';	3372111545
SELECT 
    f.institution_id AS institution_id,
    f.registered_capital AS registered_capital,
    c.total_car AS total_car,
    l.liquidity_coverage_ratio AS liquidity_coverage_ratio,
    n.npl_ratio AS npl_ratio
FROM 
    financial_institution_info f
LEFT JOIN 
    capital_adequacy_ratio c ON f.institution_id = c.institution_id
    AND c.report_date = (SELECT MAX(report_date) FROM capital_adequacy_ratio WHERE institution_id = f.institution_id)
LEFT JOIN 
    liquidity_ratio l ON f.institution_id = l.institution_id
    AND l.report_date = (SELECT MAX(report_date) FROM liquidity_ratio WHERE institution_id = f.institution_id)
LEFT JOIN 
    non_performing_loans n ON f.institution_id = n.institution_id
    AND n.report_date = (SELECT MAX(report_date) FROM non_performing_loans WHERE institution_id = f.institution_id)
WHERE 
    f.registered_capital IS NOT NULL
    AND c.total_car IS NOT NULL
    AND l.liquidity_coverage_ratio IS NOT NULL
    AND n.npl_ratio IS NOT NULL
ORDER BY 
    f.registered_capital DESC
LIMIT 100;	1509942542
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
WHERE r.report_date BETWEEN '2023-01-01' AND '2023-12-31'
  AND r.report_type = '季度报告'
  AND r.approval_status = '已拒绝';	2196231862
WITH loan_growth AS (
    SELECT 
        b1.institution_id,
        b1.report_date AS year1_date,
        b2.report_date AS year2_date,
        b1.loans_and_advances AS year1_loans,
        b2.loans_and_advances AS year2_loans,
        (b2.loans_and_advances - b1.loans_and_advances) / b1.loans_and_advances AS growth_rate
    FROM 
        balance_sheet b1
    JOIN 
        balance_sheet b2 ON b1.institution_id = b2.institution_id
        AND b2.report_date = b1.report_date + INTERVAL '1 year'
    WHERE 
        (b2.loans_and_advances - b1.loans_and_advances) / b1.loans_and_advances > 0.2
),
car_decline AS (
    SELECT 
        c1.institution_id,
        c1.report_date AS year1_date,
        c2.report_date AS year2_date,
        c1.total_car AS year1_car,
        c2.total_car AS year2_car
    FROM 
        capital_adequacy_ratio c1
    JOIN 
        capital_adequacy_ratio c2 ON c1.institution_id = c2.institution_id
        AND c2.report_date = c1.report_date + INTERVAL '1 year'
    WHERE 
        c2.total_car < c1.total_car
)
SELECT 
    COUNT(DISTINCT lg.institution_id) AS count
FROM 
    loan_growth lg
JOIN 
    car_decline cd ON lg.institution_id = cd.institution_id
    AND lg.year1_date = cd.year1_date;	2728172184
SELECT 
    fi.institution_name
FROM 
    financial_institution_info fi
JOIN 
    regulatory_reports rr ON fi.institution_id = rr.institution_id
WHERE 
    rr.report_date BETWEEN '2023-07-01' AND '2023-09-30'
    AND rr.report_type = '季度报告'
    AND rr.approval_status = '需修改';	3768872221
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
JOIN non_performing_loans n ON f.institution_id = n.institution_id
WHERE r.report_date = '2023-07-01'
  AND r.report_type = '季度报告'
  AND n.report_date = '2023-07-01'
  AND n.npl_ratio > 1;	2784905980
SELECT DISTINCT f.institution_id 
FROM financial_institution_info f
WHERE EXISTS (
    SELECT 1 
    FROM related_party_transactions r 
    WHERE r.institution_id = f.institution_id 
    AND r.transaction_date BETWEEN '2023-10-01' AND '2023-10-31'
);	678545000
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
JOIN non_performing_loans n ON f.institution_id = n.institution_id
WHERE r.report_date = '2023-07-01' 
  AND r.report_type = '季度报告'
  AND n.report_date = '2023-07-01'
  AND n.npl_ratio > 2;	3037348782
SELECT 
    report_date,
    total_car AS capital_adequacy_ratio,
    risk_weighted_assets AS risk_weighted_assets_value
FROM capital_adequacy_ratio
ORDER BY report_date, institution_id;	1162073522
SELECT 
    l.institution_id AS institution_id,
    l.liquidity_coverage_ratio AS liquidity_coverage_ratio,
    r.approval_status AS approval_status
FROM 
    liquidity_ratio l
JOIN 
    regulatory_reports r ON l.institution_id = r.institution_id AND l.report_date = r.report_date
WHERE 
    EXTRACT(YEAR FROM l.report_date) = 2023;	1324283532
SELECT 
    fi.institution_name AS "机构名称",
    rr.report_date AS "报告日期",
    rr.approval_status AS "审批状态"
FROM 
    regulatory_reports rr
JOIN 
    financial_institution_info fi ON rr.institution_id = fi.institution_id
WHERE 
    rr.report_date >= '2023-07-01'
    AND rr.report_type = '季度报告'
    AND rr.approval_status = '需修改';	3789302325
SELECT COUNT(*) AS count FROM regulatory_reports WHERE report_date BETWEEN '2023-04-01' AND '2023-06-30' AND approval_status = '已拒绝';	3524683857
SELECT 
    risk_exposure_id AS "风险暴露记录ID",
    institution_id AS "金融机构ID",
    report_date AS "报告日期",
    credit_risk_exposure AS "信用风险暴露金额",
    market_risk_exposure AS "市场风险暴露金额",
    operational_risk_exposure AS "操作风险暴露金额",
    total_risk_exposure AS "风险暴露总金额"
FROM 
    risk_exposure 
WHERE 
    report_date = '2023-10-01';	1676740080
SELECT 
    f.institution_name,
    (b2.loans_and_advances - b1.loans_and_advances) / b1.loans_and_advances * 100 AS growth_rate
FROM 
    (SELECT institution_id, loans_and_advances, report_date 
     FROM balance_sheet 
     WHERE (institution_id, report_date) IN 
         (SELECT institution_id, MIN(report_date) 
          FROM balance_sheet 
          GROUP BY institution_id)) b1
JOIN 
    (SELECT institution_id, loans_and_advances, report_date 
     FROM balance_sheet 
     WHERE (institution_id, report_date) IN 
         (SELECT institution_id, MAX(report_date) 
          FROM balance_sheet 
          GROUP BY institution_id)) b2
ON b1.institution_id = b2.institution_id
JOIN 
    financial_institution_info f ON b1.institution_id = f.institution_id
WHERE 
    b1.loans_and_advances > 0
    AND b2.loans_and_advances > b1.loans_and_advances
ORDER BY 
    growth_rate DESC
LIMIT 1;	3743576610
SELECT 
    f.institution_name,
    (r.market_risk_exposure / r.total_risk_exposure) * 100 AS market_risk_capital_ratio
FROM 
    risk_exposure r
JOIN 
    financial_institution_info f ON r.institution_id = f.institution_id
WHERE 
    EXTRACT(YEAR FROM r.report_date) = 2023
    AND (r.market_risk_exposure / r.total_risk_exposure) * 100 > 15;	763017611
SELECT 
    fi.institution_name AS institution_name,
    rr.report_type AS report_type,
    rr.submission_date AS submission_date
FROM 
    regulatory_reports rr
JOIN 
    financial_institution_info fi ON rr.institution_id = fi.institution_id
WHERE 
    rr.approval_status = '需修改'
    AND rr.report_date BETWEEN '2023-01-01' AND '2023-12-31'
ORDER BY 
    rr.submission_date DESC;	227811783
SELECT DISTINCT f.institution_name
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
WHERE r.report_date BETWEEN '2023-01-01' AND '2023-12-31'
  AND r.report_type = '季度报告'
  AND r.approval_status = '需修改'
  AND EXISTS (
    SELECT 1 
    FROM related_party_transactions t 
    WHERE t.institution_id = f.institution_id
      AND t.transaction_date BETWEEN '2023-01-01' AND '2023-12-31'
      AND t.transaction_amount > 10000000
  );	636265180
SELECT 
    l.liquidity_coverage_ratio AS liquidity_coverage_ratio,
    f.institution_type AS institution_type
FROM liquidity_ratio l
JOIN financial_institution_info f ON l.institution_id = f.institution_id
WHERE f.institution_type IN ('外资银行', '国际银行', '跨国银行')
ORDER BY l.liquidity_coverage_ratio DESC;	3904345596
SELECT DISTINCT fii.institution_id AS institution_id
FROM financial_institution_info fii
JOIN related_party_transactions rpt ON fii.institution_id = rpt.institution_id
WHERE rpt.transaction_date BETWEEN '2023-10-01' AND '2023-10-31'
AND rpt.transaction_amount > 10000000;	2375076145
SELECT 
    f.institution_name AS institution_name, 
    COUNT(CASE WHEN r.approval_status != 'approved' THEN 1 END) * 100.0 / COUNT(*) AS failure_rate
FROM 
    related_party_transactions r
JOIN 
    financial_institution_info f ON r.institution_id = f.institution_id
WHERE 
    r.transaction_date >= '2023-01-01'
GROUP BY 
    f.institution_name
ORDER BY 
    failure_rate DESC
LIMIT 1;	1557709908
SELECT 
    f.institution_name,
    r.operational_risk_exposure / r.total_risk_exposure AS op_risk_ratio
FROM 
    risk_exposure r
JOIN 
    financial_institution_info f ON r.institution_id = f.institution_id
WHERE 
    EXTRACT(YEAR FROM r.report_date) = 2023
ORDER BY 
    op_risk_ratio DESC
LIMIT 1;	963481309
SELECT DISTINCT f.institution_id
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
WHERE r.report_date BETWEEN '2023-01-01' AND '2023-12-31'
AND r.comments IS NOT NULL
AND r.report_type = 'Annual Report';	3447512985
SELECT 
    n.npl_id AS npl_id,
    n.institution_id AS institution_id,
    n.report_date AS report_date,
    n.total_loans AS total_loans,
    n.npl_amount AS npl_amount,
    n.npl_ratio AS npl_ratio,
    n.provision_coverage_ratio AS provision_coverage_ratio,
    f.institution_name AS institution_name
FROM 
    non_performing_loans n
JOIN 
    financial_institution_info f ON n.institution_id = f.institution_id
WHERE 
    n.report_date = '2023-03-01';	3623964040
SELECT institution_name 
FROM financial_institution_info 
WHERE legal_representative LIKE '王%';	478636896
SELECT DISTINCT f.institution_name AS institution_name, c.total_car AS total_capital_adequacy_ratio
FROM financial_institution_info f
JOIN regulatory_reports r ON f.institution_id = r.institution_id
JOIN capital_adequacy_ratio c ON f.institution_id = c.institution_id AND r.report_date = c.report_date
WHERE r.report_date BETWEEN '2023-01-01' AND '2023-03-31'
  AND (r.report_type LIKE '%资本充足率%' OR r.report_type LIKE '%CAR%' OR r.report_type LIKE '%资本%' OR r.comments LIKE '%资本充足率%')
  AND c.total_car > 10;	1733036868

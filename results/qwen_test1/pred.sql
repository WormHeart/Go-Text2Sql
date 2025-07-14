SELECT 
    e.name AS name, 
    e.employee_id AS employee_id, 
    a.check_in AS check_in, 
    a.check_out AS check_out 
FROM 
    employees e 
JOIN 
    departments d ON e.department_id = d.id 
JOIN 
    attendance_records a ON e.employee_id = a.employee_id 
WHERE 
    d.name = '客户服务部' 
    AND a.date = '2024-10-13' 
    AND a.check_out > a.check_in 
    AND (a.check_out - a.check_in) > INTERVAL '15 hours';	3457299966
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in FROM employees e JOIN attendance_records a ON e.employee_id = a.employee_id WHERE e.university = '清华大学' AND a.date = '2024-10-11' AND a.check_in > '09:00:00';	1044893251
SELECT COUNT(*) AS count FROM attendance_records WHERE employee_id = 'H03961' AND date BETWEEN '2024-01-01' AND '2024-12-31' AND check_in > '09:00:00';	3626797096
SELECT e.name AS name, a.check_in AS check_in, pe.rating AS rating FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE a.date = '2024-09-24' AND a.check_in < '08:30' AND pe.rating = 'A+';	207527642
SELECT e.name AS employee_name, d.name AS department_name, a.check_in, a.check_out FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.date = '2024-10-05';	4093748071
SELECT e.name AS name, d.name AS department_name, a.check_in, a.check_out 
FROM attendance_records a 
JOIN employees e ON a.employee_id = e.employee_id 
JOIN departments d ON e.department_id = d.id::text 
WHERE a.date = '2024-09-21' 
ORDER BY d.name;	4123999737
SELECT (COUNT(CASE WHEN (EXTRACT(EPOCH FROM (end_date - start_date)) / (24 * 3600)) < 90 THEN 1 END) * 100.0 / COUNT(*)) AS 离职比例 FROM probation_employees WHERE start_date IS NOT NULL AND end_date IS NOT NULL;	560968712
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '客户服务部' 
AND a.date = '2024-10-08' 
AND a.check_in > '09:00:00'::time;	2123418406
AMBIGUOUS_QUERY	2685336973
SELECT d.name AS department_name, e.name AS employee_name, a.check_in, e.remaining_annual_leave 
FROM attendance_records a 
JOIN employees e ON a.employee_id = e.employee_id 
JOIN departments d ON e.department_id = d.department_id 
WHERE a.date = '2024-09-22' 
AND a.check_in > '09:00:00' 
AND e.remaining_annual_leave < 5;	1786804299
SELECT e.name AS employee_name, pe.rating AS performance_rating FROM employees e JOIN attendance_records a ON e.employee_id = a.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE e.hire_date >= '2023-01-01' AND e.hire_date < '2024-01-01' AND a.date = '2024-10-05';	187164736
SELECT e.name AS 员工姓名, e.hire_date AS 入职日期, pe.rating AS 绩效等级 
FROM employees e 
JOIN attendance_records ar ON e.employee_id = ar.employee_id 
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id 
WHERE EXTRACT(YEAR FROM e.hire_date) = 2023 
AND ar.date = '2024-09-26';	16656251
SELECT COUNT(DISTINCT date) AS count FROM attendance_records WHERE employee_id = 'H05598' AND date BETWEEN '2024-01-01' AND '2024-12-31' AND check_out < '18:00';	3745687130
SELECT e.name AS employee_name, d.name AS department_name FROM attendance_records ar JOIN employees e ON ar.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE ar.date = '2024-09-28' AND ar.check_in > '09:00:00';	2706374430
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '运营部' 
AND a.date = '2024-10-12' 
AND a.check_in > '09:00'::time;	1934436050
SELECT e.name AS employee_name, d.name AS department_name FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.date = '2024-10-11' AND a.check_in > '09:00:00';	3074190923
AMBIGUOUS_QUERY	511554832
SELECT e.name AS employee_name, d.name AS department_name 
FROM performance_evaluations pe 
JOIN employees e ON pe.employee_id = e.employee_id 
JOIN departments d ON e.department_id = d.department_id 
WHERE pe.evaluation_date = '2023-12-11' AND pe.rating = 'C';	2699770862
AMBIGUOUS_QUERY	2054121283
SELECT a.employee_id AS employee_id, e.name AS name, a.award_name AS award_name, pe.rating AS rating 
FROM awards a 
JOIN employees e ON a.employee_id = e.employee_id 
JOIN performance_evaluations pe ON a.employee_id = pe.employee_id 
WHERE a.year = 2023 
AND a.award_name = '创新奖' 
AND pe.rating = 'A+';	1458867293
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '客户服务部' 
AND a.date = '2024-10-09' 
AND a.check_in > '08:30:00';	3998131614
AMBIGUOUS_QUERY	3232263409
SELECT e.name AS name, a.award_name AS award_name FROM employees e JOIN awards a ON e.employee_id = a.employee_id WHERE e.hire_date >= '2021-01-01' AND e.hire_date < '2022-01-01' AND a.year = 2022;	3292642794
AMBIGUOUS_QUERY	1309577663
SELECT d.name AS department_name, e.name AS employee_name FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.date = '2024-09-24' AND a.check_in > '09:30:00' AND e.remaining_annual_leave < 10;	3488243740
SELECT e.name AS name, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.id::text 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '销售部' 
AND a.date = '2024-09-19' 
AND a.check_in > TIME '09:00:00';	651157477
SELECT d.name AS department_name, e.name AS employee_name 
FROM attendance_records a 
JOIN employees e ON a.employee_id = e.employee_id 
JOIN departments d ON e.department_id = d.department_id 
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id 
WHERE a.date = '2024-09-26' 
AND a.check_in > '09:00' 
AND pe.rating = 'C';	53102733
SELECT e.name AS name, a.award_name AS award_name, pe.rating AS rating 
FROM employees e 
JOIN awards a ON e.employee_id = a.employee_id 
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id 
WHERE EXTRACT(YEAR FROM e.hire_date) = 2021 
AND a.year = 2021 
AND pe.rating = 'B' 
AND EXTRACT(YEAR FROM pe.evaluation_date) = 2021;	3108523290
SELECT e.name AS name, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '销售部' 
AND a.date = DATE '2024-10-03' 
AND a.check_in > TIME '09:00:00';	840538968
SELECT e.name AS name, p.status AS status FROM employees e JOIN awards a ON e.employee_id = a.employee_id JOIN probation_employees p ON e.employee_id = p.employee_id WHERE a.year = 2020 AND a.award_name = '优秀员工' AND p.status = '在职';	3192644686
SELECT e.name AS name, a.award_name AS award_name, pe.rating AS rating FROM employees e JOIN awards a ON e.employee_id = a.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE e.hire_date >= '2023-01-01' AND e.hire_date < '2024-01-01' AND a.year = 2023 AND pe.rating = 'A+';	1597119407
AMBIGUOUS_QUERY	3355699316
AMBIGUOUS_QUERY	1396580707
SELECT e.name AS name, a.date AS date, a.check_in AS check_in, a.check_out AS check_out 
FROM attendance_records a 
JOIN employees e ON a.employee_id = e.employee_id 
WHERE a.employee_id IN (
    SELECT employee_id 
    FROM awards 
    WHERE year = 2022 AND award_name = '技术突破奖'
) 
AND (a.check_out - a.check_in) > INTERVAL '10 hours';	2385394779
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in, a.check_out AS check_out 
FROM employees e 
JOIN departments d ON e.department_id = d.id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '质量控制部' 
AND a.date = '2024-09-20' 
AND ( (a.date + a.check_out) - (a.date + a.check_in) ) > INTERVAL '8 hours';	3598287205
SELECT e.name AS name FROM employees e JOIN attendance_records a ON e.employee_id = a.employee_id WHERE e.university = '清华大学' AND a.date = '2024-09-25' AND a.check_in < '09:00:00';	1157360763
SELECT e.name, AVG(EXTRACT(EPOCH FROM (a.check_out - a.check_in)) / 3600) AS average_hours_per_day
FROM employees e
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
JOIN attendance_records a ON e.employee_id = a.employee_id
WHERE pe.rating = 'A+'
GROUP BY e.employee_id, e.name
ORDER BY average_hours_per_day DESC
LIMIT 1;	1456890377
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '销售部' 
AND a.date = '2024-10-04' 
AND a.check_in > '09:00:00';	455172185
SELECT e.name AS name, a.check_in AS check_in, pe.rating AS rating FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE a.date = '2024-09-18' AND a.check_in > '09:00' AND pe.rating = 'D';	4212530835
SELECT e.name AS name, a.check_in AS check_in, pe.rating AS rating FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON a.employee_id = pe.employee_id WHERE a.date = '2024-09-25' AND a.check_in > '08:30:00' AND pe.rating = 'B+';	1240612673
SELECT id AS interview_id, employee_id, interview_date, interview_count FROM interviews WHERE interview_date BETWEEN '2024-01-01' AND '2024-12-31' ORDER BY interview_count;	2857901445
SELECT e.name AS name, a.check_in AS check_in, pe.rating AS rating FROM attendance_records a JOIN performance_evaluations pe ON a.employee_id = pe.employee_id JOIN employees e ON a.employee_id = e.employee_id WHERE a.date = '2024-10-10' AND a.check_in > '08:30:00' AND pe.rating = 'A+';	71265646
SELECT d.name AS department_name, e.name AS employee_name, a.check_in, e.remaining_annual_leave 
FROM attendance_records a 
JOIN employees e ON a.employee_id = e.employee_id 
JOIN departments d ON e.department_id = d.department_id 
WHERE a.date = '2024-09-27' 
AND a.check_in > '09:00:00' 
AND e.remaining_annual_leave < 10;	2168264130
SELECT e.name AS name, pe.evaluation_date AS evaluation_date FROM employees e LEFT JOIN performance_evaluations pe ON e.employee_id = pe.employee_id;	1505285087
SELECT e.name AS name, d.name AS department_name, ar.check_in, ar.check_out FROM attendance_records ar JOIN employees e ON ar.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE ar.date = '2024-10-07' AND ar.check_in > '09:00:00' AND ar.check_out < '17:00:00';	1736090929
SELECT e.name AS name, d.name AS department_name, a.check_in, a.check_out FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.date = '2024-10-05';	816170327
SELECT e.department_id AS department_id, AVG(i.interview_count) AS avg_interview_count 
FROM employees e 
JOIN (SELECT employee_id, COUNT(*) AS interview_count FROM interviews GROUP BY employee_id) i 
ON e.employee_id = i.employee_id 
GROUP BY e.department_id 
ORDER BY avg_interview_count DESC 
LIMIT 1;	3913837113
SELECT e.name AS name, a.employee_id AS employee_id, a.date AS date, a.check_in AS check_in, a.check_out AS check_out, pe.rating AS rating FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE a.date = '2024-09-27' AND pe.rating = 'A+';	578427607
AMBIGUOUS_QUERY	2435455132
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.id::text 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '质量控制部' 
AND a.date = '2024-10-14' 
AND a.check_in > '09:00'::time;	801113743
SELECT e.name AS name, a.check_out AS check_out, pe.rating AS rating FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON a.employee_id = pe.employee_id WHERE a.date = '2024-09-24' AND a.check_out > '13:00:00' AND pe.rating = 'B+';	879816496
SELECT e.name AS employee_name, d.name AS department_name FROM attendance_records ar JOIN employees e ON ar.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE ar.date = '2024-10-08' AND ar.check_in > '09:00:00';	2367322111
SELECT e.name AS employee_name, d.name AS department_name, a.award_name FROM awards a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.year = 2022;	247458622
SELECT e.name AS name, a.check_in AS check_in, pe.rating AS rating FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE a.date = '2024-10-12' AND a.check_in > '09:00:00' AND pe.rating = 'D';	570267133
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in FROM employees e JOIN attendance_records a ON e.employee_id = a.employee_id WHERE e.university = '清华大学' AND a.date = '2024-10-13' AND a.check_in < '09:30:00';	137546085
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in, a.check_out AS check_out 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '客户服务部' AND a.date = '2024-09-22';	4072264422
SELECT DISTINCT e.name AS name, a.award_name AS award_name, pe.rating AS rating 
FROM awards a 
JOIN employees e ON a.employee_id = e.employee_id 
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id 
WHERE a.year = 2023 
AND a.award_name = '质量改进奖' 
AND pe.rating = 'A+';	4121529769
SELECT e.name AS name, a.employee_id, a.check_in, d.name AS department_name FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.date = '2024-10-05' AND a.check_in > '08:30:00' AND d.manager_id = 'H05487';	437939056
SELECT e.name AS name, a.check_in AS check_in, a.check_out AS check_out 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '行政部' 
AND a.date = '2024-10-02' 
AND (a.check_out - a.check_in) > INTERVAL '9 hours';	2108794903
SELECT departments.name AS department_name, employees.name AS employee_name FROM performance_evaluations JOIN employees ON performance_evaluations.employee_id = employees.employee_id JOIN departments ON employees.department_id = departments.department_id WHERE performance_evaluations.evaluation_date = '2023-03-31' AND performance_evaluations.rating = 'D';	2803368869
AMBIGUOUS_QUERY	408783378
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.id::text 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '质量控制部' 
AND a.date = '2024-09-19' 
AND a.check_in > '09:00:00';	1719343281
<final>
SELECT e.name AS name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2022
  AND a.award_name = '客户满意度奖'
  AND ar.date = '2024-10-12'
  AND ar.check_in > '09:00:00';
</final>;	2395193694
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in, d.name AS department_name 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.manager_id = 'H00842' 
AND a.date = '2024-10-11' 
AND a.check_in > TIME '09:00';	2461283805
SELECT e.name AS employee_name, d.name AS department_name FROM awards a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.year = 2023 AND a.award_name = '领导力奖';	1004841644
AMBIGUOUS_QUERY	958025096
SELECT e.name AS employee_name, d.name AS department_name, d.manager_id AS manager_id FROM attendance_records ar JOIN employees e ON ar.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE ar.date = '2024-10-02' AND ar.check_in BETWEEN '09:00:00' AND '10:00:00' AND e.employee_type = '实习生';	4156394932
SELECT departments.name AS department_name, AVG(extract(year from age(employees.birth_date))) AS average_age 
FROM employees 
JOIN departments ON CAST(substring(employees.department_id FROM 2) AS INTEGER) = departments.id 
GROUP BY departments.name 
ORDER BY average_age DESC 
LIMIT 1;	5535555
SELECT e.name AS employee_name, e.employee_id AS employee_id, a.check_in, a.check_out FROM employees e JOIN attendance_records a ON e.employee_id = a.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE a.date = '2024-09-16' AND pe.rating = 'C';	1584866592
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.id::character varying 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '研发部' 
AND a.date = '2024-10-08' 
AND a.check_in > '09:00'::time;	4123927043
SELECT e.name AS name, a.check_in AS check_in FROM employees e JOIN departments d ON e.department_id = d.id JOIN attendance_records a ON e.employee_id = a.employee_id WHERE d.name = '财务部' AND a.date = '2024-09-20' AND a.check_in > '09:00:00';	2642437739
SELECT d.name AS department_name, e.employee_id, a.check_in, a.check_out 
FROM employees e 
JOIN departments d ON e.department_id = d.id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '人力资源部' 
AND a.date = '2024-10-05' 
AND ( (a.date::timestamp + a.check_out::time) - (a.date::timestamp + a.check_in::time) ) > INTERVAL '8 hours';	1412040002
SELECT e.name AS name, a.employee_id AS employee_id, a.date AS date, a.check_in AS check_in, a.check_out AS check_out, pe.rating AS rating FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON a.employee_id = pe.employee_id WHERE a.date = '2024-10-14' AND pe.rating = 'A+';	467771706
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records a ON e.employee_id = a.employee_id
WHERE d.name = '行政部'
AND a.date = '2024-09-27'
AND a.check_in > TIME '09:00';	416599650
SELECT d.name AS department_name, COUNT(e.id) AS employee_count FROM departments d LEFT JOIN employees e ON d.id::text = e.department_id GROUP BY d.id, d.name;	2074887228
SELECT employees.name AS name FROM employees JOIN performance_evaluations ON employees.employee_id = performance_evaluations.employee_id WHERE performance_evaluations.rating = 'A+' ORDER BY employees.start_work_date ASC LIMIT 1;	4204863942
<final>
WITH employee_hours AS (
    SELECT 
        employee_id,
        SUM(EXTRACT(EPOCH FROM (check_out - check_in)) / 3600) AS total_hours
    FROM attendance_records
    GROUP BY employee_id
)
SELECT 
    e.employee_id,
    e.name,
    e.department_id,
    eh.total_hours,
    da.avg_hours,
    ABS(eh.total_hours - da.avg_hours) AS difference
FROM employees e
JOIN employee_hours eh ON e.employee_id = eh.employee_id
JOIN (
    SELECT 
        d.department_id,
        SUM(eh.total_hours) / COUNT(eh.employee_id) AS avg_hours
    FROM departments d
    JOIN employees e ON d.id = e.department_id
    JOIN employee_hours eh ON e.employee_id = eh.employee_id
    GROUP BY d.department_id
) da ON e.department_id = da.department_id
ORDER BY difference DESC;
</final>;	603993474
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in, a.check_out AS check_out, (EXTRACT(EPOCH FROM (a.check_out::time - a.check_in::time)) / 3600)::numeric AS work_duration FROM employees e JOIN departments d ON e.department_id = d.department_id JOIN attendance_records a ON e.employee_id = a.employee_id WHERE d.name = '研发部' AND a.date = '2024-10-05' AND (EXTRACT(EPOCH FROM (a.check_out::time - a.check_in::time)) / 3600)::numeric > 10;	4133405205
SELECT e.name AS employee_name, d.name AS department_name, pe.rating AS performance_rating 
FROM attendance_records ar 
JOIN employees e ON ar.employee_id = e.employee_id 
JOIN departments d ON e.department_id = d.id::text 
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id 
WHERE ar.date = '2024-10-12';	1822156377
SELECT e.name AS name, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '销售部' 
AND a.date = '2024-10-11' 
AND a.check_in > '09:00:00';	3941104083
SELECT e.name AS name, d.name AS department_name, a.check_in AS check_in, aw.award_name AS award_name 
FROM attendance_records a 
JOIN employees e ON a.employee_id = e.employee_id 
JOIN departments d ON e.department_id = d.department_id 
JOIN awards aw ON e.employee_id = aw.employee_id 
WHERE a.date = '2024-09-26' 
AND a.check_in > '09:00:00' 
AND aw.year = 2024;	1448803792
SELECT e.name AS name, a.employee_id AS employee_id, a.check_in AS check_in, pe.rating AS rating 
FROM attendance_records a 
JOIN employees e ON a.employee_id = e.employee_id 
JOIN performance_evaluations pe ON a.employee_id = pe.employee_id 
WHERE a.date = '2024-10-05' 
AND a.check_in > '09:00:00' 
AND pe.rating = 'A+';	2348295774
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '人力资源部' 
AND a.date = '2024-10-07' 
AND a.check_in > '09:00:00';	1351044911
SELECT e.name AS name, d.name AS department_name, a.check_in 
FROM attendance_records a 
JOIN employees e ON a.employee_id = e.employee_id 
JOIN departments d ON e.department_id = d.department_id 
WHERE a.date = '2024-10-11' 
AND a.check_in < '09:00:00' 
AND e.employee_type = '实习生';	1269433479
SELECT e.name AS name, a.award_name AS award_name, pe.rating AS rating
FROM awards a
JOIN employees e ON a.employee_id = e.employee_id
JOIN performance_evaluations pe ON a.employee_id = pe.employee_id
WHERE a.year = 2023
AND a.award_name = '优秀员工奖'
AND pe.rating = 'A+';	2181400574
AMBIGUOUS_QUERY	2992677261
SELECT DISTINCT e.name AS name FROM awards a JOIN employees e ON a.employee_id = e.employee_id JOIN attendance_records ar ON e.employee_id = ar.employee_id WHERE a.year = 2024 AND a.award_name = '新人奖' AND ar.date = '2024-10-08';	1583766775
SELECT e.name AS name, a.check_in AS check_in FROM employees e JOIN attendance_records a ON e.employee_id = a.employee_id JOIN performance_evaluations p ON e.employee_id = p.employee_id WHERE a.date = '2024-10-02' AND a.check_in > '09:00:00' AND p.rating = 'A+';	2928703740
SELECT e.name AS employee_name, d.name AS department_name FROM awards a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.year = 2024 AND a.award_name = '新人奖';	2166514841
AMBIGUOUS_QUERY	2864760744
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in, a.check_out AS check_out 
FROM employees e 
JOIN departments d ON e.department_id = d.id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '研发部' 
AND a.date = '2024-10-06' 
AND (a.check_out::time + a.date) - (a.check_in::time + a.date) > INTERVAL '10 hours';	2860391364
SELECT e.name AS name, a.award_name AS award_name, pe.rating AS rating FROM employees e JOIN awards a ON e.employee_id = a.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE a.year = 2023 AND a.award_name = '技术突破奖' AND pe.rating = 'A+';	1852490763
SELECT e.name AS name, a.check_in AS check_in FROM employees e JOIN performance_evaluations pe ON e.employee_id = pe.employee_id JOIN attendance_records a ON e.employee_id = a.employee_id WHERE pe.rating = 'D' AND a.date = '2024-09-17' AND a.check_in > '09:00:00';	2494653166
SELECT DISTINCT e.name AS name FROM awards a JOIN employees e ON a.employee_id = e.employee_id JOIN attendance_records ar ON a.employee_id = ar.employee_id WHERE a.year = 2024 AND a.award_name = '项目管理奖' AND ar.date = '2024-10-03';	3084451002
SELECT e.name AS name, e.hire_date AS hire_date, a.award_name AS award_name 
FROM awards a 
JOIN employees e ON a.employee_id = e.employee_id 
WHERE a.year = 2023 
AND a.award_name = '领导力奖' 
AND e.hire_date > '2017-12-31';	408688532
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in, a.check_out AS check_out FROM employees e JOIN attendance_records a ON e.employee_id = a.employee_id WHERE e.university = '清华大学' AND a.date = '2024-09-16' AND (a.check_out - a.check_in) > INTERVAL '8 hours';	4036648411
SELECT DISTINCT e.name AS name FROM employees e JOIN awards a ON e.employee_id = a.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE a.year = 2023 AND a.award_name = '领导力奖' AND pe.evaluation_date = '2023-06-04' AND pe.rating = 'D';	548473863
SELECT e.name AS name, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '客户服务部' 
AND a.date = DATE '2024-10-12' 
AND a.check_in > TIME '09:00';	2286968533
SELECT e.name AS name, a.check_in AS check_in FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations p ON e.employee_id = p.employee_id WHERE a.date = '2024-09-21' AND a.check_in > '08:00'::time AND p.rating = 'B';	3284637113
SELECT departments.name AS department_name 
FROM attendance_records 
JOIN employees ON attendance_records.employee_id = employees.employee_id 
JOIN departments ON employees.department_id = departments.department_id 
JOIN performance_evaluations ON employees.employee_id = performance_evaluations.employee_id 
WHERE attendance_records.date = '2024-09-24' 
AND attendance_records.check_in > '09:00:00' 
AND performance_evaluations.rating = 'C';	773404511
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in, a.check_out AS check_out 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '行政部' 
AND a.date = '2024-10-05' 
AND (a.date::timestamp + a.check_out) - (a.date::timestamp + a.check_in) > INTERVAL '9 hours';	2149393306
SELECT e.name AS employee_name, e.employee_id AS employee_id, a.check_in AS check_in FROM employees e JOIN departments d ON e.department_id = d.id JOIN attendance_records a ON e.employee_id = a.employee_id WHERE a.date = '2024-10-06' AND a.check_in > '09:00' AND d.name = '财务部';	2477803619
SELECT e.name AS employee_name, d.name AS department_name, d.manager_id AS manager_id FROM performance_evaluations pe JOIN employees e ON pe.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE EXTRACT(YEAR FROM pe.evaluation_date) = 2023 AND pe.rating = 'A+';	821353235
SELECT e.name AS name, a.check_in AS check_in FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations p ON a.employee_id = p.employee_id WHERE a.date = '2024-09-28' AND a.check_in > '09:00:00' AND p.rating = 'A';	907163187
AMBIGUOUS_QUERY	811463423
WITH first_a_plus AS (
    SELECT 
        employee_id,
        MIN(evaluation_date) AS first_a_plus_date
    FROM 
        performance_evaluations
    WHERE 
        rating = 'A+'
    GROUP BY 
        employee_id
),
ranked_employees AS (
    SELECT 
        d.department_id,
        e.employee_id,
        e.name,
        EXTRACT(EPOCH FROM (fa.first_a_plus_date - e.hire_date)) / 86400 AS time_to_first_a_plus,
        ROW_NUMBER() OVER (PARTITION BY d.department_id ORDER BY EXTRACT(EPOCH FROM (fa.first_a_plus_date - e.hire_date)) / 86400) AS rn
    FROM 
        employees e
    JOIN 
        first_a_plus fa ON e.employee_id = fa.employee_id
    JOIN 
        departments d ON e.department_id = d.department_id
    WHERE 
        fa.first_a_plus_date >= e.hire_date
)
SELECT 
    department_id,
    employee_id,
    name,
    time_to_first_a_plus
FROM 
    ranked_employees
WHERE 
    rn = 1
ORDER BY 
    department_id;	2913040945
SELECT e.name AS employee_name, d.name AS department_name FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.date = '2024-09-22' AND a.check_in > '09:00:00';	1736656854
SELECT e.name AS name, a.award_name AS award_name, pe.rating AS rating FROM awards a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE a.year = 2024 AND a.award_name = '优秀员工' AND pe.rating = 'A+';	2339817132
SELECT e.name AS employee_name, d.name AS department_name, pe.rating AS rating FROM performance_evaluations pe JOIN employees e ON pe.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE pe.evaluation_date = '2023-10-29';	2218878981
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in, a.check_out AS check_out FROM employees e JOIN attendance_records a ON e.employee_id = a.employee_id WHERE e.university = '清华大学' AND a.date = '2024-09-17' AND (a.check_out - a.check_in) > INTERVAL '9 hours';	1785434408
SELECT e.name AS employee_name, d.name AS department_name FROM performance_evaluations pe JOIN employees e ON pe.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE pe.evaluation_date = '2022-06-16' AND pe.rating = 'C';	2274426817
SELECT e.name AS name FROM employees e JOIN awards a ON e.employee_id = a.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE a.year = 2022 AND a.award_name = '优秀员工' AND pe.evaluation_date = '2022-10-30' AND pe.rating = 'A+';	1121061015
SELECT e.name AS name, a.check_in AS check_in FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations p ON e.employee_id = p.employee_id WHERE a.date = '2024-09-15' AND a.check_in > '09:00:00' AND p.rating = 'B';	1822740611
SELECT e.name AS employee_name, e.position AS position FROM employees e JOIN departments d ON e.department_id = d.department_id WHERE d.name = '销售部';	3049098373
SELECT e.name AS name, a.check_in AS check_in 
FROM attendance_records a 
JOIN employees e ON a.employee_id = e.employee_id 
JOIN performance_evaluations p ON a.employee_id = p.employee_id 
WHERE a.date = '2024-09-23' 
AND p.rating = 'D' 
AND a.check_in >= '09:00:00';	2137629249
SELECT e.name AS name, e.employee_id AS employee_id FROM departments d JOIN employees e ON d.department_id = e.department_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE d.name = '客户服务部' AND pe.rating = 'D';	2240615465
SELECT e.name AS name, e.hire_date AS hire_date, a.award_name AS award_name 
FROM awards a 
JOIN employees e ON a.employee_id = e.employee_id 
WHERE a.year = 2023 
AND a.award_name = '领导力奖' 
AND e.hire_date >= '2019-01-01';	1309270874
SELECT DISTINCT e.name AS employee_name, d.name AS department_name 
FROM attendance_records a 
JOIN employees e ON a.employee_id = e.employee_id 
JOIN departments d ON e.department_id = d.department_id 
JOIN performance_evaluations p ON e.employee_id = p.employee_id 
WHERE a.date = '2024-09-20' 
AND a.check_in > '09:00:00' 
AND p.rating = 'A+';	2420332715
AMBIGUOUS_QUERY	60966118
SELECT e.name AS name, a.check_in AS check_in, pe.rating AS rating FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON a.employee_id = pe.employee_id WHERE a.date = '2024-09-20' AND a.check_in >= '08:00:00' AND a.check_in < '09:00:00' AND pe.rating = 'B';	1965264110
AMBIGUOUS_QUERY	1436736406
SELECT e.name AS name, a.check_in AS check_in FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations p ON e.employee_id = p.employee_id WHERE a.date = '2024-09-19' AND a.check_in > '09:00' AND p.rating = 'B+';	2263195811
SELECT e.name AS employee_name, d.name AS department_name, a.check_in, a.check_out, (a.check_out - a.check_in) AS work_duration FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.date = '2024-09-24' AND (a.check_out - a.check_in) > INTERVAL '12 hours';	1079007714
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in FROM employees e JOIN attendance_records a ON e.employee_id = a.employee_id WHERE e.university = '清华大学' AND a.date = '2024-09-29' AND a.check_in < '09:00:00';	2835428087
SELECT e.name AS name, a.check_in AS check_in_time, pe.rating AS rating_level
FROM attendance_records a
JOIN employees e ON a.employee_id = e.employee_id
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id
WHERE a.date = '2024-10-11'
AND a.check_in > '09:00:00'
AND pe.rating = 'A';	2600324766
AMBIGUOUS_QUERY	1290741288
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE e.university = '厦门大学' 
AND a.date = '2024-09-23' 
AND a.check_in > '09:00:00';	3714812669
SELECT e.name AS name, a.check_in AS check_in, pe.rating AS rating FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON a.employee_id = pe.employee_id WHERE a.date = '2024-09-19' AND a.check_in > '09:00:00' AND pe.rating = 'D';	4217899403
SELECT e.name AS name, e.employee_id AS employee_id, a.date AS date, a.check_in AS check_in FROM employees e JOIN attendance_records a ON e.employee_id = a.employee_id WHERE e.university = '清华大学' AND a.date = '2024-10-11' AND a.check_in > TIME '08:30';	1946117596
SELECT e.name AS name, a.check_in AS check_in 
FROM attendance_records a 
JOIN employees e ON a.employee_id = e.employee_id 
JOIN performance_evaluations p ON a.employee_id = p.employee_id 
WHERE a.date = '2024-10-10' 
AND a.check_in > '09:00:00' 
AND p.rating = 'D';	1268105110
SELECT e.name AS name, a.award_name AS award_name, pe.rating AS rating FROM employees e JOIN awards a ON e.employee_id = a.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE EXTRACT(YEAR FROM e.hire_date) = 2024 AND a.year = 2024 AND a.award_name = '新人奖' AND pe.rating = 'A';	910719964
SELECT e.name AS name, a.check_in AS check_in FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations p ON a.employee_id = p.employee_id WHERE a.date = '2024-09-26' AND a.check_in BETWEEN '08:00:00' AND '09:00:00' AND p.rating = 'B+';	4215983699
SELECT DISTINCT e.name AS name FROM employees e JOIN awards a ON e.employee_id = a.employee_id JOIN attendance_records ar ON e.employee_id = ar.employee_id WHERE a.year = 2023 AND a.award_name = '创新奖' AND ar.date = '2024-09-25';	3022631781
SELECT e.name AS name, a.check_in AS check_in FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations p ON a.employee_id = p.employee_id WHERE a.date = '2024-09-24' AND a.check_in > '09:00:00' AND p.rating = 'D';	1326215630
SELECT d.name AS department_name, AVG(e.remaining_annual_leave) AS avg_annual_leave FROM departments d JOIN employees e ON e.department_id = d.id::text WHERE d.manager_id = 'H03372' GROUP BY d.name;	2739991096
SELECT e.name AS name, a.date AS date, pe.rating AS rating FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON a.employee_id = pe.employee_id WHERE a.date = '2024-10-12' AND pe.rating = 'A+';	3094758858
SELECT e.name AS name, a.date AS date, a.check_in AS check_in 
FROM employees e 
JOIN attendance_records a ON e.employee_id = a.employee_id 
JOIN awards aw ON e.employee_id = aw.employee_id 
WHERE aw.year = 2023 
AND aw.award_name = '质量改进奖' 
AND a.date = '2024-10-03' 
AND a.check_in > '09:00:00';	3240116959
SELECT e.name AS name, e.employee_id AS employee_id, d.name AS department_name, pe.rating AS rating 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id 
WHERE d.name = '财务部' 
AND pe.rating = 'A+' 
AND CAST(pe.evaluation_date AS DATE) = '2024-09-15';	3253971302
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '质量控制部' 
AND a.date = '2024-09-21' 
AND a.check_in > '09:00:00';	3037862925
SELECT e.name AS name, a.check_in AS check_in, a.check_out AS check_out 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '销售部' 
AND a.date = '2024-09-25' 
AND (a.check_out - a.check_in) > INTERVAL '8 hours';	1991610345
SELECT e.name AS name, a.award_name AS award_name, pe.rating AS rating 
FROM awards a 
JOIN employees e ON a.employee_id = e.employee_id 
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id 
WHERE a.year = 2022 
AND a.award_name = '技术突破奖' 
AND pe.evaluation_date > '2022-07-13';	3421802959
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in FROM employees e JOIN departments d ON e.department_id = d.department_id JOIN attendance_records a ON e.employee_id = a.employee_id WHERE d.name = '财务部' AND a.date = '2024-10-11' AND a.check_in > '09:00:00';	3350855518
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in FROM employees e JOIN departments d ON e.department_id = d.department_id JOIN attendance_records a ON e.employee_id = a.employee_id WHERE d.name = '研发部' AND a.date = '2024-10-12' AND a.check_in > '09:00:00';	1481678835
SELECT DISTINCT departments.name AS department_name FROM performance_evaluations JOIN employees ON performance_evaluations.employee_id = employees.employee_id JOIN departments ON employees.department_id = departments.department_id WHERE performance_evaluations.evaluation_date = '2023-08-06' AND performance_evaluations.rating = 'C';	1832961045
SELECT e.name AS employee_name, d.name AS department_name, a.check_in, a.check_out FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.date = '2024-10-01' AND (a.check_out - a.check_in) > interval '12 hours';	3794832374
SELECT e.name AS name, a.check_in AS check_in FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations p ON a.employee_id = p.employee_id WHERE a.date = '2024-10-09' AND a.check_in > '09:00:00' AND p.rating = 'A+';	4131389571
SELECT e.name AS name, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '人力资源部' 
AND a.date = '2024-09-24' 
AND a.check_in > '09:00:00';	2592420070
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '销售部' 
AND a.date = '2024-10-02' 
AND a.check_in > '09:00:00';	1526114356
SELECT e.name AS name, a.check_out AS check_out, pe.rating AS rating FROM employees e JOIN attendance_records a ON e.employee_id = a.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE a.date = '2024-10-11' AND CAST(a.check_out AS TIME) > '21:00:00' AND pe.rating = 'B+';	906637391
SELECT e.name AS name, d.name AS department_name, e.hire_date AS hire_date FROM performance_evaluations pe JOIN employees e ON pe.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE EXTRACT(YEAR FROM pe.evaluation_date) = 2022 AND pe.rating = 'B' ORDER BY e.hire_date;	3180358031
SELECT e.name AS employee_name, d.name AS department_name, a.check_in, a.check_out FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.date = '2024-09-22' AND d.name = '客户服务部';	1427670664
SELECT d.name AS department_name, e.name AS employee_name 
FROM attendance_records a 
JOIN employees e ON a.employee_id = e.employee_id 
JOIN performance_evaluations p ON e.employee_id = p.employee_id 
JOIN departments d ON e.department_id = d.department_id 
WHERE a.date = '2024-09-20' 
AND a.check_in > '09:00'::time 
AND p.rating = 'B';	2517372671
SELECT e.name AS name FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id WHERE a.date = '2024-10-02' ORDER BY a.check_in ASC LIMIT 1;	2374975326
SELECT e.name AS name, e.employee_id AS employee_id, a.date AS date, pe.rating AS rating FROM employees e JOIN attendance_records a ON e.employee_id = a.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE e.hire_date BETWEEN '2023-01-01' AND '2023-12-31' AND a.date = '2024-10-10' AND pe.rating = 'B+';	1399658957
SELECT e.name AS name, e.employee_id AS employee_id, a.date AS date, a.check_in AS check_in FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.date = '2024-10-04' AND a.check_in > '09:00:00' AND d.name = '财务部';	1337508734
AMBIGUOUS_QUERY	2509046712
SELECT d.name AS department_name FROM probation_employees p JOIN employees e ON p.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id GROUP BY p.employee_id, d.name ORDER BY COUNT(p.employee_id) DESC LIMIT 3;	1196649212
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.id::text 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '财务部' 
AND a.date = '2024-10-04' 
AND a.check_in > '09:00:00';	3455582973
SELECT e.name AS employee_name, d.name AS department_name FROM awards a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.year = 2023 AND a.award_name = '优秀员工';	2169239057
AMBIGUOUS_QUERY	329969630
SELECT e.name AS name, a.check_in AS check_in 
FROM attendance_records a 
JOIN employees e ON a.employee_id = e.employee_id 
JOIN performance_evaluations p ON e.employee_id = p.employee_id 
WHERE a.date = '2024-09-24' 
AND a.check_in > '09:00:00' 
AND p.rating = 'C';	1957766738
SELECT e.name AS name, a.award_name AS award_name FROM employees e INNER JOIN awards a ON e.employee_id = a.employee_id;	701997867
<final>
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.id::varchar 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '法务部' 
AND a.date = '2024-10-13' 
AND a.check_in < '08:30:00';
</final>;	906781191
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in, a.check_out AS check_out 
FROM employees e 
JOIN departments d ON e.department_id = d.id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '质量控制部' 
AND a.date = '2024-09-17' 
AND (EXTRACT(EPOCH FROM (a.check_out - a.check_in)) / 3600) > 9;	388401260
AMBIGUOUS_QUERY	1988310183
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON CAST(e.department_id AS integer) = d.id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '财务部' 
AND a.date = '2024-10-09' 
AND a.check_in > '09:00:00';	2363197929
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.id::text 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '客户服务部' 
AND a.date = '2024-10-10' 
AND a.check_in > '09:00:00';	935583315
AMBIGUOUS_QUERY	3679145520
SELECT e.name AS employee_name, d.name AS department_name 
FROM attendance_records ar 
JOIN employees e ON ar.employee_id = e.employee_id 
JOIN departments d ON e.department_id = d.department_id 
WHERE ar.date = '2024-09-25' AND ar.check_in > '09:00:00';	1647521458
SELECT e.name AS name, e.employee_id AS employee_id, pe.rating AS rating 
FROM employees e 
JOIN departments d ON e.department_id = d.id::text 
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id 
WHERE d.id = '6' 
AND pe.evaluation_date = '2024-09-28' 
AND pe.rating = 'A+';	2154404311
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.id::text 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '法务部' 
AND a.date = '2024-10-07'::date 
AND a.check_in > '09:00:00'::time;	1956887122
SELECT e.name AS employee_name, d.name AS department_name, a.check_in, a.check_out FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.date = '2024-10-14';	541499305
AMBIGUOUS_QUERY	607760760
SELECT AVG(e.remaining_annual_leave) AS avg_remaining_annual_leave 
FROM awards a 
JOIN employees e ON a.employee_id = e.employee_id 
WHERE a.year = 2024 
AND a.award_name = '领导力奖' 
AND e.hire_date > '2017-01-01';	3786409554
AMBIGUOUS_QUERY	1833538335
SELECT e.name AS employee_name, d.name AS department_name FROM performance_evaluations pe JOIN employees e ON pe.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE pe.evaluation_date = '2023-12-07' AND pe.rating = 'B';	2571560082
SELECT e.name AS name, d.name AS department_name, a.award_name AS award_name 
FROM employees e 
JOIN departments d ON e.department_id = d.id 
JOIN awards a ON e.employee_id = a.employee_id 
WHERE e.hire_date >= DATE '2023-01-01' 
AND e.hire_date < DATE '2024-01-01' 
AND a.year = 2023;	3184081384
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in FROM employees e JOIN departments d ON e.department_id = d.department_id JOIN attendance_records a ON e.employee_id = a.employee_id WHERE d.name = '销售部' AND a.date = '2024-09-25' AND a.check_in > '09:00:00';	3265054996
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in FROM employees e JOIN departments d ON e.department_id = d.department_id JOIN attendance_records a ON e.employee_id = a.employee_id WHERE d.name = '质量控制部' AND a.date = '2024-09-20' AND a.check_in > '09:00:00';	1987469456
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in, a.check_out AS check_out 
FROM attendance_records a 
JOIN employees e ON a.employee_id = e.employee_id 
JOIN departments d ON e.department_id = d.department_id 
WHERE a.date = '2024-09-29' 
AND d.name = '客户服务部' 
AND (EXTRACT(EPOCH FROM (a.check_out - a.check_in)) / 3600) > 10;	3475714298
SELECT e.name AS name, a.check_in AS check_in, pe.rating AS rating FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON a.employee_id = pe.employee_id WHERE a.date = '2024-10-04' AND a.check_in > '08:30' AND pe.rating = 'A+';	3158837504
SELECT e.employee_id, COUNT(CASE WHEN a.check_in > '09:00' THEN 1 END) AS late_days 
FROM employees e 
LEFT JOIN attendance_records a ON e.employee_id = a.employee_id 
GROUP BY e.employee_id;	1341335041
AMBIGUOUS_QUERY	1248129462
SELECT DISTINCT e.name AS name FROM employees e JOIN awards a ON e.employee_id = a.employee_id JOIN attendance_records ar ON e.employee_id = ar.employee_id WHERE a.year = 2021 AND a.award_name = '最佳团队奖' AND ar.date = '2024-09-19';	2929076718
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in, a.check_out AS check_out FROM employees e JOIN departments d ON e.department_id = d.department_id JOIN attendance_records a ON e.employee_id = a.employee_id WHERE d.name = '客户服务部' AND a.date = '2024-09-21';	860593492
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '财务部' 
AND a.date = '2024-09-23' 
AND a.check_in < '09:30:00';	803138423
SELECT e.name AS name, a.check_in AS check_in FROM employees e JOIN attendance_records a ON e.employee_id = a.employee_id WHERE e.employee_type = '实习生' AND a.date = '2024-10-09' AND a.check_in > '09:00:00';	1392351924
ERROR: LLM 请求失败	2647170145
SELECT e.name AS name, a.award_name AS award_name, pe.rating AS rating FROM employees e JOIN awards a ON e.employee_id = a.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE EXTRACT(YEAR FROM e.hire_date) = 2022 AND a.year = 2023 AND pe.rating = 'A+';	2581619009
SELECT e.name AS employee_name, d.name AS department_name, a.check_in AS check_in_time, a.check_out AS check_out_time FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.date = '2024-10-13' AND d.name = '人力资源部';	2697889458
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '行政部' 
AND a.date = '2024-09-18' 
AND a.check_in > '09:00:00';	3387668548
AMBIGUOUS_QUERY	1417292000
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '销售部' AND a.date = '2024-09-20' AND a.check_in > '08:00:00';	1597423542
SELECT d.department_id AS department_id, e.employee_id AS employee_id, e.name AS name, EXTRACT(YEAR FROM AGE(e.birth_date)) AS max_age 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
WHERE (e.department_id, EXTRACT(YEAR FROM AGE(e.birth_date))) IN (
    SELECT e2.department_id, MAX(EXTRACT(YEAR FROM AGE(e2.birth_date))) 
    FROM employees e2 
    JOIN departments d2 ON e2.department_id = d2.department_id 
    GROUP BY e2.department_id
);	3397723976
SELECT e.name AS name, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '人力资源部' 
AND a.date = '2024-09-30' 
AND a.check_in > '09:00:00';	339893232
SELECT e.name AS name, a.check_in AS check_in FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.date = '2024-09-18' AND a.check_in > '09:00:00' AND d.name = '研发部';	244305078
SELECT e.name AS name, a.check_in AS check_in, 'A+' AS rating 
FROM attendance_records a 
JOIN employees e ON a.employee_id = e.employee_id 
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id 
WHERE a.date = '2024-09-28' 
AND a.check_in > '09:30:00' 
AND pe.rating = 'A+';	2030661443
SELECT e.name AS name, a.check_in AS check_in, pe.rating AS rating FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE a.date = '2024-09-17' AND a.check_in > '09:00' AND pe.rating = 'B';	2290320497
SELECT e.name AS name, a.employee_id AS employee_id, a.date AS date, pe.rating AS rating FROM attendance_records a JOIN performance_evaluations pe ON a.employee_id = pe.employee_id JOIN employees e ON a.employee_id = e.employee_id WHERE a.date = '2024-09-22' AND pe.rating = 'D';	2134005508
SELECT e.name AS name, a.employee_id AS employee_id, a.date AS date, a.check_in AS check_in, a.check_out AS check_out, pe.rating AS rating FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE a.date = '2024-10-03' AND pe.rating = 'A+';	3179866905
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '客户服务部' 
AND a.date = '2024-10-07' 
AND a.check_in > '09:00:00';	1447725797
AMBIGUOUS_QUERY	3166523944
SELECT e.name AS name, a.award_name 
FROM employees e 
JOIN awards a ON e.employee_id = a.employee_id 
JOIN attendance_records ar ON e.employee_id = ar.employee_id 
WHERE ar.date = '2024-10-05' 
AND ar.check_in > '09:00:00' 
AND a.year = 2021;	3133264714
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '质量控制部' 
AND a.date = '2024-09-25' 
AND a.check_in > '08:30:00';	2850698943
	2860363666
SELECT a.employee_id AS employee_id, e.name AS name, a.award_name AS award_name, pe.rating AS rating FROM awards a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON a.employee_id = pe.employee_id WHERE a.year = 2023 AND pe.rating = 'A+';	3284872060
SELECT e.name AS name FROM employees e JOIN awards a ON e.employee_id = a.employee_id JOIN attendance_records ar ON e.employee_id = ar.employee_id WHERE a.year = 2022 AND a.award_name = '质量改进奖' AND ar.date = '2024-10-04' AND ar.check_in > '09:00:00';	1370529433
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '客户服务部' 
AND a.date = '2024-10-03' 
AND a.check_in > '09:00'::time;	4101493476
SELECT e.name AS name, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '人力资源部' 
AND a.date = '2024-10-02' 
AND a.check_in > '09:00:00';	1724137514
SELECT e.name AS name, pe.rating AS rating FROM awards a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON a.employee_id = pe.employee_id WHERE a.year = 2023 AND pe.rating = 'A+';	3595600525
SELECT DISTINCT d.name AS department_name 
FROM performance_evaluations pe 
JOIN employees e ON pe.employee_id = e.employee_id 
JOIN departments d ON e.department_id = d.department_id 
WHERE pe.evaluation_date = '2023-05-31' 
AND pe.rating = 'A+';	815548435
SELECT e.name AS name, a.check_in AS check_in, pe.rating AS rating FROM attendance_records a JOIN performance_evaluations pe ON a.employee_id = pe.employee_id JOIN employees e ON a.employee_id = e.employee_id WHERE a.date = '2024-10-02' AND a.check_in > '09:00:00' AND pe.rating = 'A+';	2061849622
SELECT a.date AS date, a.check_in AS check_in, a.check_out AS check_out FROM attendance_records a JOIN awards w ON a.employee_id = w.employee_id WHERE w.year = 2021 AND w.award_name = '销售冠军' AND a.date = '2024-09-18';	1250267679
SELECT e.name AS employee_name, d.name AS department_name FROM performance_evaluations pe JOIN employees e ON pe.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE pe.evaluation_date = '2023-05-27' AND pe.rating = 'A+';	1929429344
SELECT e.name AS employee_name, d.name AS department_name FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.date = '2024-09-16' AND a.check_in > '09:00:00';	3689323727
SELECT employees.name AS employee_name, departments.name AS department_name FROM employees INNER JOIN departments ON CAST(employees.department_id AS INTEGER) = departments.id;	2977986068
SELECT 
  id AS id,
  employee_id AS employee_id,
  name AS name,
  birth_date AS birth_date,
  hire_date AS hire_date,
  start_work_date AS start_work_date,
  remaining_annual_leave AS remaining_annual_leave,
  department_id AS department_id,
  position AS position,
  phone_number AS phone_number,
  car_plate AS car_plate,
  university AS university,
  major AS major,
  employee_type AS employee_type
FROM employees
WHERE hire_date = (SELECT MIN(hire_date) FROM employees)
ORDER BY position ASC
LIMIT 1;	3402561235
SELECT e.name AS name FROM employees e JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE e.department_id = 'D00007' AND pe.rating = 'A' AND pe.evaluation_date BETWEEN '2024-01-01' AND '2024-12-31';	3958686389
SELECT e.name AS name
FROM employees e
WHERE e.employee_id IN (
    SELECT employee_id
    FROM awards
    WHERE year = 2022 AND award_name = '创新奖'
)
AND EXISTS (
    SELECT 1
    FROM attendance_records ar
    WHERE ar.employee_id = e.employee_id
    AND ar.date = '2024-10-12'
    AND ar.check_in > '09:00:00'
);	3786147845
SELECT e.name AS employee_name, d.name AS department_name FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.date = '2024-09-23' AND a.check_in > '09:00:00';	1159542995
SELECT COUNT(DISTINCT a.employee_id) AS count FROM awards a JOIN performance_evaluations pe ON a.employee_id = pe.employee_id WHERE a.year = 2023 AND a.award_name = '质量改进奖' AND pe.rating = 'A+';	3254827737
SELECT DISTINCT d.name AS department_name 
FROM attendance_records a 
JOIN employees e ON a.employee_id = e.employee_id 
JOIN departments d ON e.department_id = d.department_id 
WHERE a.date = '2024-09-23' 
AND a.check_in > '08:00:00' 
AND a.check_out < '18:00:00';	3909320290
AMBIGUOUS_QUERY	628072208
SELECT e.name AS name, a.check_in AS check_in FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations p ON a.employee_id = p.employee_id WHERE a.date = '2024-10-12' AND a.check_in < '09:00:00' AND p.rating = 'B+';	3286899081
SELECT e.name AS name, a.check_in AS check_in
FROM attendance_records a
JOIN employees e ON a.employee_id = e.employee_id
JOIN performance_evaluations p ON e.employee_id = p.employee_id
WHERE a.date = '2024-09-20'
AND a.check_in > '09:00:00'
AND p.rating = 'A+';	2517269758
AMBIGUOUS_QUERY	3866100328
SELECT e.name AS employee_name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '客户服务部' 
AND a.date = '2024-09-29' 
AND a.check_in > '08:30:00';	3469101707
SELECT e.name AS employee_name, d.name AS department_name, d.manager_id AS manager_id 
FROM attendance_records a 
JOIN employees e ON a.employee_id = e.employee_id 
JOIN departments d ON e.department_id = d.department_id 
WHERE a.date = '2024-09-16' 
AND a.check_in > '08:30:00';	2797510377
SELECT e.name AS name, e.position AS position, a.check_in AS check_in FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id WHERE a.date = '2024-10-01' AND a.check_in > '09:00:00' AND e.position = '顾问';	2587625643
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in FROM employees e JOIN departments d ON e.department_id = d.department_id JOIN attendance_records a ON e.employee_id = a.employee_id WHERE d.name = '客户服务部' AND a.date = '2024-09-23' AND a.check_in > '09:00:00';	2556819995
SELECT a.year AS year, e.name AS name, a.award_name AS award_name, p.status AS status 
FROM awards a 
JOIN employees e ON a.employee_id = e.employee_id 
LEFT JOIN probation_employees p ON a.employee_id = p.employee_id 
WHERE a.award_name LIKE '%创新%' 
AND a.year >= EXTRACT(YEAR FROM CURRENT_DATE) - 5;	2163155798
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '财务部' 
AND a.date = '2024-10-06' 
AND a.check_in > '09:00'::time;	1599035554
AMBIGUOUS_QUERY	3248411469
SELECT e.name AS employee_name, d.name AS department_name FROM attendance_records ar JOIN employees e ON ar.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE ar.date = '2024-10-04';	2257279104
SELECT a.employee_id AS employee_id, a.award_name AS award_name, pe.rating AS rating, pe.evaluation_date AS evaluation_date
FROM awards a
JOIN performance_evaluations pe ON a.employee_id = pe.employee_id
WHERE a.year = 2023
AND EXTRACT(YEAR FROM pe.evaluation_date) = 2023;	2036213054
SELECT e.name AS employee_name, d.name AS department_name FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.date = '2024-10-10' AND a.check_in > '09:30:00';	2231439732
SELECT e.name AS name, d.name AS department_name, a.check_in AS check_in, a.check_out AS check_out FROM employees e JOIN departments d ON e.department_id = d.department_id JOIN attendance_records a ON e.employee_id = a.employee_id WHERE a.date = '2024-09-19';	1852561007
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '行政部' 
AND a.date = '2024-10-03' 
AND a.check_in > '09:00:00';	3057784484
SELECT d.department_id, AVG(e.remaining_annual_leave) AS avg_remaining_annual_leave 
FROM departments d 
JOIN employees e ON d.department_id = e.department_id 
GROUP BY d.department_id 
ORDER BY avg_remaining_annual_leave DESC 
LIMIT 1;	604055577
SELECT e.name AS name, a.check_in AS check_in, pe.rating AS rating FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON a.employee_id = pe.employee_id WHERE a.date = '2024-09-27' AND a.check_in < '10:00:00' AND pe.rating = 'A+';	1799658813
SELECT interview_date, COUNT(*) AS interview_count FROM interviews WHERE EXTRACT(YEAR FROM interview_date) = 2024 GROUP BY interview_date;	556306212
SELECT e.name AS employee_name, d.name AS department_name FROM attendance_records ar JOIN employees e ON ar.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE ar.date = '2024-09-20' AND ar.check_in > '09:00:00';	3669286537
SELECT e.name AS name, e.employee_id AS employee_id, d.name AS department_name, pe.rating AS rating FROM employees e JOIN departments d ON e.department_id = d.department_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE d.name = '研发部' AND pe.rating = 'B+' AND pe.evaluation_date = '2024-09-29';	1975822937
SELECT a.id AS id, a.employee_id AS employee_id, a.date AS date, a.check_in AS check_in, a.check_out AS check_out FROM attendance_records a JOIN awards w ON a.employee_id = w.employee_id WHERE w.year = 2022 AND w.award_name = '销售冠军' AND a.date = '2024-10-10';	1362951886
SELECT e.name AS name, e.hire_date AS hire_date, a.award_name AS award_name FROM awards a JOIN employees e ON a.employee_id = e.employee_id WHERE a.year = 2023 AND a.award_name = '客户满意度奖' AND e.hire_date > '2020-06-19';	2799760973
SELECT e.name AS name, a.check_in AS check_in, pe.rating AS rating FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON a.employee_id = pe.employee_id WHERE a.date = '2024-09-22' AND a.check_in > '09:00:00' AND pe.rating = 'A+';	1692765210
SELECT DISTINCT d.name AS department_name FROM performance_evaluations pe JOIN employees e ON pe.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE pe.evaluation_date = '2022-06-20' AND pe.rating = 'C';	804998806
SELECT e.name AS name, a.award_name AS award_name, pe.rating AS rating FROM awards a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON a.employee_id = pe.employee_id WHERE a.year = 2024 AND a.award_name = '客户满意度奖' AND pe.rating = 'C';	170694593
SELECT e.name AS name, (SUM(EXTRACT(EPOCH FROM ( (a.date::timestamp + a.check_out::time) - (a.date::timestamp + a.check_in::time) )) / 3600) / COUNT(*)) AS avg_work_hours 
FROM attendance_records a 
JOIN employees e ON a.employee_id = e.employee_id 
WHERE a.employee_id IN (SELECT employee_id FROM awards WHERE year = 2023 AND award_name = '项目管理奖') 
GROUP BY e.employee_id, e.name 
HAVING (SUM(EXTRACT(EPOCH FROM ( (a.date::timestamp + a.check_out::time) - (a.date::timestamp + a.check_in::time) )) / 3600) / COUNT(*)) > 10;	2091607073
SELECT e.name AS employee_name, d.name AS department_name 
FROM performance_evaluations pe 
JOIN employees e ON pe.employee_id = e.employee_id 
JOIN departments d ON e.department_id = d.id::text 
WHERE pe.evaluation_date::date = '2023-03-09' 
AND pe.rating = 'D';	2894384990
AMBIGUOUS_QUERY	1149281173
SELECT e.name AS name, d.name AS department_name, ar.check_in, ar.check_out FROM attendance_records ar JOIN employees e ON ar.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE ar.date = '2024-10-08';	1884200158
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in FROM employees e JOIN departments d ON e.department_id = d.department_id JOIN attendance_records a ON e.employee_id = a.employee_id WHERE a.date = '2024-09-26' AND a.check_in > '09:00' AND d.name = '人力资源部';	2557740373
SELECT e.name AS name, a.check_in AS check_in FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations p ON a.employee_id = p.employee_id WHERE a.date = '2024-09-28' AND a.check_in > '09:00:00' AND p.rating = 'A+';	3799739588
SELECT e.name AS employee_name, a.check_in AS check_in_time FROM employees e JOIN departments d ON e.department_id = d.department_id JOIN attendance_records a ON e.employee_id = a.employee_id WHERE d.name = '研发部' AND a.date = '2024-09-20' AND a.check_in > '09:00:00';	1074403791
SELECT d.name AS department_name, e.name AS employee_name 
FROM attendance_records ar 
JOIN employees e ON ar.employee_id = e.employee_id 
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id 
JOIN departments d ON e.department_id = d.department_id 
WHERE ar.date = '2024-10-13' 
AND ar.check_in > TIME '09:00' 
AND pe.rating = 'A+';	1640643914
SELECT e.name AS name, a.award_name AS award_name, pe.rating AS rating 
FROM employees e 
JOIN awards a ON e.employee_id = a.employee_id 
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id 
WHERE a.year = 2023 
AND a.award_name = '销售冠军' 
AND pe.rating >= 'B';	3875469036
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in, a.check_out AS check_out 
FROM employees e 
JOIN departments d ON e.department_id = d.id::text 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '财务部' 
AND a.date = '2024-09-17' 
AND (TO_TIMESTAMP(a.date::text || ' ' || a.check_out, 'YYYY-MM-DD HH24:MI') - TO_TIMESTAMP(a.date::text || ' ' || a.check_in, 'YYYY-MM-DD HH24:MI')) > INTERVAL '9 hours';	1182082319
SELECT e.name AS employee_name, a.employee_id, a.check_in, d.name AS department_name, d.manager_id AS manager_id FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.date = '2024-09-18' AND a.check_in > '09:00:00';	219564979
SELECT e.name AS name, a.check_in AS check_in FROM employees e JOIN attendance_records a ON e.employee_id = a.employee_id WHERE a.date = '2024-09-23' AND a.check_in > '09:00:00' AND e.employee_id IN (SELECT employee_id FROM awards WHERE year = 2023 AND award_name = '技术突破奖');	2296352057
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in, a.check_out AS check_out 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '运营部' AND a.date = '2024-09-26';	3848854887
SELECT e.name AS name FROM employees e JOIN awards a ON e.employee_id = a.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE a.year = 2020 AND a.award_name = '优秀员工' AND pe.evaluation_date BETWEEN '2023-01-01' AND '2023-12-31' AND pe.rating = 'C';	4144781586
SELECT e.name AS name, a.check_in AS check_in, pe.rating AS rating FROM employees e JOIN attendance_records a ON e.employee_id = a.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE a.date = '2024-10-03' AND pe.rating = 'C' AND a.check_in > '09:00:00';	543593806
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '法务部' 
AND a.date = '2024-10-12' 
AND a.check_in > '09:00:00';	3302179394
AMBIGUOUS_QUERY	1798514231
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in, a.check_out AS check_out FROM employees e JOIN attendance_records a ON e.employee_id = a.employee_id WHERE e.university = '清华大学' AND a.date = '2024-10-12';	2882208186
SELECT e.name AS name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2023
AND a.award_name = '领导力奖'
AND ar.date = '2024-10-01'
AND ar.check_in > '09:00:00';	2752876678
SELECT e.name AS name
FROM employees e
JOIN awards a ON e.employee_id = a.employee_id
JOIN attendance_records ar ON e.employee_id = ar.employee_id
WHERE a.year = 2023
AND a.award_name = '销售冠军'
AND ar.date = '2024-09-22'
AND ar.check_in > '08:00:00';	2550918549
SELECT e.name AS name, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.id::text 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '人力资源部' 
AND a.date = '2024-10-10' 
AND a.check_in > '09:00:00';	2654497153
SELECT e.name AS employee_name, d.name AS department_name FROM performance_evaluations pe JOIN employees e ON pe.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE pe.evaluation_date = '2023-04-20' AND pe.rating = 'D';	776263740
<final>
SELECT 
    (COUNT(*) * 1.0 / (SELECT COUNT(*) FROM employees)) AS award_and_performance_ratio
FROM 
    employees
WHERE 
    employee_id IN (
        SELECT DISTINCT employee_id 
        FROM awards 
        WHERE year >= EXTRACT(YEAR FROM CURRENT_DATE) - 1
    )
    AND employee_id IN (
        SELECT DISTINCT employee_id 
        FROM performance_evaluations 
        WHERE evaluation_date >= CURRENT_DATE - INTERVAL '2 years'
    );
</final>;	1728657056
SELECT e.employee_id AS employee_id, e.name AS name, a.award_name AS award_name, pe.rating AS rating 
FROM employees e 
JOIN awards a ON e.employee_id = a.employee_id 
JOIN performance_evaluations pe ON e.employee_id = pe.employee_id 
WHERE e.hire_date >= '2023-01-01' 
AND e.hire_date < '2024-01-01' 
AND a.year = 2023 
AND a.award_name LIKE '%优秀员工%' 
AND pe.evaluation_date >= '2023-01-01' 
AND pe.evaluation_date < '2024-01-01' 
AND pe.rating = 'A+';	4069271992
SELECT e.name AS name, a.check_in AS check_in 
FROM departments d 
JOIN employees e ON d.department_id = e.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '客户服务部' 
AND a.date = '2024-09-21' 
AND a.check_in > '09:00:00';	2408826226
AMBIGUOUS_QUERY	2252548426
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.id::text 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '客户服务部' 
AND a.date = '2024-09-15' 
AND a.check_in > '09:00:00';	141603518
SELECT e.name AS name, a.date AS date, a.check_in AS check_in FROM awards aw JOIN employees e ON aw.employee_id = e.employee_id JOIN attendance_records a ON e.employee_id = a.employee_id WHERE aw.year = 2021 AND aw.award_name = '创新奖' AND a.date = '2024-10-05' AND a.check_in > '09:00';	3509550647
SELECT e.name AS name, a.award_name AS award_name, pe.rating AS rating FROM awards a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE a.year = 2024 AND pe.rating = 'C';	102704152
SELECT e.name AS name, a.award_name AS award_name, pe.rating AS rating FROM awards a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON a.employee_id = pe.employee_id WHERE a.year = 2024 AND a.award_name = '领导力奖' AND pe.rating = 'C';	4066261878
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE d.name = '质量控制部' 
AND a.date = '2024-09-19' 
AND a.check_in > '09:00:00';	7133946
SELECT e.name FROM employees e JOIN awards a ON e.employee_id = a.employee_id JOIN attendance_records ar ON e.employee_id = ar.employee_id WHERE a.year = 2024 AND a.award_name = '项目管理奖' AND ar.date = '2024-09-23';	2339648
AMBIGUOUS_QUERY	1476916008
SELECT e.name AS employee_name, d.name AS department_name, d.manager_id AS manager_id FROM attendance_records a JOIN employees e ON a.employee_id = e.employee_id JOIN departments d ON e.department_id = d.department_id WHERE a.date = '2024-09-26' AND a.check_in > TIME '09:30:00';	2848971755
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in 
FROM employees e 
JOIN attendance_records a ON e.employee_id = a.employee_id 
WHERE e.university = '清华大学' 
AND a.date = '2024-10-03' 
AND a.check_in > '09:00';	1510555187
<final>
SELECT e.name AS name, e.employee_id AS employee_id, a.check_in AS check_in, a.check_out AS check_out
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN attendance_records a ON e.employee_id = a.employee_id
WHERE d.name = '研发部'
AND a.date = '2024-10-01'
AND EXTRACT(EPOCH FROM (a.check_out - a.check_in)) / 3600 > 10;
</final>;	1954114065
SELECT e.name AS name, a.award_name AS award_name, pe.rating AS rating FROM awards a JOIN employees e ON a.employee_id = e.employee_id JOIN performance_evaluations pe ON e.employee_id = pe.employee_id WHERE a.year = 2023 AND a.award_name = '优秀员工' AND pe.evaluation_date BETWEEN '2023-01-01' AND '2023-12-31';	3968556416
ERROR: LLM 请求失败	2192717523
ERROR: LLM 请求失败	747211607
ERROR: LLM 请求失败	218132520
ERROR: LLM 请求失败	175056471
ERROR: LLM 请求失败	334027216
ERROR: LLM 请求失败	3272129262
ERROR: LLM 请求失败	2889578956
AMBIGUOUS_QUERY	88302712
ERROR: LLM 请求失败	1348647978
ERROR: LLM 请求失败	1016905624
ERROR: LLM 请求失败	3611732895
ERROR: LLM 请求失败	1319754722
ERROR: LLM 请求失败	2123954700
ERROR: LLM 请求失败	4161720938
ERROR: LLM 请求失败	1485816909
AMBIGUOUS_QUERY	864749016
ERROR: LLM 请求失败	3380354553
ERROR: LLM 请求失败	146146439
ERROR: LLM 请求失败	2245911258
ERROR: LLM 请求失败	904046704
ERROR: LLM 请求失败	2037290745
ERROR: LLM 请求失败	1073845704
ERROR: LLM 请求失败	1970903262
ERROR: LLM 请求失败	2098164166
ERROR: LLM 请求失败	3382000879
AMBIGUOUS_QUERY	2579167658
ERROR: LLM 请求失败	1454085576
ERROR: LLM 请求失败	1846154246
ERROR: LLM 请求失败	3291969349
AMBIGUOUS_QUERY	3977283654
ERROR: LLM 请求失败	2512363543
ERROR: LLM 请求失败	4035425926
AMBIGUOUS_QUERY	82349614
ERROR: LLM 请求失败	3816528329
ERROR: LLM 请求失败	3967240206
AMBIGUOUS_QUERY	2555762315
ERROR: LLM 请求失败	1472446382
ERROR: LLM 请求失败	837468015
ERROR: LLM 请求失败	3614707278
ERROR: LLM 请求失败	3381297740
AMBIGUOUS_QUERY	3209601254
ERROR: LLM 请求失败	1181974520
ERROR: LLM 请求失败	4290316983
ERROR: LLM 请求失败	4121525980
ERROR: LLM 请求失败	1634196262
ERROR: LLM 请求失败	2019378478
ERROR: LLM 请求失败	522536270
ERROR: LLM 请求失败	126227619
AMBIGUOUS_QUERY	2456368123
ERROR: LLM 请求失败	1564372003
AMBIGUOUS_QUERY	2160477527
ERROR: LLM 请求失败	1462437870
ERROR: LLM 请求失败	4083934626
AMBIGUOUS_QUERY	2872120818
ERROR: LLM 请求失败	1283326851
ERROR: LLM 请求失败	531921010
ERROR: LLM 请求失败	1418289021
ERROR: LLM 请求失败	137242606
AMBIGUOUS_QUERY	2672242323
ERROR: LLM 请求失败	2845015839
ERROR: LLM 请求失败	1582007502
ERROR: LLM 请求失败	283689317
AMBIGUOUS_QUERY	1594346019
ERROR: LLM 请求失败	3342713409
ERROR: LLM 请求失败	842726032
ERROR: LLM 请求失败	236915033
AMBIGUOUS_QUERY	4229311898
ERROR: LLM 请求失败	258690623
AMBIGUOUS_QUERY	3376193292
ERROR: LLM 请求失败	116553538
AMBIGUOUS_QUERY	646950911
AMBIGUOUS_QUERY	109259315
ERROR: LLM 请求失败	2700778328
ERROR: LLM 请求失败	4212764935
ERROR: LLM 请求失败	4269406178
ERROR: LLM 请求失败	1128360712
ERROR: LLM 请求失败	2724005771
ERROR: LLM 请求失败	3382134012
AMBIGUOUS_QUERY	1545912595
ERROR: LLM 请求失败	2397640501
ERROR: LLM 请求失败	561955406
ERROR: LLM 请求失败	1986127383
ERROR: LLM 请求失败	1657316021
AMBIGUOUS_QUERY	2162181589
ERROR: LLM 请求失败	2307971258
ERROR: LLM 请求失败	2557946358
ERROR: LLM 请求失败	3214990589
ERROR: LLM 请求失败	140188268
AMBIGUOUS_QUERY	2839950527
AMBIGUOUS_QUERY	2833646672
AMBIGUOUS_QUERY	508839263
AMBIGUOUS_QUERY	3720034566
ERROR: LLM 请求失败	1167041688
ERROR: LLM 请求失败	1532873158
ERROR: LLM 请求失败	2367133121
ERROR: LLM 请求失败	2982430979
ERROR: LLM 请求失败	4126585093
AMBIGUOUS_QUERY	1577554550
ERROR: LLM 请求失败	1654794343
ERROR: LLM 请求失败	2092588313
AMBIGUOUS_QUERY	2021025668
ERROR: LLM 请求失败	891116215
AMBIGUOUS_QUERY	3533102799
ERROR: LLM 请求失败	2160175524
ERROR: LLM 请求失败	305358980
ERROR: LLM 请求失败	3219483220
ERROR: LLM 请求失败	3553634354
ERROR: LLM 请求失败	1610907085
ERROR: LLM 请求失败	1410414363
ERROR: LLM 请求失败	3954115529
ERROR: LLM 请求失败	1086674624
ERROR: LLM 请求失败	1680159550
ERROR: LLM 请求失败	2548352227
ERROR: LLM 请求失败	1833243393
ERROR: LLM 请求失败	3824204712
ERROR: LLM 请求失败	3260667731
ERROR: LLM 请求失败	732762958
AMBIGUOUS_QUERY	330418458
AMBIGUOUS_QUERY	245397134
ERROR: LLM 请求失败	2669572809
ERROR: LLM 请求失败	2085255506
ERROR: LLM 请求失败	1984536651
ERROR: LLM 请求失败	258245311
ERROR: LLM 请求失败	1895651034
ERROR: LLM 请求失败	134489693
ERROR: LLM 请求失败	2899938404
ERROR: LLM 请求失败	1614542471
AMBIGUOUS_QUERY	2860028194
ERROR: LLM 请求失败	2112082105
ERROR: LLM 请求失败	1900105170
ERROR: LLM 请求失败	3724611031
ERROR: LLM 请求失败	3179484363
AMBIGUOUS_QUERY	3200437107
ERROR: LLM 请求失败	2071923254
ERROR: LLM 请求失败	3565838054
ERROR: LLM 请求失败	1893298039
ERROR: LLM 请求失败	2315630941
ERROR: LLM 请求失败	870110560
ERROR: LLM 请求失败	1308562229
ERROR: LLM 请求失败	1986404179
ERROR: LLM 请求失败	2032902123
ERROR: LLM 请求失败	3109098948
ERROR: LLM 请求失败	188271146
ERROR: LLM 请求失败	7209425
ERROR: LLM 请求失败	1065176696
ERROR: LLM 请求失败	953680810
ERROR: LLM 请求失败	2393859347
ERROR: LLM 请求失败	749612150
ERROR: LLM 请求失败	3260359700
AMBIGUOUS_QUERY	2869045188
ERROR: LLM 请求失败	2139894777
AMBIGUOUS_QUERY	2426521027
AMBIGUOUS_QUERY	3310012060
AMBIGUOUS_QUERY	1454101538
ERROR: LLM 请求失败	1355579742
ERROR: LLM 请求失败	2730549341
ERROR: LLM 请求失败	1021718263
ERROR: LLM 请求失败	405520388
ERROR: LLM 请求失败	1969682603
ERROR: LLM 请求失败	797442197
AMBIGUOUS_QUERY	3086691704
ERROR: LLM 请求失败	1652118460
ERROR: LLM 请求失败	729818388
AMBIGUOUS_QUERY	3319537046
ERROR: LLM 请求失败	981960336
ERROR: LLM 请求失败	446364127
ERROR: LLM 请求失败	1464013698
ERROR: LLM 请求失败	2417924945
ERROR: LLM 请求失败	3366689482
AMBIGUOUS_QUERY	3973811473
AMBIGUOUS_QUERY	1905559813
ERROR: LLM 请求失败	6017603
ERROR: LLM 请求失败	2286869285
ERROR: LLM 请求失败	1590803091
AMBIGUOUS_QUERY	3414285101
ERROR: LLM 请求失败	3246518573
ERROR: LLM 请求失败	104815069
ERROR: LLM 请求失败	3801446621
ERROR: LLM 请求失败	368801370
ERROR: LLM 请求失败	852089580
ERROR: LLM 请求失败	1377442693
ERROR: LLM 请求失败	2349708736
AMBIGUOUS_QUERY	3911124385
ERROR: LLM 请求失败	3773516021
AMBIGUOUS_QUERY	1642595147
AMBIGUOUS_QUERY	2547804030
AMBIGUOUS_QUERY	1574302461
ERROR: LLM 请求失败	576649992
ERROR: LLM 请求失败	278921693
ERROR: LLM 请求失败	2923698873
AMBIGUOUS_QUERY	2256662449
ERROR: LLM 请求失败	956063573
ERROR: LLM 请求失败	568233943
ERROR: LLM 请求失败	665248378
ERROR: LLM 请求失败	1030650241
ERROR: LLM 请求失败	1979307069
AMBIGUOUS_QUERY	645950570
ERROR: LLM 请求失败	3312818819
ERROR: LLM 请求失败	527420496
ERROR: LLM 请求失败	2918505586
ERROR: LLM 请求失败	1280121870
ERROR: LLM 请求失败	2006837077
AMBIGUOUS_QUERY	938785076
ERROR: LLM 请求失败	182531082
ERROR: LLM 请求失败	1098966204
ERROR: LLM 请求失败	2906434348
ERROR: LLM 请求失败	4018894094
ERROR: LLM 请求失败	2317494329
ERROR: LLM 请求失败	2459941756
ERROR: LLM 请求失败	627241378
ERROR: LLM 请求失败	3818857737
ERROR: LLM 请求失败	1788527678
ERROR: LLM 请求失败	1240825133
ERROR: LLM 请求失败	1225880496
ERROR: LLM 请求失败	1895296880
ERROR: LLM 请求失败	1454533076
ERROR: LLM 请求失败	3316681947
AMBIGUOUS_QUERY	2982717712
AMBIGUOUS_QUERY	279794629
AMBIGUOUS_QUERY	2733048479
ERROR: LLM 请求失败	1486729335
ERROR: LLM 请求失败	760463294
ERROR: LLM 请求失败	84990606
ERROR: LLM 请求失败	2524485514
AMBIGUOUS_QUERY	3030054295
ERROR: LLM 请求失败	2842932086
ERROR: LLM 请求失败	2650630480
AMBIGUOUS_QUERY	3532447015
ERROR: LLM 请求失败	2513228683
AMBIGUOUS_QUERY	3023054014
AMBIGUOUS_QUERY	252107871
ERROR: LLM 请求失败	2902085248
SELECT 
    e.name AS name,
    e.position AS position,
    s.store_name AS store_name,
    SUM(so.total_amount) AS total_amount
FROM 
    salesorders so
JOIN 
    employees e ON so.employee_id = e.employee_id
JOIN 
    stores s ON so.store_id = s.store_id
WHERE 
    so.order_date = '2023-05-05'
    AND s.store_name = '数码广场店'
GROUP BY 
    e.employee_id, s.store_id
HAVING 
    SUM(so.total_amount) > 7000;	1743968577
AMBIGUOUS_QUERY	3620145899
	2283742907
SELECT DISTINCT p.product_name AS product_name, p.supplier_name AS supplier_name 
FROM products p 
JOIN orderdetails od ON p.product_id = od.product_id 
JOIN salesorders so ON od.order_id = so.order_id 
JOIN stores st ON so.store_id = st.store_id 
WHERE st.store_name = '电子城旗舰店';	3238938312
SELECT s.store_name AS store_name, e.name AS employee_name, e.position AS position FROM salesorders so JOIN orderdetails od ON so.order_id = od.order_id JOIN products p ON od.product_id = p.product_id JOIN employees e ON so.employee_id = e.employee_id JOIN stores s ON so.store_id = s.store_id WHERE so.order_date = '2023-05-09' AND p.product_name = 'iPad Air';	2878333594
SELECT s.store_name AS store_name, s.manager_name AS manager_name 
FROM salesorders o 
JOIN stores s ON o.store_id = s.store_id 
WHERE o.order_date = '2023-05-05' 
GROUP BY s.store_id, s.store_name, s.manager_name 
HAVING SUM(o.total_amount) > 10000;	754309478
SELECT e.name AS name, SUM(so.total_amount) AS total_amount FROM salesorders so JOIN employees e ON so.employee_id = e.employee_id WHERE so.order_date = '2023-05-07' GROUP BY e.employee_id HAVING SUM(so.total_amount) > 10000;	711957819
SELECT s.store_name AS store_name, e.name AS employee_name, SUM(ss.profit) AS total_profit 
FROM salesstatistics ss 
JOIN stores s ON ss.store_id = s.store_id 
JOIN employees e ON ss.employee_id = e.employee_id 
JOIN products p ON ss.product_id = p.product_id 
WHERE p.product_name = '索尼WH-1000XM4' 
AND ss.date BETWEEN '2023-05-01' AND '2023-05-31' 
GROUP BY s.store_id, e.employee_id 
HAVING SUM(ss.profit) > 5000;	1769127756
SELECT e.employee_id AS employee_id, e.name AS name FROM employees e JOIN salesorders so ON e.employee_id = so.employee_id JOIN orderdetails od ON so.order_id = od.order_id JOIN products p ON od.product_id = p.product_id WHERE p.product_name = 'Nintendo Switch' AND so.order_date BETWEEN '2023-05-01' AND '2023-05-31' AND so.total_amount > 5000;	435444064
	2637911653
SELECT orderdetails.order_detail_id AS order_detail_id, products.product_name AS product_name, salesorders.total_amount AS total_amount FROM orderdetails JOIN products ON orderdetails.product_id = products.product_id JOIN salesorders ON orderdetails.order_id = salesorders.order_id;	424774041
SELECT employees.name AS name, stores.store_name AS store_name FROM employees JOIN stores ON employees.store_id = stores.store_id;	1958922267
AMBIGUOUS_QUERY	1850407582
SELECT salesorders.order_id AS order_id, employees.name AS name FROM salesorders JOIN employees ON salesorders.employee_id = employees.employee_id WHERE salesorders.total_amount > 7000;	3887504470
	3068871934
AMBIGUOUS_QUERY	2869270561
SELECT order_id AS order_id, store_id AS store_id, employee_id AS employee_id, order_date AS order_date, total_amount AS total_amount FROM salesorders WHERE order_id = 'b8b62bfe-a35d-4ff5-9bc9-654b5f67fed2';	3219161296
SELECT e.name, SUM(so.total_amount) AS total_sales FROM employees e JOIN salesorders so ON e.employee_id = so.employee_id GROUP BY e.employee_id;	4084880534
SELECT product_name AS product_name, sale_price AS sale_price, purchase_price AS purchase_price FROM products;	758163770
SELECT e.name AS employee_name, s.manager_name AS store_manager_name 
FROM salesorders so 
JOIN employees e ON so.employee_id = e.employee_id 
JOIN stores s ON e.store_id = s.store_id 
WHERE so.order_date BETWEEN '2023-05-01' AND '2023-05-31' 
GROUP BY e.employee_id, s.manager_name 
HAVING SUM(so.total_amount) > 10000;	2553064409
AMBIGUOUS_QUERY	2558715347
SELECT s.store_name AS store_name, e.name AS employee_name, p.product_name AS product_name, ss.profit AS profit FROM salesstatistics ss JOIN stores s ON ss.store_id = s.store_id JOIN employees e ON ss.employee_id = e.employee_id JOIN products p ON ss.product_id = p.product_id WHERE ss.date = '2023-05-07' AND p.product_name = 'Apple Watch Series 7';	2334672967
SELECT s.store_name AS store_name, s.manager_name AS manager_name 
FROM stores s 
WHERE s.store_id IN (
    SELECT so.store_id 
    FROM salesorders so 
    WHERE so.order_date = '2023-05-05' 
    AND EXISTS (
        SELECT 1 
        FROM orderdetails od 
        JOIN products p ON od.product_id = p.product_id 
        WHERE od.order_id = so.order_id 
        AND p.sale_price > 5000
    ) 
    GROUP BY so.store_id 
    HAVING SUM(so.total_amount) > 10000
);	3673770320
SELECT od.order_detail_id AS order_detail_id, p.product_name AS product_name, od.quantity AS quantity FROM orderdetails od JOIN products p ON od.product_id = p.product_id;	1434650665
SELECT order_id AS order_id, store_id AS store_id, employee_id AS employee_id, order_date AS order_date, total_amount AS total_amount FROM salesorders WHERE store_id = '0887d06a-27a8-46b4-98d6-514702e698da';	4072489559
SELECT s.employee_id AS employee_id, e.name AS name FROM (SELECT employee_id, SUM(sales_quantity) AS sales_statistic_quantity FROM salesstatistics WHERE date BETWEEN '2023-05-01' AND '2023-05-31' GROUP BY employee_id) s JOIN employees e ON s.employee_id = e.employee_id LEFT JOIN (SELECT e2.employee_id, SUM(od.quantity) AS order_details_quantity FROM orderdetails od JOIN salesorders so ON od.order_id = so.order_id JOIN employees e2 ON so.employee_id = e2.employee_id WHERE so.order_date BETWEEN '2023-05-01' AND '2023-05-31' GROUP BY e2.employee_id) o ON s.employee_id = o.employee_id WHERE s.sales_statistic_quantity > COALESCE(o.order_details_quantity, 0);	3987499786
<final>
SELECT 
    stores.store_name AS store_name,
    employees.name AS employee_name,
    SUM(salesorders.total_amount) AS total_sales_amount
FROM 
    products
JOIN 
    orderdetails ON products.product_id = orderdetails.product_id
JOIN 
    salesorders ON orderdetails.order_id = salesorders.order_id
JOIN 
    stores ON salesorders.store_id = stores.store_id
JOIN 
    employees ON salesorders.employee_id = employees.employee_id
WHERE 
    products.product_name = 'iPad Air'
    AND salesorders.order_date = '2023-05-01'
GROUP BY 
    stores.store_id, employees.employee_id;
</final>;	3272650586
AMBIGUOUS_QUERY	1170763492
SELECT s.store_name, s.manager_name, SUM(so.total_amount) AS total_sales 
FROM salesorders so 
JOIN stores s ON so.store_id = s.store_id 
WHERE EXTRACT(MONTH FROM so.order_date) = 5 AND EXTRACT(YEAR FROM so.order_date) = 2023 
GROUP BY s.store_id, s.store_name, s.manager_name 
ORDER BY total_sales DESC 
LIMIT 1;	3307597619
SELECT e.name AS name, e.position AS position, s.store_name AS store_name, p.product_name AS product_name, SUM(od.quantity) AS sales_quantity 
FROM salesorders so 
JOIN orderdetails od ON so.order_id = od.order_id 
JOIN products p ON od.product_id = p.product_id 
JOIN employees e ON so.employee_id = e.employee_id 
JOIN stores s ON so.store_id = s.store_id 
WHERE so.order_date = '2023-05-03' 
AND p.product_name = 'iPhone 13' 
AND s.store_name LIKE '%数码广场%' 
GROUP BY e.name, e.position, s.store_name, p.product_name 
HAVING SUM(od.quantity) > 1;	2824509879
AMBIGUOUS_QUERY	348511856
SELECT 
    s.store_name AS store_name,
    e.name AS employee_name,
    so.total_amount AS total_amount
FROM 
    salesorders so
JOIN 
    orderdetails od ON so.order_id = od.order_id
JOIN 
    products p ON od.product_id = p.product_id
JOIN 
    stores s ON so.store_id = s.store_id
JOIN 
    employees e ON so.employee_id = e.employee_id
WHERE 
    p.product_name = '索尼WH-1000XM4'
    AND so.order_date = '2023-05-01'
    AND so.total_amount > 8000;	3403500771
AMBIGUOUS_QUERY	1837973022
AMBIGUOUS_QUERY	1041289855
SELECT DISTINCT e.name AS employee_name, s.store_name AS store_name 
FROM salesorders so 
JOIN employees e ON so.employee_id = e.employee_id 
JOIN stores s ON so.store_id = s.store_id 
JOIN orderdetails od ON so.order_id = od.order_id 
JOIN products p ON od.product_id = p.product_id 
WHERE so.order_date = '2023-05-06' 
AND p.product_name = 'Apple Watch Series 7';	2902800338
AMBIGUOUS_QUERY	2465572579
SELECT DISTINCT e.name AS employee_name, p.category_name AS product_category
FROM salesorders s
JOIN employees e ON s.employee_id = e.employee_id
JOIN orderdetails od ON s.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE s.order_date BETWEEN '2023-05-01' AND '2023-05-31'
AND s.total_amount > 10000;	4232056788
SELECT e.name AS employee_name, s.store_name AS store_name, SUM(so.total_amount) AS total_amount FROM employees e JOIN stores s ON e.store_id = s.store_id JOIN salesorders so ON e.store_id = so.store_id GROUP BY e.employee_id, s.store_id, s.store_name;	3813879652
SELECT s.store_name, s.manager_name, SUM(so.total_amount) AS total_sales_amount FROM salesorders so JOIN stores s ON so.store_id = s.store_id WHERE so.order_date BETWEEN '2023-05-01' AND '2023-05-31' GROUP BY s.store_id, s.store_name, s.manager_name;	1308038325
SELECT p.product_name, SUM(od.quantity) AS total_quantity FROM orderdetails od JOIN salesorders so ON od.order_id = so.order_id JOIN products p ON od.product_id = p.product_id WHERE so.order_date >= '2023-05-01' AND so.order_date < '2023-06-01' GROUP BY p.product_id HAVING SUM(od.quantity) > 5;	3746071071
AMBIGUOUS_QUERY	2561670271
SELECT s.store_name AS store_name, s.manager_name AS sales_manager_name, ss.profit AS profit 
FROM salesstatistics ss 
JOIN stores s ON ss.store_id = s.store_id 
JOIN products p ON ss.product_id = p.product_id 
WHERE p.product_name = '佳能EOS R6' 
AND ss.date = '2023-05-01';	3159630797
SELECT store_name AS store_name, phone AS phone, address AS address FROM stores;	4216280203
SELECT so.order_id AS order_id, p.product_name AS product_name FROM salesorders so JOIN orderdetails od ON so.order_id = od.order_id JOIN products p ON od.product_id = p.product_id WHERE so.total_amount < 5000;	731373976
<final>
SELECT 
    st.store_name AS store_name,
    e.name AS employee_name,
    SUM(s.sales_quantity) AS total_sales_quantity,
    SUM(s.profit) AS total_profit
FROM salesstatistics s
JOIN employees e ON s.employee_id = e.employee_id
JOIN stores st ON s.store_id = st.store_id
WHERE s.date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY st.store_id, e.employee_id
ORDER BY total_sales_quantity DESC
LIMIT 1;
</final>;	170942591
SELECT s.store_name, SUM(ss.profit) AS total_profit 
FROM salesstatistics ss 
JOIN stores s ON ss.store_id = s.store_id 
WHERE ss.product_id IN (SELECT product_id FROM products WHERE product_name = '小米电视4A') 
AND ss.date BETWEEN '2023-05-01' AND '2023-05-31' 
GROUP BY s.store_id, s.store_name;	3730467553
<final>
SELECT 
    e.name AS employee_name,
    SUM(s.profit) AS total_profit
FROM 
    salesstatistics s
JOIN 
    stores st ON s.store_id = st.store_id
JOIN 
    products p ON s.product_id = p.product_id
JOIN 
    employees e ON s.employee_id = e.employee_id
WHERE 
    st.store_name = '智慧街店'
    AND p.product_name = '小米电视4A'
    AND s.date = '2023-05-06'
GROUP BY 
    e.employee_id;
</final>;	2909047140
AMBIGUOUS_QUERY	2998787786
SELECT s.store_name AS store_name, s.manager_name AS manager_name FROM stores s JOIN (SELECT store_id FROM salesstatistics WHERE date = '2023-05-08' GROUP BY store_id HAVING SUM(profit) > 1000) sub ON s.store_id = sub.store_id;	3020408935
SELECT p.category_name, SUM(od.quantity) AS total_sales FROM orderdetails od JOIN products p ON od.product_id = p.product_id GROUP BY p.category_name;	3729612424
AMBIGUOUS_QUERY	1558062721
SELECT order_id FROM salesorders WHERE total_amount > (SELECT AVG(total_amount) FROM salesorders);	3748358677
AMBIGUOUS_QUERY	281510090
SELECT employees.name AS name, salesorders.order_date AS order_date, salesorders.total_amount AS total_amount FROM employees JOIN salesorders ON employees.employee_id = salesorders.employee_id;	930082852
SELECT e.name, SUM(so.total_amount) AS total_sales FROM salesorders so JOIN employees e ON so.employee_id = e.employee_id GROUP BY e.employee_id;	874677465
SELECT e.name, SUM(ss.sales_quantity) AS total_sales_quantity, SUM(ss.profit) AS total_profit FROM salesstatistics ss JOIN employees e ON ss.employee_id = e.employee_id GROUP BY e.employee_id;	1675790879
SELECT DISTINCT s.store_name AS store_name
FROM stores s
JOIN salesorders so ON s.store_id = so.store_id
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE p.product_name = '佳能EOS R6'
AND so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
AND so.total_amount > 10000;	1635802249
SELECT s.store_name AS store_name, s.manager_name AS manager_name, ds.total_sales AS total_sales 
FROM stores s 
JOIN (
    SELECT store_id, SUM(total_amount) AS total_sales 
    FROM salesorders 
    WHERE order_date = '2023-05-05' 
    GROUP BY store_id 
    ORDER BY total_sales DESC 
    LIMIT 1
) ds ON s.store_id = ds.store_id;	2425848754
SELECT s.store_name, COALESCE(SUM(ss.sales_quantity), 0) AS total_quantity, COALESCE(SUM(ss.sales_amount), 0) AS total_amount FROM stores s LEFT JOIN salesstatistics ss ON s.store_id = ss.store_id GROUP BY s.store_name;	2746220287
AMBIGUOUS_QUERY	4181874210
AMBIGUOUS_QUERY	1518878415
AMBIGUOUS_QUERY	729031894
SELECT s.store_name, ss.date, SUM(ss.sales_amount) AS sales_amount FROM salesstatistics ss JOIN stores s ON ss.store_id = s.store_id GROUP BY ss.store_id, ss.date, s.store_name;	415457057
AMBIGUOUS_QUERY	2711834209
SELECT s.store_name, s.manager_name, SUM(so.total_amount) AS total_sales FROM salesorders so JOIN stores s ON so.store_id = s.store_id WHERE so.order_date = '2023-05-09' GROUP BY s.store_id HAVING SUM(so.total_amount) > 10000;	1625040088
AMBIGUOUS_QUERY	3394370453
SELECT s.store_name AS store_name, s.manager_name AS manager_name FROM salesorders so JOIN stores s ON so.store_id = s.store_id WHERE so.order_date = '2023-05-09' GROUP BY s.store_id HAVING SUM(so.total_amount) > 1000;	1323956071
SELECT e.name AS employee_name, p.category_name AS product_category 
FROM salesorders s 
JOIN employees e ON s.employee_id = e.employee_id 
JOIN orderdetails od ON s.order_id = od.order_id 
JOIN products p ON od.product_id = p.product_id 
WHERE s.order_date BETWEEN '2023-05-01' AND '2023-05-31' 
AND s.total_amount > 10000;	3696477446
SELECT s.store_name, SUM(ss.profit) AS total_profit FROM salesstatistics ss JOIN stores s ON ss.store_id = s.store_id GROUP BY s.store_name;	4263762934
	1452830768
SELECT s.order_id AS order_id, s.total_amount AS total_amount, od.product_id AS product_id, od.quantity AS quantity FROM salesorders s INNER JOIN orderdetails od ON s.order_id = od.order_id WHERE s.total_amount > 5000;	4210000185
AMBIGUOUS_QUERY	2309159488
SELECT s.sales_quantity AS sales_quantity, st.store_name AS store_name FROM salesstatistics s JOIN stores st ON s.store_id = st.store_id WHERE s.date BETWEEN '2023-05-01' AND '2023-05-31';	3856696435
SELECT product_name AS product_name, sale_price AS sale_price, purchase_price AS purchase_price FROM products;	3385775144
SELECT s.store_name, SUM(ss.sales_quantity) AS total_sales_quantity 
FROM salesstatistics ss 
JOIN products p ON ss.product_id = p.product_id 
JOIN stores s ON ss.store_id = s.store_id 
WHERE ss.date >= '2023-05-01' 
AND ss.date < '2023-06-01' 
AND p.category_name = '智能手表' 
AND p.supplier_name = '索尼官方旗舰店' 
GROUP BY s.store_id 
HAVING SUM(ss.sales_quantity) > 10;	898352649
SELECT s.store_name AS store_name, s.manager_name AS manager_name, AVG(so.total_amount) AS avg_order_amount 
FROM stores s 
JOIN salesorders so ON s.store_id = so.store_id 
WHERE so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY s.store_id, s.store_name, s.manager_name
HAVING AVG(so.total_amount) > 10000;	1057968799
SELECT s.store_name AS store_name, e.name AS employee_name, p.product_name AS product_name, ss.sales_quantity AS sales_quantity, ss.sales_amount AS sales_amount, ss.profit AS profit FROM salesstatistics ss JOIN stores s ON ss.store_id = s.store_id JOIN employees e ON ss.employee_id = e.employee_id JOIN products p ON ss.product_id = p.product_id WHERE ss.date = '2023-05-02' AND p.product_name = 'iPad Air';	1042797521
AMBIGUOUS_QUERY	2349214824
SELECT st.store_name AS store_name, sub.total_sales_quantity AS total_sales_quantity, sub.total_sales_amount AS total_sales_amount FROM (SELECT s.store_id, SUM(od.quantity) AS total_sales_quantity, SUM(od.quantity * od.unit_price) AS total_sales_amount FROM salesorders s JOIN orderdetails od ON s.order_id = od.order_id WHERE s.order_date BETWEEN '2023-05-01' AND '2023-05-31' GROUP BY s.store_id) AS sub JOIN stores st ON sub.store_id = st.store_id ORDER BY sub.total_sales_quantity DESC LIMIT 1;	1437353225
SELECT s.store_name AS store_name, e.name AS employee_name, SUM(so.total_amount) AS total_sales_amount FROM orderdetails od JOIN products p ON od.product_id = p.product_id JOIN salesorders so ON od.order_id = so.order_id JOIN employees e ON so.employee_id = e.employee_id JOIN stores s ON so.store_id = s.store_id WHERE p.product_name = 'Apple Watch Series 7' AND so.order_date = '2023-05-09' GROUP BY s.store_name, e.name;	2159290753
SELECT quantity AS sales_quantity, unit_price AS unit_price FROM orderdetails;	3028653636
SELECT s.store_name AS store_name, e.name AS employee_name, e.position AS position FROM salesorders so JOIN stores s ON so.store_id = s.store_id JOIN employees e ON so.employee_id = e.employee_id JOIN orderdetails od ON so.order_id = od.order_id JOIN products p ON od.product_id = p.product_id WHERE p.product_name = 'Nintendo Switch' AND so.order_date BETWEEN '2023-05-01' AND '2023-05-31';	699540097
SELECT statistic_id AS statistic_id, store_id AS store_id, product_id AS product_id, employee_id AS employee_id, date AS date, sales_quantity AS sales_quantity, sales_amount AS sales_amount, profit AS profit FROM salesstatistics WHERE sales_quantity > 1;	1931659377
SELECT s.store_name, SUM(ss.profit) AS total_profit 
FROM salesstatistics ss 
JOIN products p ON ss.product_id = p.product_id 
JOIN stores s ON ss.store_id = s.store_id 
WHERE p.product_name = 'Nintendo Switch' 
AND ss.date BETWEEN '2023-05-01' AND '2023-05-31' 
GROUP BY s.store_id, s.store_name;	3746361325
SELECT order_date, total_amount AS total_sales FROM salesorders;	716876897
SELECT s.store_name, SUM(so.total_amount) AS total_sales, SUM(od.quantity) AS total_orders FROM salesorders so JOIN stores s ON so.store_id = s.store_id JOIN orderdetails od ON so.order_id = od.order_id GROUP BY s.store_id, s.store_name;	2607128675
SELECT order_detail_id AS order_detail_id, order_id AS order_id, product_id AS product_id, quantity AS quantity, unit_price AS unit_price FROM orderdetails WHERE quantity = 2;	285217611
SELECT s.store_name AS store_name, e.name AS employee_name, e.position AS position FROM salesorders so JOIN orderdetails od ON so.order_id = od.order_id JOIN products p ON od.product_id = p.product_id JOIN stores s ON so.store_id = s.store_id JOIN employees e ON so.employee_id = e.employee_id WHERE p.product_name = '戴尔灵越15' AND so.order_date = '2023-05-01';	780164755
SELECT e.name AS name, e.position AS position, s.store_name AS store_name FROM employees e JOIN stores s ON e.store_id = s.store_id;	936656745
SELECT 
    s.store_name AS store_name,
    e.name AS employee_name,
    SUM(ss.profit) AS total_profit
FROM 
    salesstatistics ss
JOIN 
    products p ON ss.product_id = p.product_id
JOIN 
    stores s ON ss.store_id = s.store_id
JOIN 
    employees e ON ss.employee_id = e.employee_id
WHERE 
    ss.date = '2023-05-03'
    AND p.product_name = '佳能EOS R6'
GROUP BY 
    s.store_id, e.employee_id, s.store_name, e.name;	1245782625
AMBIGUOUS_QUERY	1283619082
SELECT stores.store_name AS store_name, employees.name AS employee_name, SUM(orderdetails.quantity) AS sales_quantity 
FROM orderdetails 
JOIN salesorders ON orderdetails.order_id = salesorders.order_id 
JOIN products ON orderdetails.product_id = products.product_id 
JOIN stores ON salesorders.store_id = stores.store_id 
JOIN employees ON salesorders.employee_id = employees.employee_id 
WHERE products.product_name = '华为Mate 40 Pro' 
AND salesorders.order_date = '2023-05-06' 
GROUP BY stores.store_id, employees.employee_id, products.product_id 
HAVING SUM(orderdetails.quantity) > 1;	1656453304
AMBIGUOUS_QUERY	366199293
SELECT employees.name AS name, employees.position AS position, stores.phone AS phone FROM employees INNER JOIN stores ON employees.store_id = stores.store_id;	3334478107
SELECT s.store_name, e.name AS employee_name, SUM(od.quantity) AS quantity 
FROM orderdetails od 
JOIN salesorders so ON od.order_id = so.order_id 
JOIN products p ON od.product_id = p.product_id 
JOIN employees e ON so.employee_id = e.employee_id 
JOIN stores s ON so.store_id = s.store_id 
WHERE p.product_name = '戴尔灵越15' 
AND so.order_date = '2023-05-05' 
GROUP BY s.store_id, e.employee_id 
HAVING SUM(od.quantity) > 1;	4270219527
SELECT so.order_id AS order_id, so.total_amount AS total_amount, od.product_id AS product_id, od.quantity AS quantity FROM salesorders so INNER JOIN orderdetails od ON so.order_id = od.order_id WHERE so.total_amount > 5000;	1514093143
SELECT e.name AS name, so.order_id, so.total_amount FROM employees e JOIN salesorders so ON e.employee_id = so.employee_id;	2669644548
SELECT statistic_id AS statistic_id, date AS order_date FROM salesstatistics WHERE profit > 3000;	805828737
SELECT s.store_name AS store_name, e.name AS employee_name, so.total_amount AS total_amount 
FROM salesorders so 
JOIN orderdetails od ON so.order_id = od.order_id 
JOIN products p ON od.product_id = p.product_id 
JOIN stores s ON so.store_id = s.store_id 
JOIN employees e ON so.employee_id = e.employee_id 
WHERE so.order_date = '2023-05-01' 
AND p.product_name = 'Apple Watch Series 7' 
AND so.total_amount > 7000;	3997676800
SELECT product_name AS product_name, remaining_quantity AS remaining_quantity, category_name AS category_name FROM products;	4161491201
SELECT DISTINCT e.employee_id AS employee_id, e.name AS name, e.position AS position FROM employees e JOIN salesorders so ON e.employee_id = so.employee_id JOIN orderdetails od ON so.order_id = od.order_id JOIN products p ON od.product_id = p.product_id WHERE so.order_date = '2023-05-07' AND so.total_amount > 15000 AND p.category_name = '相机';	1127435173
AMBIGUOUS_QUERY	2902593996
SELECT s.store_name, s.manager_name, SUM(so.total_amount) AS total_sales 
FROM salesorders so 
JOIN stores s ON so.store_id = s.store_id 
WHERE so.order_date = '2023-05-08' 
GROUP BY s.store_id, s.store_name, s.manager_name 
ORDER BY total_sales DESC 
LIMIT 1;	3388599532
SELECT e.name AS employee_name, SUM(od.quantity) AS sales_quantity, SUM(od.quantity * od.unit_price) AS sales_amount 
FROM salesorders so 
JOIN orderdetails od ON so.order_id = od.order_id 
JOIN products p ON od.product_id = p.product_id 
JOIN employees e ON so.employee_id = e.employee_id 
JOIN stores s ON so.store_id = s.store_id 
WHERE s.store_name = '数字大道店' 
AND p.product_name = 'Nintendo Switch' 
AND so.order_date = '2023-05-03' 
GROUP BY e.employee_id;	4098005311
SELECT 
    s.store_name AS store_name,
    e.name AS employee_name
FROM 
    salesstatistics ss
JOIN 
    stores s ON ss.store_id = s.store_id
JOIN 
    employees e ON ss.employee_id = e.employee_id
JOIN 
    products p ON ss.product_id = p.product_id
WHERE 
    p.product_name = '戴森V11'
    AND ss.date = '2023-05-05'
    AND ss.profit > 500;	923028298
SELECT s.store_name AS store_name, s.manager_name AS manager_name FROM stores s JOIN (SELECT store_id, SUM(total_amount) AS total_sales FROM salesorders WHERE order_date = '2023-05-09' GROUP BY store_id HAVING SUM(total_amount) > 2000) so ON s.store_id = so.store_id;	1361891626
SELECT s.store_name AS store_name, s.manager_name AS manager_name FROM stores s JOIN (SELECT store_id, SUM(total_amount) AS total_sales FROM salesorders WHERE order_date = '2023-05-01' GROUP BY store_id HAVING SUM(total_amount) > 10000) so ON s.store_id = so.store_id;	1630147030
SELECT s.store_name AS store_name, s.manager_name AS manager_name, e.name AS employee_name 
FROM salesorders so 
JOIN orderdetails od ON so.order_id = od.order_id 
JOIN products p ON od.product_id = p.product_id 
JOIN stores s ON so.store_id = s.store_id 
JOIN employees e ON so.employee_id = e.employee_id 
WHERE so.order_date = '2023-05-09' AND p.product_name = 'iPhone 13';	3263175989
AMBIGUOUS_QUERY	378330460
AMBIGUOUS_QUERY	4052285642
SELECT s.store_name AS store_name, e.name AS employee_name, so.total_amount AS total_amount 
FROM salesorders so 
JOIN stores s ON so.store_id = s.store_id 
JOIN employees e ON so.employee_id = e.employee_id 
WHERE so.order_date = '2023-05-02' 
AND so.total_amount > 2000;	1549729846
SELECT store_id, SUM(sales_quantity) AS total_sales_quantity, SUM(profit) AS total_profit FROM salesstatistics GROUP BY store_id;	3935894550
SELECT s.store_name AS store_name, SUM(ss.profit) AS profit, s.manager_name AS manager_name FROM salesstatistics ss JOIN stores s ON ss.store_id = s.store_id WHERE ss.date = '2023-05-07' GROUP BY s.store_id HAVING SUM(ss.profit) > 1000;	3331362186
SELECT s.store_name AS store_name, s.manager_name AS manager_name, SUM(ss.sales_quantity) AS sales_quantity FROM salesstatistics ss JOIN stores s ON ss.store_id = s.store_id WHERE ss.date = '2023-05-08' GROUP BY ss.store_id, s.store_name, s.manager_name ORDER BY sales_quantity DESC LIMIT 1;	1128623969
AMBIGUOUS_QUERY	2501471268
SELECT st.store_name AS store_name, e.name AS employee_name, s.total_amount AS total_sales 
FROM salesorders s 
JOIN orderdetails od ON s.order_id = od.order_id 
JOIN products p ON od.product_id = p.product_id 
JOIN employees e ON s.employee_id = e.employee_id 
JOIN stores st ON s.store_id = st.store_id 
WHERE p.product_name = '佳能EOS R6' 
AND s.order_date BETWEEN '2023-05-01' AND '2023-05-31' 
AND s.total_amount > 5000;	1462073315
SELECT DISTINCT s.store_name AS store_name, e.name AS employee_name, e.position AS position 
FROM salesorders so 
JOIN orderdetails od ON so.order_id = od.order_id 
JOIN products p ON od.product_id = p.product_id 
JOIN employees e ON so.employee_id = e.employee_id 
JOIN stores s ON so.store_id = s.store_id 
WHERE p.product_name = 'iPad Air' 
AND so.order_date BETWEEN '2023-05-01' AND '2023-05-31';	1581647710
SELECT category_name AS category_name, sale_price AS sale_price FROM products;	801232665
AMBIGUOUS_QUERY	456965504
AMBIGUOUS_QUERY	3382493010
SELECT order_id AS order_id, order_date AS order_date, total_amount AS total_amount FROM salesorders;	571189478
SELECT 
    s.store_name AS store_name,
    e.name AS employee_name,
    p.product_name AS product_name,
    ss.sales_quantity AS sales_quantity
FROM 
    salesstatistics ss
JOIN 
    stores s ON ss.store_id = s.store_id
JOIN 
    employees e ON ss.employee_id = e.employee_id
JOIN 
    products p ON ss.product_id = p.product_id
WHERE 
    ss.date = '2023-05-06'
    AND p.product_name = '华为Mate 40 Pro'
    AND ss.sales_quantity > 1;	3197967117
AMBIGUOUS_QUERY	426781097
SELECT e.name AS employee_name, SUM(od.unit_price * od.quantity) AS total_sales_amount 
FROM salesorders o 
JOIN stores s ON o.store_id = s.store_id 
JOIN orderdetails od ON o.order_id = od.order_id 
JOIN products p ON od.product_id = p.product_id 
JOIN employees e ON o.employee_id = e.employee_id 
WHERE s.store_name LIKE '%创客空间%' 
  AND p.product_name = '华为Mate 40 Pro' 
  AND o.order_date = '2023-05-01' 
GROUP BY e.name;	3095201302
SELECT stores.store_name AS store_name, employees.name AS employee_name, employees.position AS position FROM salesorders JOIN orderdetails ON salesorders.order_id = orderdetails.order_id JOIN products ON orderdetails.product_id = products.product_id JOIN stores ON salesorders.store_id = stores.store_id JOIN employees ON salesorders.employee_id = employees.employee_id WHERE products.product_name = '戴森V11' AND salesorders.order_date BETWEEN '2023-05-01' AND '2023-05-31';	3814813462
AMBIGUOUS_QUERY	609043667
SELECT s.employee_id AS employee_id, e.name AS name FROM salesstatistics s JOIN products p ON s.product_id = p.product_id JOIN employees e ON s.employee_id = e.employee_id WHERE s.date = '2023-05-06' AND s.sales_quantity > 1 AND p.supplier_name = '戴尔官方旗舰店';	1259543351
SELECT product_name AS product_name, sale_price AS sale_price FROM products;	3115466033
AMBIGUOUS_QUERY	1445435683
SELECT salesorders.total_amount AS total_amount, stores.store_name AS store_name FROM salesorders JOIN employees ON salesorders.employee_id = employees.employee_id JOIN stores ON salesorders.store_id = stores.store_id WHERE employees.name = '范莹' AND salesorders.order_date = '2023-05-07';	1024575513
SELECT s.store_name AS store_name, SUM(so.total_amount) AS total_sales
FROM salesorders so
JOIN orderdetails od ON so.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
JOIN stores s ON so.store_id = s.store_id
WHERE p.product_name = 'Apple Watch Series 7'
AND so.order_date BETWEEN '2023-05-01' AND '2023-05-31'
GROUP BY s.store_id
HAVING SUM(so.total_amount) > 10000;	1356118157
AMBIGUOUS_QUERY	2779355161
SELECT store_name AS store_name, manager_name AS manager_name FROM stores;	3800488480
AMBIGUOUS_QUERY	52927163
AMBIGUOUS_QUERY	4140737645
SELECT 
    s.store_name AS store_name,
    e.name AS employee_name,
    so.total_amount AS total_amount
FROM 
    salesorders so
JOIN 
    orderdetails od ON so.order_id = od.order_id
JOIN 
    products p ON od.product_id = p.product_id
JOIN 
    employees e ON so.employee_id = e.employee_id
JOIN 
    stores s ON so.store_id = s.store_id
WHERE 
    p.product_name = '索尼WH-1000XM4'
    AND so.order_date = '2023-05-08'
    AND so.total_amount > 15000;	3812947992
SELECT s.store_name AS store_name, s.manager_name AS manager_name, ss.total_sales AS max_sales_quantity 
FROM stores s 
JOIN (SELECT store_id, SUM(sales_quantity) AS total_sales 
      FROM salesstatistics 
      WHERE date = '2023-05-09' 
      GROUP BY store_id 
      ORDER BY total_sales DESC 
      LIMIT 1) ss 
ON s.store_id = ss.store_id;	2237439168
SELECT SUM(profit) AS total_profit FROM salesstatistics;	3083869006
AMBIGUOUS_QUERY	106112262
SELECT s.store_name AS store_name, SUM(od.quantity) AS total_sales_quantity 
FROM salesorders so 
JOIN orderdetails od ON so.order_id = od.order_id 
JOIN employees e ON so.employee_id = e.employee_id 
JOIN stores s ON so.store_id = s.store_id 
WHERE e.name = '黄萍' 
AND so.order_date BETWEEN '2023-05-01' AND '2023-05-31' 
GROUP BY s.store_id 
ORDER BY total_sales_quantity DESC 
LIMIT 1;	886303610
AMBIGUOUS_QUERY	1529918379
SELECT 
    s.store_name AS store_name,
    e.name AS employee_name,
    so.total_amount AS total_amount
FROM 
    salesorders so
JOIN 
    orderdetails od ON so.order_id = od.order_id
JOIN 
    products p ON od.product_id = p.product_id
JOIN 
    employees e ON so.employee_id = e.employee_id
JOIN 
    stores s ON so.store_id = s.store_id
WHERE 
    p.product_name = '索尼WH-1000XM4'
    AND so.order_date = '2023-05-05';	3470071233
SELECT e.name AS name, e.position AS position, p.product_name AS product_name FROM employees e JOIN salesorders s ON e.employee_id = s.employee_id JOIN stores st ON s.store_id = st.store_id JOIN orderdetails od ON s.order_id = od.order_id JOIN products p ON od.product_id = p.product_id WHERE st.store_name = '智能生活馆' AND s.order_date = '2023-05-05' AND p.supplier_name = '小米官方旗舰店';	616988720
SELECT s.store_name AS store_name, s.manager_name AS manager_name FROM stores s WHERE s.store_id = (SELECT store_id FROM salesstatistics WHERE date = '2023-05-07' GROUP BY store_id ORDER BY SUM(profit) DESC LIMIT 1);	4131869213
SELECT s.store_name AS store_name, e.name AS employee_name, p.product_name AS product_name, (od.unit_price * od.quantity - p.purchase_price * od.quantity) AS profit 
FROM salesorders so 
JOIN orderdetails od ON so.order_id = od.order_id 
JOIN products p ON od.product_id = p.product_id 
JOIN employees e ON so.employee_id = e.employee_id 
JOIN stores s ON so.store_id = s.store_id 
WHERE so.order_date = '2023-05-09' 
AND p.product_name = '索尼WH-1000XM4';	2632379040
AMBIGUOUS_QUERY	1347772939
SELECT s.store_name AS store_name, so.total_amount AS total_amount FROM salesorders so JOIN stores s ON so.store_id = s.store_id WHERE so.order_date = '2023-05-03';	2314844420
SELECT order_detail_id AS order_detail_id, order_id AS order_id, product_id AS product_id, quantity AS quantity, unit_price AS unit_price FROM orderdetails WHERE quantity > 1;	1029843679
AMBIGUOUS_QUERY	973958071
SELECT so.order_id AS order_id, so.total_amount AS total_amount, s.store_name AS store_name FROM salesorders so JOIN stores s ON so.store_id = s.store_id WHERE so.order_date = '2023-05-05';	3235376159
SELECT p.product_name AS product_name, od.order_id AS order_id FROM orderdetails od JOIN products p ON od.product_id = p.product_id GROUP BY od.order_id, od.product_id, p.product_name HAVING SUM(od.quantity) > 1;	590339570
SELECT order_id AS 订单编号, order_date AS 下单日期, total_amount AS 总金额 FROM salesorders WHERE order_date >= '2023-05-01' AND order_date <= '2023-05-31';	947155024
SELECT employee_id, SUM(sales_quantity) AS sum FROM salesstatistics GROUP BY employee_id;	143868964
SELECT category_name AS category, remaining_quantity AS stock FROM products;	801054820
AMBIGUOUS_QUERY	956049949
SELECT order_id AS order_id, product_id AS product_id FROM orderdetails;	1812261268
AMBIGUOUS_QUERY	573573963
AMBIGUOUS_QUERY	2726627092
SELECT DISTINCT e.name AS name FROM employees e JOIN salesorders s ON e.employee_id = s.employee_id JOIN orderdetails od ON s.order_id = od.order_id JOIN products p ON od.product_id = p.product_id WHERE p.product_name = 'Apple Watch Series 7' AND p.supplier_name = '任天堂官方旗舰店' AND s.order_date = '2023-05-09';	3682087832
SELECT salesorders.total_amount AS total_amount, stores.store_name AS store_name FROM salesorders INNER JOIN stores ON salesorders.store_id = stores.store_id WHERE salesorders.order_date = '2023-05-06';	994704464
AMBIGUOUS_QUERY	2258930244
SELECT e.name AS employee_name, s.store_name, p.product_name, SUM(so.total_amount) AS total_sales_amount 
FROM salesorders so 
JOIN stores s ON so.store_id = s.store_id 
JOIN employees e ON so.employee_id = e.employee_id 
JOIN orderdetails od ON so.order_id = od.order_id 
JOIN products p ON od.product_id = p.product_id 
WHERE so.order_date = '2023-05-07' 
AND s.store_name = '智慧街店' 
AND p.product_name = '佳能EOS R6' 
GROUP BY e.name, s.store_name, p.product_name;	251367692
AMBIGUOUS_QUERY	4178948313
SELECT s.store_name AS store_name, e.name AS employee_name, so.total_amount AS total_amount FROM salesorders so JOIN orderdetails od ON so.order_id = od.order_id JOIN products p ON od.product_id = p.product_id JOIN stores s ON so.store_id = s.store_id JOIN employees e ON so.employee_id = e.employee_id WHERE p.product_name = '佳能EOS R6' AND so.order_date = '2023-05-05';	635779591
SELECT product_id AS product_id, product_name AS product_name, category_name AS category_name, purchase_price AS purchase_price, sale_price AS sale_price, remaining_quantity AS remaining_quantity, supplier_name AS supplier_name, description AS description FROM products WHERE sale_price > 15000;	2326522926
SELECT s.store_name, e.name AS employee_name, p.product_name, SUM(od.quantity) AS sales_quantity 
FROM orderdetails od 
JOIN products p ON od.product_id = p.product_id 
JOIN salesorders so ON od.order_id = so.order_id 
JOIN stores s ON so.store_id = s.store_id 
JOIN employees e ON so.employee_id = e.employee_id 
WHERE p.product_name = '索尼WH-1000XM4' 
AND so.order_date = '2023-05-08' 
GROUP BY s.store_id, e.employee_id, p.product_name 
HAVING SUM(od.quantity) > 1;	845825777
SELECT s.store_name AS store_name, e.name AS employee_name, p.product_name AS product_name, (od.quantity * od.unit_price) AS sales_amount 
FROM salesorders so 
JOIN orderdetails od ON so.order_id = od.order_id 
JOIN products p ON od.product_id = p.product_id 
JOIN employees e ON so.employee_id = e.employee_id 
JOIN stores s ON so.store_id = s.store_id 
WHERE so.order_date = '2023-05-01' 
AND p.supplier_name = '戴森官方旗舰店' 
AND (od.quantity * od.unit_price) > 1000;	1519890808
AMBIGUOUS_QUERY	624803127
SELECT s.store_name, SUM(so.total_amount) AS total_sales FROM salesorders so JOIN stores s ON so.store_id = s.store_id GROUP BY s.store_id, s.store_name;	4067103855
AMBIGUOUS_QUERY	2670659765
AMBIGUOUS_QUERY	4067388605
SELECT product_name AS product_name, supplier_name AS supplier_name FROM products;	383590974
SELECT sale_price AS sale_price, supplier_name AS supplier_name FROM products;	4056403376
SELECT orderdetails.order_detail_id AS order_detail_id, products.product_name AS product_name, products.sale_price AS unit_price FROM orderdetails JOIN products ON orderdetails.product_id = products.product_id;	3670992366
SELECT s.store_name AS store_name, s.phone AS phone 
FROM stores s 
JOIN (
    SELECT store_id, SUM(total_amount) AS total_sales 
    FROM salesorders 
    WHERE order_date >= '2023-05-01' 
      AND order_date < '2023-06-01' 
    GROUP BY store_id 
    HAVING SUM(total_amount) > 3000
) so ON s.store_id = so.store_id;	2335581270
SELECT store_name AS store_name, manager_name AS manager_name FROM stores;	2535524828
SELECT employees.name AS name, stores.phone AS phone FROM employees JOIN stores ON employees.store_id = stores.store_id;	120259515
SELECT e.name AS employee_name, s.sales_quantity, s.profit FROM salesstatistics s JOIN employees e ON s.employee_id = e.employee_id JOIN stores st ON s.store_id = st.store_id JOIN products p ON s.product_id = p.product_id WHERE st.store_name = '创新路专卖店' AND p.product_name = 'iPad Air' AND s.date = '2023-05-09';	1670319692
SELECT e.name AS name, e.position AS position, s.store_name AS store_name, so.total_amount AS total_amount FROM salesorders so JOIN stores s ON so.store_id = s.store_id JOIN employees e ON so.employee_id = e.employee_id WHERE so.order_date = '2023-05-07' AND s.store_name = '未来城店' AND so.total_amount > 15000;	4086419825
SELECT product_name, (sale_price - purchase_price) AS price_difference FROM products;	3256730396
SELECT s.store_name AS store_name, s.manager_name AS manager_name 
FROM stores s 
WHERE s.store_id IN (
    SELECT so.store_id 
    FROM salesorders so 
    WHERE so.order_date BETWEEN '2023-05-01' AND '2023-05-31' 
    GROUP BY so.store_id 
    HAVING SUM(so.total_amount) > 10000
);	2107889479
AMBIGUOUS_QUERY	595252998
SELECT order_id AS order_id, store_id AS store_id, employee_id AS employee_id, order_date AS order_date, total_amount AS total_amount FROM salesorders WHERE store_id = '64921abb-1d54-4e03-a15e-ea42f058f31c';	2271451016
SELECT 
    s.store_name AS store_name,
    e.name AS employee_name,
    p.product_name AS product_name,
    so.total_amount AS total_amount
FROM 
    salesorders so
JOIN 
    orderdetails od ON so.order_id = od.order_id
JOIN 
    products p ON od.product_id = p.product_id
JOIN 
    employees e ON so.employee_id = e.employee_id
JOIN 
    stores s ON so.store_id = s.store_id
WHERE 
    p.product_name = '小米电视4A' 
    AND so.order_date = '2023-05-06' 
    AND so.total_amount > 10000;	3431877623
<final>
SELECT DISTINCT s.store_name AS store_name
FROM stores s
JOIN salesstatistics ss ON s.store_id = ss.store_id
WHERE ss.product_id IN (
    SELECT product_id
    FROM products
    WHERE product_name = 'Nintendo Switch'
)
AND ss.date BETWEEN '2023-05-01' AND '2023-05-31'
AND ss.profit > 1000;
</final>;	1818716672
SELECT s.store_name, e.name AS employee_name, SUM(od.quantity) AS quantity, SUM(od.unit_price * od.quantity) AS total_amount 
FROM orderdetails od 
JOIN salesorders so ON od.order_id = so.order_id 
JOIN products p ON od.product_id = p.product_id 
JOIN stores s ON so.store_id = s.store_id 
JOIN employees e ON so.employee_id = e.employee_id 
WHERE p.product_name = '索尼WH-1000XM4' 
AND so.order_date = '2023-05-09' 
GROUP BY s.store_id, e.employee_id, s.store_name, e.name;	3062953566
AMBIGUOUS_QUERY	3908942610
AMBIGUOUS_QUERY	208218356
SELECT ss.store_id AS store_id, s.store_name AS store_name, s.manager_name AS manager_name, ss.sales_quantity AS sales_quantity FROM salesstatistics ss JOIN stores s ON ss.store_id = s.store_id WHERE DATE(ss.date) = '2023-05-03' ORDER BY ss.sales_quantity DESC LIMIT 1;	4174482566
SELECT DISTINCT stores.store_name AS store_name, employees.name AS employee_name, salesorders.total_amount AS total_amount 
FROM salesorders 
JOIN stores ON salesorders.store_id = stores.store_id 
JOIN employees ON salesorders.employee_id = employees.employee_id 
JOIN orderdetails ON salesorders.order_id = orderdetails.order_id 
JOIN products ON orderdetails.product_id = products.product_id 
WHERE salesorders.order_date = '2023-05-01' AND products.product_name = 'iPad Air';	1762340720
SELECT store_id, SUM(total_amount) AS total_sales FROM salesorders GROUP BY store_id;	1734342716
SELECT e.position, COUNT(so.order_id) AS order_count FROM employees e LEFT JOIN salesorders so ON e.employee_id = so.employee_id GROUP BY e.employee_id, e.position;	3698654694
AMBIGUOUS_QUERY	3114650274
SELECT s.store_name, s.manager_name, SUM(so.total_amount) AS total_sales FROM salesorders so JOIN stores s ON so.store_id = s.store_id WHERE so.order_date BETWEEN '2023-05-01' AND '2023-05-31' GROUP BY s.store_id, s.store_name, s.manager_name HAVING SUM(so.total_amount) > 10000;	2085424302
<final>
SELECT s.store_name AS store_name
FROM salesorders so
JOIN stores s ON so.store_id = s.store_id
WHERE so.order_date = '2023-05-02'
AND (
    SELECT SUM(od.unit_price * od.quantity)
    FROM orderdetails od
    JOIN products p ON od.product_id = p.product_id
    WHERE od.order_id = so.order_id
    AND p.supplier_name = '华为官方旗舰店'
) > 10000;
</final>;	662177839
AMBIGUOUS_QUERY	3976972213
AMBIGUOUS_QUERY	783788015
SELECT s.store_name AS store_name, s.manager_name AS manager_name, SUM(so.total_amount) AS total_sales FROM salesorders so JOIN stores s ON so.store_id = s.store_id WHERE so.order_date = '2023-05-04' GROUP BY s.store_id ORDER BY total_sales DESC LIMIT 1;	2306528451
SELECT stores.store_name AS store_name, employees.name AS employee_name, employees.position AS position FROM salesorders JOIN orderdetails ON salesorders.order_id = orderdetails.order_id JOIN products ON orderdetails.product_id = products.product_id JOIN stores ON salesorders.store_id = stores.store_id JOIN employees ON salesorders.employee_id = employees.employee_id WHERE salesorders.order_date = '2023-05-01' AND products.product_name = '华为Mate 40 Pro';	1834111948
AMBIGUOUS_QUERY	1718600359
SELECT s.store_name AS store_name, e.name AS employee_name, so.total_amount AS total_amount FROM orderdetails od JOIN products p ON od.product_id = p.product_id JOIN salesorders so ON od.order_id = so.order_id JOIN employees e ON so.employee_id = e.employee_id JOIN stores s ON so.store_id = s.store_id WHERE p.product_name LIKE '%戴尔灵越15%' AND so.order_date BETWEEN '2023-05-01' AND '2023-05-31' AND so.total_amount > 5000;	2900121322
AMBIGUOUS_QUERY	1605466649
SELECT s.store_name, COUNT(e.employee_id) AS employee_count FROM stores s LEFT JOIN employees e ON s.store_id = e.store_id GROUP BY s.store_id;	330758085
SELECT e.name AS employee_name, e.position, SUM(od.quantity) AS quantity 
FROM employees e 
JOIN salesorders so ON e.employee_id = so.employee_id 
JOIN stores st ON so.store_id = st.store_id 
JOIN orderdetails od ON so.order_id = od.order_id 
JOIN products p ON od.product_id = p.product_id 
WHERE st.store_name = '科技中心店' 
AND so.order_date = '2023-05-05' 
AND p.product_name = '戴森V11' 
GROUP BY e.employee_id, e.name, e.position 
HAVING SUM(od.quantity) > 1;	1887568974
SELECT s.order_id AS order_id, s.total_amount AS total_amount FROM salesorders s JOIN stores st ON s.store_id = st.store_id WHERE st.store_name = '数码广场店';	1544829110
SELECT ra.assessment_id AS assessment_id, ra.risk_level AS risk_level, ra.impact_score AS impact_score, re.event_type AS event_type, re.event_description AS event_description FROM risk_assessments ra INNER JOIN risk_events re ON ra.event_id = re.event_id WHERE ra.risk_level = '高' AND ra.impact_score > 8;	1389319035
AMBIGUOUS_QUERY	955757206
SELECT re.event_description AS event_description, al.audit_result AS status 
FROM alerts a 
JOIN risk_events re ON a.event_id = re.event_id 
JOIN audit_logs al ON a.alert_id = al.alert_id 
WHERE a.alert_type = 'fraud_suspicion';	1687223871
AMBIGUOUS_QUERY	948809000
SELECT risk_level AS risk_level, COUNT(*) AS customer_count, AVG(credit_score) AS avg_credit_score FROM customers GROUP BY risk_level;	2131857844
ERROR: LLM 请求失败	1810509227
SELECT report_id AS report_id, report_date AS report_date, author AS author, event_id AS event_id FROM risk_reports WHERE approval_status = '已批准';	2704266530
SELECT c.risk_level, t.transaction_type, 
       CASE 
           WHEN t.amount <= 1000 THEN '0-1000'
           WHEN t.amount <= 5000 THEN '1001-5000'
           WHEN t.amount <= 10000 THEN '5001-10000'
           ELSE '10000+'
       END AS amount_range, 
       COUNT(*) AS transaction_count, 
       AVG(t.risk_score) AS avg_risk_score
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY c.risk_level, t.transaction_type, amount_range
ORDER BY c.risk_level, t.transaction_type, amount_range;	3816194798
AMBIGUOUS_QUERY	3476903471
AMBIGUOUS_QUERY	451357687
SELECT report_id AS report_id, report_date AS creation_date, author AS author, approval_status AS approval_status FROM risk_reports WHERE report_date > '2023-01-01';	880512967
AMBIGUOUS_QUERY	4205370122
AMBIGUOUS_QUERY	2721513399
SELECT ra.event_id AS event_id, re.event_description AS event_description, ra.risk_level AS risk_level, ra.mitigation_plan AS mitigation_plan FROM risk_assessments ra JOIN risk_events re ON ra.event_id = re.event_id WHERE ra.risk_level = '高风险' AND ra.assessor = '曾强';	1697295436
SELECT DISTINCT c.customer_name AS customer_name FROM customers c JOIN transactions t ON c.customer_id = t.customer_id WHERE t.transaction_type = '投资' AND t.risk_score > 60;	2228217319
SELECT event_id AS EventID, created_at AS CreatedAt, status AS Status FROM risk_events;	1939667217
SELECT c.customer_name AS customer_name, t.risk_score AS risk_score FROM customers c JOIN transactions t ON c.customer_id = t.customer_id WHERE c.credit_score < 600;	2175309220
SELECT t.amount AS amount, c.customer_name AS customer_name FROM transactions t JOIN customers c ON t.customer_id = c.customer_id WHERE t.transaction_date BETWEEN '2023-12-01' AND '2023-12-31' AND t.status = 'success';	1016775966
SELECT alert_type AS type, alert_content AS content FROM alerts;	629791557
AMBIGUOUS_QUERY	4191869630
AMBIGUOUS_QUERY	3240782233
AMBIGUOUS_QUERY	1390189932
SELECT c.customer_id, c.customer_name, t.status AS status
FROM customers c
JOIN (
    SELECT customer_id, MAX(transaction_date) AS latest_transaction_date
    FROM transactions
    GROUP BY customer_id
) latest
ON c.customer_id = latest.customer_id
JOIN transactions t
ON t.customer_id = latest.customer_id AND t.transaction_date = latest.latest_transaction_date;	2842460105
AMBIGUOUS_QUERY	3963285376
SELECT DISTINCT a.customer_id AS customer_id, a.customer_name AS customer_name
FROM customers a
WHERE a.customer_id IN (
    SELECT t.customer_id
    FROM transactions t
    WHERE t.amount > 500000
    AND t.transaction_date >= CURRENT_DATE - INTERVAL '1 year'
    AND EXISTS (
        SELECT 1
        FROM audit_logs l
        WHERE l.transaction_id = t.transaction_id
        AND l.audit_result = '拒绝'
    )
)
AND a.customer_id IN (
    SELECT t2.customer_id
    FROM transactions t2
    WHERE t2.risk_score > 50
    AND t2.transaction_date >= CURRENT_DATE - INTERVAL '1 year'
);	2546181421
SELECT AVG(impact_score) AS average_impact_score FROM risk_assessments WHERE mitigation_plan IS NULL OR mitigation_plan = '';	2755620243
AMBIGUOUS_QUERY	3751427783
SELECT 
    c.customer_name,
    (COALESCE(t.high_risk_transactions, 0) * 2 + COALESCE(a.unprocessed_alerts, 0) * 3 + 1000.0 / c.credit_score) AS risk_index
FROM 
    customers c
LEFT JOIN (
    SELECT customer_id, COUNT(*) AS high_risk_transactions
    FROM transactions
    WHERE status = '失败'
    AND transaction_date >= CURRENT_DATE - INTERVAL '90 days'
    GROUP BY customer_id
) t ON c.customer_id = t.customer_id
LEFT JOIN (
    SELECT customer_id, COUNT(*) AS unprocessed_alerts
    FROM alerts
    JOIN risk_events ON alerts.event_id = risk_events.event_id
    JOIN transactions ON risk_events.event_id = transactions.event_id
    WHERE alerts.status = '未处理'
    GROUP BY customer_id
) a ON c.customer_id = a.customer_id
ORDER BY risk_index DESC
LIMIT 10;	2897506811
SELECT event_type, COUNT(*) AS occurrence_count, AVG(severity) AS avg_severity FROM risk_events WHERE EXTRACT(YEAR FROM occurrence_time) = 2023 GROUP BY event_type ORDER BY occurrence_count DESC;	1765860698
AMBIGUOUS_QUERY	2186954842
AMBIGUOUS_QUERY	1001861352
AMBIGUOUS_QUERY	3688441488
AMBIGUOUS_QUERY	2337622346
AMBIGUOUS_QUERY	1820971007
SELECT DISTINCT c.customer_id AS customer_id, c.customer_name AS customer_name, c.credit_score AS credit_score FROM customers c JOIN transactions t ON c.customer_id = t.customer_id WHERE t.transaction_date >= '2023-01-01' AND t.transaction_date < '2024-01-01' AND c.credit_score < 700;	3328333298
SELECT risk_events.event_id AS event_id, risk_events.event_type AS event_type, risk_reports.report_id AS report_id FROM risk_events INNER JOIN risk_reports ON risk_events.event_id = risk_reports.event_id;	547790744
SELECT COUNT(*) AS rejected_reports_count
FROM risk_reports
WHERE approval_status = 'rejected'
AND report_date BETWEEN '2023-01-01' AND '2023-12-31';	3644288071
AMBIGUOUS_QUERY	3802320452
SELECT log_id AS log_id, actual_value AS actual_value, is_exceeding_threshold AS is_exceeding_threshold FROM risk_monitoring_logs WHERE (indicator_id, monitoring_date) IN (SELECT indicator_id, MAX(monitoring_date) FROM risk_monitoring_logs GROUP BY indicator_id);	3489018825
SELECT rc.rule_id, rc.rule_name, COUNT(a.alert_id) AS alert_count 
FROM rule_configurations rc 
LEFT JOIN alerts a ON rc.rule_id = a.rule_id 
GROUP BY rc.rule_id, rc.rule_name;	2505821643
AMBIGUOUS_QUERY	3072597279
SELECT risk_level AS risk_level, COUNT(*) AS customer_count FROM customers GROUP BY risk_level;	260033616
AMBIGUOUS_QUERY	2369245761
AMBIGUOUS_QUERY	1787317276
AMBIGUOUS_QUERY	1447865488
AMBIGUOUS_QUERY	3560291801
SELECT 
  EXTRACT(YEAR FROM transaction_date) AS year, 
  EXTRACT(MONTH FROM transaction_date) AS month, 
  AVG(amount) AS avg_amount, 
  COUNT(*) AS transaction_count 
FROM 
  transactions 
GROUP BY 
  EXTRACT(YEAR FROM transaction_date), 
  EXTRACT(MONTH FROM transaction_date) 
ORDER BY 
  year, 
  month;	2152701139
SELECT 
    risk_reports.report_id AS report_id,
    risk_reports.report_type AS report_type,
    risk_reports.approved_by AS approved_by,
    risk_events.event_description AS event_description,
    risk_events.severity AS severity
FROM 
    risk_reports
JOIN 
    risk_events ON risk_reports.event_id = risk_events.event_id
WHERE 
    risk_reports.approval_status = '已批准';	558233205
AMBIGUOUS_QUERY	3381293646
AMBIGUOUS_QUERY	3077667667
SELECT report_id AS 报告ID, report_type AS 报告类型, report_date AS 报告日期, report_content AS 报告内容, author AS 作者, approval_status AS 审批状态, approved_by AS 审批人, event_id AS 事件ID FROM risk_reports WHERE author = '孙宇' AND approval_status = '未审批';	2339616488
AMBIGUOUS_QUERY	1797007792
SELECT risk_level AS risk_level, COUNT(*) AS customer_count FROM customers WHERE risk_level IN ('中', '高') GROUP BY risk_level;	298505495
AMBIGUOUS_QUERY	612300483
SELECT DATE_TRUNC('month', registration_date) AS registration_month, COUNT(*) AS new_high_risk_customers FROM customers WHERE risk_level = '高' GROUP BY DATE_TRUNC('month', registration_date);	3872938276
AMBIGUOUS_QUERY	4293195588
SELECT risk_level AS risk_level, COUNT(*) AS customer_count, AVG(credit_score) AS avg_credit_score FROM customers GROUP BY risk_level;	3735769324
SELECT a.alert_type, MAX(al.audit_time - a.alert_time) AS max_processing_time 
FROM alerts a 
JOIN audit_logs al ON a.alert_id = al.alert_id 
WHERE a.status = '已解决' 
GROUP BY a.alert_type 
ORDER BY max_processing_time DESC 
LIMIT 1;	3555900229
SELECT c.customer_name AS 客户名称, t.amount AS 交易金额, t.transaction_date AS 交易日期 FROM customers c JOIN transactions t ON c.customer_id = t.customer_id WHERE t.transaction_date BETWEEN '2023-11-01' AND '2023-11-30' AND t.amount > 100000;	390806390
SELECT SUM(threshold_value) AS total_threshold_sum FROM risk_indicators WHERE indicator_name LIKE '%财务%';	2736578842
SELECT customer_name AS customer_name, credit_score AS credit_score FROM customers;	453782697
AMBIGUOUS_QUERY	605680231
AMBIGUOUS_QUERY	591035595
AMBIGUOUS_QUERY	154773295
AMBIGUOUS_QUERY	2894945358
SELECT report_type AS report_type, COUNT(*) AS report_count FROM risk_reports WHERE approval_status = '已拒绝' GROUP BY report_type;	3936841885
SELECT customer_id AS customer_id, customer_name AS customer_name, credit_score AS credit_score, risk_level AS risk_level FROM customers WHERE credit_score < 600 AND risk_level = '高';	2451684746
SELECT c.risk_level, AVG(t.amount) AS avg_transaction_amount, COUNT(t.transaction_id) / COUNT(DISTINCT c.customer_id) AS avg_transactions_per_customer FROM customers c JOIN transactions t ON c.customer_id = t.customer_id WHERE t.transaction_date >= CURRENT_DATE - INTERVAL '1 year' GROUP BY c.risk_level;	1650691143
AMBIGUOUS_QUERY	3897186376
SELECT COUNT(DISTINCT c.customer_id) AS customer_count, SUM(t.amount) AS total_transaction_amount FROM customers c LEFT JOIN transactions t ON c.customer_id = t.customer_id WHERE c.credit_score BETWEEN 600 AND 800;	1076275288
SELECT report_content AS report_content FROM risk_reports WHERE approved_by = '王思远' AND report_date BETWEEN '2023-03-01' AND '2023-03-31';	1120727301
AMBIGUOUS_QUERY	1080125465
SELECT transaction_id AS transaction_id, customer_id AS customer_id, transaction_type AS transaction_type, amount AS amount, transaction_date AS transaction_date, status AS status, risk_score AS risk_score, event_id AS event_id FROM transactions WHERE EXTRACT(YEAR FROM transaction_date) = 2023 AND EXTRACT(MONTH FROM transaction_date) = 6;	136539419
SELECT re.event_id AS event_id, re.event_type AS event_type, re.event_description AS event_description, al.audit_id AS audit_id, al.audit_type AS audit_type, al.audit_result AS audit_result FROM risk_events re INNER JOIN audit_logs al ON re.event_id = al.event_id WHERE re.severity = 3;	3750047672
AMBIGUOUS_QUERY	3909298542
AMBIGUOUS_QUERY	2762771801
SELECT risk_events.event_id AS event_id, risk_events.event_description AS event_description, alerts.alert_level AS alert_level, alerts.alert_content AS alert_content FROM risk_events INNER JOIN alerts ON risk_events.event_id = alerts.event_id WHERE alerts.alert_level = '高';	2830564670
SELECT risk_events.event_id AS event_id, risk_events.event_description AS event_description, alerts.alert_id AS alert_id, alerts.alert_time AS alert_time FROM risk_events INNER JOIN alerts ON risk_events.event_id = alerts.event_id ORDER BY alerts.alert_time;	942591775
SELECT 
    c.risk_level,
    AVG(sub.total_amount) AS avg_transaction_amount,
    AVG(sub.total_transactions) AS avg_transaction_count
FROM (
    SELECT 
        t.customer_id,
        SUM(t.amount) AS total_amount,
        COUNT(*) AS total_transactions
    FROM transactions t
    JOIN customers c ON t.customer_id = c.customer_id
    WHERE t.transaction_date >= CURRENT_DATE - INTERVAL '90 days'
    GROUP BY t.customer_id
) AS sub
JOIN customers c ON sub.customer_id = c.customer_id
GROUP BY c.risk_level;	3295587616
SELECT customer_id AS customer_id, customer_name AS customer_name, credit_score AS credit_score FROM customers WHERE credit_score < 700 AND risk_level = '高';	3932804573
SELECT c.customer_id AS customer_id, c.credit_score AS credit_score, t.transaction_id AS transaction_id, t.status AS status FROM customers c JOIN transactions t ON c.customer_id = t.customer_id WHERE t.status = '失败' AND (t.customer_id, t.transaction_date) IN (SELECT customer_id, MAX(transaction_date) FROM transactions WHERE status = '失败' GROUP BY customer_id);	862533692
SELECT ra.assessment_id AS assessment_id, ra.event_id AS event_id, t.customer_id AS customer_id, c.customer_name AS customer_name, c.credit_score AS credit_score FROM risk_assessments ra JOIN risk_events re ON ra.event_id = re.event_id JOIN transactions t ON re.event_id = t.event_id JOIN customers c ON t.customer_id = c.customer_id WHERE ra.risk_level = '高' AND c.credit_score > 700;	2759801136
AMBIGUOUS_QUERY	1448319074
AMBIGUOUS_QUERY	2148910450
AMBIGUOUS_QUERY	3303778848
SELECT c.customer_name AS customer_name, t.amount AS transaction_amount, t.status AS transaction_status FROM customers c JOIN transactions t ON c.customer_id = t.customer_id;	2919479377
AMBIGUOUS_QUERY	3408098582
AMBIGUOUS_QUERY	3536942222
AMBIGUOUS_QUERY	3025435441
	3761432717
AMBIGUOUS_QUERY	3404778014
SELECT risk_events.event_description AS event_description, risk_assessments.assessment_date AS assessment_date FROM risk_assessments JOIN risk_events ON risk_assessments.event_id = risk_events.event_id WHERE risk_assessments.risk_level = '高';	3200534548
AMBIGUOUS_QUERY	698660188
AMBIGUOUS_QUERY	756643276
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
    t.transaction_date BETWEEN '2023-01-01' AND '2023-03-31'
    AND c.risk_level = 'high'
    AND t.amount > 500000;	1961596891
ERROR: LLM 请求失败	1488802626
AMBIGUOUS_QUERY	3027811751
SELECT r.report_id AS report_id, r.report_type AS report_type, r.author AS author, re.event_type AS event_type, re.severity AS severity, a.audit_result AS audit_result, a.audit_comments AS audit_comments 
FROM risk_reports r 
JOIN risk_events re ON r.event_id = re.event_id 
LEFT JOIN (
    SELECT related_id, audit_result, audit_comments, audit_time, 
           ROW_NUMBER() OVER (PARTITION BY related_id ORDER BY audit_time DESC) AS rn 
    FROM audit_logs
) a ON r.report_id = a.related_id 
WHERE r.approval_status = '待审批' 
AND a.rn = 1;	1296190191
SELECT customer_id AS cust_id, customer_name AS cust_name, credit_score AS cred_score, risk_level AS risk_level FROM customers WHERE EXTRACT(YEAR FROM registration_date) = 2021 AND risk_level = '高' AND credit_score < 550;	2631012035
AMBIGUOUS_QUERY	2342271424
SELECT event_type, COUNT(*) AS event_count FROM risk_events GROUP BY event_type;	2292865545
AMBIGUOUS_QUERY	3057920994
SELECT 
    TO_CHAR(DATE_TRUNC('month', occurrence_time), 'YYYY-MM') AS month, 
    event_type, 
    COUNT(*) AS event_count, 
    AVG(severity) AS avg_severity, 
    SUM(CASE WHEN status = 'solved' THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS resolution_rate 
FROM 
    risk_events 
GROUP BY 
    TO_CHAR(DATE_TRUNC('month', occurrence_time), 'YYYY-MM'), 
    event_type;	1563461822
ERROR: LLM 请求失败	2699040253
AMBIGUOUS_QUERY	2609391365
AMBIGUOUS_QUERY	1646275357
SELECT customer_id AS customer_id, customer_name AS customer_name, risk_level AS risk_level, credit_score AS credit_score FROM customers;	3640375109
AMBIGUOUS_QUERY	1137138067
SELECT customer_name AS name, registration_date AS registration_date FROM customers;	674388735
AMBIGUOUS_QUERY	2598937105
AMBIGUOUS_QUERY	62865185
AMBIGUOUS_QUERY	185839438
AMBIGUOUS_QUERY	3165460471
AMBIGUOUS_QUERY	3849483796
AMBIGUOUS_QUERY	1990473038
AMBIGUOUS_QUERY	3119334868
SELECT event_type, COUNT(*) AS event_count FROM risk_events WHERE status = '未处理' GROUP BY event_type;	2458967882
AMBIGUOUS_QUERY	4081376750
AMBIGUOUS_QUERY	2952805928
AMBIGUOUS_QUERY	790231894
AMBIGUOUS_QUERY	76184048
SELECT report_content AS report_content FROM risk_reports WHERE report_type = '月度风险报告' AND approval_status = '已拒绝';	291950371
SELECT event_type, COUNT(*) as event_count FROM risk_events GROUP BY event_type;	2809252635
SELECT c.customer_name AS customer_name, t.amount AS amount, t.transaction_date AS transaction_date
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE t.transaction_type = '转账' AND t.transaction_date = '2023-05-04' AND t.amount > 200000;	184311181
AMBIGUOUS_QUERY	1539184065
SELECT report_id AS report_id, report_content AS report_content FROM risk_reports WHERE approved_by = '高志远' AND report_date BETWEEN '2023-04-01' AND '2023-04-30';	3408938184
AMBIGUOUS_QUERY	547284006
SELECT re.event_id AS event_id, ra.risk_level AS latest_risk_level FROM risk_events re JOIN (SELECT event_id, risk_level, ROW_NUMBER() OVER (PARTITION BY event_id ORDER BY assessment_date DESC) AS rn FROM risk_assessments) ra ON re.event_id = ra.event_id WHERE ra.rn = 1;	2791172353
<final>
SELECT c.customer_name, 
       ra.high_risk_count AS high_risk_assessment_count, 
       t.large_transaction_count AS large_transaction_count
FROM customers c
JOIN (
    SELECT t.customer_id, COUNT(*) AS high_risk_count
    FROM transactions t
    JOIN risk_events re ON t.event_id = re.event_id
    JOIN risk_assessments ra ON re.event_id = ra.event_id
    WHERE ra.risk_level = 'high'
    AND ra.assessment_date >= CURRENT_DATE - INTERVAL '1 year'
    GROUP BY t.customer_id
) ra ON c.customer_id = ra.customer_id
JOIN (
    SELECT customer_id, COUNT(*) AS large_transaction_count
    FROM transactions
    WHERE amount > 500000
    AND transaction_date >= CURRENT_DATE - INTERVAL '1 year'
    GROUP BY customer_id
) t ON c.customer_id = t.customer_id;
</final>;	616009086
SELECT transactions.transaction_id AS transaction_id, transactions.customer_id AS customer_id, transactions.transaction_type AS transaction_type, transactions.amount AS amount, transactions.transaction_date AS transaction_date, transactions.status AS status, transactions.risk_score AS risk_score, transactions.event_id AS event_id FROM transactions JOIN customers ON transactions.customer_id = customers.customer_id WHERE customers.customer_name = '恒基能源有限公司';	2755424699
SELECT event_id, MAX(severity) AS max_severity FROM risk_events GROUP BY event_id;	3357225905
AMBIGUOUS_QUERY	2507883319
AMBIGUOUS_QUERY	2171757699
SELECT rm.log_id AS log_id, rm.actual_value AS actual_value, rm.is_exceeding_threshold AS is_exceeding_threshold, ri.indicator_name AS indicator_name 
FROM risk_monitoring_logs rm 
JOIN risk_indicators ri ON rm.indicator_id = ri.indicator_id;	1791933892
AMBIGUOUS_QUERY	4281611752
SELECT alert_id AS alert_id, alert_content AS alert_content, status AS status FROM alerts WHERE EXTRACT(YEAR FROM alert_time) = 2023;	2403947927
SELECT 
    r.indicator_id AS indicator_id,
    r.indicator_name AS indicator_name,
    m.monitoring_date AS monitoring_date,
    m.actual_value AS actual_value
FROM 
    risk_indicators r
JOIN 
    (SELECT 
        indicator_id, 
        MAX(monitoring_date) AS latest_date
     FROM 
        risk_monitoring_logs
     GROUP BY 
        indicator_id) latest
ON 
    r.indicator_id = latest.indicator_id
JOIN 
    risk_monitoring_logs m
ON 
    m.indicator_id = latest.indicator_id 
    AND m.monitoring_date = latest.latest_date;	3007794799
AMBIGUOUS_QUERY	3478580962
SELECT risk_level, COUNT(*) AS customer_count FROM customers GROUP BY risk_level;	2835641813
SELECT customer_id AS customer_id, risk_score AS risk_score, status AS status FROM transactions;	3556405805
SELECT DISTINCT ra.assessment_id AS assessment_id, ra.risk_level AS risk_level, t.transaction_id AS transaction_id, t.risk_score AS risk_score FROM risk_assessments ra JOIN risk_events re ON ra.event_id = re.event_id JOIN transactions t ON re.event_id = t.event_id WHERE ra.risk_level = '高' AND t.risk_score < 50;	1912282533
SELECT transaction_type, COUNT(*) AS success_count FROM transactions WHERE status = '成功' GROUP BY transaction_type;	966675168
AMBIGUOUS_QUERY	1657330121
SELECT t.transaction_id AS transaction_id, c.customer_name AS customer_name FROM transactions t INNER JOIN customers c ON t.customer_id = c.customer_id WHERE t.status = '处理中';	2427884877
AMBIGUOUS_QUERY	2050953540
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
    AND t.transaction_date >= CURRENT_TIMESTAMP - INTERVAL '1 year' 
    AND c.risk_level = '高';	2088100618
SELECT assessment_id AS 评估ID, mitigation_plan AS 缓解计划 FROM risk_assessments WHERE mitigation_plan IS NOT NULL;	4242999593
AMBIGUOUS_QUERY	4243946175
AMBIGUOUS_QUERY	1679294343
AMBIGUOUS_QUERY	1824329950
SELECT DISTINCT c.customer_name AS customer_name, c.credit_score AS credit_score, c.registration_date AS registration_date, t.transaction_date AS transaction_date 
FROM customers c 
JOIN transactions t ON c.customer_id = t.customer_id 
WHERE c.registration_date BETWEEN '2021-01-01' AND '2021-12-31' 
AND c.credit_score > 700 
AND t.transaction_date >= CURRENT_DATE - INTERVAL '1 year';	888703769
SELECT 
    a.alert_id AS alert_id,
    a.alert_type AS alert_type,
    a.alert_content AS alert_content,
    a.event_id AS event_id,
    re.event_type AS event_type,
    t.transaction_id AS transaction_id,
    t.amount AS amount
FROM alerts a
JOIN risk_events re ON a.event_id = re.event_id
JOIN transactions t ON re.event_id = t.event_id
WHERE a.assigned_to = '陈强';	411280576
AMBIGUOUS_QUERY	452369014
AMBIGUOUS_QUERY	865900816
SELECT indicator_name AS name, threshold_value AS threshold FROM risk_indicators;	92424187
AMBIGUOUS_QUERY	2998508313
SELECT t.transaction_id AS transaction_id, t.amount AS amount, c.customer_name AS customer_name, c.customer_type AS customer_type FROM transactions t JOIN customers c ON t.customer_id = c.customer_id WHERE t.amount > 100000;	1024168357
SELECT report_id AS report_id, report_type AS report_type, report_date AS report_date, report_content AS report_content, author AS author, approval_status AS approval_status, approved_by AS approved_by, event_id AS event_id FROM risk_reports WHERE approval_status = '已批准';	2422412797
SELECT transaction_type, AVG(risk_score) AS avg_risk_score FROM transactions GROUP BY transaction_type;	3918852865
	2671276850
SELECT 
    a.audit_type AS alert_type, 
    COUNT(*) AS alert_count, 
    AVG(EXTRACT(EPOCH FROM (a.audit_time - al.alert_time))) AS avg_processing_time
FROM 
    audit_logs a
JOIN 
    alerts al ON a.alert_id = al.alert_id
WHERE 
    a.audit_result = '通过'
GROUP BY 
    a.audit_type;	3873676880
<final>
SELECT 
    re.event_type AS event_type,
    AVG(EXTRACT(EPOCH FROM (a.alert_time - re.created_at)) / (60 * 60 * 24)) AS avg_resolution_days
FROM 
    risk_events re
JOIN 
    alerts a ON re.event_id = a.event_id
WHERE 
    re.status = '已解决'
    AND a.status = '已解决'
GROUP BY 
    re.event_type;
</final>;	3957865555
AMBIGUOUS_QUERY	4127521896
AMBIGUOUS_QUERY	4089186720
AMBIGUOUS_QUERY	907497664
AMBIGUOUS_QUERY	4046233588
SELECT customer_type, COUNT(*) AS customer_count FROM customers GROUP BY customer_type;	950586637
AMBIGUOUS_QUERY	1374953478
AMBIGUOUS_QUERY	3381418272
AMBIGUOUS_QUERY	2179442925
AMBIGUOUS_QUERY	1859945760
SELECT risk_events.event_id AS event_id, risk_events.event_type AS event_type, risk_assessments.risk_level AS risk_level, risk_assessments.mitigation_plan AS mitigation_plan, risk_assessments.assessor AS assessor FROM risk_events JOIN risk_assessments ON risk_events.event_id = risk_assessments.event_id WHERE risk_assessments.risk_level = '高';	2798341435
SELECT customer_id AS cust_id, customer_name AS cust_name, credit_score AS credit_score FROM customers WHERE risk_level = '高' AND credit_score < 700;	2480313897
SELECT customer_id AS customer_id, customer_name AS customer_name, customer_type AS customer_type, credit_score AS credit_score, risk_level AS risk_level, registration_date AS registration_date, last_update_date AS last_update_date FROM customers WHERE risk_level = '高' AND credit_score < 600;	4249746696
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
AMBIGUOUS_QUERY	1094205818
SELECT author, COUNT(*) AS report_count FROM risk_reports GROUP BY author ORDER BY report_count DESC LIMIT 1;	4008892599
AMBIGUOUS_QUERY	1522060162
SELECT customer_name AS customer_name, last_update_date AS last_update_date FROM customers WHERE registration_date > '2021-01-01';	2054103027
AMBIGUOUS_QUERY	3283769605
AMBIGUOUS_QUERY	747719750
AMBIGUOUS_QUERY	334580003
AMBIGUOUS_QUERY	388467912
SELECT risk_events.event_id AS event_id, risk_events.event_description AS event_description, risk_assessments.assessor AS assessor FROM risk_events INNER JOIN risk_assessments ON risk_events.event_id = risk_assessments.event_id WHERE risk_assessments.assessor IS NOT NULL;	3589660339
SELECT SUM(amount) AS total_refund_amount FROM transactions WHERE transaction_type = '退款';	1785182803
SELECT ri.indicator_id AS indicator_id, ri.indicator_name AS indicator_name, ri.indicator_description AS indicator_description, ri.measurement_unit AS measurement_unit, ri.threshold_value AS threshold_value, ri.data_source AS data_source, ri.update_frequency AS update_frequency, rml.actual_value AS actual_value, rml.monitoring_date AS monitoring_date FROM risk_indicators ri JOIN risk_monitoring_logs rml ON ri.indicator_id = rml.indicator_id WHERE (ri.indicator_id, rml.monitoring_date) IN (SELECT indicator_id, MAX(monitoring_date) FROM risk_monitoring_logs GROUP BY indicator_id);	3949045999
SELECT 
    re.event_type, 
    EXTRACT(EPOCH FROM AVG(audit_time - re.occurrence_time)) / 60 AS avg_mitigation_minutes
FROM 
    risk_events re
JOIN 
    audit_logs al ON re.event_id = al.event_id
WHERE 
    al.audit_comments ILIKE '%完成%'
GROUP BY 
    re.event_type;	1365503712
SELECT event_type, COUNT(*) AS event_count FROM risk_events GROUP BY event_type;	454781039
SELECT risk_assessments.assessment_id AS assessment_id, risk_events.event_description AS event_description, risk_assessments.assessor AS assessor FROM risk_assessments JOIN risk_events ON risk_assessments.event_id = risk_events.event_id;	312146930
AMBIGUOUS_QUERY	3050678212
AMBIGUOUS_QUERY	2500244814
SELECT report_id AS report_id, report_type AS report_type, report_date AS report_date, author AS author FROM risk_reports WHERE approval_status = 'approved';	2753692877
SELECT 
    customer_id AS customer_id,
    customer_name AS customer_name,
    customer_type AS customer_type,
    credit_score AS credit_score,
    risk_level AS risk_level,
    registration_date AS registration_date,
    last_update_date AS last_update_date
FROM 
    customers
WHERE 
    risk_level = '高'
    AND credit_score > (SELECT AVG(credit_score) FROM customers);	2701292510
AMBIGUOUS_QUERY	3788454929
SELECT 
    re.event_id AS event_id, 
    re.event_description AS event_description, 
    re.severity AS severity, 
    re.created_at AS created_at, 
    al.audit_time AS resolved_date, 
    (al.audit_time - re.created_at) AS resolution_time 
FROM 
    risk_events re 
JOIN 
    audit_logs al ON re.event_id = al.event_id 
WHERE 
    re.status = 'resolved' 
    AND al.audit_type = 'resolve' 
ORDER BY 
    resolution_time DESC 
LIMIT 10;	1494274200
AMBIGUOUS_QUERY	2741655674
SELECT risk_level, COUNT(*) AS customer_count FROM customers GROUP BY risk_level;	4006191467
AMBIGUOUS_QUERY	1366443289
SELECT created_at AS event_creation_time FROM risk_events WHERE severity >= 3;	2713864982
AMBIGUOUS_QUERY	4176420377
AMBIGUOUS_QUERY	2609744326
ERROR: LLM 请求失败	1472140605
SELECT customers.customer_id AS customer_id, customers.customer_name AS customer_name, transactions.amount AS amount FROM customers JOIN transactions ON customers.customer_id = transactions.customer_id WHERE customers.risk_level = '高' AND transactions.transaction_date >= CURRENT_DATE - INTERVAL '1 year' AND transactions.amount > 100000;	4016844576
AMBIGUOUS_QUERY	1206095116
AMBIGUOUS_QUERY	747204718
AMBIGUOUS_QUERY	380031248
SELECT report_id AS report_id, institution_id AS institution_id, report_date AS report_date, report_type AS report_type, submission_date AS submission_date, approval_status AS approval_status, comments AS comments FROM regulatory_reports WHERE submission_date = '2023-11-01';	796615861
SELECT DISTINCT fi.institution_name AS institution_name
FROM financial_institution_info fi
WHERE EXISTS (
    SELECT 1
    FROM capital_adequacy_ratio car
    WHERE car.institution_id = fi.institution_id
    AND car.report_date BETWEEN '2023-06-01' AND '2023-06-30'
    AND car.total_car < 12
)
AND EXISTS (
    SELECT 1
    FROM non_performing_loans npl
    WHERE npl.institution_id = fi.institution_id
    AND npl.report_date BETWEEN '2023-06-01' AND '2023-06-30'
    AND npl.npl_ratio > 2
);	226307394
SELECT fi.institution_name, (re.market_risk_exposure / re.total_risk_exposure) AS market_risk_ratio 
FROM risk_exposure re 
JOIN financial_institution_info fi ON re.institution_id = fi.institution_id 
ORDER BY market_risk_ratio DESC 
LIMIT 1;	2186232166
SELECT fi.institution_name AS institution_name, rr.report_id AS report_id, rr.report_type AS report_type, rr.approval_status AS approval_status, fi.registered_capital AS registered_capital 
FROM regulatory_reports rr 
JOIN financial_institution_info fi ON rr.institution_id = fi.institution_id 
WHERE rr.report_date BETWEEN '2023-07-01' AND '2023-09-30' 
AND rr.report_type = '季度报告' 
AND rr.approval_status = '需修改' 
AND fi.registered_capital > 50000000;	3832687129
AMBIGUOUS_QUERY	3593789396
AMBIGUOUS_QUERY	3734281326
AMBIGUOUS_QUERY	2976622725
SELECT institution_id, loans_and_advances AS total_loans, deposits AS total_deposits FROM balance_sheet WHERE EXTRACT(YEAR FROM report_date) = 2024;	3196242817
ERROR: LLM 请求失败	1889616376
AMBIGUOUS_QUERY	453935379
SELECT net_interest_income AS net_interest_income, non_interest_income AS non_interest_income FROM income_statement WHERE report_date = '2023-03-01';	44191459
SELECT npl_ratio AS npl_ratio FROM non_performing_loans;	584013962
SELECT fi.institution_name
FROM financial_institution_info fi
WHERE EXISTS (
    SELECT 1
    FROM regulatory_reports rr
    WHERE rr.institution_id = fi.institution_id
    AND rr.report_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND rr.report_type = '季度报告'
    AND rr.approval_status = '需修改'
)
AND EXISTS (
    SELECT 1
    FROM non_performing_loans npl
    WHERE npl.institution_id = fi.institution_id
    AND npl.report_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND npl.npl_ratio > 1
);	2733428482
SELECT fi.institution_name AS institution_name 
FROM regulatory_reports rr 
JOIN financial_institution_info fi ON rr.institution_id = fi.institution_id 
WHERE rr.report_date = '2023-10-01' 
AND rr.report_type = '半年度报告' 
AND rr.approval_status = '待审核';	951459633
SELECT institution_name AS 机构名称, registered_capital AS 注册资本 FROM financial_institution_info WHERE institution_type != '银行' ORDER BY registered_capital DESC LIMIT 5;	1829456676
SELECT COUNT(DISTINCT b.institution_id) AS count FROM balance_sheet b JOIN non_performing_loans npl ON b.institution_id = npl.institution_id WHERE b.institution_id IN (SELECT institution_id FROM balance_sheet ORDER BY total_assets DESC LIMIT 500) AND npl.npl_ratio < 0.01 AND npl.provision_coverage_ratio > 200;	1953695337
SELECT fi.institution_name 
FROM financial_institution_info fi 
JOIN capital_adequacy_ratio car ON fi.institution_id = car.institution_id 
JOIN regulatory_reports rr ON fi.institution_id = rr.institution_id 
WHERE car.core_tier_1_ratio < 10 
AND rr.approval_status = '待审核' 
AND car.report_date = '2023-12-01';	1414930652
	364214965
SELECT report_id AS report_id, approval_status AS approval_status FROM regulatory_reports WHERE report_date = '2023-07-01';	419882166
AMBIGUOUS_QUERY	3742684421
SELECT record_id AS record_id, institution_id AS institution_id, record_date AS record_date, compliance_type AS compliance_type, description AS description, severity AS severity, status AS status, resolution_date AS resolution_date FROM compliance_records WHERE record_date >= '2023-01-01' AND record_date <= '2023-12-31' AND status = '已解决';	2448874069
SELECT report_type, COUNT(*) AS submission_count FROM regulatory_reports WHERE submission_date BETWEEN '2023-07-01' AND '2023-09-30' GROUP BY report_type ORDER BY submission_count DESC LIMIT 1;	3679648301
AMBIGUOUS_QUERY	293590145
AMBIGUOUS_QUERY	685587392
AMBIGUOUS_QUERY	727742801
SELECT record_id AS 记录ID, institution_id AS 机构ID, record_date AS 记录日期, resolution_date AS 解决日期, description AS 描述, severity AS 严重程度, status AS 状态, compliance_type AS 合规类型 FROM compliance_records WHERE record_date BETWEEN '2023-03-01' AND '2023-03-31';	3429671168
AMBIGUOUS_QUERY	3200376501
SELECT report_type AS report_type FROM regulatory_reports WHERE report_date = '2023-10-01';	1891907399
ERROR: LLM 请求失败	11596427
ERROR: LLM 请求失败	3129849565
AMBIGUOUS_QUERY	3154891263
ERROR: LLM 请求失败	1874414819
AMBIGUOUS_QUERY	495816064
AMBIGUOUS_QUERY	4161304037
AMBIGUOUS_QUERY	1631317162
SELECT record_id AS record_id, institution_id AS institution_id, record_date AS record_date, compliance_type AS compliance_type, description AS description, severity AS severity, status AS status, resolution_date AS resolution_date FROM compliance_records WHERE status = '已解决';	2784626903
SELECT fi.institution_name AS institution_name, rr.approval_status AS approval_status, npl.npl_ratio AS npl_ratio FROM regulatory_reports rr JOIN financial_institution_info fi ON rr.institution_id = fi.institution_id JOIN non_performing_loans npl ON rr.institution_id = npl.institution_id WHERE rr.report_date BETWEEN '2023-07-01' AND '2023-07-31' AND npl.report_date BETWEEN '2023-07-01' AND '2023-07-31' AND rr.approval_status = '需修改' AND npl.npl_ratio > 1;	1450759690
AMBIGUOUS_QUERY	862814083
SELECT DISTINCT fi.institution_id AS institution_id
FROM non_performing_loans npl
JOIN financial_institution_info fi ON npl.institution_id = fi.institution_id
WHERE npl.total_loans > 100000000000;	2681992996
AMBIGUOUS_QUERY	3797835240
AMBIGUOUS_QUERY	788537141
SELECT fi.institution_name AS institution_name, rr.report_type AS report_type, rr.approval_status AS approval_status, npl.npl_ratio AS npl_ratio 
FROM regulatory_reports rr 
JOIN financial_institution_info fi ON rr.institution_id = fi.institution_id 
JOIN non_performing_loans npl ON fi.institution_id = npl.institution_id 
WHERE rr.report_date >= '2023-01-01' 
AND rr.report_date < '2024-01-01' 
AND rr.report_type = '季度报告' 
AND rr.approval_status = '已拒绝' 
AND npl.report_date >= '2023-01-01' 
AND npl.report_date < '2024-01-01' 
AND npl.npl_ratio > 0.02;	2511418954
AMBIGUOUS_QUERY	133973236
SELECT 0 AS average_branch_count;	580723534
SELECT r.institution_id AS institution_id, fi.institution_name AS institution_name 
FROM risk_exposure r 
JOIN financial_institution_info fi ON r.institution_id = fi.institution_id 
WHERE r.market_risk_exposure > 20 
AND EXISTS (
    SELECT 1 
    FROM capital_adequacy_ratio ca 
    WHERE ca.institution_id = r.institution_id 
    AND ca.core_tier_1_ratio < 8.5
);	627590872
SELECT fi.institution_name, car.core_tier_1_ratio, car.tier_1_ratio, car.total_car 
FROM capital_adequacy_ratio car 
JOIN financial_institution_info fi ON car.institution_id = fi.institution_id 
WHERE car.report_date = '2023-12-01' 
AND car.core_tier_1_ratio < 10 
AND car.total_car < 12;	3208012990
SELECT COUNT(*) AS count FROM compliance_records WHERE severity = '高' AND record_date >= '2023-01-01' AND record_date < '2024-01-01';	377707744
SELECT fi.institution_name
FROM balance_sheet bs
JOIN financial_institution_info fi ON bs.institution_id = fi.institution_id
ORDER BY (bs.cash_and_equivalents / bs.total_assets) DESC
LIMIT 1;	2467976254
SELECT fi.institution_name
FROM risk_exposure re
JOIN financial_institution_info fi ON re.institution_id = fi.institution_id
WHERE re.market_risk_exposure / re.total_risk_exposure > 0.4
AND re.total_risk_exposure > 0;	416448494
AMBIGUOUS_QUERY	1582694445
SELECT fi.institution_name AS institution_name
FROM financial_institution_info fi
JOIN capital_adequacy_ratio car ON fi.institution_id = car.institution_id
JOIN regulatory_reports rr ON fi.institution_id = rr.institution_id
WHERE car.core_tier_1_ratio < 8
AND car.report_date BETWEEN '2023-01-01' AND '2023-12-31'
AND rr.approval_status = '已批准'
AND rr.report_date BETWEEN '2023-01-01' AND '2023-12-31';	3631241992
SELECT institution_id AS inst_id, credit_risk_exposure AS credit_risk, operational_risk_exposure AS operational_risk FROM risk_exposure WHERE report_date >= '2024-01-01' AND report_date < '2024-02-01';	3632342709
SELECT record_id AS record_id, institution_id AS institution_id, record_date AS record_date, resolution_date AS resolution_date, description AS description, severity AS severity, status AS status, compliance_type AS compliance_type FROM compliance_records WHERE record_date = '2023-04-02';	2274602916
AMBIGUOUS_QUERY	3547022021
SELECT institution_id, provision_coverage_ratio AS provision_coverage_ratio FROM non_performing_loans WHERE provision_coverage_ratio > 150;	4106988075
SELECT transaction_id AS TransactionID, institution_id AS InstitutionID, transaction_date AS TransactionDate, related_party AS RelatedParty, transaction_type AS TransactionType, transaction_amount AS TransactionAmount, approval_status AS ApprovalStatus FROM related_party_transactions WHERE transaction_date = '2023-12-22';	1714782457
SELECT fi.institution_name 
FROM financial_institution_info fi 
JOIN liquidity_ratio lr ON fi.institution_id = lr.institution_id 
JOIN non_performing_loans npl ON fi.institution_id = npl.institution_id 
WHERE lr.liquidity_coverage_ratio > 110 
AND npl.npl_ratio < 1.5;	663454855
SELECT 
    r.institution_id AS institution_id,
    fi.institution_name AS institution_name,
    r.report_type AS report_type,
    r.approval_status AS approval_status,
    npl.npl_ratio AS npl_ratio
FROM 
    regulatory_reports r
JOIN financial_institution_info fi ON r.institution_id = fi.institution_id
JOIN non_performing_loans npl ON r.institution_id = npl.institution_id
WHERE 
    r.submission_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND r.report_type = '季度报告'
    AND r.approval_status = '需修改'
    AND npl.npl_ratio > 2;	1930062711
AMBIGUOUS_QUERY	166707732
AMBIGUOUS_QUERY	833967887
<final>
SELECT COUNT(DISTINCT m.institution_id) AS count
FROM (
    SELECT institution_id
    FROM (
        SELECT 
            institution_id,
            report_date,
            credit_risk_exposure,
            LAG(credit_risk_exposure) OVER (PARTITION BY institution_id ORDER BY report_date) AS prev_exposure
        FROM risk_exposure
    ) sub
    WHERE (credit_risk_exposure - prev_exposure) > 0
      AND (credit_risk_exposure - prev_exposure) / prev_exposure > 0.5
) m
JOIN (
    SELECT institution_id
    FROM (
        SELECT 
            institution_id,
            report_date,
            total_car,
            LAG(total_car) OVER (PARTITION BY institution_id ORDER BY report_date) AS prev_car
        FROM capital_adequacy_ratio
    ) sub
    WHERE (total_car - prev_car) > 0
      AND (total_car - prev_car) < 1
) c
ON m.institution_id = c.institution_id;
</final>;	4204116228
SELECT institution_id AS institution_id, total_assets AS total_assets, total_liabilities AS total_liabilities FROM balance_sheet;	771560804
SELECT fi.institution_name AS institution_name, rr.approval_status AS approval_status, rpt.transaction_amount AS transaction_amount 
FROM regulatory_reports rr 
JOIN related_party_transactions rpt ON rr.institution_id = rpt.institution_id 
JOIN financial_institution_info fi ON rr.institution_id = fi.institution_id 
WHERE rr.report_date BETWEEN '2023-07-01' AND '2023-07-31' 
AND rr.approval_status = '需修改' 
AND rpt.transaction_amount > 5000000;	1414769749
AMBIGUOUS_QUERY	2946947084
SELECT risk_exposure_id AS risk_exposure_id, institution_id AS institution_id, report_date AS report_date, credit_risk_exposure AS credit_risk_exposure, market_risk_exposure AS market_risk_exposure, operational_risk_exposure AS operational_risk_exposure, total_risk_exposure AS total_risk_exposure FROM risk_exposure WHERE report_date = '2023-10-01';	68375114
ERROR: LLM 请求失败	1086344523
AMBIGUOUS_QUERY	1266365033
AMBIGUOUS_QUERY	152560977
SELECT fi.institution_name 
FROM financial_institution_info fi 
JOIN regulatory_reports rr ON fi.institution_id = rr.institution_id 
JOIN non_performing_loans npl ON fi.institution_id = npl.institution_id 
WHERE rr.report_date = '2023-07-01' 
AND rr.report_type = '季度报告' 
AND rr.approval_status = '需修改' 
AND npl.report_date = '2023-07-01' 
AND npl.npl_ratio > 2;	3829846580
AMBIGUOUS_QUERY	3809349460
SELECT fi.institution_name 
FROM financial_institution_info fi 
JOIN regulatory_reports rr ON fi.institution_id = rr.institution_id 
JOIN non_performing_loans npl ON fi.institution_id = npl.institution_id 
WHERE rr.report_date = '2023-10-01' 
  AND rr.report_type = '半年度报告' 
  AND npl.npl_ratio > 2 
  AND npl.report_date = '2023-10-01';	3887529815
AMBIGUOUS_QUERY	1095324516
SELECT institution_id, SUM(non_interest_income) AS total_non_interest_income FROM income_statement WHERE report_date = '2023-03-01' GROUP BY institution_id;	2608079409
AMBIGUOUS_QUERY	1384996686
SELECT COUNT(*) AS count FROM related_party_transactions WHERE transaction_type = '资产转移' AND transaction_amount > 500000000 AND transaction_date BETWEEN '2023-01-01' AND '2023-12-31';	2903384914
SELECT fi.institution_name 
FROM financial_institution_info fi
JOIN regulatory_reports rr ON fi.institution_id = rr.institution_id
JOIN related_party_transactions rptr ON fi.institution_id = rptr.institution_id
WHERE rr.report_date = '2023-08-01' 
  AND rr.approval_status = '需修改' 
  AND rptr.transaction_amount > 5000000;	1640671061
SELECT DISTINCT r.institution_id AS institution_id, fi.institution_name AS institution_name 
FROM regulatory_reports r 
JOIN financial_institution_info fi ON r.institution_id = fi.institution_id 
WHERE r.report_date BETWEEN '2023-01-01' AND '2023-12-31' 
  AND r.report_type = '季度报告' 
  AND r.approval_status = '已拒绝' 
  AND EXISTS (
    SELECT 1 
    FROM income_statement i 
    WHERE i.institution_id = r.institution_id 
      AND i.report_date BETWEEN '2023-01-01' AND '2023-03-31' 
      AND i.net_profit > 10000000
  );	3904574419
SELECT DISTINCT fi.institution_name AS institution_name
FROM regulatory_reports rr
JOIN financial_institution_info fi ON rr.institution_id = fi.institution_id
WHERE rr.report_date = '2023-07-01'
AND rr.report_type = '季度报告'
AND rr.approval_status = '需修改';	493525183
ERROR: LLM 请求失败	3146074594
<final>
SELECT 
    fi.institution_name AS institution_name,
    rr.report_type AS report_type,
    rr.approval_status AS approval_status,
    npl.npl_ratio AS npl_ratio
FROM 
    regulatory_reports rr
JOIN 
    financial_institution_info fi ON rr.institution_id = fi.institution_id
JOIN 
    non_performing_loans npl ON rr.institution_id = npl.institution_id
WHERE 
    rr.report_date BETWEEN '2023-10-01' AND '2023-10-31'
    AND rr.report_type = '半年度报告'
    AND rr.approval_status = '待审核'
    AND npl.report_date BETWEEN '2023-10-01' AND '2023-10-31'
    AND npl.npl_ratio > 1;
</final>;	2337714646
AMBIGUOUS_QUERY	2791588181
SELECT car_id AS car_id, institution_id AS institution_id, report_date AS report_date, core_tier_1_ratio AS core_tier_1_ratio, tier_1_ratio AS tier_1_ratio, total_car AS total_car, risk_weighted_assets AS risk_weighted_assets FROM capital_adequacy_ratio WHERE core_tier_1_ratio < 8;	833263523
SELECT regulatory_reports.institution_id AS report_institution_id, financial_institution_info.institution_name, financial_institution_info.registered_capital, regulatory_reports.report_type, regulatory_reports.approval_status FROM regulatory_reports JOIN financial_institution_info ON regulatory_reports.institution_id = financial_institution_info.institution_id WHERE EXTRACT(YEAR FROM regulatory_reports.report_date) = 2023 AND regulatory_reports.report_type = '半年度报告' AND regulatory_reports.approval_status = '待审核' AND financial_institution_info.registered_capital > 50000000;	3179741002
SELECT DISTINCT fi.institution_name AS institution_name FROM related_party_transactions rpt JOIN financial_institution_info fi ON rpt.institution_id = fi.institution_id WHERE rpt.transaction_date = '2023-06-01' AND rpt.approval_status = '待审批' AND rpt.transaction_amount > 5000000;	2065261887
AMBIGUOUS_QUERY	2360476437
SELECT fi.institution_name 
FROM financial_institution_info fi 
JOIN income_statement is_table ON fi.institution_id = is_table.institution_id 
WHERE is_table.report_date = '2023-04-01' 
AND is_table.net_interest_income > 1000000000;	1635102268
ERROR: LLM 请求失败	890576370
SELECT fi.institution_name AS institution_name, re.total_risk_exposure AS total_risk_exposure, car.core_tier_1_ratio AS core_tier_1_ratio 
FROM financial_institution_info fi 
JOIN risk_exposure re ON fi.institution_id = re.institution_id 
JOIN capital_adequacy_ratio car ON fi.institution_id = car.institution_id 
WHERE re.report_date = '2023-10-01' 
AND car.report_date = '2023-10-01' 
AND re.total_risk_exposure > 300000000000 
AND car.core_tier_1_ratio < 8;	1878253672
AMBIGUOUS_QUERY	860852233
SELECT DISTINCT institution_id AS institution_id FROM balance_sheet WHERE loans_and_advances > deposits;	3387337626
SELECT fi.institution_name AS institution_name, rr.report_date AS report_date, rr.approval_status AS approval_status FROM regulatory_reports rr JOIN financial_institution_info fi ON rr.institution_id = fi.institution_id WHERE rr.submission_date BETWEEN '2023-01-01' AND '2023-12-31' AND rr.report_type = '季度报告' AND rr.approval_status = '已拒绝';	1310122613
SELECT fi.institution_name AS institution_name
FROM financial_institution_info fi
JOIN income_statement is_table ON fi.institution_id = is_table.institution_id
WHERE is_table.report_date = '2023-04-01'
AND is_table.non_interest_income > 200000000;	663309404
AMBIGUOUS_QUERY	3052564664
AMBIGUOUS_QUERY	3564915606
SELECT DISTINCT institution_id AS institution_id FROM risk_exposure WHERE report_date BETWEEN '2023-01-01' AND '2023-12-31';	197691923
SELECT institution_id AS institution_id FROM capital_adequacy_ratio WHERE report_date >= '2023-11-01' AND report_date < '2023-12-01' AND risk_weighted_assets > 120000000000;	4129983532
AMBIGUOUS_QUERY	2233736633
AMBIGUOUS_QUERY	2305237654
SELECT 
    AVG(npl.npl_ratio) AS average_npl_ratio,
    AVG(npl.provision_coverage_ratio) AS average_provision_coverage_ratio,
    AVG(car.total_car) AS average_total_car
FROM 
    (SELECT institution_id FROM balance_sheet ORDER BY total_assets DESC LIMIT 1000) AS top_institutions
JOIN 
    non_performing_loans AS npl ON top_institutions.institution_id = npl.institution_id
JOIN 
    capital_adequacy_ratio AS car ON top_institutions.institution_id = car.institution_id;	2186326450
SELECT fi.institution_name AS institution_name, rr.report_type AS report_type, npl.npl_ratio AS npl_ratio FROM financial_institution_info fi JOIN regulatory_reports rr ON fi.institution_id = rr.institution_id JOIN non_performing_loans npl ON fi.institution_id = npl.institution_id WHERE rr.report_date = '2023-07-01' AND rr.report_type = '季度报告' AND npl.npl_ratio > 1.5;	2638456489
SELECT fi.institution_name AS institution_name
FROM financial_institution_info fi
JOIN regulatory_reports rr ON fi.institution_id = rr.institution_id
JOIN non_performing_loans npl ON fi.institution_id = npl.institution_id
WHERE rr.report_date = '2024-01-01'
  AND rr.report_type = '年度报告'
  AND rr.approval_status = '已批准'
  AND npl.npl_ratio > 1
  AND npl.report_date = '2024-01-01';	3113756288
AMBIGUOUS_QUERY	1220868379
SELECT fi.institution_name AS institution_name FROM financial_institution_info fi JOIN non_performing_loans npl ON fi.institution_id = npl.institution_id WHERE npl.report_date BETWEEN '2023-12-01' AND '2023-12-31' AND npl.npl_ratio > 1.5;	576576905
SELECT fi.institution_name 
FROM financial_institution_info fi 
JOIN liquidity_ratio lr ON fi.institution_id = lr.institution_id 
WHERE lr.loan_to_deposit_ratio > 75 
AND lr.liquidity_coverage_ratio < 120;	4037291156
SELECT report_id AS report_id, institution_id AS institution_id, report_date AS report_date, report_type AS report_type, submission_date AS submission_date, approval_status AS approval_status, comments AS comments FROM regulatory_reports WHERE report_type = '半年度报告';	163054391
ERROR: LLM 请求失败	3390154129
SELECT r.institution_id AS institution_id, r.report_id AS report_id, r.report_type AS report_type, r.approval_status AS approval_status, n.npl_ratio AS npl_ratio FROM regulatory_reports r JOIN non_performing_loans n ON r.institution_id = n.institution_id WHERE r.report_date BETWEEN '2023-01-01' AND '2023-12-31' AND r.report_type = '季度报告' AND r.approval_status = '已拒绝' AND n.report_date BETWEEN '2023-01-01' AND '2023-12-31' AND n.npl_ratio > 2;	1510688156
SELECT fi.institution_name AS institution_name, rr.report_id AS report_id, rr.report_date AS report_date, rr.comments AS comments FROM regulatory_reports rr JOIN financial_institution_info fi ON rr.institution_id = fi.institution_id WHERE rr.report_type = '季度报告' AND rr.approval_status = '已拒绝' AND rr.report_date BETWEEN '2023-01-01' AND '2023-12-31';	776982448
AMBIGUOUS_QUERY	3735593182
SELECT institution_id, (core_tier_1_ratio - total_car) AS difference FROM capital_adequacy_ratio ORDER BY difference ASC LIMIT 1;	1403047777
SELECT balance_sheet.institution_id AS institution_id, balance_sheet.total_liabilities AS total_liabilities, financial_institution_info.registered_capital AS registered_capital FROM balance_sheet INNER JOIN financial_institution_info ON balance_sheet.institution_id = financial_institution_info.institution_id WHERE balance_sheet.report_date >= '2024-01-01' AND balance_sheet.report_date < '2025-01-01';	2008864858
AMBIGUOUS_QUERY	4061107202
ERROR: LLM 请求失败	1821132508
AMBIGUOUS_QUERY	1128459706
SELECT fi.institution_name AS institution_name FROM financial_institution_info fi JOIN risk_exposure re ON fi.institution_id = re.institution_id WHERE re.report_date BETWEEN '2023-05-01' AND '2023-05-31' AND re.market_risk_exposure > 20000000000;	4259113020
SELECT fi.institution_name AS institution_name, rr.report_date AS report_date, rr.approval_status AS approval_status FROM regulatory_reports rr JOIN financial_institution_info fi ON rr.institution_id = fi.institution_id WHERE rr.report_type = '年度报告' AND rr.approval_status = '已批准' AND rr.report_date BETWEEN '2024-01-01' AND '2024-12-31';	3886257211
AMBIGUOUS_QUERY	1168290373
AMBIGUOUS_QUERY	2077067574
SELECT fi.institution_name AS institution_name, rr.report_date AS report_date FROM regulatory_reports rr JOIN financial_institution_info fi ON rr.institution_id = fi.institution_id WHERE rr.report_type = '年度报告' AND rr.approval_status = '已批准' AND rr.submission_date >= '2024-01-01' AND rr.submission_date < '2025-01-01';	2225198432
SELECT car_id AS car_id, institution_id AS institution_id, report_date AS report_date, core_tier_1_ratio AS core_tier_1_ratio, tier_1_ratio AS tier_1_ratio, total_car AS total_car, risk_weighted_assets AS risk_weighted_assets FROM capital_adequacy_ratio WHERE report_date = '2023-11-01';	1600202324
SELECT core_tier_1_ratio AS core_tier1_ratio, tier_1_ratio AS tier1_ratio, total_car AS total_car, risk_weighted_assets AS risk_weighted_assets, report_date AS report_date FROM capital_adequacy_ratio WHERE institution_id = 2162;	1999653381
SELECT institution_id, SUM(total_loans) AS total_loans_2023, SUM(npl_amount) AS total_npl_amount_2023
FROM non_performing_loans
WHERE EXTRACT(YEAR FROM report_date) = 2023
GROUP BY institution_id;	4241341417
AMBIGUOUS_QUERY	885949604
SELECT institution_id, MAX(provision_coverage_ratio) AS provision_coverage_ratio
FROM non_performing_loans
GROUP BY institution_id
ORDER BY provision_coverage_ratio DESC
LIMIT 1;	2230661366
SELECT lr.institution_id AS institution_id, lr.report_date AS report_date, lr.liquidity_coverage_ratio AS liquidity_coverage_ratio, lr.net_stable_funding_ratio AS net_stable_funding_ratio, lr.loan_to_deposit_ratio AS loan_to_deposit_ratio, car.core_tier_1_ratio AS core_tier_1_ratio, car.tier_1_ratio AS tier_1_ratio, car.total_car AS total_car 
FROM liquidity_ratio lr 
JOIN capital_adequacy_ratio car 
ON lr.institution_id = car.institution_id AND lr.report_date = car.report_date 
WHERE lr.report_date BETWEEN '2023-01-01' AND '2023-12-31';	2148224764
AMBIGUOUS_QUERY	1163520286
SELECT institution_id, SUM(non_interest_income) AS total_non_interest_income, SUM(net_profit) AS total_net_profit FROM income_statement WHERE EXTRACT(YEAR FROM report_date) = 2023 GROUP BY institution_id;	3770945123
SELECT 
    fi.institution_name AS institution_name,
    rr.report_type AS report_type,
    rr.approval_status AS approval_status,
    npl.npl_ratio AS npl_ratio
FROM 
    regulatory_reports rr
JOIN 
    financial_institution_info fi ON rr.institution_id = fi.institution_id
JOIN 
    non_performing_loans npl ON rr.institution_id = npl.institution_id
WHERE 
    rr.report_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND rr.report_type = '季度报告'
    AND rr.approval_status = '已拒绝'
    AND npl.npl_ratio > 2
    AND npl.report_date BETWEEN '2023-01-01' AND '2023-12-31';	3353540268
SELECT fi.institution_name AS inst_name
FROM capital_adequacy_ratio car
JOIN financial_institution_info fi ON car.institution_id = fi.institution_id
WHERE car.report_date = '2023-12-31' AND car.core_tier_1_ratio < 9;	2078748822
SELECT institution_id AS institution_id FROM liquidity_ratio WHERE report_date BETWEEN '2023-11-01' AND '2023-11-30' AND liquidity_coverage_ratio < 110;	953035312
SELECT r.market_risk_exposure AS market_risk_exposure, npl.provision_coverage_ratio AS provision_coverage_ratio 
FROM risk_exposure r 
JOIN non_performing_loans npl 
ON r.institution_id = npl.institution_id 
AND r.report_date = npl.report_date 
WHERE r.report_date = '2023-03-01';	2823110481
SELECT legal_representative AS 法人代表, contact_number AS 联系方式 FROM financial_institution_info;	1671662541
AMBIGUOUS_QUERY	2071522801
SELECT SUBSTRING(address FROM 1 FOR POSITION('市' IN address) - 1) AS region, AVG(liquidity_coverage_ratio) AS avg_liquidity_coverage_ratio 
FROM financial_institution_info 
JOIN liquidity_ratio ON financial_institution_info.institution_id = liquidity_ratio.institution_id 
GROUP BY region 
ORDER BY avg_liquidity_coverage_ratio DESC 
LIMIT 1;	205800859
AMBIGUOUS_QUERY	3274370781
AMBIGUOUS_QUERY	1230704489
AMBIGUOUS_QUERY	1986352436
SELECT fi.institution_name AS institution_name, rr.report_date AS report_date, rr.submission_date AS submission_date FROM regulatory_reports rr JOIN financial_institution_info fi ON rr.institution_id = fi.institution_id WHERE rr.report_type = '季度报告' AND rr.approval_status = '需修改' AND rr.submission_date BETWEEN '2023-01-01' AND '2023-12-31';	171565062
SELECT fi.institution_name AS institution_name, car.total_car AS capital_adequacy_ratio, npl.npl_ratio AS non_performing_ratio 
FROM financial_institution_info fi 
JOIN capital_adequacy_ratio car ON fi.institution_id = car.institution_id 
JOIN non_performing_loans npl ON fi.institution_id = npl.institution_id 
WHERE car.total_car > 12 AND npl.npl_ratio < 2;	1038814840
AMBIGUOUS_QUERY	1181628181
SELECT fi.institution_name AS institution_name FROM risk_exposure re JOIN financial_institution_info fi ON re.institution_id = fi.institution_id WHERE re.report_date BETWEEN '2023-01-01' AND '2023-12-31' AND re.credit_risk_exposure > 50000000000;	3568939453
AMBIGUOUS_QUERY	716682341
SELECT car_id AS 资本充足率ID, institution_id AS 机构ID, report_date AS 报告日期, core_tier_1_ratio AS 核心一级资本比率, tier_1_ratio AS 一级资本比率, total_car AS 总资本充足率, risk_weighted_assets AS 风险加权资产 FROM capital_adequacy_ratio WHERE report_date = '2023-05-01';	2344870041
SELECT institution_id, severity, COUNT(*) AS severity_count FROM compliance_records WHERE record_date >= '2023-01-01' AND record_date < '2024-01-01' GROUP BY institution_id, severity;	79705771
SELECT fi.institution_name AS institution_name, rr.report_date AS report_date, rr.comments AS comments FROM regulatory_reports rr JOIN financial_institution_info fi ON rr.institution_id = fi.institution_id WHERE rr.report_type = '季度报告' AND rr.approval_status = '已拒绝' AND rr.report_date BETWEEN '2023-01-01' AND '2023-12-31';	3897795864
AMBIGUOUS_QUERY	3910780788
SELECT fi.institution_name, MAX(r.report_type) AS report_type, SUM(rpt.transaction_amount) AS total_transaction_amount 
FROM regulatory_reports r 
JOIN financial_institution_info fi ON r.institution_id = fi.institution_id 
JOIN related_party_transactions rpt ON r.institution_id = rpt.institution_id 
WHERE r.report_type = '半年度报告' AND r.report_date = '2023-10-01' 
GROUP BY fi.institution_id 
HAVING SUM(rpt.transaction_amount) > 10000000;	463284912
SELECT fi.institution_name AS institution_name, rr.report_id AS report_id, rr.report_date AS report_date, rr.comments AS comments FROM regulatory_reports rr JOIN financial_institution_info fi ON rr.institution_id = fi.institution_id WHERE rr.report_type = '季度报告' AND rr.approval_status = '已拒绝' AND rr.report_date BETWEEN '2023-01-01' AND '2023-12-31';	3023341474
SELECT fi.institution_name AS institution_name, rr.report_type AS report_type, rr.approval_status AS approval_status, rr.submission_date AS submission_date FROM regulatory_reports rr JOIN financial_institution_info fi ON rr.institution_id = fi.institution_id WHERE rr.submission_date BETWEEN '2023-01-01' AND '2023-12-31' AND rr.report_type = '季度报告' AND rr.approval_status = '已拒绝';	100349185
AMBIGUOUS_QUERY	1713055268
SELECT report_id AS report_id, institution_id AS institution_id, report_date AS report_date, report_type AS report_type, approval_status AS approval_status FROM regulatory_reports WHERE EXTRACT(YEAR FROM submission_date) = 2024;	1241000114
SELECT institution_type, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY liquidity_coverage_ratio) AS median_liquidity_coverage_ratio 
FROM financial_institution_info 
JOIN liquidity_ratio ON financial_institution_info.institution_id = liquidity_ratio.institution_id 
GROUP BY institution_type;	2918395057
SELECT r.institution_id AS institution_id, r.report_id AS report_id, r.report_type AS report_type, r.approval_status AS approval_status, c.core_tier_1_ratio AS core_tier_1_ratio 
FROM regulatory_reports r 
JOIN capital_adequacy_ratio c ON r.institution_id = c.institution_id 
WHERE r.report_date BETWEEN '2023-01-01' AND '2023-12-31' 
AND r.report_type = '季度报告' 
AND r.approval_status = '已拒绝' 
AND c.report_date = '2023-06-01' 
AND c.core_tier_1_ratio < 8;	3292170043
SELECT AVG(npl_ratio) AS average_npl_ratio FROM non_performing_loans WHERE institution_id IN (SELECT institution_id FROM capital_adequacy_ratio WHERE report_date BETWEEN '2023-07-01' AND '2023-09-30' ORDER BY total_car DESC LIMIT 10) AND report_date BETWEEN '2023-07-01' AND '2023-09-30';	759134662
SELECT fi.institution_name FROM (SELECT institution_id FROM compliance_records WHERE status = '未解决' GROUP BY institution_id ORDER BY COUNT(*) DESC LIMIT 1) AS sub JOIN financial_institution_info fi ON sub.institution_id = fi.institution_id;	4264132838
ERROR: LLM 请求失败	2605714275
SELECT DISTINCT institution_id AS institution_id FROM risk_exposure WHERE market_risk_exposure / total_risk_exposure > 0.25;	1937284507
SELECT fi.institution_name AS institution_name, rpt.transaction_amount AS transaction_amount, rpt.transaction_type AS transaction_type FROM related_party_transactions rpt JOIN financial_institution_info fi ON rpt.institution_id = fi.institution_id WHERE rpt.transaction_date BETWEEN '2023-08-01' AND '2023-08-31' AND rpt.approval_status = '待审批' AND rpt.transaction_amount > 5000000;	2934397812
SELECT DISTINCT fi.institution_id AS institution_id, fi.institution_name AS institution_name 
FROM financial_institution_info fi 
JOIN regulatory_reports rr ON fi.institution_id = rr.institution_id 
JOIN income_statement is_stmt ON fi.institution_id = is_stmt.institution_id 
WHERE rr.report_type = '季度报告' 
AND rr.approval_status = '需修改' 
AND rr.submission_date BETWEEN '2023-01-01' AND '2023-12-31' 
AND is_stmt.report_date BETWEEN '2023-01-01' AND '2023-03-31' 
AND is_stmt.net_profit > 50000000;	508885744
AMBIGUOUS_QUERY	1632272828
AMBIGUOUS_QUERY	1799492050
SELECT fi.institution_name AS institution_name 
FROM financial_institution_info fi 
JOIN regulatory_reports rr ON fi.institution_id = rr.institution_id 
WHERE rr.report_date = '2023-10-01' 
AND rr.approval_status = '待审批';	2216482912
SELECT fi.institution_name AS institution_name FROM financial_institution_info fi JOIN risk_exposure re ON fi.institution_id = re.institution_id WHERE re.report_date BETWEEN '2023-05-01' AND '2023-05-31' AND re.total_risk_exposure > 15000000000;	1256154419
SELECT r.institution_id AS institution_id, fi.institution_name AS institution_name, fi.registered_capital AS registered_capital 
FROM regulatory_reports r 
JOIN financial_institution_info fi ON r.institution_id = fi.institution_id 
WHERE r.report_type = '季度报告' 
AND r.approval_status = '需修改' 
AND r.submission_date >= '2023-01-01' 
AND r.submission_date < '2024-01-01' 
AND fi.registered_capital > 50000000;	4262674456
ERROR: LLM 请求失败	710647517
SELECT institution_id AS institution_id, credit_risk_exposure AS credit_risk_exposure FROM risk_exposure WHERE report_date = '2023-09-01';	58767252
SELECT fi.institution_name AS institution_name, rpt.transaction_amount AS transaction_amount, rpt.approval_status AS approval_status 
FROM related_party_transactions rpt 
JOIN financial_institution_info fi ON rpt.institution_id = fi.institution_id 
WHERE rpt.transaction_date BETWEEN '2023-05-01' AND '2023-05-31' 
AND rpt.transaction_amount > 5000000 
AND rpt.approval_status = '已批准';	637645661
SELECT DISTINCT c.institution_id AS institution_id FROM capital_adequacy_ratio c WHERE c.risk_weighted_assets > 8000;	3688064451
SELECT COUNT(DISTINCT fi.institution_id) AS count FROM financial_institution_info fi JOIN balance_sheet bs ON fi.institution_id = bs.institution_id WHERE fi.registered_capital < 1000000000 AND bs.total_assets > 1000000000000;	3547661219
AMBIGUOUS_QUERY	162610329
AMBIGUOUS_QUERY	1552788455
AMBIGUOUS_QUERY	116844122
AMBIGUOUS_QUERY	4240691021
SELECT fi.institution_name AS institution_name, rr.report_type AS report_type, rpt.transaction_amount AS transaction_amount FROM regulatory_reports rr JOIN related_party_transactions rpt ON rr.institution_id = rpt.institution_id JOIN financial_institution_info fi ON rr.institution_id = fi.institution_id WHERE rr.report_date = '2023-10-01' AND rr.report_type = '半年度报告' AND rpt.transaction_amount > 5000000;	1677817776
SELECT AVG(non_interest_income) AS avg_non_interest_income FROM income_statement WHERE report_date = '2023-01-01';	1301409349
SELECT report_date AS loan_report_date, npl_amount AS non_performing_loan_amount FROM non_performing_loans WHERE report_date BETWEEN '2023-06-01' AND '2023-06-30';	948022455
SELECT institution_id AS institution_id FROM non_performing_loans WHERE provision_coverage_ratio < 200;	3714986713
AMBIGUOUS_QUERY	3771907244
SELECT financial_institution_info.institution_name AS institution_name FROM financial_institution_info JOIN compliance_records ON financial_institution_info.institution_id = compliance_records.institution_id WHERE compliance_records.description LIKE '%客户投诉%';	1867865451
AMBIGUOUS_QUERY	246993905
SELECT r.institution_id AS institution_id, r.report_id AS report_id, r.report_type AS report_type, r.approval_status AS approval_status, n.npl_ratio AS npl_ratio 
FROM regulatory_reports r 
JOIN non_performing_loans n ON r.institution_id = n.institution_id 
WHERE r.report_type = '季度报告' 
AND r.approval_status = '已拒绝' 
AND r.report_date BETWEEN '2023-01-01' AND '2023-12-31' 
AND n.report_date BETWEEN '2023-01-01' AND '2023-12-31' 
AND n.npl_ratio > 1;	1509764635
SELECT npl_amount AS npl_amount, provision_coverage_ratio AS provision_coverage_ratio FROM non_performing_loans WHERE report_date = '2023-03-01';	3372111545
AMBIGUOUS_QUERY	1509942542
SELECT DISTINCT fi.institution_name AS institution_name
FROM regulatory_reports rr
JOIN financial_institution_info fi ON rr.institution_id = fi.institution_id
WHERE rr.report_date BETWEEN '2023-01-01' AND '2023-12-31'
AND rr.approval_status = '已拒绝'
AND rr.report_type = '季度';	2196231862
AMBIGUOUS_QUERY	2728172184
SELECT fi.institution_name AS institution_name FROM regulatory_reports rr JOIN financial_institution_info fi ON rr.institution_id = fi.institution_id WHERE rr.report_date BETWEEN '2023-07-01' AND '2023-09-30' AND rr.report_type = '季度报告' AND rr.approval_status = '需修改';	3768872221
AMBIGUOUS_QUERY	2784905980
AMBIGUOUS_QUERY	678545000
SELECT DISTINCT fi.institution_name AS institution_name
FROM financial_institution_info fi
JOIN regulatory_reports rr ON fi.institution_id = rr.institution_id
JOIN non_performing_loans npl ON fi.institution_id = npl.institution_id
WHERE rr.report_date = '2023-07-01'
AND rr.report_type = '季度报告'
AND npl.report_date = '2023-07-01'
AND npl.npl_ratio > 2.0;	3037348782
AMBIGUOUS_QUERY	1162073522
SELECT l.institution_id AS institution_id, l.liquidity_coverage_ratio AS liquidity_coverage_ratio, r.approval_status AS approval_status 
FROM liquidity_ratio l 
JOIN regulatory_reports r ON l.institution_id = r.institution_id 
WHERE l.report_date >= '2023-01-01' AND l.report_date < '2024-01-01';	1324283532
SELECT fi.institution_name AS institution_name, rr.report_date AS report_date, rr.approval_status AS approval_status 
FROM regulatory_reports rr 
JOIN financial_institution_info fi ON rr.institution_id = fi.institution_id 
WHERE rr.report_type = '季度报告' 
AND rr.report_date > '2023-07-01' 
AND rr.approval_status = '需修改';	3789302325
SELECT COUNT(*) AS count FROM regulatory_reports WHERE submission_date BETWEEN '2023-04-01' AND '2023-06-30' AND approval_status = '已拒绝';	3524683857
AMBIGUOUS_QUERY	1676740080
AMBIGUOUS_QUERY	3743576610
SELECT 
    fi.institution_name,
    (re.market_risk_exposure / bs.total_equity) * 100 AS market_risk_capital_ratio
FROM 
    risk_exposure re
JOIN 
    financial_institution_info fi ON re.institution_id = fi.institution_id
JOIN 
    balance_sheet bs ON re.institution_id = bs.institution_id AND re.report_date = bs.report_date
WHERE 
    re.report_date BETWEEN '2023-01-01' AND '2023-12-31'
    AND re.market_risk_exposure > 0
    AND bs.total_equity > 0
    AND (re.market_risk_exposure / bs.total_equity) * 100 > 15
ORDER BY 
    market_risk_capital_ratio DESC;	763017611
SELECT fi.institution_name AS institution_name, rr.report_type AS report_type, rr.submission_date AS submission_date FROM regulatory_reports rr JOIN financial_institution_info fi ON rr.institution_id = fi.institution_id WHERE rr.submission_date BETWEEN '2023-01-01' AND '2023-12-31' AND rr.approval_status = '需修改' ORDER BY rr.submission_date DESC;	227811783
SELECT fi.institution_name 
FROM financial_institution_info fi 
WHERE fi.institution_id IN (
    SELECT r.institution_id 
    FROM regulatory_reports r 
    WHERE r.report_date BETWEEN '2023-01-01' AND '2023-12-31' 
    AND r.report_type = '季度报告' 
    AND r.approval_status = '需修改'
) 
AND EXISTS (
    SELECT 1 
    FROM related_party_transactions rpt 
    WHERE rpt.institution_id = fi.institution_id 
    AND rpt.transaction_date BETWEEN '2023-01-01' AND '2023-12-31' 
    AND rpt.transaction_amount > 10000000
);	636265180
AMBIGUOUS_QUERY	3904345596
AMBIGUOUS_QUERY	2375076145
SELECT fi.institution_name, (COUNT(CASE WHEN rp.approval_status = 'rejected' THEN 1 END) * 1.0 / COUNT(*)) AS failure_rate 
FROM related_party_transactions rp 
JOIN financial_institution_info fi ON rp.institution_id = fi.institution_id 
WHERE rp.transaction_date >= '2023-01-01' 
GROUP BY fi.institution_id, fi.institution_name 
ORDER BY failure_rate DESC 
LIMIT 1;	1557709908
AMBIGUOUS_QUERY	963481309
AMBIGUOUS_QUERY	3447512985
AMBIGUOUS_QUERY	3623964040
SELECT institution_name AS institution_name FROM financial_institution_info WHERE legal_representative LIKE '王%';	478636896
AMBIGUOUS_QUERY	1733036868

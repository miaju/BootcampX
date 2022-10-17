SELECT cohorts.name as cohort_name, count(students.cohort_id) as student_count
FROM cohorts
JOIN students ON cohorts.id = students.cohort_id
GROUP BY cohort_name
HAVING count(students.cohort_id) >= 18
ORDER BY student_count;
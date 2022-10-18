SELECT cohorts.name as name, avg(completed_at - started_at) as average_request_duration
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY average_request_duration DESC
LIMIT 1;
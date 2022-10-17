SELECT students.name AS student, 
  CAST(sum(assignment_submissions.duration) as float)/CAST(count(assignment_submissions.duration) as float)
  AS average_assignment_duration
FROM assignment_submissions
JOIN students ON students.id = assignment_submissions.student_id
WHERE students.end_date IS NULL
GROUP BY student
ORDER BY average_assignment_duration DESC
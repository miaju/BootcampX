const { Pool } = require('pg');

const pool = new Pool({
  user: 'mia',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});
const cohortName = process.argv[2] || 'JUL02';
const values = [`%${cohortName}%`];
const queryString = `
SELECT DISTINCT teachers.name as name, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
ORDER BY teachers.name
`;

pool.query(queryString, values)
  .then(res => {
    res.rows.forEach(teacher => {
      console.log(`${teacher.cohort}: ${teacher.name}`);
    });
  }).catch(err => console.error('query error', err.stack));
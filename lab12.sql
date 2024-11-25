-- Concatenate course_name and semester fields with a hyphen
SELECT course_name || ' - ' || semester AS course_and_semester
FROM courses;

-- Find all courses with lab sessions on Friday
SELECT course_id, course_name, lab_time
FROM courses
WHERE lab_time LIKE '%Friday%';

-- List assignments with a due date after the current date
SELECT course_id, title, due_date
FROM assignments
WHERE due_date > date();

-- Count assignments grouped by their status
SELECT status, COUNT(*) AS assignment_count
FROM assignments
GROUP BY status;

-- Find the course with the longest course_name
SELECT course_id, course_name
FROM courses
ORDER BY length(course_name) DESC
LIMIT 1;

-- Return a list of all course names in uppercase
SELECT UPPER(course_name) AS uppercase_course_name
FROM courses;

-- List titles of assignments due in September (ignoring year)
SELECT title, due_date
FROM assignments
WHERE due_date LIKE '%-09-%';

-- Find assignments with missing due_dates (NULL)
SELECT course_id, title
FROM assignments
WHERE due_date IS NULL;

-- List each course_id along with the total number of assignments for that course
SELECT c.course_id, c.course_name, COUNT(a.id) AS total_assignments
FROM courses c
LEFT JOIN assignments a ON c.course_id = a.course_id
GROUP BY c.course_id;

-- Find all courses that do not have any assignments
SELECT c.course_id, c.course_name
FROM courses c
LEFT JOIN assignments a ON c.course_id = a.course_id
WHERE a.id IS NULL;

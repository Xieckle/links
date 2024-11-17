-- Ed-xieckle Arigo

-- query that display the title and due date of assignments for courses COMP1234
SELECT title, due_date
FROM assignments
WHERE course_id = 'COMP1234';

-- earliest assignment due date
SELECT min(due_date) 
FROM assignments;

-- latest assignment due date
SELECT max(due_date)
FROM assignments;

-- assignment due on specific date
SELECT title, course_id
FROM assignments
WHERE due_date = '2024-10-08';

-- assignments due on october
SELECT title, due_date
FROM assignments
WHERE due_date LIKE '2024-10%';

-- recent compleated assignments
SELECT max(due_date)
FROM assignments
WHERE status = 'Completed';


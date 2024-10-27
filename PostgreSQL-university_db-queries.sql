-- Query-1: Inserting a value into students table
/*
INSERT INTO table_name (columns) VALUES (column_values),...  
Here just use above query to insert values into students table
 */
INSERT INTO students (student_name, "age", email, frontend_mark, backend_mark, "status")
VALUES
('Ashfaqur Rahman Fahad', 23, 'ashfaqurrahmanfahad@gmail.com', 60, 60, NULL),
('Ali', 22, 'ali@example.com', 45, 55, NULL),
('Mia', 21, 'mia@example.com', 50, 47, NULL),
('Ahmed', 23, 'ahmed@example.com', 39, 44, NULL),
('Lina', 22, 'lina@example.com', 53, 57, NULL),
('Yara', 24, 'yara@example.com', 60, 59, NULL);

-- Query-2: Retrieve the names of all students who are enrolled in the course titled 'Next.js'.
/*
SELECT student_name FROM --> To get only student_name column
FROM enrollment JOIN students USING(student_id) --> Joining students with enrollment using student_id column which is common in both tables
JOIN courses USING(course_id) --> Joining courses table same as students table by common column
WHERE course_name = 'Next.js'; --> course_name must 'Next.js'
*/
SELECT student_name FROM enrollment JOIN students USING(student_id) JOIN courses USING(course_id) WHERE course_name = 'Next.js';

-- Query-3: Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.
/*
UPDATE students SET "status" = 'Awarded' --> Updating students table by set status column record to Awarded
WHERE (SELECT max(frontend_mark + backend_mark) FROM students) = frontend_mark + backend_mark; --> Max single value (total of frontend_mark & backend_mark) comes from SELECT query which comparing condition
*/
UPDATE students SET "status" = 'Awarded' WHERE (SELECT max(frontend_mark + backend_mark) FROM students) = frontend_mark + backend_mark;

-- Query-4: Delete all courses that have no students enrolled.
/*
DELETE FROM courses --> Deleting records from courses table
WHERE course_id NOT IN (SELECT course_id FROM enrollment); --> Those course_id records which not included in enrollment table
*/
DELETE FROM courses WHERE course_id NOT IN (SELECT course_id FROM enrollment);

-- Query-5: Retrieve the names of students using a limit of 2, starting from the 3rd student.
/*
Here LIMIT 2 means only 2 rows with OFFSET 2 means
after 2 raws
So, LIMIT 2 OFFSET 2 shows 2 student data after 2 
students it means starting from 3
*/
SELECT student_name FROM students LIMIT 2 OFFSET 2;

-- Query-6: Retrieve the course names and the number of students enrolled in each course.
/*
Here using GROUP BY to show unique course_name raws 
& aggregate function count is used to count how many
students enrolled for each unique course
*/
SELECT course_name, count(*) as students_enrolled FROM enrollment JOIN courses USING(course_id) GROUP BY course_name;

-- Query-7: Calculate and display the average age of all students.
/*
 avg is used to calculate average_age of students and 
 round is used to round a number to a specified number of decimal places.
*/
SELECT round(avg("age"), 2) as average_age FROM students;

-- Query-8: Retrieve the names of students whose email addresses contain 'example.com'.
/*
Here LIKE is used to match those email which contain 'example.com' as suffix
If matched it will return true else false
*/
SELECT student_name FROM students WHERE email LIKE '%example.com';

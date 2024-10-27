-- Query-1: Inserting a value into students table
INSERT INTO students (student_name, "age", email, frontend_mark, backend_mark, "status")
VALUES
('Ashfaqur Rahman Fahad', 23, 'ashfaqurrahmanfahad@gmail.com', 60, 60, NULL),
('Ali', 22, 'ali@example.com', 45, 55, NULL),
('Mia', 21, 'mia@example.com', 50, 47, NULL),
('Ahmed', 23, 'ahmed@example.com', 39, 44, NULL),
('Lina', 22, 'lina@example.com', 53, 57, NULL),
('Yara', 24, 'yara@example.com', 60, 59, NULL);

-- Query-2: Retrieve the names of all students who are enrolled in the course titled 'Next.js'.
SELECT student_name FROM enrollment JOIN students USING(student_id) JOIN courses USING(course_id) WHERE course_name = 'Next.js';

-- Query-3: Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.
UPDATE students SET "status" = 'Awarded' WHERE (SELECT max(frontend_mark + backend_mark) FROM students) = frontend_mark + backend_mark;

-- Query-4: Delete all courses that have no students enrolled.
DELETE FROM courses WHERE course_id NOT IN (SELECT course_id FROM enrollment);

-- Query-5: Retrieve the names of students using a limit of 2, starting from the 3rd student.
SELECT student_name FROM students LIMIT 2 OFFSET 2;

-- Query-6: Retrieve the course names and the number of students enrolled in each course.
SELECT course_name, count(*) as students_enrolled FROM enrollment JOIN courses USING(course_id) GROUP BY course_name;

-- Query-7: Calculate and display the average age of all students.
SELECT round(avg("age"), 2) as average_age FROM students;

-- Query-8: Retrieve the names of students whose email addresses contain 'example.com'.
SELECT student_name FROM students WHERE email LIKE '%example.com';

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollment;
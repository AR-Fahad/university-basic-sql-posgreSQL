-- Active: 1729623238338@@127.0.0.1@5432@university_db
-- Creating a database called university_db
CREATE DATABASE university_db;

-- Creating a table called students
CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    "age" INT,
    email VARCHAR(50),
    frontend_mark INT,
    backend_mark  INT,
    "status" VARCHAR(30)
);

-- Creating a table called courses
CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY, 
    course_name VARCHAR(50),
    credits INT
);

-- Creating a table called enrollment
CREATE TABLE enrollment(
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id INT REFERENCES courses(course_id)
);

-- Inserting values into students table
INSERT INTO students (student_name, "age", email, frontend_mark, backend_mark, "status") 
VALUES 
('Sameer', 21, 'sameer@example.com', 48, 60, NULL),
('Zoya', 23, 'zoya@example.com', 52, 58, NULL),
('Nabil', 22, 'nabil@example.com', 37, 46, NULL),
('Rafi', 24, 'rafi@example.com', 41, 40, NULL),
('Sophia', 22, 'sophia@example.com', 50, 52, NULL),
('Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);

-- Inserting values into courses table
INSERT INTO courses (course_name, credits)
VALUES 
('Next.js', 3),
('React.js', 4),
('Databases', 3),
('Prisma', 3);

-- Inserting values into enrollment table
INSERT INTO enrollment (student_id, course_id)
VALUES 
(1, 1),
(1, 2),
(2, 1),
(3, 2);

-- Check all table to get columns with record that has inserted
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollment;



CREATE DATABASE IF NOT EXISTS student_result_db;
USE student_result_db;

DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    class VARCHAR(10),
    subject VARCHAR(30),
    marks INT
);

INSERT INTO students VALUES
(1, 'Malleswari', '10th', 'Maths', 95),
(2, 'Malleswari', '10th', 'Science', 88),
(3, 'Malleswari', '10th', 'English', 92),
(4, 'Ravi', '10th', 'Maths', 78),
(5, 'Ravi', '10th', 'Science', 65),
(6, 'Anjali', '10th', 'Maths', 98),
(7, 'Anjali', '10th', 'Science', 90),
(8, 'Kiran', '10th', 'Maths', 35),
(9, 'Kiran', '10th', 'Science', 40);

-- 1. Full data
SELECT * FROM students;

-- 2. Subject wise topper
SELECT subject, MAX(marks) as topper_marks FROM students GROUP BY subject;

-- 3. Total marks per student
SELECT name, SUM(marks) as total FROM students GROUP BY name;

-- 4. Pass/Fail
SELECT name, subject, marks, CASE WHEN marks >= 35 THEN 'Pass' ELSE 'Fail' END as result FROM students;


-- 5. 90+ marks students (Topper list)
SELECT * FROM students WHERE marks > 90;

-- 6. Average marks
SELECT AVG(marks) as average_marks FROM students;

-- 7. Top 3 students total marks tho
SELECT name, SUM(marks) as total FROM students GROUP BY name ORDER BY total DESC LIMIT 3;

-- 8. View create - Pass aina vallu matrame
CREATE VIEW pass_students AS SELECT * FROM students WHERE marks >= 35;
SELECT * FROM pass_students;

-- 9. Pass Percentage
SELECT (COUNT(CASE WHEN marks >= 35 THEN 1 END) * 100.0 / COUNT(*)) as pass_percentage FROM students;

-- 10. Fail count (Important)
SELECT COUNT(*) as fail_count FROM students WHERE marks < 35;

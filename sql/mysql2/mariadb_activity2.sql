-- Create the Enrollments Table
CREATE TABLE
    enrollments (
        enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
        student_id INT,
        course_id INT,
        enrollment_date DATE
    );

-- Check the table
DESCRIBE enrollments;

-- Add Foreign Keys
ALTER TABLE enrollments ADD CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES students (id);

ALTER TABLE enrollments ADD CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES courses (course_id);

-- Check the structure
DESCRIBE enrollments;

-- Display the students
SELECT
    *
FROM
    students;

-- Display the courses
SELECT
    *
FROM
    courses;

-- Insert enrollment records
INSERT INTO
    enrollments (student_id, course_id, enrollment_date)
VALUES
    (1, 1, '2026-10-07'),
    (2, 2, '2026-10-07'),
    (3, 3, '2026-10-07'),
    -- Display the records
SELECT
    *
FROM
    enrollments;

-- Basic JOIN
SELECT
    students.name,
    course.course_name,
    enrollments.enrollment_date
FROM
    enrollments
    JOIN students ON enrollments.student_id = student_id
    JOIN courses ON enrollments.course_id = courses.course_id
    -- Filter Using WHERE
SELECT
    students.name,
    courses.course_name
FROM
    enrollments
    JOIN students ON enrollments.student_id = students.id
    JOIN courses ON enrollments.course_id = courses.course_id
WHERE
    courses.course_name = 'Web Development';

-- Sort the Results
SELECT
    students.name,
    courses.course_name
FROM
    enrollments
    JOIN students ON enrollments.student_id = students.id
    JOIN courses ON enrollments.course_id = courses.course_id
ORDER BY
    students.name ASC;

-- sort in descending order
SELECT
    *
FROM
    students
ORDER BY
    name DESC;

-- Count the Number of Students
SELECT
    COUNT(*) AS total_students
FROM
    students;

-- Count Student Enrollments
SELECT
    COUNT(*) AS total_enrollments
FROM
    enrollments;

-- Count Students per Course
SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS number_of_students
FROM
    courses
    LEFT JOIN enrollments ON courses.course_id = enrollments.course_id
GROUP BY
    courses.course_id,
    courses.course_name;

-- Find the Most Popular Course
SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS number_of_students
FROM
    courses
    LEFT JOIN enrollments ON courses.course_id = enrollments.course_id
GROUP BY
    courses.course_id,
    courses.course_name
ORDER BY
    number_of_students DESC;

-- Create a Student Report
SELECT
    students.id AS student_id,
    students.name AS student_name,
    courses.course_name,
    enrollments.enrollment_date
FROM
    enrollments
    JOIN students ON enrollments.student_id = students.id
    JOIN courses ON enrollments.course_id = courses.course_id
ORDER BY
    students.name;

-- Challenge Queries
-- Task 1
SELECT
    students.name,
    courses.course_name
FROM
    enrollments
    JOIN students ON enrollments.student_id = students.id
    JOIN courses ON enrollments.course_id = courses.course_id
WHERE
    courses.course_name = 'Web Development';

-- Task 2
SELECT
    students.name,
    courses.course_name
FROM
    enrollments
    JOIN students ON enrollments.student_id = students.id
    JOIN courses ON enrollments.course_id = courses.course_id
WHERE
    students.name = 'John';

-- Task 3
SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS number_of_students
FROM
    courses
    LEFT JOIN enrollments ON courses.course_id = enrollments.course_id
GROUP BY
    courses.course_id,
    courses.course_name;

-- Task 4
SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS number_of_students
FROM
    courses
    LEFT JOIN enrollments ON courses.course_id = enrollments.course_id
GROUP BY
    courses.course_id,
    courses.course_name
ORDER BY
    number_of_students DESC
LIMIT
    1;

-- Task 5
SELECT
    *
FROM
    students
ORDER BY
    name ASC;

-- Task 6
SELECT
    COUNT(*) AS total_enrollments
FROM
    enrollments;
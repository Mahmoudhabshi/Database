-- Create UniversityDB database
CREATE DATABASE UniversityDB;

-- Use UniversityDB
USE UniversityDB;
-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);


-- Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    GPA FLOAT,
    CONSTRAINT fk_DepartmentID FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    DepartmentID INT,
    CONSTRAINT fk_DepartmentID_Courses FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create Enrollments table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    AcademicYear INT,
    CONSTRAINT fk_StudentID FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CONSTRAINT fk_CourseID FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


-- Insert data into Departments table
INSERT INTO Departments VALUES
    (1, 'Computer Science'),
    (2, 'Mathematics'),
    (3, 'Physics'),
    (4, 'Chemistry'),
    (5, 'Biology'),
    (6, 'Electrical Engineering'),
    (7, 'History'),
    (8, 'Mechanical Engineering'),
    (9, 'English'),
    (10, 'Civil Engineering'),
    (11, 'Psychology'),
    (12, 'Computer Science'),
    (13, 'Mathematics'),
    (14, 'Physics'),
    (15, 'Psychiatry');


-- Insert data into Students table
INSERT INTO Students VALUES
    (1, 'John', 'Doe', 1, 3.5),
    (2, 'Jane', 'Smith', 2, 3.8),
    (3, 'Bob', 'Johnson', 1, 3.2),
    (4, 'Alice', 'Johnson', 2, 3.9),
    (5, 'Charlie', 'Smith', 3, 3.5),
    (6, 'Eva', 'Davis', 4, 3.8),
    (7, 'Frank', 'White', 1, 3.3),
    (8, 'Grace', 'Turner', 6, 3.6),
    (9, 'Henry', 'Roberts', 7, 3.2),
    (10, 'Ivy', 'Anderson', 6, 3.9),
    (11, 'Jack', 'Miller', 7, 3.5),
    (12, 'Katherine', 'Clark', 8, 3.7),
    (13, 'Liam', 'Perez', 9, 3.1),
    (14, 'Mia', 'Carter', 8, 3.8),
    (15, 'Noah', 'Wright', 9, 3.6),
    (16, 'Olivia', 'Johnson', 10, 3.5),
    (17, 'Logan', 'Garcia', 11, 3.4),
    (18, 'Sophia', 'Martinez', 10, 3.9),
    (19, 'Lucas', 'Brown', 11, 3.2),
    (24, 'Emma', 'Evans', 14, 3.8),
    (25, 'Oliver', 'Morris', 15, 3.4),
    (26, 'Aria', 'Hill', 14, 3.9),
    (27, 'Ethan', 'Cole', 15, 3.6);

-- Insert data into Courses table
INSERT INTO Courses VALUES
    (101, 'Introduction to Programming', 1),
    (102, 'Calculus I', 2),
    (103, 'Physics I', 3),
    (104, 'Chemical Reactions', 4),
    (105, 'Genetics', 5),
    (106, 'Data Structures', 1),
    (107, 'Organic Chemistry', 4),
    (108, 'Digital Electronics', 6),
    (109, 'World History', 7),
    (110, 'Algorithms', 1),
    (111, 'Political Science', 7),
    (112, 'Thermodynamics', 8),
    (113, 'American Literature', 9),
    (114, 'Database Management', 1),
    (115, 'Mechatronics', 8),
    (116, 'Structural Engineering', 10),
    (117, 'Cognitive Psychology', 11),
    (118, 'Web Development', 1),
    (119, 'Environmental Science', 5),
    (124, 'Quantum Mechanics', 14),
    (125, 'Psychopathology', 15),
    (126, 'Machine Learning', 12),
    (127, 'Linear Algebra', 13);


-- Insert data into Enrollments table
INSERT INTO Enrollments VALUES
    (1, 1, 101, 2017),
    (2, 2, 102, 2020),
    (3, 3, 103, 2021),
    (4, 4, 104, 2023),
    (5, 5, 105, 2022),
    (6, 6, 106, 2022),
    (7, 7, 107, 2020),
    (8, 8, 108, 2017),
    (9, 9, 109, 2018),
    (10, 10, 110, 2020),
    (11, 11, 111, 2014),
    (12, 12, 112, 2014),
    (13, 13, 113, 2015),
    (14, 14, 114, 2015),
    (15, 15, 115, 2016),
    (16, 16, 116, 2017),
    (17, 17, 117, 2020),
    (18, 18, 118, 2021),
    (19, 19, 119, 2014),
    (24, 24, 124, 2015),
    (25, 25, 125, 2022),
    (26, 26, 126, 2022),
    (27, 27, 127, 2022);


---------------------------------------------------------------------------
Task 2: Data Analysis

a. Count of Students by Department:
-SELECT DepartmentName, COUNT(StudentID) AS StudentCount
FROM Departments
JOIN Students ON Departments.DepartmentID = Students.DepartmentID
GROUP BY DepartmentName;

b. Total Enrollment by Year:
-SELECT AcademicYear, COUNT(EnrollmentID) AS TotalEnrollment
FROM Enrollments
GROUP BY AcademicYear;

c. Average GPA by Course:
-SELECT CourseName, AVG(GPA) AS AverageGPA
FROM Courses
JOIN Enrollments ON Courses.CourseID = Enrollments.CourseID
JOIN Students ON Enrollments.StudentID = Students.StudentID
GROUP BY CourseName;

-------------------------------------------------------------------------------
Task 3: Query (Breakdown, Rollup, or Cube)
a. Breakdown by Department:
-SELECT DepartmentName, AcademicYear, COUNT(EnrollmentID) AS EnrollmentCount
FROM Departments
JOIN Students ON Departments.DepartmentID = Students.DepartmentID
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
GROUP BY DepartmentName, AcademicYear;

b. Rollup by Year and Department:
-SELECT AcademicYear, DepartmentName, COUNT(EnrollmentID) AS EnrollmentCount
FROM Departments
JOIN Students ON Departments.DepartmentID = Students.DepartmentID
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
GROUP BY ROLLUP (AcademicYear, DepartmentName);

c. Cube by Course, Year, and Department:
SELECT CourseName, AcademicYear, DepartmentName, COUNT(EnrollmentID) AS EnrollmentCount
FROM Departments
JOIN Students ON Departments.DepartmentID = Students.DepartmentID
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.CourseID
GROUP BY CUBE (CourseName, AcademicYear, DepartmentName);


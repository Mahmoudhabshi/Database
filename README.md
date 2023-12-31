# Database
Database Analysis Project
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


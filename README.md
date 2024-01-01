# Database
Database Analysis Project
Task 2: Data Analysis

a. Count of Students by Department:
-SELECT DepartmentName, COUNT(StudentID) AS StudentCount
FROM Departments
JOIN Students ON Departments.DepartmentID = Students.DepartmentID
GROUP BY DepartmentName;
Result: Chemistry	1
Civil Engineering	2
Computer Science	3
Electrical Engineering	2
English	2
History	2
Mathematics	2
Mechanical Engineering	2
Physics	3
Psychiatry	2
Psychology	2

b. Total Enrollment by Year:
-SELECT AcademicYear, COUNT(EnrollmentID) AS TotalEnrollment
FROM Enrollments
GROUP BY AcademicYear;
Result: 2014	3
2015	3
2016	1
2017	3
2018	1
2020	4
2021	2
2022	5
2023	1


c. Average GPA by Course:
-SELECT CourseName, AVG(GPA) AS AverageGPA
FROM Courses
JOIN Enrollments ON Courses.CourseID = Enrollments.CourseID
JOIN Students ON Enrollments.StudentID = Students.StudentID
GROUP BY CourseName;
Result: Algorithms	3.9
American Literature	3.1
Calculus I	3.8
Chemical Reactions	3.9
Cognitive Psychology	3.4
Data Structures	3.8
Database Management	3.8
Digital Electronics	3.6
Environmental Science	3.2
Genetics	3.5
Introduction to Programming	3.5
Linear Algebra	3.6
Machine Learning	3.9
Mechatronics	3.6
Organic Chemistry	3.3
Physics I	3.2
Political Science	3.5
Psychopathology	3.4
Quantum Mechanics	3.8
Structural Engineering	3.5
Thermodynamics	3.7
Web Development	3.9
World History	3.2


-------------------------------------------------------------------------------
Task 3: Query (Breakdown, Rollup, or Cube)
a. Breakdown by Department:
-SELECT DepartmentName, AcademicYear, COUNT(EnrollmentID) AS EnrollmentCount
FROM Departments
JOIN Students ON Departments.DepartmentID = Students.DepartmentID
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
GROUP BY DepartmentName, AcademicYear;
Result: History	2014	1
Mechanical Engineering	2014	1
Psychology	2014	1
English	2015	1
Mechanical Engineering	2015	1
Physics	2015	1
English	2016	1
Civil Engineering	2017	1
Computer Science	2017	1
Electrical Engineering	2017	1
History	2018	1
Computer Science	2020	1
Electrical Engineering	2020	1
Mathematics	2020	1
Psychology	2020	1
Civil Engineering	2021	1
Computer Science	2021	1
Chemistry	2022	1
Physics	2022	2
Psychiatry	2022	2
Mathematics	2023	1


b. Rollup by Year and Department:
-SELECT AcademicYear, DepartmentName, COUNT(EnrollmentID) AS EnrollmentCount
FROM Departments
JOIN Students ON Departments.DepartmentID = Students.DepartmentID
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
GROUP BY ROLLUP (AcademicYear, DepartmentName);
Result: 2014	History	1
2014	Mechanical Engineering	1
2014	Psychology	1
2014	NULL	3
2015	English	1
2015	Mechanical Engineering	1
2015	Physics	1
2015	NULL	3
2016	English	1
2016	NULL	1
2017	Civil Engineering	1
2017	Computer Science	1
2017	Electrical Engineering	1
2017	NULL	3
2018	History	1
2018	NULL	1
2020	Computer Science	1
2020	Electrical Engineering	1
2020	Mathematics	1
2020	Psychology	1
2020	NULL	4
2021	Civil Engineering	1
2021	Computer Science	1
2021	NULL	2
2022	Chemistry	1
2022	Physics	2
2022	Psychiatry	2
2022	NULL	5
2023	Mathematics	1
2023	NULL	1
NULL	NULL	23


c. Cube by Course, Year, and Department:
SELECT CourseName, AcademicYear, DepartmentName, COUNT(EnrollmentID) AS EnrollmentCount
FROM Departments
JOIN Students ON Departments.DepartmentID = Students.DepartmentID
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.CourseID
GROUP BY CUBE (CourseName, AcademicYear, DepartmentName);
Result: Data Structures	2022	Chemistry	1
NULL	2022	Chemistry	1
NULL	NULL	Chemistry	1
Structural Engineering	2017	Civil Engineering	1
NULL	2017	Civil Engineering	1
Web Development	2021	Civil Engineering	1
NULL	2021	Civil Engineering	1
NULL	NULL	Civil Engineering	2
Introduction to Programming	2017	Computer Science	1
NULL	2017	Computer Science	1
Organic Chemistry	2020	Computer Science	1
NULL	2020	Computer Science	1
Physics I	2021	Computer Science	1
NULL	2021	Computer Science	1
NULL	NULL	Computer Science	3
Digital Electronics	2017	Electrical Engineering	1
NULL	2017	Electrical Engineering	1
Algorithms	2020	Electrical Engineering	1
NULL	2020	Electrical Engineering	1
NULL	NULL	Electrical Engineering	2
American Literature	2015	English	1
NULL	2015	English	1
Mechatronics	2016	English	1
NULL	2016	English	1
NULL	NULL	English	2
Political Science	2014	History	1
NULL	2014	History	1
World History	2018	History	1
NULL	2018	History	1
NULL	NULL	History	2
Calculus I	2020	Mathematics	1
NULL	2020	Mathematics	1
Chemical Reactions	2023	Mathematics	1
NULL	2023	Mathematics	1
NULL	NULL	Mathematics	2
Thermodynamics	2014	Mechanical Engineering	1
NULL	2014	Mechanical Engineering	1
Database Management	2015	Mechanical Engineering	1
NULL	2015	Mechanical Engineering	1
NULL	NULL	Mechanical Engineering	2
Quantum Mechanics	2015	Physics	1
NULL	2015	Physics	1
Genetics	2022	Physics	1
Machine Learning	2022	Physics	1
NULL	2022	Physics	2
NULL	NULL	Physics	3
Linear Algebra	2022	Psychiatry	1
Psychopathology	2022	Psychiatry	1
NULL	2022	Psychiatry	2
NULL	NULL	Psychiatry	2
Environmental Science	2014	Psychology	1
NULL	2014	Psychology	1
Cognitive Psychology	2020	Psychology	1
NULL	2020	Psychology	1
NULL	NULL	Psychology	2
NULL	NULL	NULL	23
Algorithms	NULL	Electrical Engineering	1
Algorithms	NULL	NULL	1
American Literature	NULL	English	1
American Literature	NULL	NULL	1
Calculus I	NULL	Mathematics	1
Calculus I	NULL	NULL	1
Chemical Reactions	NULL	Mathematics	1
Chemical Reactions	NULL	NULL	1
Cognitive Psychology	NULL	Psychology	1
Cognitive Psychology	NULL	NULL	1
Data Structures	NULL	Chemistry	1
Data Structures	NULL	NULL	1
Database Management	NULL	Mechanical Engineering	1
Database Management	NULL	NULL	1
Digital Electronics	NULL	Electrical Engineering	1
Digital Electronics	NULL	NULL	1
Environmental Science	NULL	Psychology	1
Environmental Science	NULL	NULL	1
Genetics	NULL	Physics	1
Genetics	NULL	NULL	1
Introduction to Programming	NULL	Computer Science	1
Introduction to Programming	NULL	NULL	1
Linear Algebra	NULL	Psychiatry	1
Linear Algebra	NULL	NULL	1
Machine Learning	NULL	Physics	1
Machine Learning	NULL	NULL	1
Mechatronics	NULL	English	1
Mechatronics	NULL	NULL	1
Organic Chemistry	NULL	Computer Science	1
Organic Chemistry	NULL	NULL	1
Physics I	NULL	Computer Science	1
Physics I	NULL	NULL	1
Political Science	NULL	History	1
Political Science	NULL	NULL	1
Psychopathology	NULL	Psychiatry	1
Psychopathology	NULL	NULL	1
Quantum Mechanics	NULL	Physics	1
Quantum Mechanics	NULL	NULL	1
Structural Engineering	NULL	Civil Engineering	1
Structural Engineering	NULL	NULL	1
Thermodynamics	NULL	Mechanical Engineering	1
Thermodynamics	NULL	NULL	1
Web Development	NULL	Civil Engineering	1
Web Development	NULL	NULL	1
World History	NULL	History	1
World History	NULL	NULL	1
Environmental Science	2014	NULL	1
Political Science	2014	NULL	1
Thermodynamics	2014	NULL	1
NULL	2014	NULL	3
American Literature	2015	NULL	1
Database Management	2015	NULL	1
Quantum Mechanics	2015	NULL	1
NULL	2015	NULL	3
Mechatronics	2016	NULL	1
NULL	2016	NULL	1
Digital Electronics	2017	NULL	1
Introduction to Programming	2017	NULL	1
Structural Engineering	2017	NULL	1
NULL	2017	NULL	3
World History	2018	NULL	1
NULL	2018	NULL	1
Algorithms	2020	NULL	1
Calculus I	2020	NULL	1
Cognitive Psychology	2020	NULL	1
Organic Chemistry	2020	NULL	1
NULL	2020	NULL	4
Physics I	2021	NULL	1
Web Development	2021	NULL	1
NULL	2021	NULL	2
Data Structures	2022	NULL	1
Genetics	2022	NULL	1
Linear Algebra	2022	NULL	1
Machine Learning	2022	NULL	1
Psychopathology	2022	NULL	1
NULL	2022	NULL	5
Chemical Reactions	2023	NULL	1
NULL	2023	NULL	1

GROUP BY Clause:

The GROUP BY clause is used to group rows that have the same values in specified columns into summary rows.
It is often accompanied by aggregate functions (such as COUNT, SUM, AVG, etc.) to perform calculations on each group of rows.

ROLLUP Clause:

The ROLLUP extension of GROUP BY generates subtotals and grand totals for specified columns, creating a hierarchy of grouping levels.

CUBE Clause:

The CUBE extension of GROUP BY is similar to ROLLUP but provides subtotals and grand totals for all possible combinations of the specified columns.
-------------------------------------------------------------------------------
Task 4: Result Reports with Charts or Graphs
Export the result of one of your queries to a CSV file.
Import the data into Power BI and create visualizations.

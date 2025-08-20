USE CSE_3B_332

CREATE TABLE EMP (
    EID INT PRIMARY KEY,
    EName VARCHAR(100),
    Department VARCHAR(100),
    Salary DECIMAL(10, 2),
    JoiningDate DATE,
    City VARCHAR(100),
    Gender VARCHAR(10)
);


INSERT INTO EMP (EID, EName, Department, Salary, JoiningDate, City, Gender) VALUES
(101, 'Rahul', 'Admin', 56000, '1990-01-01', 'Rajkot', 'Male'),
(102, 'Hardik', 'IT', 18000, '1990-09-25', 'Ahmedabad', 'Male'),
(103, 'Bhavin', 'HR', 25000, '1991-05-14', 'Baroda', 'Male'),
(104, 'Bhoomi', 'Admin', 39000, '1991-02-08', 'Rajkot', 'Female'),
(105, 'Rohit', 'IT', 17000, '1990-07-23', 'Jamnagar', 'Male'),
(106, 'Priya', 'IT', 9000, '1990-10-18', 'Ahmedabad', 'Female'),
(107, 'Bhoomi', 'HR', 34000, '1991-12-25', 'Rajkot', 'Female');

SELECT * FROM EMP

------------------------------PART - A----------------------------------------



--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.

SELECT
    MAX(SALARY) AS MAXIMUM_SALARY,
    MIN(SALARY) AS MINIMUM_SALARY
FROM EMP;

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal,
--respectively.

SELECT 
    SUM(Salary) AS Total_Sal, 
    AVG(Salary) AS Average_Sal 
FROM EMP;

--3. Find total number of employees of EMPLOYEE table.

SELECT 
    COUNT(EID) AS TOTAL_EMPLOYEE
FROM EMP;

--4. Find highest salary from Rajkot city.

SELECT 
    MAX(SALARY) AS MAXIMUM_SALARY
FROM EMP
WHERE CITY = 'RAJKOT'

--5. Give maximum salary from IT department.

SELECT
    MAX(SALARY) AS MAX_SALARY
FROM EMP
WHERE Department = 'IT'

--6. Count employee whose joining date is after 8-feb-91.

SELECT 
    COUNT(EID) AS TOTAL_EMPLOYEE
FROM EMP
WHERE JoiningDate > '1991-02-08'

--7. Display average salary of Admin department.

SELECT 
    AVG(SALARY) AS AVG_SALARY
FROM EMP
WHERE Department = 'ADMIN'

--8. Display total salary of HR department.

SELECT 
    SUM(SALARY) AS SUM_SALARY
FROM EMP
WHERE Department = 'HR'

--9. Count total number of cities of employee without duplication.

SELECT 
    COUNT(DISTINCT CITY) AS CITY
FROM EMP

--10. Count unique departments.

SELECT 
    COUNT(DISTINCT Department) AS DEPARTMENT
FROM EMP

--11. Give minimum salary of employee who belongs to Ahmedabad.

SELECT
    MIN(SALARY) AS MIN_SALARY
FROM EMP
WHERE CITY = 'AHMEDABAD'

--12. Find city wise highest salary.

SELECT
    CITY, MAX(SALARY) AS MAX_SALARY
FROM EMP
GROUP BY CITY

--13. Find department wise lowest salary.

SELECT
    Department, MIN(SALARY) AS MIN_SALARY
FROM EMP
GROUP BY Department

--14. Display city with the total number of employees belonging to each city.

SELECT
    CITY, COUNT(ENAME) AS TOTAL_EMP
FROM EMP
GROUP BY CITY

--15. Give total salary of each department of EMP table.


SELECT
   Department, SUM(SALARY) AS TOTAL_SALARY
FROM EMP
GROUP BY Department

--16. Give average salary of each department of EMP table without displaying the respective department
--name.

SELECT
    Department, AVG(SALARY) AS TOTAL_SALARY
FROM EMP
GROUP BY Department

--17. Count the number of employees for each department in every city.

SELECT
    Department, COUNT(EName) AS TOTAL
FROM EMP
GROUP BY Department

--18. Calculate the total salary distributed to male and female employees.

SELECT
    Gender, SUM(SALARY) AS TOTAL_SALARY
FROM EMP
WHERE GENDER = 'FEMALE'
GROUP BY GENDER

SELECT
    Gender, SUM(SALARY) AS TOTAL_SALARY
FROM EMP
WHERE GENDER = 'MALE'
GROUP BY GENDER

--19. Give city wise maximum and minimum salary of female employees.

SELECT
    CITY, MAX(SALARY) AS MAX_SALARY
FROM EMP
WHERE GENDER = 'FEMALE'
GROUP BY CITY

SELECT
    CITY, MIN(SALARY) AS MIN_SALARY
FROM EMP
WHERE GENDER = 'FEMALE'
GROUP BY CITY

--20. Calculate department, city, and gender wise average salary.

SELECT
    Department, GENDER, CITY, AVG(SALARY) AS AVG_SALARY
FROM EMP
WHERE GENDER = 'FEMALE'
GROUP BY CITY, Department, GENDER




------------------------------------------------Part – B--------------------------------------------------------


--1. Count the number of employees living in Rajkot.

SELECT
    EName, COUNT(EID) AS TOTAL_EMP
FROM EMP
WHERE CITY = 'RAJKOT'
GROUP BY ENAME

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.

SELECT
    ENAME, MAX(SALARY) - MIN(SALARY) AS DIFFERENCE
FROM EMP
GROUP BY ENAME

--3. Display the total number of employees hired before 1st January, 1991.

SELECT
    ENAME, COUNT(EName) AS TOTAL_EMP
FROM EMP
WHERE JoiningDate < '1991-01-01'
GROUP BY ENAME

--Part – C:
--1. Count the number of employees living in Rajkot or Baroda.

SELECT
    ENAME, COUNT(EName) AS TOTAL_EMP
FROM EMP
WHERE CITY = 'RAJKOT' OR CITY = 'BARODA'
GROUP BY ENAME

--2. Display the total number of employees hired before 1st January, 1991 in IT department.

SELECT
    ENAME, COUNT(EName) AS TOTAL_EMP
FROM EMP
WHERE JoiningDate < '1991-01-01' AND Department = 'IT'
GROUP BY ENAME

--3. Find the Joining Date wise Total Salaries.

SELECT
    JoiningDate, SUM(SALARY) AS TOTAL_SALARY
FROM EMP
GROUP BY JoiningDate

--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.

SELECT
    Department, CITY, MAX(SALARY) AS TOTAL_SALARY
FROM EMP
WHERE ENAME LIKE 'R%' 
GROUP BY Department, CITY

SELECT * FROM EMP
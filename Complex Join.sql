select * from DEPT
select * from PERSON



----------------------------------------Part – A-------------------------------------------------



-- 1. Combine information from Person and Department table using cross join or Cartesian product

SELECT *
FROM PERSON
CROSS JOIN DEPT;

-- 2. Find all persons with their department name

SELECT p.PersonName, d.DepartmentName
FROM PERSON p
LEFT JOIN DEPT d ON p.DepartmentID = d.DepartmentID;

-- 3. Find all persons with their department name & code

SELECT p.PersonName, d.DepartmentName, d.DepartmentCode
FROM PERSON p
LEFT JOIN DEPT d ON p.DepartmentID = d.DepartmentID;

-- 4. Find all persons with their department code and location

SELECT p.PersonName, d.DepartmentCode, d.Location
FROM PERSON p
LEFT JOIN DEPT d ON p.DepartmentID = d.DepartmentID;

-- 5. Find the detail of the person who belongs to Mechanical department

SELECT p.*
FROM PERSON p
JOIN DEPT d ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mechanical';

-- 6. Find person's name, department code and salary who lives in Ahmedabad city

SELECT p.PersonName, d.DepartmentCode, p.Salary
FROM PERSON p
LEFT JOIN DEPT d ON p.DepartmentID = d.DepartmentID
WHERE p.City = 'Ahmedabad';

-- 7. Find the person's name whose department is in C-Block

SELECT p.PersonName
FROM PERSON p
JOIN DEPT d ON p.DepartmentID = d.DepartmentID
WHERE d.Location = 'C-Block';

-- 8. Retrieve person name, salary & department name who belongs to Jamnagar city

SELECT p.PersonName, p.Salary, d.DepartmentName
FROM PERSON p
LEFT JOIN DEPT d ON p.DepartmentID = d.DepartmentID
WHERE p.City = 'Jamnagar';

-- 9. Retrieve person's detail who joined the Civil department after 1-Aug-2001

SELECT p.*
FROM PERSON p
JOIN DEPT d ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Civil' AND p.JoiningDate > '2001-08-01';

-- 10. Display all the person's name with the department whose joining date difference with current date is more than 365 days

SELECT p.PersonName, d.DepartmentName
FROM PERSON p
LEFT JOIN DEPT d ON p.DepartmentID = d.DepartmentID
WHERE DATEDIFF(day, p.JoiningDate, GETDATE()) > 365;

-- 11. Find department wise person counts

SELECT d.DepartmentName, COUNT(p.PersonID) as PersonCount
FROM DEPT d
LEFT JOIN PERSON p ON d.DepartmentID = p.DepartmentID
GROUP BY d.DepartmentName;

-- 12. Give department wise maximum & minimum salary with department name

SELECT d.DepartmentName, 
       MAX(p.Salary) as MaxSalary, 
       MIN(p.Salary) as MinSalary
FROM DEPT d
LEFT JOIN PERSON p ON d.DepartmentID = p.DepartmentID
GROUP BY d.DepartmentName;

-- 13. Find city wise total, average, maximum and minimum salary

SELECT City, 
       SUM(Salary) as TotalSalary,
       AVG(Salary) as AverageSalary,
       MAX(Salary) as MaxSalary,
       MIN(Salary) as MinSalary
FROM PERSON
GROUP BY City;

-- 14. Find the average salary of a person who belongs to Ahmedabad

SELECT AVG(Salary) as AverageSalary
FROM PERSON
WHERE City = 'Ahmedabad';

--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In
--single column)

SELECT p.PersonName + ' lives in ' + p.City + ' and works in ' + 
       COALESCE(d.DepartmentName, 'No') + ' Department.' as PersonDetails
FROM PERSON p
LEFT JOIN DEPT d ON p.DepartmentID = d.DepartmentID;

--Part – B:
--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In
--single column)
--2. Find city & department wise total, average & maximum salaries.
--3. Find all persons who do not belong to any department.
--4. Find all departments whose total salary is exceeding 100000.
--Part – C:
--1. List all departments who have no person.
--2. List out department names in which more than two persons are working.
--3. Give a 10% increment in the computer department employee’s salary. (Use Update)






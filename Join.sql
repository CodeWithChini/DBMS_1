USE CSE_3B_332



-- Create STU_INFO table
CREATE TABLE STU_INFO (
    Rno INT ,
    Name VARCHAR(50),
    Branch VARCHAR(10)
);

-- Create RESULT table
CREATE TABLE RESULT (
    Rno INT,
    SPI DECIMAL(4,2),
);

-- Create EMPLOYEE_MASTER table
CREATE TABLE EMPLOYEE_MASTER (
    EmployeeNo VARCHAR(3),
    Name VARCHAR(50),
    ManagerNo VARCHAR(3)
);

-- Insert data into STU_INFO
INSERT INTO STU_INFO (Rno, Name, Branch) VALUES
(101, 'Raju', 'CE'),
(102, 'Amit', 'CE'),
(103, 'Sanjay', 'ME'),
(104, 'Neha', 'EC'),
(105, 'Meera', 'EE'),
(106, 'Mahesh', 'ME');

-- Insert data into RESULT
INSERT INTO RESULT (Rno, SPI) VALUES
(101, 8.8),
(102, 9.2),
(103, 7.6),
(104, 8.2),
(105, 7.0),
(107, 8.9);

-- Insert data into EMPLOYEE_MASTER
INSERT INTO EMPLOYEE_MASTER (EmployeeNo, Name, ManagerNo) VALUES
('E01', 'Tarun', NULL),
('E02', 'Rohan', 'E02'),
('E03', 'Priya', 'E01'),
('E04', 'Milan', 'E03'),
('E05', 'Jay', 'E01'),
('E06', 'Anjana', 'E04');



SELECT * FROM STU_INFO;
SELECT * FROM RESULT;
SELECT * FROM EMPLOYEE_MASTER;



---------------------------------------Part – A------------------------------------------



--1. Combine information from student and result table using cross join or Cartesian product.

SELECT * 
FROM STU_INFO 
CROSS JOIN RESULT;

--2. Perform inner join on Student and Result tables.

SELECT * 
FROM STU_INFO S
INNER JOIN RESULT R
ON S.Rno = R.Rno;

--3. Perform the left outer join on Student and Result tables.

SELECT * 
FROM STU_INFO S
LEFT OUTER JOIN RESULT R
ON S.Rno = R.Rno;

--4. Perform the right outer join on Student and Result tables.

SELECT * 
FROM STU_INFO S
RIGHT OUTER JOIN RESULT R
ON S.Rno = R.Rno;

--5. Perform the full outer join on Student and Result tables.

SELECT * 
FROM STU_INFO S
FULL OUTER JOIN RESULT R
ON S.Rno = R.Rno;

--6. Display Rno, Name, Branch and SPI of all students.

SELECT S.Rno, Name, BRANCH, SPI
FROM STU_INFO S
LEFT OUTER JOIN RESULT R
ON S.Rno = R.Rno;

--7. Display Rno, Name, Branch and SPI of CE branch’s student only.

SELECT S.Rno, Name, BRANCH, R.SPI
FROM STU_INFO S
LEFT OUTER JOIN RESULT R
ON S.Rno = R.Rno
WHERE BRANCH = 'CE';

--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only.

SELECT S.Rno, Name, BRANCH, R.SPI
FROM STU_INFO S
INNER JOIN RESULT R
ON S.Rno = R.Rno
WHERE BRANCH = 'EC';

--9. Display average result of each branch.

SELECT S.Branch, AVG(R.SPI) AS Average_SPI 
FROM STU_INFO S 
INNER JOIN RESULT R 
ON S.Rno = R.Rno 
GROUP BY S.Branch;

--10. Display average result of CE and ME branch.

SELECT S.Branch, AVG(R.SPI) AS Average_SPI 
FROM STU_INFO S 
INNER JOIN RESULT R 
ON S.Rno = R.Rno 
WHERE BRANCH IN ('CE', 'EC')
GROUP BY S.Branch;

--11. Display Maximum and Minimum SPI of each branch.

SELECT S.Branch, MIN(R.SPI) AS MIN_SPI ,  MAX(R.SPI) AS MAX_SPI
FROM STU_INFO S 
INNER JOIN RESULT R 
ON S.Rno = R.Rno 
GROUP BY S.Branch;

--12. Display branch wise student’s count in descending order.

SELECT S.Branch, COUNT(NAME)
FROM STU_INFO S 
INNER JOIN RESULT R 
ON S.Rno = R.Rno 
GROUP BY S.Branch
ORDER BY COUNT(NAME) DESC;




-------------------------------------------Part – B------------------------------




--1. Display average result of each branch and sort them in ascending order by SPI.

SELECT S.Branch, AVG(R.SPI) AS Average_SPI 
FROM STU_INFO S 
INNER JOIN RESULT R 
ON S.Rno = R.Rno 
GROUP BY S.Branch
ORDER BY  AVG(R.SPI);

--2. Display highest SPI from each branch and sort them in descending order.

SELECT S.Branch, MAX(R.SPI) AS MAX_SPI 
FROM STU_INFO S 
JOIN RESULT R 
ON S.Rno = R.Rno 
GROUP BY S.Branch
ORDER BY  MAX(R.SPI);




-------------------------------------------Part – C------------------------------------------




--1. Retrieve the names of employee along with their manager’s name from the Employee table.

SELECT E1.Name AS Employee_Name, E2.Name AS Manager_Name 
FROM EMPLOYEE_MASTER E1 
INNER JOIN EMPLOYEE_MASTER E2 
ON E1.ManagerNo = E2.EmployeeNo;


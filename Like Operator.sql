USE CSE_3B_332

CREATE TABLE STUDENT(
			STUID INT,
			FIRSTNAME VARCHAR(25),
			LASTNAME VARCHAR(25),
			WEBSITE VARCHAR(50),
			CITY VARCHAR(25),
			ADDRESS VARCHAR(100)
			);

INSERT INTO STUDENT (StuID, FirstName, LastName, Website, City, Address) 
VALUES
	(1011, 'Keyur', 'Patel', 'techonthenet.com', 'Rajkot', 'A-303 ‘Vasant Kunj’, Rajkot'),
	(1022, 'Hardik', 'Shah', 'digminecraft.com', 'Ahmedabad', '“Ram Krupa”, Raiya Road'),
	(1033, 'Kajal', 'Trivedi', 'bigactivities.com', 'Baroda', 'Raj bhavan plot, near garden'),
	(1044, 'Bhoomi', 'Gajera', 'checkyourmath.com', 'Ahmedabad', '“Jig’s Home”, Narol'),
	(1055, 'Harmit', 'Mitel', '@me.darshan.com', 'Rajkot', 'B-55, Raj Residency'),
	(1066, 'Ashok', 'Jani', NULL, 'Baroda', 'A502, Club House Building');


SELECT * FROM STUDENT


--------------------------PART : A------------------------------


--1. Display the name of students whose name starts with ‘k’.

SELECT FirstName, LastName
FROM STUDENT
WHERE FirstName LIKE 'K%';

--2. Display the name of students whose name consists of five characters.


SELECT FirstName, LastName
FROM STUDENT
WHERE FIRSTNAME LIKE '_____'

--3. Retrieve the first name & last name of students whose city name ends with ‘a’ & contains six characters.

SELECT FirstName, LastName,CITY
FROM STUDENT
WHERE CITY LIKE '%A' AND CITY LIKE '______'

--4. Display all the students whose last name ends with ‘tel’.

SELECT LastName
FROM STUDENT
WHERE LASTNAME LIKE '%TEL'

--5. Display all the students whose first name starts with ‘ha’ & ends with‘t’.

SELECT FirstName, LASTNAME
FROM STUDENT
WHERE FIRSTNAME LIKE 'HA%T'


--6. Display all the students whose first name starts with ‘k’ and third character is ‘y’.

SELECT FirstName, LastName
FROM STUDENT
WHERE FIRSTNAME LIKE 'K%' AND FIRSTNAME LIKE'__Y%'

--7. Display the name of students having no website and name consists of five characters.


SELECT FirstName, LastName
FROM STUDENT
WHERE WEBSITE IS NULL AND FIRSTNAME LIKE '_____'

--8. Display all the students whose last name consist of ‘jer’.

SELECT FirstName, LastName
FROM STUDENT
WHERE LASTNAME LIKE '%JER'

--9. Display all the students whose city name starts with either ‘r’ or ‘b’.

SELECT FirstName, LastName
FROM STUDENT
WHERE CITY LIKE 'R%' OR CITY LIKE 'B%'

--10. Display all the name students having websites.

SELECT FirstName, LastName
FROM STUDENT
WHERE WEBSITE IS NOT NULL

--11. Display all the students whose name starts from alphabet A to H.

SELECT FirstName, LastName
FROM STUDENT
WHERE FIRSTNAME LIKE '[A-H]%'

--12. Display all the students whose name’s second character is vowel.

SELECT * 
FROM STUDENT 
WHERE FirstName LIKE '_[aeiou]%';

--13. Display the name of students having no website and name consists of minimum five characters.

SELECT FirstName, LastName 
FROM STUDENT 
WHERE Website IS NULL AND FIRSTNAME LIKE '_____'

--14. Display all the students whose last name starts with ‘Pat’.

SELECT * 
FROM STUDENT 
WHERE LASTNAME LIKE 'PAT%'

--15. Display all the students whose city name does not starts with ‘b’.

SELECT * 
FROM STUDENT 
WHERE CITY NOT LIKE 'B%'

--16. Display all the students whose student ID ends with digit.

SELECT * 
FROM STUDENT 
WHERE StuID LIKE '%[0-9]';

--17. Display all the students whose address does not contain any digit.

SELECT * 
FROM STUDENT 
WHERE ADDRESS NOT LIKE '%[0-9]';

--18. Find students whose first name starts with 'B', last name ends with 'A', and their website contains either
--'math' or 'science'. Ensure that their city does not start with 'B'.

SELECT * 
FROM STUDENT 
WHERE FIRSTNAME LIKE 'B%' 
AND LastName LIKE '%A' 
AND (Website LIKE '%math%' OR Website LIKE '%science%') 
AND City NOT LIKE 'B%';

--19. Retrieve students who have 'Shah' in their last name and whose city ends with 'd'. Additionally, their
--website should be either null or contain 'com'.

SELECT * 
FROM STUDENT 
WHERE LastName LIKE '%Shah%' 
AND City LIKE '%d' 
AND (Website IS NULL OR Website LIKE '%com%');

--20. Select students whose first and second character is a vowel. Their city should start with 'R' and they must
--have a website containing '.com'.

SELECT * 
FROM STUDENT 
WHERE FirstName LIKE '[aeiou][aeiou]%' 
AND City LIKE 'R%' 
AND Website LIKE '%.com%';

-------------------------Part – B---------------------------------


--1. Display all the students whose name’s second character is vowel and of and start with H.

SELECT * 
FROM STUDENT 
WHERE FirstName LIKE 'H[aeiou]%';

--2. Display all the students whose last name does not ends with ‘a’.

SELECT * 
FROM STUDENT 
WHERE LASTNAME NOT LIKE '%A';

--3. Display all the students whose first name starts with consonant.

SELECT * 
FROM STUDENT 
WHERE FirstName NOT LIKE '[A,E,I,O,U]%';

--4. Retrieve student details whose first name starts with 'K', last name ends with 'tel', and either their
--website contains 'tech' or they live in a city starting with 'R'.

SELECT * 
FROM STUDENT 
WHERE FirstName LIKE 'K%' 
		AND LastName LIKE '%tel' 
		AND (Website LIKE '%tech%' OR City LIKE 'R%');

--5. Retrieve students whose address contains a hyphen '-' and whose city starts with either 'R' or 'B'. They
--must have a website that ends with '.com' and their first name should not start with 'A'.

SELECT *
FROM STUDENT 
WHERE Address LIKE '%-%' 
		AND (City LIKE 'R%' OR City LIKE 'B%') 
		AND Website LIKE '%.com' 
		AND FirstName NOT LIKE 'A%';

-------------------------Part – C-------------------------------
--1. Display all the students whose address contains single quote or double quote.

SELECT *
FROM STUDENT 
WHERE Address LIKE '%''%' AND Address LIKE '%""%'

--2. Find students whose city does not contain the letter 'S' and their address contains either single or double
--quotes. Their last name should start with 'P' and they must have a website that contains 'on'.

SELECT * 
FROM STUDENT 
WHERE City NOT LIKE '%S%' 
		AND (Address LIKE '%''%' OR Address LIKE '%"%' ) 
		AND LastName LIKE 'P%' 
		AND Website LIKE '%on%';




-------------------------------------------EXTRA-------------------------------------------


SELECT WEBSITE
FROM STUDENT
WHERE WEBSITE LIKE '%.COM'

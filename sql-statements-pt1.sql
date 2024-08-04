SELECT 
    *
FROM
    projmon.person;
    
SELECT 
    *
FROM
    projmon.contact;
    
SELECT 
    *
FROM
    projmon.contacttype;
    
SELECT 
    *
FROM
    projmon.project;
    
SELECT 
    *
FROM
    projmon.projectperson;
    
SELECT 
    *
FROM
    projmon.role;

SELECT 
    firstname, lastname, dob
FROM
    person;
    
SELECT 
    dob, firstname, lastname
FROM
    person;

SELECT 
    managerid
FROM
    person;
    
UPDATE person 
SET 
    managerid = '5'
WHERE
    id = '1';
    
UPDATE person 
SET 
    managerid = '4'
WHERE
    id = '2';
    
UPDATE person 
SET 
    managerid = '5'
WHERE
    id = '3';
    
UPDATE person 
SET 
    managerid = '5'
WHERE
    id = '4';
    
UPDATE person 
SET 
    managerid = '5'
WHERE
    id = '6';

SELECT 
    managerid
FROM
    person;
    
SELECT DISTINCT
    managerid
FROM
    person;
    
SELECT DISTINCT
    pid
FROM
    projectperson;

SELECT DISTINCT
    managerid, firstname
FROM
    person;
    
SELECT 
    managerid, firstname
FROM
    person;

SELECT
	LEFT(firstname, 1), lastname
FROM
	person;
    
SELECT
	SUBSTR(firstname, 1, 1), lastname
FROM
	person;
    
SELECT
	CONCAT(firstname, ' ', lastname)
FROM
	person;
    
SELECT
	CONCAT_WS(' ', firstname, lastname)
FROM
	person;
    
SELECT
	lastname, firstname, dob
FROM
	person;

SELECT
	lastname, firstname, YEAR(dob)
FROM
	person;

SELECT
	lastname, firstname, YEAR(dob), MONTH(dob)
FROM
	person;
    
SELECT
	lastname, firstname, dob-NOW()
FROM
	person;

SELECT
	lastname, firstname, NOW()-dob
FROM
	person;

SELECT
	lastname, firstname, YEAR(NOW()-dob)
FROM
	person;
    
SELECT
	lastname, firstname, YEAR(NOW())-YEAR(dob)
FROM
	person;

SELECT
	lastname, firstname, DATEDIFF(NOW(),dob)
FROM
	person;

SELECT
	lastname, firstname, DATEDIFF(NOW(),dob)/365
FROM
	person;
    
SELECT
	lastname, firstname, ROUND(DATEDIFF(NOW(),dob)/365)
FROM
	person;
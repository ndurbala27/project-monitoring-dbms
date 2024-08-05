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
    lastname, firstname, ROUND(DATEDIFF(NOW(), dob) / 365)
FROM
    person;
    
SELECT 
    lastname, firstname, dob
FROM
    person
ORDER BY lastname ASC;

SELECT 
    lastname, firstname, dob
FROM
    person
ORDER BY dob DESC;

SELECT 
    lastname, firstname, dob
FROM
    person
ORDER BY firstname ASC , dob DESC;

SELECT 
    lastname, firstname, dob, managerid
FROM
    person
ORDER BY managerid ASC , dob DESC;

SELECT 
    lastname 'Last Name', firstname as first_name, dob Birthday
FROM
    person
ORDER BY managerid ASC , dob DESC;

SELECT LEFT('John', 2);
    
SELECT ROUND(DATEDIFF(NOW(), '1986-09-28') / 365) AS 'Nate Durbala\'s age';

SELECT CONCAT('Nate', ' m', ' Durbala') AS 'concatenated name';

SELECT SUBSTR('Nathanial', 1, 3) AS 'substring';

SELECT ROUND(38.14567) AS 'rounding';

SELECT 
    LEFT(firstname, 1) initial, lastname, dob
FROM
    person
ORDER BY initial DESC;

SELECT 
    RIGHT(firstname, 1) 'Last Letter', lastname ln
FROM
    person
ORDER BY ln ASC;


-- I enjoyed creating the last SQL statement to generate a result set 
-- that relates to a real-world scenario of project code labels ('prcode')
-- for project filing purposes. I even saved this SQL statement as a snippet in MySql Workbench.
SELECT 
    label, REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
        UPPER(SUBSTRING_INDEX(label, ' ', 1)), 'A', ''), 'E', ''), 'I', ''), 'O', ''), 'U', '') AS prcode, ROUND(budget) budget
FROM
    project
ORDER BY budget ASC;

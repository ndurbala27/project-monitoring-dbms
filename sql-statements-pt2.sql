SELECT 
    *
FROM
    person;
    
SELECT 
    *
FROM
    person
WHERE
    id = 3;

SELECT 
    firstname, lastname, dob
FROM
    person
WHERE
    id = 3;
    
SELECT 
    firstname, lastname, dob
FROM
    person
WHERE
    managerid = 5;

SELECT 
    *
FROM
    person
WHERE
    id != 2 OR id <> 2;
    
SELECT 
    firstname, lastname, dob, managerid
FROM
    person
WHERE
    lastname = 'Briggs';
    
SELECT 
    firstname, lastname, dob, managerid
FROM
    person
WHERE
    firstname = 'Jenny';

SELECT 
    *
FROM
    person
WHERE
    dob = '1980-08-20';
    
SELECT 
    *
FROM
    person
WHERE
    dob > '1980-08-20';
    
SELECT 
    *
FROM
    person
WHERE
    dob < '1980-08-20';

SELECT 
    *
FROM
    contacttype;

SELECT 
    *
FROM
    contact
WHERE
    ctid = 2;

SELECT 
    *
FROM
    contact
WHERE
    ctid = 1;

SELECT 
    *
FROM
    contact
WHERE
    ctid >= 2;
    
SELECT 
    firstname, lastname, dob, managerid
FROM
    person
WHERE
    managerid = 5 AND firstname = 'Jenny';

SELECT 
    firstname, lastname, dob, managerid
FROM
    person
WHERE
    managerid = 5 OR firstname = 'Jenny';

SELECT 
    id, firstname, lastname, dob, managerid
FROM
    person
WHERE
    dob > '1970-12-31' AND managerid = 5
        AND id > 1;

SELECT 
    id, firstname, lastname, dob, managerid
FROM
    person
WHERE
    dob > '1970-12-31' OR managerid = 5
        OR id > 1;

SELECT 
    id, firstname, lastname, dob, managerid
FROM
    person
WHERE
    (dob > '1970-12-31' OR managerid = 5)
        AND id > 1;

SELECT 
    *
FROM
    person
WHERE
    id BETWEEN 2 AND 5;

SELECT 
    *
FROM
    person
WHERE
    lastname BETWEEN 'Baker' AND 'Miller';

SELECT 
    *
FROM
    person
WHERE
    lastname >= 'Baker'
        AND lastname <= 'Miller';

SELECT 
    *
FROM
    person
WHERE
    lastname IN ('Palmer' , 'James');

SELECT 
    id, firstname, lastname, notes
FROM
    person
WHERE
    notes LIKE '%CEO%';

SELECT 
    id, firstname, lastname, notes
FROM
    person
WHERE
    notes LIKE 'CEO%';

SELECT 
    id, firstname, lastname, notes
FROM
    person
WHERE
    notes LIKE 'rick%';
    
SELECT 
    id, firstname, lastname, notes
FROM
    person
WHERE
    lastname LIKE '__l%';

SELECT 
    id, firstname, lastname, managerid
FROM
    person
WHERE
    lastname BETWEEN 'Briggs' AND 'Palmer';

SELECT 
    id, firstname, lastname, managerid
FROM
    person
WHERE
    firstname LIKE 'j%';
    
SELECT 
    id, firstname, lastname, managerid
FROM
    person
WHERE
    firstname LIKE 'p%'
        OR lastname LIKE '%r';

SELECT
	id, firstname, lastname, '0000-00-00' as dob, YEAR(NOW())-YEAR(0000-00-00) as AGE
FROM
	person
WHERE
	id = 6;
    
SELECT
	id, firstname, lastname, dob, YEAR(NOW())-YEAR(dob) as AGE
FROM
	person
WHERE
	id = 6;

SELECT
	*
FROM
	project;

INSERT INTO project(id,label,budget) VALUES('4','New Project',0);

SELECT
	*
FROM
	project;
    
UPDATE project 
SET 
    budget = NULL
WHERE
    id = 4;
    
SELECT
	*
FROM
	project
WHERE budget IS NULL;

SELECT
	*
FROM
	project
WHERE budget IS NOT NULL;

SELECT 
    *
FROM
    person
WHERE
    notes = NULL;

SELECT 
    id, firstname, lastname, dob
FROM
    person
WHERE
    dob IS NULL;

SELECT 
    id, firstname, lastname, dob
FROM
    person
WHERE
    dob IS NOT NULL;

SELECT 
    label, budget
FROM
    project
WHERE
    id = 3;

SELECT 
    *
FROM
    project
WHERE
    label = 'Website';

SELECT 
    label
FROM
    project
WHERE
    budget > 500;

SELECT 
    *
FROM
    project
WHERE
    budget BETWEEN 250 AND 1500;

SELECT 
    *
FROM
    project
WHERE
    budget < 500 OR budget > 1500;
    
SELECT 
    label
FROM
    project
WHERE
    budget NOT BETWEEN 500 AND 1500;

SELECT 
    *
FROM
    project
WHERE
    id > 1 AND budget > 500;

SELECT 
	*
FROM
    project
WHERE
    budget IS NULL;

SELECT 
    *
FROM
    role
WHERE
    label LIKE '%manager%';

SELECT 
    *
FROM
    role
WHERE
    label IN ('developer' , 'tester');
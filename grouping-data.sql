SELECT * FROM person;

SELECT 
    managerid
FROM
    person
GROUP BY managerid;

SELECT DISTINCT
    managerid
FROM
    person;
    
SELECT 
    managerid, COUNT(*)
FROM
    person
GROUP BY managerid;

SELECT 
    LEFT(firstname, 1) initial, COUNT(*)
FROM
    person
GROUP BY initial;

SELECT 
    managerid, COUNT(*), MIN(dob), MAX(dob)
FROM
    person
GROUP BY managerid;

SELECT 
    *
FROM
    projmon.hourstask;

SELECT 
    pid, SUM(hours_worked)
FROM
    hourstask
GROUP BY pid;

SELECT 
    pid, date_worked, task_type, SUM(hours_worked)
FROM
    hourstask
GROUP BY pid , date_worked, task_type
ORDER BY pid;

SELECT 
    *
FROM
    hourstask
ORDER BY pid , date_worked , task_type;

-- INSERT INTO hourstask (pid, date_worked, task_type, hours_worked) VALUES (3, '2014-5-5', '171', 4.0);

SELECT 
    id, pid, date_worked, task_type, hours_worked
FROM
    hourstask
WHERE
    pid = 3
ORDER BY date_worked , task_type;

SELECT 
    pid, date_worked, task_type, SUM(hours_worked)
FROM
    hourstask
WHERE
    pid = 3
GROUP BY pid , date_worked , task_type
ORDER BY pid;

SELECT 
    COUNT(pid), ctid
FROM
    contact
GROUP BY ctid;

SELECT 
    pid as 'Person ID #', COUNT(*) as 'has #', ctid as 'of this type of contact method' 
FROM
    contact
GROUP BY pid, ctid;

SELECT 
    managerid, COUNT(*)
FROM
    person
GROUP BY managerid;

SELECT 
    managerid, COUNT(*)
FROM
    person
GROUP BY managerid
HAVING COUNT(*) <= 1;

SELECT 
    pid, date_worked, task_type, hours_worked
FROM
    hourstask
WHERE
    task_type = '171';

SELECT 
    pid, date_worked, task_type, SUM(hours_worked)
FROM
    hourstask
WHERE
    task_type = '171'
GROUP BY pid , date_worked , task_type
HAVING SUM(hours_worked) < 4;

SELECT 
    pid, prid, COUNT(pid+prid)
FROM
    projectperson
GROUP BY pid , prid;

SELECT 
    pid, prid, COUNT(pid + prid)
FROM
    projectperson
GROUP BY pid , prid
HAVING COUNT(pid + prid) > 1;

SELECT 
    LEFT(label, 1) initial, COUNT(label)
FROM
    role
GROUP BY initial
ORDER BY initial;

SELECT 
    pid, prid, rid
FROM
    projectperson
ORDER BY pid, prid, rid;

SELECT 
    prid, COUNT(rid)
FROM
    projectperson
GROUP BY prid;

SELECT 
    prid AS 'in this project',
    rid AS 'for this role',
    COUNT(pid) AS 'x num of staff assigned'
FROM
    projectperson
GROUP BY prid , rid
ORDER BY prid;

SELECT 
    prid AS 'for this project',
    pid AS 'this person',
    COUNT(rid) AS 'is assigned this num of roles'
FROM
    projectperson
GROUP BY prid , pid
ORDER BY prid;

SELECT 
    prid AS 'in this project',
    rid AS 'for this role',
    COUNT(pid) AS 'x num of staff assigned'
FROM
    projectperson
GROUP BY rid , prid
HAVING COUNT(pid) > 1;

SELECT 
    prid AS 'in this project',
    pid AS 'this person',
    COUNT(rid) AS 'is assigned this num of roles'
FROM
    projectperson
GROUP BY pid , prid
HAVING COUNT(rid) > 1
ORDER BY prid;

SELECT DISTINCT
    prid AS 'list projects'
FROM
    projectperson
GROUP BY prid, pid
HAVING COUNT(rid) > 1;
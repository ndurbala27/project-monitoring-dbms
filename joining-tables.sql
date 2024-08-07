SELECT 
    *
FROM
    person;

SELECT 
    *
FROM
    contact;

SELECT 
    *
FROM
    person,
    contact
WHERE
    person.id = contact.pid;

SELECT 
    p.id,
    p.firstname,
    p.lastname,
    p.dob,
    p.managerid,
    c.ctid,
    c.value
FROM
    person p,
    contact c
WHERE
    p.id = c.pid;

SELECT 
    p.id,
    p.firstname,
    p.lastname,
    p.dob,
    p.managerid,
    c.ctid,
    c.value
FROM
    person p
        INNER JOIN
    contact c ON p.id = c.ctid;
    
SELECT 
    p.id,
    p.firstname,
    p.lastname,
    p.managerid,
    prp.prid,
    prp.rid,
    prj.label
FROM
    person p
        INNER JOIN
    projectperson prp ON p.id = prp.pid
        INNER JOIN
    project prj ON prp.pid = prj.id
ORDER BY p.lastname , p.firstname;

SELECT 
    p.id,
    p.firstname,
    p.lastname,
    p.managerid,
    prp.prid,
    prp.rid,
    prj.label
FROM
    person p
        INNER JOIN
    projectperson prp ON p.id = prp.pid
        INNER JOIN
    project prj ON prp.pid = prj.id
WHERE
    p.managerid = '5'
ORDER BY p.lastname , p.firstname;

SELECT 
    p.id, p.lastname, p.firstname, ct.label, c.value
FROM
    person p
        INNER JOIN
    contact c ON c.pid = p.id
        INNER JOIN
    contacttype ct ON c.ctid = ct.id
ORDER BY p.lastname ASC , p.firstname ASC;

SELECT 
    p.id,
    p.firstname,
    p.lastname,
    p.managerid,
    prp.prid,
    prp.rid
FROM
    person p
        LEFT JOIN
    projectperson prp ON p.id = prp.pid
ORDER BY p.lastname , p.firstname;

SELECT 
    p.id,
    p.firstname,
    p.lastname,
    p.managerid,
    prp.prid,
    prp.rid
FROM
    projectperson prp
        LEFT JOIN
    person p ON p.id = prp.pid
ORDER BY p.lastname , p.firstname;


SELECT 
    prj.id,
    prj.label,
    prj.budget,
    p.lastname,
    p.firstname,
    pp.rid
FROM
    projectperson pp
        RIGHT JOIN
    project prj ON prj.id = pp.prid
        LEFT JOIN
    person p ON pp.pid = p.id
ORDER BY prj.label, p.lastname, p.firstname;

SELECT 
    prj.id,
    prj.label "Project",
    prj.budget,
    p.lastname,
    p.firstname,
    r.label "Role"
FROM
    projectperson pp
        RIGHT JOIN
    project prj ON prj.id = pp.prid
        LEFT JOIN
    person p ON pp.pid = p.id
        LEFT JOIN
    role r ON r.id = pp.rid
ORDER BY prj.label , p.lastname , p.firstname;

SELECT 
    p.id,
    p.firstname,
    p.lastname,
    p.managerid,
    m.firstname,
    m.lastname
FROM
    person p,
    person m
WHERE
    p.managerid = m.id;

SELECT 
    p.id,
    p.firstname,
    p.lastname,
    p.managerid,
    m.firstname,
    m.lastname
FROM
    person p
        INNER JOIN
    person m ON p.managerid = m.id;


-- This next two queries, I really enjoyed slowly building out, piece by piece
-- and then cleaning up the result set for a professional presentation
-- Nate Durbala (August 6th, 2024)
SELECT 
    p.id 'ID Number',
    p.lastname 'Last Name',
    p.firstname 'First Name',
    c.value 'Employee Phone #',
    p.managerid 'Manager ID',
    CONCAT_WS('. ', LEFT(m.firstname, 1), m.lastname) 'Manager Name',
    cm.value 'Manager Phone #'
FROM
    person p
        LEFT JOIN
    person m ON p.managerid = m.id
        LEFT JOIN
    contact c ON p.id = c.pid
        LEFT JOIN
    contact cm ON m.id = cm.pid
WHERE
    c.ctid = 2
        AND (cm.ctid = 2 OR cm.ctid IS NULL)
ORDER BY p.lastname , p.firstname;

SELECT 
    *
FROM
    person p
        INNER JOIN
    projectperson pp ON p.id = pp.pid;


-- Next is my query to the lab exercise in the book I'm following along
-- returned same 6 rows and result as the next query after this one
-- query duration took '0.00063' seconds
SELECT 
    pr.label,
    r.label,
    p.firstname,
    p.lastname,
    m.firstname,
    m.lastname
FROM
    person p
        INNER JOIN
    projectperson pp ON p.id = pp.pid
        LEFT JOIN
    project pr ON pp.prid = pr.id
        LEFT JOIN
    role r ON pp.rid = r.id
        INNER JOIN
    person m ON p.managerid = m.id
ORDER BY pr.label desc;


-- query from book I'm following along
-- same number of lines of code
-- returned same 6 rows and result as the previous query
-- query duration took '0.00068' seconds
-- which one is more efficient and why?
SELECT 
    pr.label,
    r.label,
    p.firstname,
    p.lastname,
    m.firstname,
    m.lastname
FROM
    project pr,
    role r,
    projectperson pp,
    person p,
    person m
WHERE
    pr.id = pp.prid AND r.id = pp.rid
        AND pp.pid = p.id
        AND p.managerid = m.id
ORDER BY pp.prid ASC;

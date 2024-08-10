SELECT 
    MAX(dob)
FROM
    person;

SELECT 
    *
FROM
    person
WHERE
    dob = (SELECT 
            MAX(dob)
        FROM
            person);

SELECT 
    *
FROM
    person
WHERE
    dob > (SELECT 
            AVG(dob)
        FROM
            person);

SELECT 
    *
FROM
    person
WHERE
    dob < (SELECT 
            AVG(dob)
        FROM
            person);

SELECT 
    pid
FROM
    projectperson
WHERE
    rid = 4;

-- now i finally have a better understanding of how the IN clause works.
-- the IN clause returns records that match any value contained in a single column list,
-- like this subquery.
-- essentially checking agains a range of values
SELECT 
    *
FROM
    person
WHERE
    id IN (SELECT 
            pid
        FROM
            projectperson
        WHERE
            rid = 4);

-- versus having to find the relationship values manually,
-- and providing a hardcoded list of values like this query.
-- that would be very time consuming, especially in a data warehouse
SELECT 
    *
FROM
    person
WHERE
    id IN (2 , 3, 4);

SELECT 
    *
FROM
    project
WHERE
    budget > (SELECT 
            AVG(budget)
        FROM
            project);

SELECT 
    *
FROM
    project
WHERE
    budget = (SELECT 
            MAX(budget)
        FROM
            project);

SELECT 
    *
FROM
    project
WHERE
    budget = (SELECT 
            MIN(budget)
        FROM
            project);

SELECT 
    *
FROM
    project
WHERE
    budget < (SELECT 
            AVG(budget)
        FROM
            project);

SELECT 
    *
FROM
    person p
WHERE
    EXISTS( SELECT 
            *
        FROM
            projectperson pp
        WHERE
            pp.pid = p.id);

SELECT 
    *
FROM
    person p
WHERE
    NOT EXISTS( SELECT 
            *
        FROM
            projectperson pp
        WHERE
            pp.pid = p.id);

SELECT 
    *
FROM
    person p
WHERE
    EXISTS( SELECT 
            *
        FROM
            projectperson pp
        WHERE
            pp.pid = p.id AND pp.rid = 4);

SELECT 
    *
FROM
    person p
WHERE
    EXISTS( SELECT 
            *
        FROM
            projectperson pp
        WHERE
            p.id = pp.pid AND rid = 2);

SELECT 
    *
FROM
    contact c
WHERE
    EXISTS( SELECT 
            *
        FROM
            contacttype ct
        WHERE
            ct.id = c.ctid AND ct.id = 1);

SELECT 
    *
FROM
    contact c
WHERE
    NOT EXISTS( SELECT 
            *
        FROM
            contacttype ct
        WHERE
            ct.id = c.ctid AND ct.id = 1);

SELECT 
    *
FROM
    person p
WHERE
    NOT EXISTS( SELECT 
            *
        FROM
            projectperson pp
        WHERE
            p.id = pp.pid AND rid = 2);

SELECT 
    *
FROM
    person p,
    projectperson pp
WHERE
    p.id = pp.pid AND pp.rid = 4;

SELECT 
    *
FROM
    person p
WHERE
    id IN (SELECT 
            pid
        FROM
            projectperson
        WHERE
            rid = 4);

SELECT 
    *
FROM
    person p
WHERE
    EXISTS( SELECT 
            *
        FROM
            projectperson
        WHERE
            pid = p.id AND rid = 4);

SELECT 
    *
FROM
    person p,
    contact c
WHERE
    p.id = c.pid AND c.ctid = 1;

SELECT 
    *
FROM
    person p
WHERE
    id IN (SELECT 
            pid
        FROM
            contact
        WHERE
            ctid = 1);

SELECT 
    *
FROM
    person p
WHERE
    EXISTS( SELECT 
            *
        FROM
            contact
        WHERE
            p.id = pid AND ctid = 1);

SELECT 
    *
FROM
    person;

SELECT 
    managerid, COUNT(*) directreports
FROM
    person
GROUP BY managerid;

SELECT 
    MAX(directreports)
FROM
    (SELECT 
        managerid, COUNT(*) directreports
    FROM
        person
    GROUP BY managerid) counts;

SELECT 
    nameProject.lastname 'Last Name',
    pr.label 'Project Name',
    r.label 'Project Role'
FROM
    (SELECT 
        *
    FROM
        person p, projectperson pp
    WHERE
        p.id = pp.pid) nameProject,
    role r,
    project pr
WHERE
    nameProject.rid = r.id
        AND nameProject.prid = pr.id;

SELECT 
    *
FROM
    project
WHERE
    budget > (SELECT 
            AVG(budget)
        FROM
            project);

SELECT 
    label,
    budget,
    budget / (SELECT 
            SUM(budget)
        FROM
            project)
FROM
    project;

SELECT 
    label 'Project Name',
    budget 'Budget',
    CONCAT(100 * (ROUND(budget / (SELECT 
                            SUM(budget)
                        FROM
                            project),
                    3)),
            '%') 'Budget share'
FROM
    project;

SELECT 
    *
FROM
    person
WHERE
    id IN (SELECT 
            pid
        FROM
            projectperson
        WHERE
            rid = 2);

SELECT 
    *
FROM
    project pr
WHERE
    NOT EXISTS( SELECT 
            *
        FROM
            projectperson
        WHERE
            prid = pr.id);

SELECT 
    *
FROM
    person p
WHERE
    EXISTS( SELECT 
            *
        FROM
            contact
        WHERE
            pid = p.id
                AND ctid = (SELECT 
                    id
                FROM
                    contacttype
                WHERE
                    label = 'address'));

SELECT 
    *
FROM
    contact c,
    contacttype ct
WHERE
    c.ctid = ct.id;

SELECT 
    *
FROM
    person p,
    (SELECT 
        *
    FROM
        contact c, contacttype ct
    WHERE
        c.ctid = ct.id) cinfo
WHERE
    p.id = cinfo.pid;

SELECT 
    MAX(uses)
FROM
    (SELECT 
        ctid, COUNT(*) uses
    FROM
        contact c
    GROUP BY ctid) u;
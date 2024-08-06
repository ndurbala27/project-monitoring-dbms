SELECT 
    *
FROM
    person;

SELECT 
    *
FROM
    project;

SELECT 
    COUNT(*)
FROM
    person;

SELECT 
    COUNT(notes)
FROM
    person;

SELECT 
    COUNT(dob)
FROM
    person;

SELECT 
    COUNT(*)
FROM
    person
WHERE
    dob >= '1980-01-01';

SELECT 
    id, firstname, lastname, dob
FROM
    person
WHERE
    dob >= '1980-01-01';

SELECT 
    COUNT(dob)
FROM
    person
WHERE
    dob < '1980-01-01';

SELECT 
    id, firstname, lastname, dob
FROM
    person
WHERE
    dob < '1980-01-01';

CREATE TABLE IF NOT EXISTS hourstask (
    id INT(11) NOT NULL AUTO_INCREMENT,
    pid INT(11) NOT NULL,
    date_worked DATE NOT NULL,
    task_type CHAR(3) NOT NULL DEFAULT '010',
    hours_worked DECIMAL(6 , 2 ) DEFAULT 0,
    PRIMARY KEY (id),
    KEY fk_hourstask_person_idx (pid),
    CONSTRAINT fk_hourstask_person FOREIGN KEY (pid)
        REFERENCES person (id)
        ON DELETE CASCADE ON UPDATE CASCADE
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

INSERT INTO hourstask (pid, date_worked, task_type, hours_worked) VALUES (4,'2014-5-5','172',4.0);
INSERT INTO hourstask (pid, date_worked, task_type, hours_worked) VALUES (4,'2014-5-5','171',1.5);
INSERT INTO hourstask (pid, date_worked, task_type, hours_worked) VALUES (4,'2014-5-6','172',4);
INSERT INTO hourstask (pid, date_worked, task_type, hours_worked) VALUES (4,'2014-5-6','171',2.5);
INSERT INTO hourstask (pid, date_worked, task_type, hours_worked) VALUES (4,'2014-5-6','173',3.25);
INSERT INTO hourstask (pid, date_worked, task_type, hours_worked) VALUES (5,'2014-5-5','172',8);
INSERT INTO hourstask (pid, date_worked, task_type, hours_worked) VALUES (5,'2014-5-5','171',3.35);
INSERT INTO hourstask (pid, date_worked, task_type, hours_worked) VALUES (5,'2014-5-6','172',6);
INSERT INTO hourstask (pid, date_worked, task_type, hours_worked) VALUES (5,'2014-5-7','171',5);
INSERT INTO hourstask (pid, date_worked, task_type, hours_worked) VALUES (5,'2014-5-8','173',13.7);
INSERT INTO hourstask (pid, date_worked, task_type, hours_worked) VALUES (3,'2014-5-5','171',2.1);
INSERT INTO hourstask (pid, date_worked, task_type, hours_worked) VALUES (3,'2014-5-5','172',1.35);
INSERT INTO hourstask (pid, date_worked, task_type, hours_worked) VALUES (3,'2014-5-5','173',4.4);
INSERT INTO hourstask (pid, date_worked, task_type, hours_worked) VALUES (3,'2014-5-7','171',5);
INSERT INTO hourstask (pid, date_worked, task_type, hours_worked) VALUES (3,'2014-5-7','173',2.9);

SELECT 
    *
FROM
    hourstask;

SELECT 
    SUM(hours_worked)
FROM
    hourstask
WHERE
    pid = 5 AND date_worked = '2014-05-05';

SELECT 
    *
FROM
    hourstask
WHERE
    pid = 5 AND date_worked = '2014-05-05';

SELECT 
    SUM(hours_worked)
FROM
    hourstask
WHERE
    pid = 4;

SELECT 
    SUM(budget)
FROM
    project;

SELECT 
    MAX(budget)
FROM
    project;

SELECT 
    MIN(budget)
FROM
    project;

SELECT 
    AVG(budget)
FROM
    project;

SELECT 
    ROUND(AVG(budget), 2)
FROM
    project;

SELECT 
    *
FROM
    project
ORDER BY label ASC;

SELECT 
    MAX(label)
FROM
    project;

SELECT 
    MIN(label)
FROM
    project;

SELECT 
    MAX(dob)
FROM
    person;

SELECT 
    MIN(dob)
FROM
    person;

SELECT 
    MAX(hours_worked)
FROM
    hourstask;

SELECT 
    pid
FROM
    hourstask
WHERE
    hours_worked = (SELECT 
            MAX(hours_worked)
        FROM
            hourstask);

SELECT 
    *
FROM
    person
WHERE
    id = 5;

SELECT 
    AVG(hours_worked)
FROM
    hourstask;

SELECT 
    firstname, lastname, managerid
FROM
    person
WHERE
    LEFT(firstname, 1) = 'J' 
UNION SELECT 
    firstname, lastname, managerid
FROM
    person
WHERE
    dob > '1980-01-01';
    
SELECT 
    firstname, lastname, managerid
FROM
    person
WHERE
    LEFT(firstname, 1) = 'J' 
UNION ALL SELECT 
    firstname, lastname, managerid
FROM
    person
WHERE
    dob > '1980-01-01';

SELECT 
    firstname, lastname, managerid
FROM
    person
WHERE
    LEFT(firstname, 1) = 'J' 
UNION SELECT 
    firstname, lastname, managerid
FROM
    person
WHERE
    dob > '1980-01-01'
ORDER BY lastname ASC;

SELECT 
    *
FROM
    role;

SELECT 
    *
FROM
    contacttype;

SELECT 
    *
FROM
    role 
UNION SELECT 
    *
FROM
    contacttype;
    
SELECT 
    COUNT(*)
FROM
    project;

SELECT 
    COUNT(label)
FROM
    project;

SELECT 
    COUNT(label)
FROM
    project
WHERE
    budget < 1000;

SELECT 
    SUM(budget)
FROM
    project;

SELECT 
    AVG(budget)
FROM
    project;

SELECT 
    MIN(budget)
FROM
    project;

SELECT 
    AVG(LENGTH(label))
FROM
    role;

SELECT 
    label
FROM
    project 
UNION SELECT 
    label
FROM
    role;
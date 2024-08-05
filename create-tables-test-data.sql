CREATE TABLE IF NOT EXISTS person (
    id INT(11) NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    dob DATE DEFAULT NULL,
    managerid INT(11) DEFAULT NULL,
    notes TEXT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

INSERT INTO person (lastname, firstname, dob) VALUES ('Briggs', 'Joe', '1975-02-07');
INSERT INTO person (lastname, firstname, dob) VALUES ('Miller', 'Paul', '1980-08-20');
INSERT INTO person (lastname, firstname, dob) VALUES ('Palmer', 'Jenny', '1990-04-29');
INSERT INTO person (lastname, firstname, dob) VALUES ('James', 'Jenny', '1970-11-03');
INSERT INTO person (lastname, firstname, dob, managerid, notes) VALUES ('Walker', 'Rick', '1960-10-10', 0, 'Rick Walker is the CEO of web.com');
INSERT INTO person (lastname, firstname, dob, managerid, notes) VALUES ('Baker', 'Susan', 0,0, "RickWalker's assistant, no project involvement");

SELECT 
    *
FROM
    projmon.person;

CREATE TABLE IF NOT EXISTS contacttype (
    id INT(11) NOT NULL AUTO_INCREMENT,
    label VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

INSERT INTO contacttype (label) VALUES ('email');
INSERT INTO contacttype (label) VALUES ('phone');
INSERT INTO contacttype (label) VALUES ('address');
INSERT INTO contacttype (label) VALUES ('IM');

SELECT 
    *
FROM
    projmon.contacttype;

CREATE TABLE IF NOT EXISTS project (
    id INT(11) NOT NULL AUTO_INCREMENT,
    label VARCHAR(255) DEFAULT NULL,
    budget DOUBLE DEFAULT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

INSERT INTO project (label, budget) VALUES ('Website', '2000');
INSERT INTO project (label, budget) VALUES ('Facebook app', '999.95');
INSERT INTO project (label, budget) VALUES ('Google+', '250');

SELECT 
    *
FROM
    projmon.project;

CREATE TABLE IF NOT EXISTS role (
    id INT(11) NOT NULL AUTO_INCREMENT,
    label VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

INSERT INTO role (label) VALUES ('Product Manager');
INSERT INTO role (label) VALUES ('Project Manager');
INSERT INTO role (label) VALUES ('Developr');
INSERT INTO role (label) VALUES ('Tester');

SELECT 
    *
FROM
    projmon.role;

CREATE TABLE IF NOT EXISTS contact (
    pid INT(11) NOT NULL,
    ctid INT(11) NOT NULL,
    value TEXT NOT NULL,
    PRIMARY KEY (pid , ctid),
    KEY fk_contact_contacttype_idx (ctid),
    CONSTRAINT fk_contact_contacttype FOREIGN KEY (ctid)
        REFERENCES contacttype (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_contact_person FOREIGN KEY (pid)
        REFERENCES person (id)
        ON DELETE CASCADE ON UPDATE CASCADE
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

INSERT INTO contact (pid, ctid, value) VALUES ('1', '1', 'jbriggs@web.com');
INSERT INTO contact (pid, ctid, value) VALUES ('1', '2', '+1 800 121 2222');
INSERT INTO contact (pid, ctid, value) VALUES ('2', '1', 'gener@yah.co.uk');
INSERT INTO contact (pid, ctid, value) VALUES ('2', '2', '+44 7777 123 657');
INSERT INTO contact (pid, ctid, value) VALUES ('2', '3', '10 Wee Lane Newtown AX10 5BG UK');
INSERT INTO contact (pid, ctid, value) VALUES ('3', '1', 'jpalmer@web.com');
INSERT INTO contact (pid, ctid, value) VALUES ('3', '2', '+1 800 121 2255');
INSERT INTO contact (pid, ctid, value) VALUES ('4', '1', 'jjames@facebook.com');
INSERT INTO contact (pid, ctid, value) VALUES ('4', '2', '+49 89 3324 44 0');
INSERT INTO contact (pid, ctid, value) VALUES ('5', '1', 'jwalker@web.com');
INSERT INTO contact (pid, ctid, value) VALUES ('5', '2', '+1 800 121 2200');
INSERT INTO contact (pid, ctid, value) VALUES ('5', '3', 'Web.com 425 Rodeo Av San Francisco CA 94437');
INSERT INTO contact (pid, ctid, value) VALUES ('6', '1', 'sbaker@web.com');
INSERT INTO contact (pid, ctid, value) VALUES ('6', '2', '+1 800 121 2201');

SELECT 
    *
FROM
    projmon.contact;

CREATE TABLE IF NOT EXISTS projectperson (
    prid INT(11) NOT NULL,
    pid INT(11) NOT NULL,
    rid INT(11) NOT NULL,
    PRIMARY KEY (prid , pid , rid),
    KEY fk_projectperson_role_idx (rid),
    KEY fk_projectperson_person_idx (pid),
    CONSTRAINT fk_projectperson_person FOREIGN KEY (pid)
        REFERENCES person (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_projectperson_project FOREIGN KEY (prid)
        REFERENCES project (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_projectperson_role FOREIGN KEY (rid)
        REFERENCES role (id)
        ON DELETE CASCADE ON UPDATE CASCADE
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

INSERT INTO projectperson (prid, pid, rid) VALUES ('1', '1', '3');
INSERT INTO projectperson (prid, pid, rid) VALUES ('2', '2', '3');
INSERT INTO projectperson (prid, pid, rid) VALUES ('2', '2', '4');
INSERT INTO projectperson (prid, pid, rid) VALUES ('1', '3', '4');
INSERT INTO projectperson (prid, pid, rid) VALUES ('2', '4', '2');
INSERT INTO projectperson (prid, pid, rid) VALUES ('2', '4', '4');
INSERT INTO projectperson (prid, pid, rid) VALUES ('1', '5', '1');
INSERT INTO projectperson (prid, pid, rid) VALUES ('1', '5', '2');
INSERT INTO projectperson (prid, pid, rid) VALUES ('2', '5', '1');

SELECT 
    *
FROM
    projmon.projectperson;

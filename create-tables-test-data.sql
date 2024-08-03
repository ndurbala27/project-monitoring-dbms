CREATE TABLE IF NOT EXISTS person (
id int(11) not null auto_increment,
firstname varchar(255) not null,
lastname varchar(255) not null,
dob date default null,
managerid int(11) default null,
notes text,
created timestamp not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT charset=utf8;

insert into person (lastname, firstname, dob) values ('Briggs', 'Joe', '1975-02-07');
insert into person (lastname, firstname, dob) values ('Miller', 'Paul', '1980-08-20');
insert into person (lastname, firstname, dob) values ('Palmer', 'Jenny', '1990-04-29');
insert into person (lastname, firstname, dob) values ('James', 'Jenny', '1970-11-03');
insert into person (lastname, firstname, dob, managerid, notes) values ('Walker', 'Rick', '1960-10-10', 0, 'Rick Walker is the CEO of web.com');
insert into person (lastname, firstname, dob, managerid, notes) values ('Baker', 'Susan', 0,0, "RickWalker's assistant, no project involvement");

SELECT * FROM projmon.person;

CREATE TABLE IF NOT EXISTS contacttype(
id int(11) not null auto_increment,
label varchar(255) default null,
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT charset=utf8;

insert into contacttype (label) values ('email');
insert into contacttype (label) values ('phone');
insert into contacttype (label) values ('address');
insert into contacttype (label) values ('IM');

SELECT * FROM projmon.contacttype;

CREATE TABLE IF NOT EXISTS project(
id int(11) not null auto_increment,
label varchar(255) default null,
budget double default null,
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT charset=utf8;

insert into project (label, budget) values ('Website', '2000');
insert into project (label, budget) values ('Facebook app', '999.95');
insert into project (label, budget) values ('Google+', '250');

SELECT * FROM projmon.project;

CREATE TABLE IF NOT EXISTS role(
id int(11) not null auto_increment,
label varchar(255) default null,
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT charset=utf8;

insert into role (label) values ('Product Manager');
insert into role (label) values ('Project Manager');
insert into role (label) values ('Developr');
insert into role (label) values ('Tester');

select * from projmon.role;

CREATE TABLE IF NOT EXISTS contact(
pid int(11) not null,
ctid int(11) not null,
value text not null,
PRIMARY KEY (pid, ctid),
KEY fk_contact_contacttype_idx (ctid),
CONSTRAINT fk_contact_contacttype FOREIGN KEY (ctid) REFERENCES contacttype (id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_contact_person FOREIGN KEY (pid) REFERENCES person (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT charset=utf8;

insert into contact (pid, ctid, value) values ('1', '1', 'jbriggs@web.com');
insert into contact (pid, ctid, value) values ('1', '2', '+1 800 121 2222');
insert into contact (pid, ctid, value) values ('2', '1', 'gener@yah.co.uk');
insert into contact (pid, ctid, value) values ('2', '2', '+44 7777 123 657');
insert into contact (pid, ctid, value) values ('2', '3', '10 Wee Lane Newtown AX10 5BG UK');
insert into contact (pid, ctid, value) values ('3', '1', 'jpalmer@web.com');
insert into contact (pid, ctid, value) values ('3', '2', '+1 800 121 2255');
insert into contact (pid, ctid, value) values ('4', '1', 'jjames@facebook.com');
insert into contact (pid, ctid, value) values ('4', '2', '+49 89 3324 44 0');
insert into contact (pid, ctid, value) values ('5', '1', 'jwalker@web.com');
insert into contact (pid, ctid, value) values ('5', '2', '+1 800 121 2200');
insert into contact (pid, ctid, value) values ('5', '3', 'Web.com 425 Rodeo Av San Francisco CA 94437');
insert into contact (pid, ctid, value) values ('6', '1', 'sbaker@web.com');
insert into contact (pid, ctid, value) values ('6', '2', '+1 800 121 2201');

select * from projmon.contact;

CREATE TABLE IF NOT EXISTS projectperson(
prid int(11) not null,
pid int(11) not null,
rid int(11) not null,
PRIMARY KEY (prid, pid, rid),
KEY fk_projectperson_role_idx (rid),
KEY fk_projectperson_person_idx (pid),
CONSTRAINT fk_projectperson_person FOREIGN KEY (pid) REFERENCES person (id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_projectperson_project FOREIGN KEY (prid) REFERENCES project (id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_projectperson_role FOREIGN KEY (rid) REFERENCES role (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT charset=utf8;

insert into projectperson (prid, pid, rid) values ('1', '1', '3');
insert into projectperson (prid, pid, rid) values ('2', '2', '3');
insert into projectperson (prid, pid, rid) values ('2', '2', '4');
insert into projectperson (prid, pid, rid) values ('1', '3', '4');
insert into projectperson (prid, pid, rid) values ('2', '4', '2');
insert into projectperson (prid, pid, rid) values ('2', '4', '4');
insert into projectperson (prid, pid, rid) values ('1', '5', '1');
insert into projectperson (prid, pid, rid) values ('1', '5', '2');
insert into projectperson (prid, pid, rid) values ('2', '5', '1');

select * from projmon.projectperson;
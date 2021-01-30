CREATE TABLE DEPARTMENT(DNO VARCHAR(20) PRIMARY KEY,DNAME
VARCHAR(20),MGRSTARTDATE DATE);

CREATE TABLE EMPLOYEE (SSN VARCHAR(20) PRIMARY KEY,FNAME VARCHAR(20),
LNAME VARCHAR(20),ADDRESS VARCHAR(20),SEX CHAR(1),SALARY INTEGER,
SUPERSSN VARCHAR(20),DNO VARCHAR(20),
foreign key(SUPERSSN) REFERENCES EMPLOYEE(SSN),
foreign key(DNO) REFERENCES DEPARTMENT (DNO));

ALTER TABLE DEPARTMENT ADD MGRSSN REFERENCES EMPLOYEE(SSN);

CREATE TABLE DLOCATION (DLOC VARCHAR(20),DNO VARCHAR(20),
foreign key(DNO) REFERENCES DEPARTMENT(DNO),
PRIMARY KEY (DNO, DLOC));

CREATE TABLE PROJECT (PNO INTEGER PRIMARY KEY,PNAME
VARCHAR(20), PLOCATION VARCHAR(20),DNO VARCHAR(20),
foreign key(DNO) REFERENCES DEPARTMENT(DNO));

CREATE TABLE WORKS_ON (SSN VARCHAR(20),PNO INTEGER,HOURS INTEGER,
foreign key(SSN) REFERENCES EMPLOYEE(SSN),
foreign key(PNO) REFERENCES PROJECT(PNO),
PRIMARY KEY (SSN, PNO));

/*Consider the schema for Company Database:
EMPLOYEE(SSN, Name, Address, Sex, Salary, SuperSSN, DNo)
DEPARTMENT(DNo, DName, MgrSSN, MgrStartDate) 
DLOCA TION(DNo,DLoc)
PROJECT(PNo, PName, PLocation, DNo)
WORKS_ON(SSN, PNo, Hours)
Write SQL queries to
1. Make a list of all project numbers for projects that involve an employee whose last name is ‘Scott’, 
either as a worker or as a manager of the department that controls the project.

2. Show the resulting salaries if every employee working on the ‘IoT’ project is given a 10 percent raise.

3. Find the sum of the salaries of all employees of the ‘Accounts’ department, as well as the maximum salary,
the minimum salary, and the average salary in this department

4. Retrieve the name of each employee who works on all the projects 
controlledby department number 5 (use NOT EXISTS operator).

5. For each department that has more than five employees, 
retrieve the department number and the number of its employees
who are making more than Rs. 6,00,000.*/



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

/*insert values*/
             

/*create table*/
CREATE TABLE PUBLISHER(NAME VARCHAR(20) PRIMARY KEY, PHONE VARCHAR(10), ADDRESS VARCHAR(20));

CREATE TABLE BOOK (BOOK_ID INTEGER PRIMARY KEY, TITLE VARCHAR(20), PUB_YEAR VARCHAR(20),PUBLISHER_NAME VARCHAR(25),
 FOREIGN KEY (PUBLISHER_NAME)  REFERENCES PUBLISHER(NAME) ON DELETE CASCADE);
 
CREATE TABLE BOOK_AUTHORS (AUTHOR_NAME VARCHAR (20),BOOK_ID INTEGER,
 FOREIGN KEY (BOOK_ID) REFERENCES BOOK (BOOK_ID) ON DELETE CASCADE, PRIMARY KEY (BOOK_ID, AUTHOR_NAME));
 
 CREATE TABLE LIBRARY_BRANCH (BRANCH_ID INTEGER PRIMARY KEY, BRANCH_NAME VARCHAR (50), ADDRESS VARCHAR (50));
 
 CREATE TABLE BOOK_COPIES (NO_OF_COPIES INTEGER,BOOK_ID INTEGER,FOREIGN KEY (BOOK_ID) REFERENCES BOOK (BOOK_ID) 
 ON DELETE CASCADE,BRANCH_ID INTEGER,FOREIGN KEY (BRANCH_ID) REFERENCES LIBRARY_BRANCH (BRANCH_ID) ON DELETE CASCADE,
 PRIMARY KEY (BOOK_ID, BRANCH_ID));
 
 
 CREATE TABLE BOOK_LENDING (DATE_OUT DATE, DUE_DATE DATE, BOOK_ID INTEGER,
 FOREIGN KEY (BOOK_ID) REFERENCES BOOK (BOOK_ID) ON DELETE CASCADE,BRANCH_ID INTEGER,
 FOREIGN KEY (BRANCH_ID) REFERENCES LIBRARY_BRANCH (BRANCH_ID) ON DELETE CASCADE, 
 CARD_NO INT, PRIMARY KEY (BOOK_ID, BRANCH_ID,CARD_NO));
 
 /*TABLE DESCRIPTION*/
 DESC PUBLISHER;
 DESC BOOK;
 DESC BOOK_AUTHORS;
 DESC LIBRARY_BRANCH;
 DESC BOOK_COPIES;
 DESC BOOK_LENDING;
 
 
 /*INSERTING VALUES TO THE TABLE*/
INSERT INTO PUBLISHER VALUES ('MCGRAW-HILL','9989076587','BANGALORE');
INSERT INTO PUBLISHER VALUES ('PEARSON','9889076565','NEWDELHI');
INSERT INTO PUBLISHER VALUES ('RANDOM HOUSE','7455679345','HYDERABAD');
INSERT INTO PUBLISHER VALUES ('HACHETTE LIVRE','8970862340','CHENNAI');
INSERT INTO PUBLISHER VALUES ('GRUPO PLANETA','7756120238','BANGALORE');
 
INSERT INTO BOOK VALUES (1,'DBMS','JAN-2017','MCGRAW-HILL');
INSERT INTO BOOK VALUES (2,'ADBMS','JUN-2016','MCGRAW-HILL');
INSERT INTO BOOK VALUES (3,'CN','SEP-2016','PEARSON');
INSERT INTO BOOK VALUES (4,'CG','SEP-2015','GRUPO PLANETA');
INSERT INTO BOOK VALUES (5,'OS','MAY-2016','PEARSON');
 
INSERT INTO BOOK_AUTHORS VALUES ('NAVATHE', 1);
INSERT INTO BOOK_AUTHORS VALUES ('NAVATHE', 2); 
INSERT INTO BOOK_AUTHORS VALUES ('TANENBAUM', 3);
INSERT INTO BOOK_AUTHORS VALUES ('EDWARD ANGEL', 4); 
INSERT INTO BOOK_AUTHORS VALUES ('GALVIN', 5);

INSERT INTO LIBRARY_BRANCH VALUES (10,'RR_NAGAR','BANGALORE'); 
INSERT INTO LIBRARY_BRANCH VALUES (11,'RNSIT','BANGALORE');
INSERT INTO LIBRARY_BRANCH VALUES (12,'RAJAJI_NAGAR', 'BANGALORE');
INSERT INTO LIBRARY_BRANCH VALUES (13,'NITTE','MANGALORE');
INSERT INTO LIBRARY_BRANCH VALUES (14,'MANIPAL','UDUPI'); 

INSERT INTO BOOK_COPIES VALUES (10, 1, 10);
INSERT INTO BOOK_COPIES VALUES (5, 1,11);
INSERT INTO BOOK_COPIES VALUES (2, 2,12);
INSERT INTO BOOK_COPIES VALUES(5, 2,13);
INSERT INTO BOOK_COPIES VALUES (7, 3,14);
INSERT INTO BOOK_COPIES VALUES (1, 5,10);
INSERT INTO BOOK_COPIES VALUES (3, 4,11); 

INSERT INTO BOOK_LENDING VALUES ('2017-01-01','2017-01-01', 1, 10, 101);
INSERT INTO BOOK_LENDING VALUES ('2017-01-11','2017-03-11', 3, 14, 101);
INSERT INTO BOOK_LENDING VALUES ('2017-02-21','2017-04-21', 2, 13, 101);
INSERT INTO BOOK_LENDING VALUES ('2017-03-15','2017-07-15', 4, 11, 101);
INSERT INTO BOOK_LENDING VALUES ('2017-04-12','2017-05-12', 1, 11, 104); 

/*DISPLAYING THE TABLES*/
SELECT * FROM PUBLISHER;
SELECT * FROM BOOK;
SELECT * FROM BOOK_AUTHORS;

/*QUERIES*/
/*1)
1. Retrieve details of all books in the library – id, title,
 name of publisher, authors, number of copies in each branch, etc.*/
SELECT B.BOOK_ID, B.TITLE, B.PUBLISHER_NAME,
A.AUTHOR_NAME,C.NO_OF_COPIES,L.BRANCH_ID
FROM BOOK B, BOOK_AUTHORS A, BOOK_COPIES C, LIBRARY_BRANCH L
WHERE B.BOOK_ID=A.BOOK_ID
AND B.BOOK_ID=C.BOOK_ID
AND L.BRANCH_ID=C.BRANCH_ID;

SELECT CARD_NO,COUNT(*)FROM
BOOK_LENDING 
WHERE DATE_OUT BETWEEN '2017-01-01' AND '2017-07-01'
GROUP BY CARD_NO
HAVING COUNT(*)>3;

/*3)Delete a book in BOOK table. Update the contents of other tables to reflect this data manipulation operation.*/
DELETE FROM BOOK
WHERE BOOK_ID=3;
SELECT * FROM BOOK;

/* 4. Partition the BOOK table based on year of publication. Demonstrate its working with a simple query.*/
CREATE VIEW V_PUBLICATION AS
SELECT PUB_YEAR
FROM BOOK;
Select * from V_PUBLICATION ;

/*Create a view of all books and its number of copies that are currently available in the Library.*/
CREATE VIEW V_BOOKS AS
SELECT B.BOOK_ID, B.TITLE, C.NO_OF_COPIES
FROM BOOK B, BOOK_COPIES C, LIBRARY_BRANCH L
WHERE B.BOOK_ID=C.BOOK_ID 
AND C.BRANCH_ID=L.BRANCH_ID;
SELECT * FROM V_BOOKS;


 
                                                                                                      
                                                                                                      

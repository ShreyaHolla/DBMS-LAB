create table student(usn varchar(20) primary key,sname varchar(20),address varchar(20),phone varchar(10),gender char(1));

create table semsec(ssid varchar(20) primary key,sem integer,sec char(1));

create table class(usn varchar(20) primary key,ssid varchar(20),
foreign key(usn) references student(usn),
foreign key(ssid) references semsec(ssid));

create table subject(subcode varchar(20) primary key,title varchar(20),sem integer,credits integer);

create table iamarks(usn varchar(20),subcode varchar(200),ssid varchar(20),test1 integer,test2 integer,test3 integer,finalia integer,
foreign key(usn) references student(usn),
foreign key(ssid) references semsec(ssid),
foreign key(subcode) references subject(subcode),
primary key(usn,subcode,ssid));

            
/*INSERT INTO STUDENT*/
insert into student values('1VA14CS001','SHREYA','BNG','7806734678','F');
insert into student values('1VA14CS002','MANOJ','BNG','9421250159','M');
insert into student values('1VA14CS003','PALLAVI','BNG','9422634639','F');

insert into student values('1VA15CS101','SOUNDARYA','BNG','7899142753','F');
insert into student values('1VA15CS102','NITISH','BNG','8976543210','M');
insert into student values('1VA15CS103','SAHANA','BNG','9194236782','F');

insert into student values('1VA16CS001','SURESH','BNG','9294236783','M');
insert into student values('1VA16CS002','RAJATH','BNG','7806734679','M');
insert into student values('1VA16CS003','NATASHA','BNG','7806734610','F');
            
/*INSERT INTO SEMSEC*/
INSERT INTO SEMSEC VALUES('CSE8A',8,'A');
INSERT INTO SEMSEC VALUES('CSE8B',8,'B');
INSERT INTO SEMSEC VALUES('CSE8C',8,'C');

INSERT INTO SEMSEC VALUES('CSE6A',6,'A');
INSERT INTO SEMSEC VALUES('CSE6B',6,'B');
INSERT INTO SEMSEC VALUES('CSE6C',6,'C');

INSERT INTO SEMSEC VALUES('CSE4A',4,'A');
INSERT INTO SEMSEC VALUES('CSE4B',4,'B');
INSERT INTO SEMSEC VALUES('CSE4C',4,'C');
            
/*INSERT INTO CLASS*/
INSERT INTO CLASS VALUES('1VA14CS001','CSE8A');
INSERT INTO CLASS VALUES('1VA14CS002','CSE8B');
INSERT INTO CLASS VALUES('1VA14CS003','CSE8C');

INSERT INTO CLASS VALUES('1VA15CS101','CSE6A');
INSERT INTO CLASS VALUES('1VA15CS102','CSE6B');
INSERT INTO CLASS VALUES('1VA15CS103','CSE6C');

INSERT INTO CLASS VALUES('1VA16CS001','CSE4A');
INSERT INTO CLASS VALUES('1VA16CS002','CSE4B');
INSERT INTO CLASS VALUES('1VA16CS003','CSE4C');            
        
 /*INSERT INTO SUBJECT*/
 INSERT INTO SUBJECT VALUES('14CS81','ML',8,5);          
INSERT INTO SUBJECT VALUES('14CS82','CNS',8,4);   
INSERT INTO SUBJECT VALUES('14CS83','OS',8,3);   

INSERT INTO SUBJECT VALUES('15CS61','DBMS',6,5);          
INSERT INTO SUBJECT VALUES('15CS62','ATC',6,4);   
INSERT INTO SUBJECT VALUES('15CS63','PYT',6,3);   

INSERT INTO SUBJECT VALUES('16CS41','JAVA',4,5);          
INSERT INTO SUBJECT VALUES('16CS42','DMS',4,4);   
INSERT INTO SUBJECT VALUES('16CS43','DS',4,3);   
            
/*INSERT INTO IAMARKS*/
INSERT INTO IAMARKS (USN,SUBCODE,SSID,TEST1,TEST2,TEST3) VALUES('1VA15CS101','15CS61','CSE6A',15,16,17);
INSERT INTO IAMARKS (USN,SUBCODE,SSID,TEST1,TEST2,TEST3) VALUES('1VA15CS101','15CS62','CSE6A',18,19,20);
INSERT INTO IAMARKS (USN,SUBCODE,SSID,TEST1,TEST2,TEST3) VALUES('1VA15CS101','15CS63','CSE6A',19,19,20);
            
 select * from student;
            
USN	SNAME	ADDRESS	PHONE	GENDER
1VA14CS001	SHREYA	BNG	7806734678	F
1VA14CS002	MANOJ	BNG	9421250159	M
1VA14CS003	PALLAVI	BNG	9422634639	F
1VA15CS101	SOUNDARYA	BNG	7899142753	F
1VA15CS102	NITISH	BNG	8976543210	M
1VA15CS103	SAHANA	BNG	9194236782	F
1VA16CS001	SURESH	BNG	9294236783	M
1VA16CS002	RAJATH	BNG	7806734679	M
1VA16CS003	NATASHA	BNG	7806734610	F
 
            
select * from semsec;

SSID	SEM	SEC
CSE8A	8	A
CSE8B	8	B
CSE8C	8	C
CSE6A	6	A
CSE6B	6	B
CSE6C	6	C
CSE4A	4	A
CSE4B	4	B
CSE4C	4	C           

            
 select * from class;
            
  

USN	SSID
1VA14CS001	CSE8A
1VA14CS002	CSE8B
1VA14CS003	CSE8C
1VA15CS101	CSE6A
1VA15CS102	CSE6B
1VA15CS103	CSE6C
1VA16CS001	CSE4A
1VA16CS002	CSE4B
1VA16CS003	CSE4C          
 
 select * from subject;
            

SUBCODE	TITLE	SEM	CREDITS
14CS81	ML	8	5
14CS82	CNS	8	4
14CS83	OS	8	3
15CS61	DBMS	6	5
15CS62	ATC	6	4
15CS63	PYT	6	3
16CS41	JAVA	4	5
16CS42	DMS	4	4
16CS43	DS	4	3
 
            
select * from iamarks;
            

USN	SUBCODE	SSID	TEST1	TEST2	TEST3	FINALIA
1VA15CS101	15CS61	CSE6A	15	16	17	 - 
1VA15CS101	15CS62	CSE6A	18	19	20	 - 
1VA15CS101	15CS63	CSE6A	19	19	20	 - 

            
/*QUERIES*/
/*1) List all the student details studying in fourth semester ‘C’ section. */
select s.*,ss.sem,ss.sec
from student s, semsec ss, class c
where s.usn=c.usn
and ss.ssid=c.ssid
and ss.sem=4
and ss.sec='C';
            


USN	SNAME	ADDRESS	PHONE	GENDER	SEM	SEC
1VA16CS003	NATASHA	BNG	7806734610	F	4	C

/*2) Compute the total number of male and female students in each semester and in each section.*/
select ss.sem,ss.sec,s.gender,count(s.gender) as count
from student s,semsec ss,class c
where s.usn=c.usn
and ss.ssid=c.ssid
group by ss.sem,ss.sec,s.gender
order by sem;
            

SEM	SEC	GENDER	COUNT
4	A	M	1
4	B	M	1
4	C	F	1
6	A	F	1
6	B	M	1
6	C	F	1
8	A	F	1
8	B	M	1
8	C	F	1

/*3) Create a view of Test1 marks of student USN ‘1VA15CS101’ in all Courses.*/
create view test_marks as
select subcode,test1 as marks
from iamarks
where usn='1VA15CS101';

SELECT * FROM TEST_MARKS;
            
SUBCODE	MARKS
15CS61	15
15CS62	18
15CS63	19

/*4) Calculate the FinalIA (average of best two test marks) and update the corresponding table for all students.*/
            
 UPDATE IAMARKS
SET FINALIA=case
when(test1<=test2 and test1<=test3) then ceil((test2+test3)/2)
when(test2<=test1 and test2<=test3) then ceil((test1+test3)/2)
else ceil((test1+test2)/2)
end;
                                                                                                                     
 
select * from iamarks;
                        
                                                                                                                     
USN	SUBCODE	SSID	TEST1	TEST2	TEST3	FINALIA
1VA15CS101	15CS61	CSE6A	15	16	17	17
1VA15CS101	15CS62	CSE6A	18	19	20	20
1VA15CS101	15CS63	CSE6A	19	19	20	20                                                                                                                     

  /*5) Categorize students based on the following criterion: 
 If FinalIA = 17 to 20 then CAT = ‘Outstanding’ 
 If FinalIA = 12 to 16 then CAT = ‘Average’
 If FinalIA< 12 then CAT = ‘Weak’
Give these details only for 8/6th semester A, B, and C section students.*/            
SELECT S.USN,S.SNAME,S.ADDRESS,S.PHONE,S.GENDER,IA.FINALIA,
(CASE
WHEN IA.FINALIA BETWEEN 17 AND 20 THEN 'OUTSTANDING'
WHEN IA.FINALIA BETWEEN 12 AND 16 THEN 'AVERAGE'
ELSE 'WEAK'
END) AS CAT
FROM STUDENT S, SEMSEC SS, IAMARKS IA, SUBJECT SUB
WHERE S.USN = IA.USN AND
SS.SSID = IA.SSID AND
SUB.SUBCODE = IA.SUBCODE AND
SUB.SEM = 6;            

                                                                                                                     

USN	SNAME	ADDRESS	PHONE	GENDER	FINALIA	CAT
1VA15CS101	SOUNDARYA	BNG	7899142753	F	17	OUTSTANDING
1VA15CS101	SOUNDARYA	BNG	7899142753	F	20	OUTSTANDING
1VA15CS101	SOUNDARYA	BNG	7899142753	F	20	OUTSTANDING

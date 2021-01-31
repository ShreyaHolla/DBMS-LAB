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
            
            

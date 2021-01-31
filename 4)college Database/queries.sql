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
primary key(usn,ssid));

create table salesman(s_id varchar(20) primary key,s_name varchar(20),s_city varchar(20),commission varchar(20));

create table customer(c_id varchar(20) primary key,c_name varchar(20),c_city varchar(20),grade integer, s_id varchar(20),
foreign key(s_id) references salesman(s_id));

create table orders(or_no varchar(20) primary key,pr_amt varchar(20),or_date date,c_id varchar(20),s_id varchar(20),
foreign key(c_id) references customer(c_id),
foreign key(s_id) references salesman(s_id));

insert into salesman values(1,'John','Bng','20%');
insert into salesman values(2,'Sam','Bng','25%');
insert into salesman values(3,'Terry','Goa','15%');
insert into salesman values(4,'Ross','Delhi','30%');
insert into salesman values(5,'Joey','Kerala','15%');

insert into customer values(10,'Rachel','Bng',100,1);
insert into customer values(11,'Monica','Mumbai',200,1);
insert into customer values(12,'Shreya','Chennai',300,2);
insert into customer values(13,'Kavya','Bng',400,2);
insert into customer values(14,'Natasha','Bng',500,3);
                                      
insert into orders values(20,1000,'01-Jan-21',10,1);
insert into orders values(21,2000,'02-Feb-21',10,2);
insert into orders values(22,500,'15-Mar-21',12,2);
insert into orders values(23,750,'15-Apr-21',13,3);
insert into orders values(24,3000,'17-May-21',14,2);                                      

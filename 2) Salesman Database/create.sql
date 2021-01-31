create table salesman(s_id varchar(20) primary key,s_name varchar(20),s_city varchar(20),commission varchar(20));

create table customer(c_id varchar(20) primary key,c_name varchar(20),c_city varchar(20),grade integer, s_id varchar(20),
foreign key(s_id) references salesman(s_id));

create table orders(or_no varchar(20) primary key,pr_amt varchar(20),or_date date,c_id varchar(20),s_id varchar(20),
foreign key(c_id) references customer(c_id),
foreign key(s_id) references salesman(s_id));

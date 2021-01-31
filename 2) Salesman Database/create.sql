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

                                      
 /*1) Count the customers with grades above Bangalore’s average.*/
 SELECT GRADE, COUNT (C_ID) 
FROM CUSTOMER
GROUP BY GRADE
HAVING GRADE > (SELECT AVG(GRADE) 
                FROM CUSTOMER
                WHERE C_CITY='Bng');
                                      
 GRADE	COUNT(C_ID)
400    	1
500	    1                                     
/*2)Find the name and numbers of all salesman who had more than one customer.*/
 select s_id,s_name
from salesman s
where 1<(select count(*)
         from customer c
         where s.s_id=c.s_id);
 S_ID	S_NAME
1	    John
2   	Sam                                     

 /*3)List all the salesman and indicate those who have and don’t have customers in their cities (Use UNION operation.)*/
                                      
SELECT s.s_id, s.s_name,c.c_name,s.commission 
FROM salesman s, customer c
WHERE s.s_city=c.c_city
UNION
SELECT s_id, s_name, 'NO MATCH', commission
FROM salesman
WHERE NOT s_city = ANY (SELECT c_city
                      FROM customer) 
ORDER BY commission;  
                                      


S_ID	S_NAME	   C_NAME	        COMMISSION
3 	 Terry	     NO MATCH	   15%
5	   Joey	       NO MATCH	   15%
1	   John	       Kavya	     20%
1	   John	       Natasha	   20%
1	   John	       Rachel	     20%
2	   Sam	       Kavya	     25%
2 	 Sam	       Natasha	   25%
2 	 Sam	       Rachel	     25%
4	   Ross	       NO MATCH 	 30%                                      
/*4)Create a view that finds the salesman who has the customer with the highest order of a day.*/
                                      
                                      
/*5)Demonstrate the DELETE operation by removing salesman with id 1000. All his orders must also be deleted.*/                                     

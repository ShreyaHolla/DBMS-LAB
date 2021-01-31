create table actor(act_id varchar(20) primary key,act_name varchar(20),act_gender char(1));

create table director(dir_id varchar(20) primary key,dir_name varchar(20),dir_phone varchar(10));

create table movies(mov_id varchar(20) primary key,mov_title varchar(20),mov_year integer,mov_lang varchar(20),dir_id varchar(20),
foreign key(dir_id) references director(dir_id));

create table movie_cast(act_id varchar(20),mov_id varchar(20),role varchar(20),
primary key(act_id,mov_id),
foreign key(act_id) references actor(act_id),
foreign key(mov_id) references movies(mov_id));

create table rating(mov_id varchar(20) primary key,rev_stars integer,
foreign key(mov_id) references movies(mov_id));

 
insert into actor values(1,'Anushka','F');
insert into actor values(2,'Prabhas','M');
insert into actor values(3,'Salman','M');
insert into actor values(4,'Gregory','M');
                                      
insert into director values(10,'Rajamouli','9421250159');
insert into director values(11,'Arbaz Khan','7899124753');
insert into director values(12,'Steven Spielberg','9422634639');
insert into director values(13,'Hitchcock','5672145670');
                                      
insert into movies values(100,'Bahuballi-1',2015,'Telgu',10);
insert into movies values(101,'Bahuballi-2',2017,'Telgu',10);
insert into movies values(102,'Bharat',2014,'Hindi',12);
insert into movies values(103,'Spellbound',1990,'English',13);
                                      
insert into movie_cast values(1,100,'Heroine');
insert into movie_cast values(1,101,'Heroine');
insert into movie_cast values(2,100,'Hero');
insert into movie_cast values(2,101,'Hero');
insert into movie_cast values(3,102,'Hero');
insert into movie_cast values(4,103,'Guest');

insert into rating values(100,4);
insert into rating values(101,3);
insert into rating values(102,0);
insert into rating values(103,5);

/*queries*/
/* 1)List the titles of all movies directed by ‘Hitchcock’.*/
 select m.mov_title
from movies m,director d
where m.dir_id=d.dir_id
and d.dir_name='Hitchcock';
                                      


MOV_TITLE
Spellbound
                                      
/*2)Find the movie names where one or more actors acted in two or more movies.*/
 

select mov_title
from movies m,movie_cast c
where m.mov_id=c.mov_id
and act_id in (select act_id
               from movie_cast
               group by act_id
               having count(act_id)>1)
group by mov_title
having count(*)>1;  
                                      


MOV_TITLE
Bahuballi-1
Bahuballi-2
                                      
/*3)List all actors who acted in a movie before 2000 and also in a movie after 2015 (use JOIN operation).*/
 SELECT ACT_NAME
FROM ACTOR A
JOIN MOVIE_CAST C ON A.ACT_ID=C.ACT_ID
JOIN MOVIES M ON C.MOV_ID=M.MOV_ID
WHERE M.MOV_YEAR NOT BETWEEN 2000 AND 2015;

ACT_NAME
Anushka
Prabhas
Gregory                                      
/*4)Find the title of movies and number of stars for each movie that has at least one rating and find
the highest number of stars that movie received. Sort the result by movie title.*/
SELECT MOV_TITLE, MAX (REV_STARS)
FROM MOVIES
INNER JOIN RATING USING (MOV_ID)
GROUP BY MOV_TITLE
HAVING MAX (REV_STARS)>0
ORDER BY MOV_TITLE;

MOV_TITLE	MAX(REV_STARS)
Bahuballi-1	4
Bahuballi-2	3
Spellbound	5                                      
/*5)Update rating of all movies directed by ‘Steven Spielberg’ to 5.*/                                      
update rating
set rev_stars=5
where mov_id in (select m.mov_id
                 from movies m,director d
                 where m.dir_id=d.dir_id
                 and d.dir_name='Steven Spielberg');
                                      
select * from rating;



MOV_ID	REV_STARS
100	   4
101	   3
102	   5
103	   5                                      

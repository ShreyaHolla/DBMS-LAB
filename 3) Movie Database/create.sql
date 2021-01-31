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
insert into director values(12,'Farah Khan','9422634639');
insert into director values(13,'Hitchcock','5672145670');
                                      
insert into movies values(100,'Bahuballi-1',2015,'Telgu',10);
insert into movies values(101,'Bahuballi-2',2017,'Telgu',10);
insert into movies values(102,'Bharat',2019,'Hindi',11);
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
                                      

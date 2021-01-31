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

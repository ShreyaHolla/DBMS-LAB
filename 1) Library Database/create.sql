create table publisher(name varchar(20) primary key,address varchar(20),phone varchar(10));

create table book(book_id varchar(20) primary key, title varchar(20), publisher_name varchar(20),pub_year integer,
foreign key(publisher_name) references publisher(name) on delete cascade);

create table book_authors(book_id varchar(20), author_name varchar(20), 
primary key(book_id,author_name),
foreign key(book_id) references book(book_id) on delete cascade);

create table library_branch(branch_id varchar(20) primary key,branch_name varchar(20),address varchar(20));

create table book_lending(book_id varchar(20),branch_id varchar(20),card_no varchar(20),date_out date,due_date date,
primary key(book_id,branch_id,card_no),
foreign key(book_id) references book(book_id) on delete cascade,
foreign key(branch_id) references library_branch(branch_id) on delete cascade);

create table book_copies(book_id varchar(20),branch_id varchar(20),no_of_copies integer,
primary key(book_id,branch_id),
foreign key (book_id) references book(book_id) on delete cascade,
foreign key(branch_id) references library_branch(branch_id) on delete cascade);

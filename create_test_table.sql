create database if not exists communication;
use communication;

create table if not exists tbl_customers(
	id int primary key not null auto_increment,
    username varchar(255) not null,
	password varchar(255) not null,
    email varchar(255) not null
);

insert into tbl_customers(username, password, email)values("Jhon", "Jhon", "Jhon@gmail.com");

insert into tbl_customers(username, password, email)values("Sara", "Sara", "Sara@gmail.com");

insert into tbl_customers(username, password, email)values("Paul", "Paul", "Paul@gmail.com");

insert into tbl_customers(username, password, email)values("David", "David", "David@gmail.com");

select * from tbl_customers;



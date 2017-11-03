

--- create database and set previledge to root account
create database simpleweb;
use simpleweb;
grant all privileges on simpleweb.* to root@localhost ;


-- Create table

create table USER_ACCOUNT
(
USER_CODE INT not null AUTO_INCREMENT,
USER_NAME VARCHAR(30) not null,
EMAIL_ADDRESS VARCHAR(30) not null,
NICKNAME VARCHAR(30) not null,
GENDER    VARCHAR(1) not null,
PASSWORD  VARCHAR(30) not null,
ANSWER VARCHAR(30) not null,
primary key (USER_CODE)
);
 

create table PRODUCT
(
CODE  VARCHAR(20) not null,
NAME  VARCHAR(128) not null,
PRICE FLOAT not null,
primary key (CODE)
);
 
-- Insert data: ---------------------------------------------------------------
 
insert into user_account (USER_NAME, EMAIL_ADDRESS, NICKNAME, GENDER, PASSWORD, ANSWER)
values ('ChristianoRonaldo', 'realMadrid@gmail.com', 'KingGoddo', 'M', 'RealMadrid1!', 'RealMadrid');
 
insert into user_account (USER_NAME, EMAIL_ADDRESS, NICKNAME, GENDER, PASSWORD, ANSWER)
values ('LionelMessi', 'barcelona@gmail.com', 'LittleGiant', 'M', 'Barcelona2@', 'Barcelona');
 
insert into product (CODE, NAME, PRICE)
values ('P001', 'Java Core', 100);
 q\
insert into product (CODE, NAME, PRICE)
values ('P002', 'C# Core', 90);
select * from product;
select * from user_account;

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


-- 게시물 번호, 작성자 ID, 작성자 닉네임, 제목, 내용, 날짜, 게시물 공개여부

create table POST_BOARD
(
post_num int not null AUTO_INCREMENT primary key,
post_id varchar(30),
post_nickname varchar(30),
post_subject varchar(200),
post_content varchar(5000),
post_date DATETIME,
post_visible int not null
);
 

create table PRODUCT
(
CODE  VARCHAR(20) not null,
NAME  VARCHAR(128) not null,
PRICE FLOAT not null,
primary key (CODE)
);


-- Insert data: ---------------------------------------------------------------

INSERT INTO POST_BOARD(post_id, post_nickname, post_subject, post_content, post_date, post_visible)
VALUES ('hanzo', 'hanzo', 'textSub', 'textCont', sysdate(), 1); 

INSERT INTO POST_BOARD(post_id, post_nickname, post_subject, post_content, post_date, post_visible)
VALUES ('genji', 'genji', 'textSub', 'textCont', sysdate(), 0); 


insert into user_account (USER_NAME, EMAIL_ADDRESS, NICKNAME, GENDER, PASSWORD, ANSWER)
values ('ChristianoRonaldo', 'realMadrid@gmail.com', 'KingGoddo', 'M', 'RealMadrid1!', 'RealMadrid');

insert into user_account (USER_NAME, EMAIL_ADDRESS, NICKNAME, GENDER, PASSWORD, ANSWER)
values ('LionelMessi', 'barcelona@gmail.com', 'LittleGiant', 'M', 'Barcelona2@', 'Barcelona');
 
insert into product (CODE, NAME, PRICE)
values ('P001', 'Java Core', 100);

insert into product (CODE, NAME, PRICE)
values ('P002', 'C# Core', 90);
select * from product;
select * from user_account;
--- create database and set previledge to root account

create database simpleweb;
use simpleweb;
grant all privileges on simpleweb.* to root@localhost ;



-- Create table

create table POST_COMMENT
(
	COMMENT_ID int not null auto_increment,
	USER_NAME VARCHAR(30) not null,
	COMMENT VARCHAR(30) not null,
	post_num int not null,
	foreign key (post_num) references POST_BOARD(post_num),
	primary key (COMMENT_ID)
);

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


-- 寃뚯떆臾� 踰덊샇, �옉�꽦�옄 ID, �옉�꽦�옄 �땳�꽕�엫, �젣紐�, �궡�슜, �궇吏�, 寃뚯떆臾� 怨듦컻�뿬遺�

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
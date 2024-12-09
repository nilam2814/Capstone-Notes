create database sqlassignment1;
use sqlassignment1;
#1)
create table Member1(
member_id int,
member_name varchar(30),
member_address varchar(50),
acc_open_date date,
membership_type varchar(20),
fees_paid int,
max_books_allowed int,
penalty_amount int
);

create table books(
book_no int,
book_name varchar(30),
author_name varchar(30),
cost int,
category char(10)
);

create table issue(
lib_issue_id int,
book_no int,
member_id int,
issue_date date,
return_date date
);

#2)
select * from Member1;
select * from books;
select * from issue;

#3)
drop table Member1;

#4)
create table Member1(
member_id int primary key,
member_name varchar(30),
member_address varchar(50),
acc_open_date date,
membership_type varchar(20) check (membership_type='lifetime'or membership_type='annual'or membership_type='half yearly'or membership_type='quarterly'),
fees_paid int,
max_books_allowed int,
penalty_amount int
);
#5)
alter table Member1 modify member_name varchar(40);

#6)
alter table issue add reference1 char(30);

#7)
alter table issue drop column reference1;

#8)
alter table issue rename to lib_issue;
select * from lib_issue;
drop table lib_issue;

#9)
insert into Member1 values(1,'Richa Sharma','Pune','2005-12-10','lifetime',2500,5,50);
insert into Member1 values(2, 'Garima Sen','Pune', '2023-09-26','annual', 1000,3,null);

#10)
insert into Member1 values(3,'Riya Ahuja','Kop','2001-05-17','half yearly',5000,7,20);
insert into Member1 values(4, 'arya sharma','Dhule', '2019-05-20','quarterly', 6000,4,30);
insert into Member1 values(5, 'tanya varma','mumbai', '2022-06-28','half yearly', 9000,6,0);
delete from Member1 where member_id=6;

#11)
alter table Member1 modify member_name varchar(20);

#12)
insert into Member1 values(6, 'niya joshi','chennai', '2020-07-19','lifetime', 10000,110,6);

#13)
create table Member101 as select * from Member1;
select * from Member101;

##14)
alter table Member1 add constraint max_books_allowed check(max_books_allowed<100);
alter table member1 add constraint member_books_penalty check(max_books_allowed 
< 100 and penalty_amount <= 1000);

alter table Member1
add constraint max_books_allowed check(max_books_allowed<100);

#15)
drop table books;

#16)
create table books(
book_no int primary key,
book_name varchar(30) not null,
author_name varchar(30),
cost int,
category char(10)  CHECK (category IN ('science', 'fiction', 'database', 'rdbms', 'others'))
);

#17)
insert into books values(101,'let us C','Denis Ritchie', 450,'rdbms');
insert into books values(102,'oracle-complete reference','Loni', 550,'database');
insert into books values(103,'mastering SQL','Loni', 250,'fiction');
insert into books values(104,'PL SQL-Ref','Scott Urman', 750,'database');

#18)
insert into books (book_no,book_name,author_name,cost,category)values(105,'pl sql','scott urman',400,'science');

#19)
create table books101 as select * from books where 1=0;
select *from books101;

 #20)
 insert into books101 select *from books;
 
 #21)
 commit;
 
 #22)
 select * from Member1;
 select * from books101;
 select * from issue;
 select * from books;
 
 #23)
 insert into books values(106,'National Geographic','Adi Scott',1000,'science');
 
 #24)
 rollback;
 
 #25)
 update books set cost=300 where book_no=103;
 
 #26)
alter table lib_issue rename to issue;
select * from issue;
 
 #27)
 drop table issue;
 
 #28)
create table issue(
lib_issue_id int primary key,
book_no int,
member_id int,
issue_date date,
return_date date,
FOREIGN KEY (book_no) REFERENCES books(book_no),
FOREIGN KEY (member_id) REFERENCES member1(member_id),
CHECK (issue_date < return_date)
);
#29)
insert into issue values(7001,101,1,'2022-10-10',null);
insert into issue values(7002,102,2,'2019-9-15',null);
insert into issue values(7003,104,1,'2015-01-07',null);
insert into issue values(7004,101,1,'2018-5-22',null);
insert into issue values(7005,104,2,'2017-12-27',null);
insert into issue values(7006,101,3,'2014-6-28',null);

#30)save the data
commit;
savepoint issue;

#31)
SET foreign_key_checks = 0;
#Check constraints are not directly supported in MySQL, so you don't need to disable them because they don't exist.

##32)
insert into issue values(7007,103,2,'2019-07-14',null) where not exists(select 1 from Member1 where member_id=1);

INSERT INTO Issue (lib_issue_id, book_no, member_id, issue_date, return_date)
SELECT 7007, 103, 1,2019-06-28,null
FROM dual
wHERE 2 NOT IN (SELECT member_id FROM member1);

#33)
SET foreign_key_checks = 1;

#35)
 delete from Member1
 where member_id=1;
 #Cannot delete or update a parent row: a foreign key constraint fails (`sqlassignment1`.`issue`, CONSTRAINT `issue_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `member1` (`member_id`))	0.047 sec

#36)
UPDATE issue
SET Return_Date = DATE_ADD(Issue_Date, INTERVAL 15 DAY)
WHERE lib_issue_id IN (7004, 7005);
select * from issue;


#37)
UPDATE Member1
SET Penalty_Amount = 100
WHERE member_id = 2 AND member_name = 'Garima Sen';

#38)
SAVEPOINT X;

#39)
delete from issue where member_id=1 and issue_date <'2018-5-22';

#40)
delete from books 
where category not in('rdbms','database');

SET SQL_SAFE_UPDATES = 0







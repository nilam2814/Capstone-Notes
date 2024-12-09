create database feedack_application;
use feedack_application;
create table Author(
author_id varchar(8) primary key,
First_name varchar(10),
Last_name varchar(10)
)
select * from Author;
drop table Author;
drop database feedback_application;

create table Feedback(
feedback_id varchar(10),
feedbackDesc varchar(250),
foreign key(feedback_id) references Author(author_id)
);
drop table Feedback;
insert into Author values('author01', 'Nisha', 'Shete');
insert into Author values('author02', 'Nilam', 'Patil');
insert into Author values('author03', 'Rashmi', 'Patel');
insert into Author values('author04', 'Akash', 'Kale');
insert into Author values('author05', 'Aradhya', 'Shaha');
insert into Author values('author06', 'Rahul', 'Mahajan');



desc Feedback;
insert into Feedback values ('feedbk11', 'Great product!','author01');







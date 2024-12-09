use learninigmysql;

create table department (
dept_id int not null primary key , dept_name varchar(40) not null);

insert into department values(101,'admin');
insert into department values(102,'hr');
insert into department values(103,'finance');
insert into department values(104,'QA');

select *from department;

#create table employee (
#emp_id int primary key ,emp_name varchar(30) not null,dept_id int, foreign key(dept_id) references department(dept_id));
#drop table employee;

create table employee (
emp_id int primary key not null, name varchar(100),address varchar(100), age int, deptId int, foreign key(deptId) references department(dept_id));

insert into employee values (1,"mrunali",'pune',22, 101);
insert into employee values (2,"varun",'bihar',27, 102);
insert into employee values (3,"vipul",'nashik',23, 103);
insert into employee values (4,"nilam",'kolhapur',23, 104);

#display the data(joins)

#inner join
select e.emp_id,e.name,d.dept_name from department d inner join employee e on e.deptId=d.dept_id;
#to find varun is working from which department
select e.emp_id,e.name,d.dept_name from department d inner join employee e on e.deptId=d.dept_id where emp_id=2;

#left join
select d.dept_id,d.dept_name ,e.name from department d left join employee e on e.deptId=d.dept_id;
 
 #
create table student(
id int ,
name varchar(20),
constraint pk_d primary key(id,name));


create table aTable(aid int primary key);
alter table aTable add name varchar(20);
insert into aTable values(1,'one');
#insert into aTable values(1);

create table bTable(bid int primary key);
insert into bTable values(2);

create table cTable(aid int ,bid int, foreign key(aid)references aTable(aid),foreign key(bid)references bTable(bid));
insert into cTable values(1,2);

truncate cTable;
truncate aTable;
truncate bTable;

drop table cTable;
drop table bTable;
drop table aTable;

alter table aTable add name varchar(20);
insert into aTable values(1,'one');

#create tables

create table employee1(
empid int primary key,name varchar(20) not null, salary int);

create table department1(
deptid int primary key, deptname varchar(30));

create table organization(
emp_id int,
dept_id int,
foreign key(emp_id) references employee1(empid),foreign key(dept_id) references department1(deptid));

insert into employee1 values(1,'vihan',2000);
insert into employee1 values(2,'vishal',3000);
insert into employee1 values(3,'vyas',4000);


insert into department1 values(101,'QA');
insert into department1 values(102,'digital');
insert into department1 values(103,'data');


insert into organization values(1,101);
insert into organization values(2,102);
insert into organization values(3,103);



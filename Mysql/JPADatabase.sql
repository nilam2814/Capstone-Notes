create database studentdata;
use studentdata;
CREATE TABLE STUDENT (
           ID INT NOT NULL,
           FIRSTNAME VARCHAR(20) DEFAULT NULL,
           LASTNAME VARCHAR(20) DEFAULT NULL,
          MARKS INT DEFAULT NULL,
          PRIMARY KEY (ID)
   );

select * from student;
CREATE DATABASE employeedata;
use employeedata;
CREATE TABLE EMPLOYEE(
EMPID INT NOT NULL,
NAME VARCHAR(20) DEFAULT NULL,
SALARY INT,
ADDRESS VARCHAR(200),
JOINING_DATE DATE
)


CREATE TABLE employee_address(
e_pincode int,
e_city varchar(30),
e_state varchar(40),
employee_e_id int,
constraint pk_emp primary key (e_pincode),
constraint fk_deptno foreign key (employee_e_id) references employee(e_id)
);
  

CREATE TABLE Employee(
    e_id INT,
    e_name VARCHAR(10),
    constraint pk_emp primary key (e_id)
);

create table department(
dept_id int primary key,
department_name varchar(20),
department_head int,
foreign key (department_head) references Employee(e_id)
);

select * from Employee;
select * from department;


drop table department;



Create database JPA;
use JPA;

CREATE TABLE User (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL
);


-- Feedback Table-- 
CREATE TABLE Feedback (
    id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(50) NOT NULL,
    createdBy_id INT,
    issue VARCHAR(255) NOT NULL,
    FOREIGN KEY (createdBy_id) REFERENCES User(id)author
);
use assessment;
select * from author;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';

create database TEST;
use TEST;
Create table Student(
name Varchar(25),
age int
)
drop table Student;
select* from Student;
create database assessment;
use assessment;
CREATE TABLE Author (
	ID INT(8) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(10),
	LAST_NAME CHAR(10)
	
);
desc Author;

CREATE TABLE Feedback (
	ID INT,
	FEEDBACK_ID INT,
	FIRST_NAME CHAR(10),
    FEEDBACK_DESC CHAR(250),
	FOREIGN KEY (FEEDBACK_ID)
		REFERENCES Author(ID)
        
);
desc Feedback;
select * from Feedback;
select * from Author;
insert into author values(1,'Nilam','Patil');
insert into author values(2,'Raj','Kale');
insert into author values(3,'Rahul','Mahajan');

insert into Feedback values(111,3,'Rahul','Product is good');
insert into Feedback values(112,3,'Rahul','Product is not suitable');
insert into Feedback values(113,'Rahul','NICE product');

SELECT COUNT(*) AS feedbackCount
FROM Feedback F
JOIN Author A ON F.Id = A.ID
WHERE FIRST_NAME = 'Rahul';

select count(FEEDBACK_ID) from feedback group by first_name having first_name='Rahul';
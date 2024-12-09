use learninigmysql;

delimiter $$
CREATE PROCEDURE myProcedure()
BEGIN
	select *from cars_india_dataset;
END $$

call myProcedure;
drop  procedure myProcedure;
###########################################################################################
delimiter $$
CREATE PROCEDURE MyProcedure(IN mkr varchar(50))
BEGIN
	select *from cars_india_dataset where maker=mkr;
END $$

call MyProcedure('Hyundai');
###########################################################################################
DELIMITER $$
CREATE PROCEDURE getTotalcars(OUT total int)
BEGIN
	select count(*) into total from cars_india_dataset;
    
END $$
call getTotalcars("Hyundai",@tol);
select @tol;

################################################################################################
select @tol as "Total"

DELIMITER $$
CREATE PROCEDURE getHyundaiTotal(IN mkrName varchar(30),out total int)
BEGIN
	select count(*)into total from cars_india_dataset where maker=mkrName;
    END $$

call getHyundaiTotal('hyundai',@tol);

select @tol;
#############################################################################################

create table Emp(
 first_name VARCHAR(20), id INT PRIMARY KEY)
 
insert into Emp values('HJK', 1);
insert into Emp values('ABC', 2);
insert into Emp values('DEF', 3);

select * from Emp;


delimiter $$
CREATE PROCEDURE sample_sp_with_params (IN empId INT UNSIGNED, OUT oldName VARCHAR(20), INOUT newName VARCHAR(20))
BEGIN
SELECT first_name into oldName FROM Emp where id = empId;
UPDATE emp SET first_name = newName where id = empId;
select * from emp;
END;

drop procedure sample_sp_with_params;

set @inout='updatedHJK';
CALL sample_sp_with_params(1,@out,@inout);
select @out,@inout;
select * from emp;


delimiter $$
create procedure fact (IN x int)
BEGIN
  DECLARE result INT;
  DECLARE i INT;
  SET result = 1;
  SET i = 1;
  WHILE i <= x DO
    SET result = result * i;
    SET i = i + 1;
  END WHILE;
   SELECT x AS Number, result as Factorial;

END;

CALL fact(1) 
CALL fact(2) 
CALL fact(4) 
CALL fact(0) 


drop procedure fact;
delimiter $$
CREATE PROCEDURE fact(IN x INT)
BEGIN
  DECLARE result INT DEFAULT 1;  /* notice you can declare a variable*/
  DECLARE i INT DEFAULT 1;       /* and give it a value in one line */
  REPEAT
    SET result = result * i;
    SET i = i + 1;
  UNTIL i > x
  END REPEAT;
  SELECT x AS Number, result as Factorial;
END;


CALL fact(1)
CALL fact(2)
CALL fact(4)
CALL fact(0)


#FUNCTION

delimiter $$
CREATE FUNCTION calcIncome(starting_value int)
RETURNS INT
deterministic
BEGIN
   DECLARE income INT;
   SET income = 0;

   label1: WHILE income <= 3000 DO
     SET income = income + starting_value;
   END WHILE label1;

   RETURN income;
END; 

delimiter $$
create function sample_fn_no_param()
returns int
deterministic
begin
declare count int;
select count(*) into count from employee;
return count;
end;

select sample_fn_no_param ();


#TRIGGER
create table accounts(acc_num int, amount decimal(10,2));

set @sum=0;

insert into accounts values(1,10000.23);
insert into accounts values(2,20000);
select @sum;



create trigger trg_insert before insert on accounts
for each row 
set @sum=@sum+New.amount;

CREATE TABLE test1(a1 INT);
CREATE TABLE test2(a2 INT);
CREATE TABLE test3(a3 INT NOT NULL AUTO_INCREMENT PRIMARY KEY);
CREATE TABLE test4(
  a4 INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  b4 INT DEFAULT 0);
  
delimiter $$
CREATE TRIGGER testref BEFORE INSERT ON test1
  FOR EACH ROW
  BEGIN
    INSERT INTO test2 SET a2 = NEW.a1;
    DELETE FROM test3 WHERE a3 = NEW.a1;
    UPDATE test4 SET b4 = b4 + 1 WHERE a4 = NEW.a1;
  END;
  
  INSERT INTO test3 (a3) VALUES
  (NULL), (NULL), (NULL), (NULL), (NULL),
  (NULL), (NULL), (NULL), (NULL), (NULL);

INSERT INTO test4 (a4) VALUES
  (0), (0), (0), (0), (0), (0), (0), (0), (0), (0);

INSERT INTO test1 VALUES 
       (1), (3), (1), (7), (1), (8), (4), (4);

select * from test1;
select * from test2;
select * from test3;
select * from test4;



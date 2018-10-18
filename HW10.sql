CREATE DATABASE HW10
Go

USE HW10
Go

--CREATE TABLE Employees (
--ID INT IDENTITY (1,1)
--,BadgeNum INT NOT NULL UNIQUE
--,TITLE VARCHAR null(20)
--,DATEHired DateTime2 Not Null
--);
--Go

--drop table dbo.Employees;

CREATE TRIGGER TiTle 

--drop TRIGGER TiTle;

ON EMPLOYEES 
	AFTER INSERT, UPDATE
	AS
 declare @BadgeNum int = 0;

 select @BadgeNum = BadgeNum 
 from inserted
		
IF @BadgeNum < 300 BEGIN 
	UPDATE Employees 
	SET TiTle = 'Clerk'
	WHERE BadgeNum = @BadgeNum;
	END

IF @BadgeNum > 300 and @BadgeNum <= 600 BEGIN
	UPDATE Employees
	SET TiTle = 'Office Employee'
	WHERE BadgeNum = @BadgeNum;
	END

IF @BadgeNum > 700 and @BadgeNum <= 800 BEGIN 
	UPDATE Employees
	SET TiTle = 'Manager'
	WHERE BadgeNum = @BadgeNum;
	END
IF (@BadgeNum > 900 and @BadgeNum <= 1000)BEGIN
	UPDATE Employees
	SET TiTle = 'Director'
	WHERE BadgeNum = @BadgeNum;
END
GO

DECLARE @Counter int = 1;
WHILE @Counter < 25 BEGIN
	SELECT FLOOR (RAND()*(1000-1));
	UPDATE Employees
	SET @Counter += 1;
END
GO

INSERT into Employees(BadgeNum, dateHired)
VALUES (750, GETDATE());
GO

Select * from Employees;
go

--DROP TRIGGER TiTle
--go
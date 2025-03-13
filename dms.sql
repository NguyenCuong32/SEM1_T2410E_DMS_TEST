create database dms_test
go

use dms_test
go

create table employee(
	empCode nchar(5),
	empName nvarchar(256),
	departCode char(10),
	primary key (empCode)
)

create table workTime(
	empCode nchar(5),
	workDay int,
	offWithPay int,
	offWOpay int,
	primary key (empCode),
	foreign key(empCode) references employee(empCode)
)

create table salary(
	empCode nchar(5),
	basicPay int,
	grossPay int,
	netPay int,
	primary key (empCode),
	foreign key(empCode) references employee(empCode)
)
insert into dbo.employee values('A1','Nguyễn Văn A','IT')
insert into dbo.employee values('A2','Lê Thị Bình','IT')
insert into dbo.employee values('B1','Nguyễn Lan','HR')
insert into dbo.employee values('D1','Mai Tuấn Anh','HR')
insert into dbo.employee values('C1','Hà Thị Lan','HR')
insert into dbo.employee values('C2','Lê Tú Chinh','SALE')
insert into dbo.employee values('D2','Trần Văn Toàn','HR')
insert into dbo.employee values('A3','Trần Văn Nam','IT')
insert into dbo.employee values('B2','Huỳnh Anh','SALE')

insert into dbo.workTime values('A1',22,0,0)
insert into dbo.workTime values('A2',21,1,0)
insert into dbo.workTime values('B1',20,1,1)
insert into dbo.workTime values('D1',20,1,1)
insert into dbo.workTime values('C1',22,0,0)
insert into dbo.workTime values('C2',22,0,0)
insert into dbo.workTime values('D2',22,0,0)
insert into dbo.workTime values('A3',22,0,0)
insert into dbo.workTime values('B2',21,1,0)

insert into dbo.salary values('A1',1000,22000,20000)
insert into dbo.salary values('A2',1200,26400,23000)
insert into dbo.salary values('B1',600,13200,12000)
insert into dbo.salary values('D1',500,11000,10000)
insert into dbo.salary values('C1',500,11000,10000)
insert into dbo.salary values('C2',1200,26400,23000)
insert into dbo.salary values('A3',500,11000,10000)
insert into dbo.salary values('B2',1200,26400,23000)


select * from dbo.employee;
select * from dbo.workTime;
select * from dbo.salary;

create procedure CalcNetSal 
as
select netPay from dbo.Salary
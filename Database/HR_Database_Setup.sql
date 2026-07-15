#Database----------------------------------------------------------------------------------------
create database hr_analytics;
use hr_analytics;

#--------------------------------------------------------------------------------------------------
#Employee Table dataset								

create table employees(Employee_ID varchar(20) primary key,First_Name varchar(100),
Last_Name varchar(100),Gender varchar(20),Date_of_Birth date,Email	varchar(100) unique,
Phone_no varchar(20),Address varchar(100),City varchar(50),State varchar(50),
Country varchar(50),Hire_Date date,Department_ID varchar(20),Job_ID	varchar(20),
Manager_ID varchar(20) null,Salary decimal(10,2),Bonus decimal(10,2),Employment_Status varchar(50),
Employment_Type varchar(50),Education varchar(50),Experience_Years int);

desc employees;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Hr_datasetfiles/Employees.csv'
into table employees
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(Employee_ID ,First_Name,Last_Name,Gender,Date_of_Birth,Email,
Phone_no,Address,City,State,Country,Hire_Date,Department_ID,Job_ID,
@Manager_ID,Salary,Bonus,Employment_Status,Employment_Type,Education,Experience_Years)
set manager_id=nullif(@manager_id,'');

select * from employees;

#------------------------------------------------------------------------------------------------
#Jobs Table

create table jobs(Job_ID varchar(30) primary key,Job_Title varchar(100),
Grade varchar(10),Minimum_Salary decimal(10,2),Maximum_Salary decimal(10,2));
desc jobs;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Hr_datasetfiles/jobs.csv'
into table jobs
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

use hr_analytics;
select * from jobs;

#------------------------------------------------------------------------------------------------
#Attendance Table
create table Attendance(Attendance_ID varchar(20) primary key,
Employee_ID varchar(20),Attendance_Date date,Check_In time null,
Check_Out time null, Working_Hours decimal(4,2),Overtime_Hours decimal(4,2),
Attendance_Status varchar(30) not null,Shift varchar(30));

desc attendance;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Hr_datasetfiles/Attendance.csv'
into table attendance
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(Attendance_ID,Employee_ID,Attendance_Date,@Check_In,@Check_Out,Working_Hours,Overtime_Hours,Attendance_Status,Shift)
set
check_in=nullif(@check_in,''),
check_out=nullif(@check_out,'');

select * from attendance;

#----------------------------------------------------------------------------------------------------------------------
#Exit Table

create table Exit_data(Exit_ID varchar(30) primary key,Employee_ID varchar(30) unique,
Exit_Date date,Exit_Reason varchar(100),Exit_Type varchar(50),
Notice_Period int,Final_Rating varchar(50));

desc exit_data;
	
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Hr_datasetfiles/exit.csv'
into table exit_data
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from exit_data;

#-------------------------------------------------------------------------------------------------------------------------
#Training Table
create table Training(Training_ID varchar(20) primary key,Employee_ID varchar(20),
Training_Name varchar(100),Provider	varchar(50),Start_Date date,End_Date date,
Training_Cost decimal(10,2),Certification_Status varchar(50));




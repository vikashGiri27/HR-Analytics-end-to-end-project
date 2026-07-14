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

select * from jobs;
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

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Hr_datasetfiles/training.csv'
into table training
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from training;

#---------------------------------------------------------------------------------------------------------------------------
#Leave Table

create table leave_data(Leave_ID varchar(20) primary key,Employee_ID	varchar(20),Leave_Type varchar(50),
Start_Date date,End_Date date,Total_Days int,Approval_Status varchar(50));

desc leave_data;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Hr_datasetfiles/leave.csv'
into table leave_data
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from leave_data;

#--------------------------------------------------------------------------------------------------------------------
#Payroll

create table payroll(Payroll_ID	varchar(20) primary key,Employee_ID varchar(20),
Payroll_Month varchar(10),Basic_Salary decimal(10,2),Allowances decimal(10,2),Bonus decimal(10,2),
Tax	decimal(10,2),Deductions decimal(10,2),Net_Salary decimal(10,2),Payment_Date date);

drop table payroll;
desc payroll;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Hr_datasetfiles/payroll.csv'
into table payroll
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from payroll;
#-----------------------------------------------------------------------------------------------------------
#Performance
create table performance(Performance_ID varchar(20) primary key,Employee_ID varchar(20),
Review_Date date,Reviewer_ID varchar(20),KPI_Score decimal(6,2),Productivity_Score	decimal(6,2),
Attendance_Score decimal(6,2),Teamwork_Score decimal(6,2),Overall_Rating varchar(30),
Promotion_Recommendation varchar(20));

desc performance;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Hr_datasetfiles/performance.csv'
into table performance
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from performance;

#--------------------------------------------------------------------------------------------------------
#Recruitment
create table Recruitment(Recruitment_ID varchar(20) primary key,Candidate_ID varchar(20),
Candidate_Name varchar(50),Position varchar(50),Department_ID varchar(20),Application_Date date,
Interview_Date date,Recruiter_ID varchar(20),Interview_Score decimal(6,2),
Hiring_Status varchar(50),Joining_Date date null);
desc recruitment;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Hr_datasetfiles/recruitment.csv'
into table recruitment
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(Recruitment_ID ,Candidate_ID ,Candidate_Name ,Position,Department_ID,Application_Date,
Interview_Date,Recruiter_ID,Interview_Score,Hiring_Status,@Joining_Date)
set Joining_Date=nullif(@Joining_Date, '');

select * from recruitment;
#--------------------------------------------------------------------------------------------------------
# Adding Foreign Key Constraints

#Employees-> Departments,jobs,self reference manager
alter table employees add constraint fk_employee_department
foreign key (department_id)  references departments(department_id);
desc employees;

alter table employees add constraint fk_employees_job foreign key
(job_id) references jobs(job_id);
desc employees;

alter table employees add constraint fk_employees_manager
foreign key (manager_id) references employees(employee_id);

desc employees;

#Departments table-> Employees table
alter table departments add constraint fk_department_head_id 
foreign key (head_employee_id) references employees(employee_id);

desc departments;

#leave_date -> Employees
alter table leave_data add constraint fk_leave_employee
foreign key (employee_id) references employees (employee_id);

#Training -> Employees
alter table training add constraint fk_training_employees
foreign key (employee_id) references employees (employee_id);



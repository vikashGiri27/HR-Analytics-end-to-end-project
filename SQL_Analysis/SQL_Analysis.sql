use hr_analytics;

#---------------------Employees------------------------------

#Q1. Find the total numbers of employees.
select count(*) as emp_count from employees;

#Q2. Find the numbers of employees hired each year.
select year(hire_date) as year,count(*) as emp_count
from employees group by year order by year asc;

#Q3. Find top 10 highest paid employees.
select employee_id,concat(first_name,' ',last_name) as employee_name,salary
from employees order by salary desc limit 10;

#Q4. calculate the average salary by education level.
select education,round(avg(salary),2) as salary from employees
group by education order by salary desc;

#Q5. Find the top 10 most experienced employees.
select employee_id,concat(first_name,' ',last_name) as employee_name,
experience_years from employees order by Experience_Years desc limit 10;

#Q6. Find the number of employees in each county.
select country,count(*) as employee_count from employees
group by country order by employee_count desc;



/*--------------------------------Attendance Table-------------------------------------*/


#Q1. Find the number of employees by attendance status.
select attendance_status,count(*) as total_records from attendance
group by attendance_status order by total_records desc;

#Q2. Calculate the average working hours of employees
select round(avg(working_hours),2) as avg_working_hours from attendance;

#Q3. Find the top 10 employees with the highest overtime hours.
select employee_id,concat(first_name,' ',last_name) as employee_name,
sum(overtime_hours) as total_overtime from employees
inner join attendance using(employee_id)
group by employee_id,concat(first_name,' ',last_name)
order by total_overtime desc limit 10;

#Q4. Find the average overtime hours by shift.
select shift,(avg(overtime_hours)) as avg_overtime_hrs
from attendance group by shift order by avg_overtime_hrs desc;

#Q5. Find the attendance count of each shift.
select shift,count(*) as Attendance_count
from attendance group by shift order by attendance_count desc;

#---------------------------Department---------------------------------------

#Q1. Find the numbers of employees in each department.
select department_name,count(employee_id) as employee_count
from departments inner join employees using(department_id)
group by department_name order by employee_count desc;

#Q2. Find the average salary in each department.
select department_name,round(avg(salary),2) as avg_salary from departments
inner join employees using(department_id) group by department_name
order by avg_salary desc;

#Q3. Find the total salary expense of each department.
select d.department_name,sum(e.salary) as salary_expense from departments d
inner join employees e on d.Department_ID=e.department_id
group by department_name order by salary_expense desc;

#Q4. Find the average experience of employees in each department.
select d.department_name,round(avg(e.experience_years),2) as avg_experience 
from departments d inner join employees e on d.department_id=e.Department_ID
group by Department_Name order by avg_experience desc;

#Q5. Find the highest paid employee in each department.
with high_sal as
(select e.Employee_ID,concat(e.First_Name,' ',e.last_name) as employee_Name,
d.department_name,e.salary,dense_rank()
over (partition by d.Department_Name order by e.salary desc) as rnk
from departments d inner join employees e on d.Department_ID=e.Department_ID)
select employee_id,employee_name,department_name,salary from high_sal where rnk=1;

#----------------------------- Payroll----------------------------------------------------

#Q1. Find the total payroll amount of the organization.
select sum(net_salary) as total_payroll_amount from payroll;

#Q2. Find the top 10 employees with highest net salary.
select e.employee_id,concat(e.first_name,' ',e.last_name)as full_name,p.net_salary
from employees e inner join payroll p on e.Employee_ID=p.Employee_ID
order by net_salary desc limit 10;

#Q3. Calculate the avergae net salary by department.
select d.department_name,avg(p.net_salary) as avg_net_salary
from departments d inner join employees e
on d.Department_ID=e.Department_ID inner join
payroll p on e.Employee_ID=p.Employee_ID
group by department_name order by avg_net_salary desc;

#Q4. Find the department with the highest deductions.
select d.department_name,sum(p.deductions) as total_deduction 
from departments d inner join employees e
on d.Department_ID=e.Department_ID inner join
payroll p on e.Employee_ID=p.Employee_ID
group by department_name order by total_deduction desc;

#Q5. compare total basic salary vs total net salary.
select sum(basic_salary) as total_salary,sum(net_salary) as total_net_Salary,
sum(basic_salary)-sum(net_salary) as salary_difference from payroll;

#--------------------------- Performance----------------------------------------

#Q1. Calculate the avgerage Kpi score by department.
select d.department_name,round(avg(p.kpi_score),2)as avg_Kpi_score 
from departments d inner join 
employees e on d.department_id=e.Department_ID
inner join performance p on e.employee_id=p.employee_id 
group by d.department_name order by avg_Kpi_score desc;

#Q2. Find the top 10 highest-performing employees.
select e.employee_id,concat(e.first_name,' ',e.last_name) as employee_name,
round(avg(p.kpi_score),2) as Performance from employees e inner join
performance p on e.employee_id=p.employee_id group by e.employee_id,
e.first_name,e.last_name order by performance desc limit 10;

#Q3. Find the average kpi score by overall rating.
select Overall_Rating,round(avg(KPI_Score),2) as Average_Kpi
from performance group by Overall_Rating order by average_kpi desc; 

#-------------------------------Exit_data----------------------------------------

#Q1. Analyze employee exit by year.
select year(exit_date) as year,count(*) as exit_count
from exit_data group by year(exit_date) order by year;

#Q2. Find the top exit reasons.
select exit_reason,count(*) exit_count from exit_data
group by Exit_Reason order by exit_count desc;

#Q3. Analyze employee exit by department.
select d.department_name,count(x.exit_id) as total_exit_count
from departments d inner join employees e on e.Department_ID=d.Department_ID
inner join exit_data x on e.Employee_ID=x.Employee_ID
group by d.Department_Name order by total_exit_count desc;

#Q4. Calculate the average tenure of exited employee.
select round(avg(timestampdiff(month,e.hire_date,x.exit_date))/12,2) as tenure
from employees e inner join exit_data x on e.Employee_ID=x.Employee_ID;

#Q5. Analyze employee exits by gender.
select e.gender,count(x.exit_id)as exit_count from employees e
inner join exit_data x on e.Employee_ID=x.Employee_ID
group by e.Gender order by exit_count desc;


#-------------------------------Leave----------------------------------------------

#Q1. Find the most common leave type
select leave_type,count(*) as leave_count from leave_data
group by Leave_Type order by leave_count desc;

#Q2. Calculate the average leave duration by leave type.
select Leave_Type,round(avg(datediff(end_date,start_date)),2) as avg_leave_duration
from leave_data group by leave_type order by avg_leave_duration desc;


#Q3. Analyze leave request by approval status.
select approval_status,count(approval_status) as approval_count
from leave_data group by Approval_Status order by Approval_count desc;

#Q4. Find the department with the highest number of leave request.
select d.department_name,count(l.leave_id) as leave_request_count 
from departments d inner join employees e on d.department_id=e.department_id
inner join leave_data l on e.employee_id=l.employee_id
group by d.Department_Name order by leave_request_count desc;


#Q5. Find the employees who have taken the highest number of leave days.
select e.employee_id,concat(e.first_name,' ',e.last_name) as employee_name,
sum(l.total_days) as total_leave from employees e inner join leave_data l
on e.Employee_ID=l.Employee_ID group by e.Employee_id,e.First_Name,e.Last_Name
order by total_leave desc;

#------------------------------Training Table----------------------------------------

#Q1. Find the total training cost spent by the organization.
select sum(training_cost) as total_training_cost from training;

#Q2. Find the number of employees certified vs not certified.
select certification_status,count(*) as employee_count
from training group by certification_status order by employee_count desc;

#Q3. Find the top training providers by number of trainings conducted.
select provider,count(*) as training_count
from training group by provider order by training_count desc;

#------------------------------Jobs Table----------------------------------------

#Q1. Find the number of employees in each job grade.
select j.grade,count(e.employee_id) as employee_count
from jobs j inner join employees e on j.job_id=e.job_id
group by j.grade order by employee_count desc;

#Q2. Find the job title with the highest average salary.
select j.job_title,round(avg(e.salary),2) as avg_salary
from jobs j inner join employees e on j.job_id=e.job_id
group by j.job_title order by avg_salary desc limit 10;

#Q3. Find the salary range (min-max) for each job grade.
select grade,min(minimum_salary) as min_range,max(maximum_salary) as max_range
from jobs group by grade order by grade;


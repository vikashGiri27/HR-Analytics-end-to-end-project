use hr_analytics;

/*--------------------------------------------------------------------
                           Employees Table
--------------------------------------------------------------------*/
#Q1. Find the total numbers of employees.
select count(*) as emp_count from employees;

#Q2. Find the numbers of employees hired each year.
select year(hire_date) as year,count(*) as emp_count
from employees group by year order by year asc;

#Q3. Find top 10 highest paid employees.
select concat(first_name,' ',last_name) as employee_name,sum(salary) as salary
from employees group by concat(first_name,' ',last_name) order by salary asc limit 10;

#Q4. calculate the average salary by education level.
select education,round(avg(salary),2) as salary from employees
group by education order by salary desc;

#Q5. Find the top 10 most experienced employees.
select concat(first_name,' ',last_name) as employee_name,experience_years
from employees order by Experience_Years desc limit 10;

#Q6. Find the number of employees in each county.
select country,count(*) as employee_count from employees
group by country order by employee_count desc;



/*--------------------------------Attendance Table-------------------------------------*/
select * from attendance;

#Q1. Find the number of employees by attendance status.
select attendance_status,count(*) as total_records from attendance
group by attendance_status order by total_records desc;

#Q2. Calculate the average working hours of employees
select round(avg(working_hours),2) as avg_working_hours from attendance;




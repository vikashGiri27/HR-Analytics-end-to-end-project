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
select * from attendance;
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





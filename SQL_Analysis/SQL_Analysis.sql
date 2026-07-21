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
select education,round(avg(salary)) as salary from employees
group by education order by salary desc;

#Q5. Find the Year wise number of terminated employees.alter

#Q6. Find the number of employees in each county.
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
select concat(first
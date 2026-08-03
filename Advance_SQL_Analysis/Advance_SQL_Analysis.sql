#Q1. Identify employees whose salary is higher than the average salary of their respective department.
select e.employee_id,concat(e.first_name,' ',e.last_name) as employee_name,
e.salary from employees e where salary>(select avg(e1.salary)
from employees e1 where e.Department_ID=e1.department_id);

#Q2. Classify employees into salary bands based on their salary.
select  salary from employees order by salary desc;
select concat(First_Name,'',last_name) as employee_name,salary,case
when salary<80000 then "Low salary"
when salary between 80000 and 150000 then 'Medium salary'
when salary >150000 and salary<=200000 then 'High salary'
else 'Very high salary' end as salary_band from employees;

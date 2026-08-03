#Q1. Identify employees whose salary is higher than the average salary of their respective department.
select e.employee_id,concat(e.first_name,' ',e.last_name) as employee_name
,e.salary from employees e where salary>(select avg(e1.salary)
from employees e1 where e.Department_ID=e1.department_id);


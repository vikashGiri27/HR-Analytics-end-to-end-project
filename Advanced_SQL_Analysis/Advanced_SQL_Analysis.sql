#Q1. Identify employees whose salary is higher than the average salary of their respective department.
select e.employee_id,concat(e.first_name,' ',e.last_name) as employee_name,
e.salary from employees e where salary>(select avg(e1.salary)
from employees e1 where e.Department_ID=e1.department_id);

#Q2. Classify employees into salary bands based on their salary.
select concat(First_Name,' ',last_name) as employee_name,salary,case
when salary<80000 then "Low salary"
when salary between 80000 and 150000 then 'Medium salary'
when salary >150000 and salary<=200000 then 'High salary'
else 'Very high salary' end as salary_band from employees;

#Q3. Finds employees along with their manager name.
select e.employee_id,concat(e.first_name,' ',e.last_name) as employee_name,
concat(e1.first_name,' ',e1.last_name) as manager_name
from employees e Left join employees e1 on e.manager_id=e1.Employee_ID;

#Q4. Find the second-highest paid employee in each department.
with second_highest_salary as
(select e.employee_id,
concat(e.first_name,' ',e.last_name)as employee_name,
  e.salary,d.department_name,
dense_rank() over(partition by d.department_name
order by e.salary desc) as salary_rank
from employees e inner join departments d 
on e.department_id=d.department_id)
select employee_id,employee_name,department_name,
salary,salary_rank from second_highest_salary where salary_rank=2;

#Q5. Find the employees whose salary is in the top 10% of salaries in the organization.
with salary_bucket as
(select employee_id,
concat(first_name,' ',last_name) as employee_name,
salary,ntile(10) over(order by salary desc) as
salary_bucket from employees)
select employee_id,employee_name,salary
from salary_bucket where salary_bucket=1
order by salary desc;

#Q6. Find the employees who have the highest total overtime hours in each department.
with highest_overtime as
(with employee_overtime as
(select e.employee_id,concat(e.first_name,' ',e.last_name) as employee_name,
d.department_name,sum(a.overtime_hours) as total_overtime from employees e
inner join departments d on e.department_id=d.department_id inner join
attendance a on e.Employee_ID=a.Employee_ID group by e.Employee_ID,
e.First_Name,e.Last_Name,d.Department_Name)
select employee_id,employee_name,department_name,total_overtime,
dense_rank() over(partition by department_name
order by total_overtime desc) as overtime_rank
from employee_overtime)
select employee_id,employee_name,department_name,total_overtime
from highest_overtime where overtime_rank=1;


#Q7. Find the employee who have taken more leave days than the average leave days taken by all employees.
select e.employee_id,concat(e.first_name,' ',e.last_name) as 
employee_name,sum(l.total_days) as total_leave_days from
employees e inner join leave_data l on e.Employee_ID=
l.Employee_ID group by e.Employee_ID,e.First_Name,
e.Last_Name having sum(l.total_days)>
(select avg(total_leave) from

(select employee_id,sum(total_days) as total_leave from leave_Data
group by employee_id) as x)
order by total_leave_days desc;


#Q8. Calculate the year-over-year change in employee exits to identify whether
#employee exits increased or decreased each year.
With yoy_attrition_diff as
(select year(exit_date) as year,count(Exit_ID) as employee_attrition_count,
lag(count(exit_id)) over(order by year(exit_date)) as
 previous_year_attrition_count from exit_data group by year )
select year,employee_attrition_count,previous_year_attrition_count,
employee_attrition_count-previous_year_attrition_count as
yoy_attrition_difference from yoy_attrition_diff;

#Q9.Find the hiring success rate of each recruiter.
select Recruiter_ID,count(*) as total_applications,
sum(case when Hiring_Status="Hired" then 1 else 0 end) as total_hired,
round(sum(case when hiring_status="Hired" then 1 else 0 end)*100/count(*),2) as success_rate
from recruitment group by Recruiter_ID order by success_rate desc;

#Q10. Find high performers who haven't been recommended for promotion despite having 3+ years experience'.
select e.employee_id,concat(e.first_name,' ',e.last_name)as employee_name,
p.overall_rating,p.promotion_recommendation,e.experience_years from employees e
inner join performance p on e.Employee_id=p.Employee_ID
where Experience_Years>=3 and Overall_Rating="excellent"
and Promotion_Recommendation="No"
order by Experience_Years desc;


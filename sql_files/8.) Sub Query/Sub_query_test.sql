

-- Fetch the employees from departments where there are more than 5 employees

select department_id, count(department_id)
from employees 
group by department_id
having count(department_id) > 5
order by 1;

select * from 
(
select department_id, count(department_id) emp_count
from employees 
group by (department_id)
order by 1
)
where emp_count > 5


select employee_id, first_name, department_id from employees 
where department_id in (
select department_id from 
(
select department_id, count(department_id) emp_count
from employees 
group by (department_id)
order by 1
)
where emp_count > 5)
order by department_id;


select employee_id, first_name, department_id from employees 
where department_id in ( 
select department_id 
from employees 
group by (department_id)
having count(department_id) > 5
)
order by department_id;


-- Fetch the employees from departments where there are more than 5 employees(analytical)

select * from(
select employee_id, first_name, department_id, count(department_id) over(partition by department_id order by department_id) emp_count
from employees
)
where emp_count > 5;

-- co-related sub query

select e.employee_id, e.first_name, e.department_id from employees e
where (select count(department_id) from employees where nvl(department_id,-999) = nvl(e.DEPARTMENT_ID,-999)) > 5
order by department_id;

from join 

select employee_id, first_name, e.department_id from 
employees e,
(select department_id from employees group by DEPARTMENT_ID having count(DEPARTMENT_ID) > 5) d
where (e.department_id = d.DEPARTMENT_ID)

---------------------------------------------------------------------------------------

select e.department_id, d.department_name
from employees e join departments d
on (e.department_id = d.department_id) 
group by (e.department_id, d.department_name)
order by 1



select e.employee_id, e.first_name, e.department_id, d.department_name from employees e join departments d 
on (e.department_id = d.department_id)
where e.department_id in (
select department_id from 
(
select department_id, count(department_id) emp_count
from employees 
group by (department_id)
order by 1
)
where emp_count > 5)
order by e.department_id;


select employee_id, first_name, e.department_id, department_name from employees e join departments d  
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
where e.department_id in ( 
select department_id 
from employees 
group by (department_id)
having count(department_id) > 5
)
order by e.department_id;


-- Fetch the employees from departments where there are more than 5 employees(analytical)

select employee_id, first_name, department_id, department_name from(
select employee_id, first_name, employees.department_id, department_name, count(employees.department_id) over(partition by employees.department_id order by employees.department_id) emp_count
from employees join departments d
on (employees.department_id = d.DEPARTMENT_ID)
)
where emp_count > 5;

-- co-related sub query

select e.employee_id, e.first_name, e.department_id, d.department_name from employees e join departments d
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
where (select count(department_id) from employees where nvl(department_id,-999) = nvl(e.DEPARTMENT_ID,-999)) > 5
order by department_id;

from join 

select employee_id, first_name, e.department_id, d1.department_name from 
employees e,
(select department_id from employees group by DEPARTMENT_ID having count(DEPARTMENT_ID) > 5) d,
departments d1
where (e.DEPARTMENT_ID = d1.DEPARTMENT_ID)
and (e.department_id = d.DEPARTMENT_ID)
order by e.DEPARTMENT_ID

-- ABCD object 

select * from user_objects;

select object_type from user_objects object_name = 'ABCD';

Fetch the employees in Seattle city using subquery

select e.employee_id, e.first_name, e.department_id, d.DEPARTMENT_NAME, l.city from 
employees e join departments d
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
join locations l
on (d.LOCATION_ID = l.LOCATION_ID)
where l.CITY = 'Seattle';


select employee_id, first_name, department_id from employees 
where department_id IN 
(
   select department_id d
   from departments  
   where location_id = 
   (
     select location_id from locations where city = 'Seattle'
   )
)

Fetch the employees joined on the same date

join, subquery, analytical, corelated 

select * from employees
order by hire_date;

select e.hire_date from employees e 
group by (e.HIRE_DATE)
having count(hire_date) > 1
order by e.hire_date;

-- Using From select query and analytical function

select * from (
select e.employee_id, e.first_name, e.last_name, e.hire_date, count(hire_date) over(partition by hire_date order by hire_date) count_of_emp
from employees e
)
where count_of_emp > 1
order by hire_date;

-- using WHERE Sub query

select employee_id, first_name, last_name, hire_date
from employees 
where hire_date IN (
select e.hire_date from employees e 
group by (e.HIRE_DATE)
having count(hire_date) > 1 )
order by hire_date

-- using join 

select employee_id, first_name, last_name, e1.HIRE_DATE
from employees e1, 
(select hire_date from employees  
group by (HIRE_DATE)
having count(hire_date) > 1 ) e2
where (e1.hire_date = e2.hire_Date)
order by hire_date;

-- co-related 

select e.employee_id, e.first_name, e.last_name, e.hire_date
from employees e 
where e.hire_date = (select hire_date from employees group by hire_date having count(hire_date) > 1 and hire_date = e.HIRE_DATE)























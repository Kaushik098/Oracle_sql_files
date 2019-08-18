
--Requirement:
--fetch employees in Marketing department

select * from employees e JOIN departments d
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
where d.department_name = 'Marketing';

2 records

--Requirement: Fetch the employees who get salary more that Surya

 select distinct mgr.first_name, mgr.salary
 from t_test_emp mgr 
 where salary > (select salary from t_test_emp where first_name LIKE 'Surya%')

--Requirement: Fetch the employees who are in Surya department and earn more than her
 
 select distinct mgr.first_name, mgr.salary
 from t_test_emp mgr join t_test_emp wkr
 on (mgr.EMPLOYEE_ID = wkr.MANAGER_ID and mgr.DEPARTMENT_ID = wkr.DEPARTMENT_ID)
 where mgr.salary > wkr.salary 
 and wkr.first_name LIKE 'Surya%'; 
 
select first_name, salary 
from t_test_emp 
where salary > (select salary from t_test_emp where first_name LIKE 'Surya%')
and department_id = (select department_id from t_test_emp where first_name LIKE 'Surya%')


--try out your own examples and update me - I will add

select (select sum(decode('MR', 'MRS', 2, 3))+Length('MR') from dual) from dual;

select (select first_name from employees where employee_id = 101)  employee_det from dual

select ( select decode('Hello','Hi','It is Hello and Hi', 'It is not equal') from dual) from dual

select (
select 1000 salary 
from dual
) salary
from dual;

select * from employees

--------------------------------------------------------------------------------------------

 --select employee_id, first_name, department_id, department_name from employees and departments table using sub query from clause

select e.employee_id, e.first_name, e.department_id, d.department_name
from employees e JOIN DEPARTMENTS d
on (e.department_id = d.department_id)
order by e.EMPLOYEE_ID;

- using where clause 

select e.employee_id, e.first_name, e.department_id from employees e
where e.department_id = (select department_id from departments where department_name = 'IT');

- using from clause

select employee_id, first_name, department_id, department_name from 
(
   select e.*, d.department_name from employees e JOIN departments d 
   on(e.department_id = d.department_id)
   where d.department_name = 'IT'
)

select EXTRACT(year from sysdate) from dual;
select EXTRACT(month from sysdate) from dual;
select EXTRACT(day from sysdate) from dual;

select TO_CHAR(sysdate, 'DD.MM.YYYY:HH:MI:SS') from dual;
select TO_CHAR(sysdate, 'DD.MM.YYYY:HH24:MI:SS') from dual;

select TO_CHAR('01-01-2019', 'DD.MM.YYYY:HH24:MI:SS') from dual;



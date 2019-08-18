
Sub Query - Query within a query 

Can be written in three places.
1.) In select 
2.) In where 
3.) In from 

-- Fetch the employees in department_id 20

  select * from employees
  where department_id = 20;

  select * from departments;

select * 
from employees e JOIN departments d 
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID)

employee_id, frst_name, dept_id, dept_name 

select e.employee_id, e.first_name, d.department_id, d.department_name
from employees e, departments d
where (e.department_id = d.department_id)
order by e.employee_id;
 
-- Fetch the employees in marketing department 
select  * from DEPARTMENTS;

select * 
from employees e JOIN departments d 
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
where d.DEPARTMENT_NAME = 'Marketing';

-- Fetch above query using sub query

  select * from employees
  where department_id = 20;

  select * from departments where department_name = 'Marketing';
 
  select department_id from departments where department_name = 'Marketing';

-- Sub query using where clause:
   select * from employees
   where department_id = (select department_id from departments where department_name = 'Marketing');

-- Fetch employees in dept_id 10 and 20

 select * 
 from employees 
 where DEPARTMENT_ID IN (10, 20);

-- Fetch employees in marketing and administration
 
 -- JOIN
  select e.employee_id, e.first_name, d.DEPARTMENT_ID, d.DEPARTMENT_NAME 
  from employees e, departments d
  where (e.DEPARTMENT_ID = d.department_id)
  and d.DEPARTMENT_NAME = 'Marketing'
  or d.department_name = 'Administration';

 -- Sub query 
 select * from employees 
 where department_id = (select department_id from departments where department_name in ('Marketing', 'Administration'));
  2 ORA-01427: single-row subquery returns more than one row 


 select * from employees 
 where department_id IN (select department_id from departments where department_name in ('Marketing', 'Administration'));

 select * 
 from employees 
 where DEPARTMENT_ID IN (10, 20);

 select * 
 from employees 
 where DEPARTMENT_ID = (10, 20);

select * from T_TEST_EMP;

-- Fetch the salary of surya

select salary 
from t_test_emp
where FIRST_NAME LIKE 'Surya%';

-- Fetch the details of employees getting salary more than 6000 

select *
from T_TEST_EMP
where salary > 6000;

-- Fetch the details of emp getting sal more than surya

Sub Query 

select * 
from t_test_emp 
where salary > (select salary from t_test_emp where FIRST_NAME LIKE 'Surya%')

select * from t_test_emp;
Trying above using JOIN

select e1.*
from t_test_emp e1 JOIN t_test_emp e2
on (e1.SALARY /*other emp*/ > e2.SALARY /*6000*/ and e2.first_name LIKE 'Surya%')

-- Fetch the collegues of surya 

select * from t_test_emp;

select first_name 
from T_TEST_EMP
where DEPARTMENT_ID = (select DEPARTMENT_ID from t_test_emp where FIRST_NAME LIKE 'Surya%')
and first_name <> 'Surya Java';

-- Sub query using from 

select * from (
select e1.*
from t_test_emp e1 JOIN t_test_emp e2
on (e1.department_id = e2.DEPARTMENT_ID and e2.FIRST_NAME LIKE 'Surya%')
) 
where first_name not like 'Surya%';


select * from T_TEST_EMP;  

-- Fetch the collegue of surya who are getting more salary than him

select first_name 
from T_TEST_EMP
where salary > (select salary from t_test_emp where department_id = (select department_id from t_test_emp where first_name LIKE 'Surya%'))
2 ORA-01427: single-row subquery returns more than one row

select first_name 
from T_TEST_EMP
where salary > (select salary from t_test_emp where first_name LIKE 'Surya%')
and department_id = (select department_id from t_test_emp where first_name LIKE 'Surya%')


-- try using single sub query 
-- try using join 
 select distinct mgr.first_name, mgr.salary
 from t_test_emp mgr join t_test_emp wkr
 on (mgr.EMPLOYEE_ID = wkr.MANAGER_ID and mgr.DEPARTMENT_ID = wkr.DEPARTMENT_ID)
 where mgr.salary > wkr.salary 
 and wkr.department_id = 20; 


dept id = 20 
20 th dept employees salary 

Fetch the employees who get salary more than 6000 and in department_id 20

select *
from t_test_emp
where salary > 6000 and department_id = 20;

-- Fetch the minimum salary in the company

select * from t_test_emp;

select MIN(salary)
from t_test_emp; 

-- CLue(fetch the employees who are getting salary 1000)

select * from t_test_emp where salary = 1000;

-- Fetch the employees who are getting minimum salary 

select * from T_TEST_EMP
where salary = (select min(salary) from t_test_emp);

select * from employees;

-- Fetch the employees who joined on the same day as 'Susan'

select * 
from employees 
where hire_date = (select hire_date from employees where first_name = 'Susan');

select e1.*
from employees e1 JOIN employees e2
on (e1.hire_date = e2.hire_date and e2.FIRST_NAME = 'Susan');

-- Fetch the employees who joined after susan

select * 
from employees 
where hire_date > (select  hire_date from employees where first_name = 'Susan');

select e1.* 
from employees e1 JOIN employees e2
on (e1.hire_date > e2.hire_date and e2.first_name = 'Susan')

- 102 records 



select hire_date from employees where hire_date > (select hire_date from employees where first_name = 'Susan')

-- delete the collegues of surya 

select * from t_test_emp 

select * from t_test_emp 
where department_id = (select department_id from t_test_emp where first_name LIKE 'Surya%')
and first_name not like 'Surya%'

delete from t_test_emp 
where department_id = (select department_id from t_test_emp where first_name LIKE 'Surya%')
and first_name not like 'Surya%'
2 ORA-02292: integrity constraint (HR.SYS_C007047) violated - child record found  

delete from t_test_emp 
where department_id = (select department_id from t_test_emp where first_name LIKE 'Surya%')
--and first_name not like 'Surya%'

select * from t_test_emp;
rollback;

-- update the salary of surya to all/ collegues 

update T_TEST_EMP set SALARY = (select salary from T_TEST_EMP where FIRST_NAME like 'Surya%'); 
-- using sub query in select 

select a, dummy, (select 1 from dual) tt
from (select 'a' a, dummy from dual)
where 1 = (select 1 from dual);

SELECT dummy, DECODE ((SELECT dummy FROM DUAL),
                     (SELECT dummy FROM DUAL),(SELECT 'It is X' FROM DUAL),
                     (SELECT 'It is not X' FROM DUAL)
                     ) my_decode
FROM dual;


------------------------------------------------------------------


-- Fetch the details of employee who is getting the maximum salary in the company

select * from t_test_emp;

select employee_id, first_name, salary max_salary
from t_test_emp
where salary >= (select max(salary) from t_test_emp) 

select * from (
select employee_id, first_name, max(salary) over () max_sal_employee, salary from t_test_emp
)
where salary >= max_sal_employee


select employee_id, first_name, department_id, department_name from (
    select department_id, department_name from departments where department_name = 'IT' 
)

select e.*,(select department_name from departments where department_id = e.department_id), UPPER(first_name) from employees e

select * from dual;

select dummy, (select * from dual) from dual;

select dummy, (select department_name from departments where department_id = 10) from dual;

select dummy, 1 from dual;



select SUB QUERY 

select employee_id, first_name, (select department_name from departments where department_id = e.department_id) from employees e


Fetch the department_id, department_name and count_of_emp in each department 

select e.department_id, d.department_name, count(e.department_id)
from employees e, departments d 
where (e.department_id = d.department_id)
group by (e.department_id, d.department_name)
order by department_id;


select d.department_id, d.department_name, count(e.department_id)
from t_test_emp e, t_test_dept d 
where (e.department_id(+) = d.department_id)
group by (d.department_id, d.department_name)
order by department_id;

sub query in select 


select e.department_id, 
       (select department_name from t_test_dept where department_id = e.department_id) dept_name, 
       count(e.department_id) 
from t_test_emp e
where department_id is not null
group by (e.department_id)

select d.department_id, d.department_name, (select count(department_id) from t_test_emp where department_id = d.department_id ) count_of_emp from t_test_dept d;


select d.department_id,
       d.department_name,
       (select nvl(max(salary),0) from t_test_emp where department_id = d.DEPARTMENT_ID) 
from t_test_dept d;


---------------------------------------------------------------------------------------

21/07/2019

Co- related sub query

- outer query and inner query work together in co-relation.
- you cannot run the inner query separately.

create table emp_copy as
select * from employees;

select * from emp_copy;

alter table emp_copy add (dept_name varchar2(100))

update emp_copy e set dept_name = (select department_name from departments d where d.department_id = e.department_id) 

commit;

fetch the details of employees getting the maximum salary

select * from employees 
where salary = (select max(salary) from employees);

-- using Analytical fn

select * from 
(
select e.*, max(salary) over() max_salary 
from employees e
)
where salary = max_salary;

select * from 
(
select e.*, dense_rank() over (order by salary desc) rank 
from employees e
)
where rank = 1;

-- Fetch the employees getting salary more than company's avg salary 

select avg(salary) from employees;
-- 6461

select * 
from employees 
where salary >= (select avg(salary) from employees);

-- rank, dense rank, row_number

select * from 
(
select e.*, avg(salary) over ()  avg_sal from employees e
)
where salary > avg_sal;


-- Fetch the employees getting max_sal in each dept

select * from 
(
   select e.employee_id, e.first_name, e.department_id, e.salary, max(salary) over(partition by department_id order by salary desc) max_sal
   from t_test_emp e
   order by e.department_id
)
where salary = max_sal; 


max(salary)

select * from (
select e.*, dense_rank() over(partition by department_id order by salary desc) rank from t_test_emp e
)
where rank = 1;

- correlated sub query 

select * from t_test_emp e 
where salary = (select max(salary) from t_test_emp where nvl(department_id,-999) = nvl(e.department_id,-999)) 

select * from t_test_emp;


-- Fetch the employees getting salary more than avg salary in their depart

select * from (
select e.employee_id, e.first_name, e.department_id, e.salary , avg(salary) over(partition by department_id) avg_sal from t_test_emp e
)
where salary >= avg_sal;

-- using co-related

select * from T_TEST_EMP e
where salary >= (select avg(salary) from t_test_emp where nvl(department_id,-999) = nvl(e.DEPARTMENT_ID,-999))



-- increment the salary by 500 rupees for the employees getting salary more than avg salary in their depart

-- a.)
update t_test_emp e set salary = salary+500 
where salary >= (select avg(salary) from t_test_emp where nvl(department_id,-999) = nvl(e.DEPARTMENT_ID,-999))

--b.)
update t_test_emp e set salary = salary+500 
where salary >= (select distinct avg(salary) over (partition by department_id) from t_test_emp where nvl(DEPARTMENT_ID,-999)  = nvl(e.DEPARTMENT_ID,-999))

select * from t_test_emp;
rollback;
-- try below query by updating the max salary employee department_wise 

update t_test_emp e set salary = salary+500
where salary = (select max(salary) from t_test_emp where department_id = e.DEPARTMENT_ID)

Analytical Functions

SUM() over()
MAX() over()
MIN() over()
LAG()
LEAD()
RANK()
DENSE_RANK()
ROW_NUMBER()

-- Analytical 
-- Subquery 
-- Correlated sub Query 
double the amount of salary - using correlated subquery and any other way 
job_history



-- Fetch the employees getting salary more than company's avg salary 

select * from emp_copy
where salary >= (select avg(salary) from emp_copy);
(51 recors - subQuery)

-- Fetch the employees getting max_sal in each dept

select * from emp_copy e 
where salary >= (select max(salary) from emp_copy where nvl(department_id,-999) = nvl(e.department_id,-999))
(12 records - correlated)

-- Fetch the employees getting salary more than avg salary in their depart

select  * from emp_copy e
where salary >= (select avg(salary) from emp_copy where nvl(department_id,-999) = nvl(e.department_id,-999));
(42 records - correlated)

-- increment the salary by 500 rupees for the employees getting salary more than avg salary in their depart

update emp_Copy e set salary = salary+500
where salary >= (select avg(salary) from emp_copy where department_id = e.department_id);
(42 rows updated)

rollback;

double the amount of salary where reportees are more than two - using correlated subquery and any other way 

update t_test_emp e set salary = salary*2 

update t_test_emp set salary = salary*2
where employee_id in (1,2,5); 



update t_test_emp set salary = salary*2
where employee_id in 
( 
select wkr.manager_id manager_id
from t_test_emp wkr join t_test_emp mgr
on (wkr.MANAGER_ID = mgr.EMPLOYEE_ID)
group by (wkr.manager_id, mgr.first_name)
);

select * from t_test_emp;

select * from t_test_emp e
where (select count(*) from t_test_emp where nvl(department_id,-999) = nvl(e.department_id,-999)) >= 2 
and  salary = (select max(salary) from t_test_emp where nvl(department_id,-999) = nvl(e.DEPARTMENT_ID,-999))


UPDATE t_Test_emp e
SET salary = salary * 2
WHERE 2 <= ( SELECT COUNT(*) 
           FROM t_Test_emp 
           WHERE manager_id = e.employee_id);

select * from t_test_emp 
rollback;

job_history

select * from job_history
order by employee_id;
/*
Requirement:
Select and show 
Employee_id
First_name
Department_name

of all employees from EMPLOYEES table

Seems straight forward. Twist in requirement is - 
Show department name for only those employees who have entry in JOB_HISTORY table, if the employee does not have entry then show department name as NULL

Understand JOB_HISTORY table

Try above using - JOIN and Subquery (Clue - Subquery in SELECT)
*/

select -  employee_id, First_name, Department_name
table  - employees, departments, job_history
clue   - subquery in select 







 





















 
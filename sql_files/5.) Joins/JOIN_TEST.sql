

-- Fetch the regions not having locations

select r.region_id, r.region_name, count(c.REGION_ID)
from locations l join countries c
on (l.COUNTRY_ID = c.COUNTRY_ID)
right join regions r
on (c.REGION_ID = r.REGION_ID)
group by (r.region_id, r.region_name)
having count(c.region_id) = 0;

select * from 
(
   select r.region_id, r.region_name, count(c.REGION_ID) count_of_region_id
   from locations l join countries c
   on (l.country_id = c.country_id)
   right join regions r
   on (c.REGION_ID = r.REGION_ID)
   group by (r.region_id, r.region_name)
)
where count_of_region_id = 0;

SELECT * FROM regions
WHERE region_id NOT IN (SELECT DISTINCT region_id FROM countries WHERE country_id IN (SELECT DISTINCT country_id FROM locations));


-- Fetch the managers in Sales and shipping and having less than 5 employees reporting to them

select  manager_id, manager_fname, manager_lname, count(manager_id) from (
SELECT mgr.employee_id manager_id, mgr.first_name manager_fname, mgr.last_name manager_lname,
       wkr.EMPLOYEE_ID wkr_id, wkr.FIRST_NAME wkr_fname,  d.DEPARTMENT_NAME wkr_dept_name
from employees wkr join employees mgr
on (wkr.MANAGER_ID = mgr.EMPLOYEE_ID)
join departments d
on (wkr.DEPARTMENT_ID = d.DEPARTMENT_ID)
where d.department_name in ('Shipping', 'Sales')
order by d.department_name
)
group by ( manager_id, manager_fname, manager_lname)
having count(manager_id) > 5

SELECT manager_id, count(*) FROM employees WHERE department_id in (50,80)
GROUP BY manager_id;

select * from employees where EMPLOYEE_ID = 100;
 
SELECT mgr.first_name, COUNT(*) cnt
FROM employees wkr, employees mgr, departments d
WHERE wkr.manager_id = mgr.employee_id
 AND d.department_id = mgr.department_id
 AND d.department_name IN ('Sales','Shipping')
GROUP BY mgr.first_name
HAVING COUNT(*) > 5;

select * from employees;


-- on      ()
   natural 

-- GRADE - TITLE

select  * from title;

Employee_Id	First_name	salary	grade
100	A	3000	Grade1
102	B	70000	No grade

select * from t_test_emp;

select * from title;

select employee_id, first_name, salary, nvl2(title,title,'no grade') grade
from t_test_emp e left join title t
on (e.salary between t.MIN_SAL and t.MAX_SAL)
order by 1

-- Fetch the children of departments

Parent table	 Parent column	 Child table	 Child column
Departments	   Department_id	 employees	   department_id
Departments	   Department_id	 emp_bk	     dept_id
Departments	   Department_id	 emp2	       department_id

select pt.table_name parent_table, ct.table_name child_table
from user_constraints pt join user_constraints ct
on (pt.CONSTRAINT_NAME = ct.R_CONSTRAINT_NAME)
where pt.CONSTRAINT_TYPE = 'P'
and pt.TABLE_NAME = 'DEPARTMENTS';


-- getting column name


select pt.table_name parent_table, cc.COLUMN_NAME parent_column, ct.table_name child_table, cc1.COLUMN_NAME child_column
from user_constraints pt join user_constraints ct
on (pt.CONSTRAINT_NAME = ct.R_CONSTRAINT_NAME)
join user_cons_columns cc
on (pt.CONSTRAINT_NAME = cc.CONSTRAINT_NAME)
join user_cons_columns cc1
on (ct.CONSTRAINT_NAME = cc1.CONSTRAINT_NAME)
where pt.CONSTRAINT_TYPE = 'P'
and pt.TABLE_NAME = 'DEPARTMENTS';




select * from user_constraints where table_name in ('DEPARTMENTS', 'EMPLOYEES');
select * from user_cons_columns where table_name in ('DEPARTMENTS', 'T_CONSTRAINT_COL_LEV');


select * from user_constraints where R_CONSTRAINT_NAME = 'DEPT_ID_PK';


select * from job_history;
select * from employees where employee_id IN (101,176);

-- Fetch the employees who have changed their job and the number of times they changed

select e.EMPLOYEE_ID, count(j.EMPLOYEE_ID) count_of_job_change
from employees e join job_history j
on (e.EMPLOYEE_ID = j.EMPLOYEE_ID)
group by (e.EMPLOYEE_ID)

select * from job_history where employee_id = 101;

select distinct employee_id from job_history;


--
select e.EMPLOYEE_ID, count(j.EMPLOYEE_ID) count_of_job_change
from employees e  left join job_history j
on (e.EMPLOYEE_ID = j.EMPLOYEE_ID)
group by (e.EMPLOYEE_ID)
order by 2;


select e.EMPLOYEE_ID, d.department_name, count(j.EMPLOYEE_ID) count_of_job_change
from employees e  left join job_history j
on (e.EMPLOYEE_ID = j.EMPLOYEE_ID)
join departments d
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
group by (e.EMPLOYEE_ID, d.DEPARTMENT_NAME)
order by 1;


select * from t_test_emp;

-- Fetch all the managers first name

select distinct mgr.first_name manager_fname 
from t_test_emp wkr join t_test_emp mgr
on (wkr.MANAGER_ID = mgr.EMPLOYEE_ID)

-- Fetch the employees who are not managers

select  wkr.FIRST_NAME f1_name 
from t_test_emp wkr join t_test_emp mgr
on (wkr.MANAGER_ID = mgr.EMPLOYEE_ID)
MINUS
select distinct mgr.first_name manager_fname 
from t_test_emp wkr join t_test_emp mgr
on (wkr.MANAGER_ID = mgr.EMPLOYEE_ID)

SUB QUERY + JOIN

--NOT in () - kindly check whether there is null values or not

--If null is there then change it.

select first_name from t_test_emp e
where employee_id not in (select distinct nvl(manager_id,0) from t_test_emp);

select * from t_test_emp;



















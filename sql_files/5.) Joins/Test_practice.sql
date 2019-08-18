1	Fetch the country name for Seattle City

select country_name
from locations l JOIN countries c
on (l.COUNTRY_ID = c.COUNTRY_ID)
where l.CITY = 'Seattle';

2	Fetch the count of employees in each department id	

select d.department_id, count(e.department_id) count_of_employees
from employees e join departments d
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
group by (d.department_id)
order by 1;


select d.department_id, d.department_name, count(e.department_id) count_of_employees
from employees e join departments d
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
group by (d.department_id, d.department_name)
order by 1;
					
3	Fetch the count of employees in each department name


select  d.department_name, count(e.department_id) count_of_employees
from employees e join departments d
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
group by (d.department_name)
order by 1;
					
4	Fetch the department name having less than 10 employees and order by count

select  d.department_name, count(e.department_id) count_of_employees
from employees e join departments d
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
group by (d.department_name)
having count(e.department_id) < 10
order by 1;
				
5	Fetch the count of employees under each manager id					
6	Remove NULL manager id count from above output
7	Fetch the count of employees under each manager_name					

select mgr.employee_id,  mgr.first_name, mgr.last_name, count(wkr.employee_id) count_of_employees
from employees wkr join employees mgr
on (wkr.manager_id = mgr.employee_id)
group by (mgr.employee_id, mgr.first_name, mgr.last_name)
order by mgr.employee_id;

8	Fetch the manager names having only one employee reporting to them

select mgr.employee_id,  mgr.first_name, mgr.last_name, count(wkr.employee_id) count_of_employees
from employees wkr join employees mgr
on (wkr.manager_id = mgr.employee_id)
group by (mgr.employee_id, mgr.first_name, mgr.last_name)
having count(wkr.employee_id) = 1
order by mgr.employee_id;

				
9	Fetch the manager names working in departments Shipping, Sales, Executive and having less than 8 employees reporting to them
10	Remove NULL manager id count from above output	

select mgr.employee_id mgr_id, mgr.first_name mgr_name1, mgr.last_name mgr_name2, d.DEPARTMENT_NAME
from employees wkr join employees mgr
on (wkr.manager_id = mgr.employee_id)
join departments d
on (wkr.department_id = d.department_id)
group by (mgr.employee_id,mgr.FIRST_NAME,mgr.LAST_NAME, d.DEPARTMENT_NAME)
having d.DEPARTMENT_NAME in ('Shipping','Sales','Executive')
order by (1); 

select e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME,e.MANAGER_ID, e.DEPARTMENT_ID, d.DEPARTMENT_NAME from employees e join departments d
on (e.department_id = d.department_id)
where d.department_name = 'Shipping'

select mgr.employee_id mgr_id, mgr.first_name mgr_name1, mgr.last_name mgr_name2, wkr.employee_id emp_id, wkr.first_name emp_name, 
       wkr.department_id emp_dept_id, d.DEPARTMENT_NAME wkr_dept_name
from employees wkr join employees mgr
on (wkr.manager_id = mgr.employee_id)
join departments d
on (wkr.department_id = d.department_id)
where d.DEPARTMENT_NAME in ('Shipping','Sales','Executive'); 


select e.*, e.department_id, d.department_name
from employees e join departments d
on (e.department_id = d.department_id)
where d.DEPARTMENT_NAME in ('Shipping','Sales','Executive'); 


11	Fetch the region name and postal code for Donald						

select region_name, postal_Code
from employees e join departments d 
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
join locations l 
on (d.LOCATION_ID = l.LOCATION_ID)
join countries c
on (l.COUNTRY_ID = c.COUNTRY_ID)
join regions r
on (c.REGION_ID = r.REGION_ID)
where e.first_name = 'Donald';


12	Fetch the countries having less than 10 employees						

select c.COUNTRY_NAME, count(e.employee_id) count_of_employees
from employees e join departments d 
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
join locations l 
on (d.LOCATION_ID = l.LOCATION_ID)
join countries c
on (l.COUNTRY_ID = c.COUNTRY_ID)
group by C.COUNTRY_NAME 
having count(e.employee_id) < 10

13	Fetch the department name and max of salary in each department name				

select distinct d.department_id, d.department_name, max(e.salary) over (partition by d.department_id)
from employees e, departments d 
where (e.department_id = d.department_id)
group by (d.department_id, d.department_name, salary)
order by 1;


14	Difference between ON and NATURAL JOIN						

15	dept1								
dept_no	d_name							

emp1								
emp_no	e_name	department_no						

How to join the above 2 tables using						
ON								
NATURAL JOIN								
USING								


select *
from dept1 join emp1
on (dept1.DEPT_ID = emp1.DEPARTMENT_NO)


16	Fetch the count of employees in each department name					
Expected output								
Oracle	3							
Java	3							

select d.department_name, count(e.employee_id) count_of_employees
from t_test_emp e join t_test_dept d
on (e.department_id = d.department_id)
group by d.department_name
order by 2;


17	Modify the above query to bring the below output						
Expected output								
Oracle	3							
Java	3							
Dotnet	0							

select d.department_name, count(e.employee_id) count_of_employees
from t_test_emp e join t_test_dept d
on (e.department_id(+) = d.department_id)
group by d.department_name
order by 2;

18	Add COUNT(ROWID) in above query						

select d.department_name, count(e.employee_id) count_of_employees, count(e.rowid) row_id
from t_test_emp e join t_test_dept d
on (e.department_id(+) = d.department_id)
group by d.department_name
order by 2;

select count(rowid), 1 from dual

19	Fetch COUNT of employees in each Grade						

20	Fetch the Grades which has count of employees more than 20					



21	Fetch the Grades and count of employees like below						
GRADE	Count_of_emps							
A	20							
B	45							
C	12							
…								
F	0							


22	Fetch the employees whose salary does not fall in any grade					

23	Fetch output like below							
Parent table name	   Parent column	    Child table	   Child column					
Departments	           Department_id	    employees	   department_id					
Departments	           Department_id	     emp_bk	       dept_id					
Departments

select * from user_cons_columns;

select constraint_name, constraint_type, table_name, SEARCH_CONDITION, r_constraint_name from user_constraints 
where table_name in ('EMPLOYEES','DEPARTMENTS', 'LOCATIONS')
order by 3;

select uc2.table_name 
from user_constraints uc1 join user_constraints uc2
on (uc1.R_CONSTRAINT_NAME = uc2.CONSTRAINT_NAME)
where uc1.TABLE_NAME = 'DEPARTMENTS'
and uc2.CONSTRAINT_TYPE = 'P'

select * from user_constraints where table_name in ('EMPLOYEES','DEPARTMENTS');

create table cc_employees as
select * from employees;

select * from employees;

select * from user_constraints;



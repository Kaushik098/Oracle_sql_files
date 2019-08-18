 ANSI JoinS

1. EQUII JOIN -- 95% use
  ON
  NATURAL
  USING - dont mention alias name for common columns as natural.

Using ON:

SELECT employee_id, first_name, department_id
FROM t_test_emp JOIN t_test_dept -- you can follow any order - t_test_dept JOIN t_Test_emp
ON (t_Test_emp.department_id = t_Test_dept.department_id); --you can follow any order ON (t_Test_dept.department_id = t_Test_emp.department_id)

ERROR:  2 ORA-00918: column ambiguously defined


SELECT employee_id, first_name, t_test_dept.department_id
FROM t_test_emp JOIN t_test_dept -- you can follow any order - t_test_dept JOIN t_Test_emp
ON (t_Test_emp.department_id = t_Test_dept.department_id); --you can follow any order ON (t_Test_dept.department_id = t_Test_emp.department_id)
 

-using Alias name

SELECT te.employee_id, te.first_name, td.department_id
FROM t_test_emp te JOIN t_test_dept td -- you can follow any order - t_test_dept JOIN t_Test_emp
ON (te.department_id = td.department_id); --you can follow any order ON (t_Test_dept.department_id = t_Test_emp.department_id)


SELECT *
FROM t_test_emp JOIN t_test_dept -- you can follow any order - t_test_dept JOIN t_Test_emp
ON (t_Test_emp.department_id = t_Test_dept.department_id); --you can follow any order ON (t_Test_dept.department_id = t_Test_emp.department_id)
 
-----------------------------
SELECT e.employee_id, e.first_name, e.department_id, d.department_name
FROM t_test_emp e JOIN t_test_dept d
ON (e.department_id = d.department_id)
AND d.department_id = 10;

SELECT e.employee_id, e.first_name, e.department_id, d.department_name
FROM t_test_emp e JOIN t_test_dept d
ON (e.department_id = d.department_id)
WHERE d.department_id = 10;

-----------------------------------------------------------

select * 
from locations l JOIN departments d
ON (l.location_id = d.location_id);


select l.location_id, d.department_id, d.department_name 
from locations l JOIN departments d
ON (l.location_id = d.location_id)
where d.department_id > 60;


-- Fetch employees in oracle department 

select * from t_test_emp;
select * from t_test_dept;

select * 
from t_test_emp e JOIN t_test_dept d
ON (e.department_id = d.department_id);


select * 
from t_test_emp e JOIN t_test_dept d
ON (e.department_id = d.department_id)
where d.department_name = 'Oracle';

----------------------------------------
Three Table join in ANSI

SELECT employee_id, city, department_name
FROM   employees e 
JOIN   departments d
ON     d.department_id = e.department_id 
JOIN   locations l
ON     d.location_id = l.location_id;

SELECT e.employee_id, e.first_name, d.department_id, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND l.location_id = d.location_id;

--How to compare outputs of two or more queries ?

Comparing Oracle Join and ANSI Join

-- While using union the main rule is :
- Equal number of column should be written in select.
- The output while running any one query written below should match even when we try with union set operators.

SELECT employee_id, city, department_name
FROM   employees e 
JOIN   departments d
ON     d.department_id = e.department_id 
JOIN   locations l
ON     d.location_id = l.location_id
union 
SELECT employee_id, city, department_name
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND l.location_id = d.location_id;



-- Fetch the employees working in Seattle.
SELECT employee_id, city, department_name
FROM   employees e 
JOIN   departments d
ON     d.department_id = e.department_id 
JOIN   locations l
ON     d.location_id = l.location_id
where l.city = 'Seattle';

-- Fetch the count of employees working in each city
SELECT l.city, count(*) city_count
FROM   employees e 
JOIN   departments d
ON     d.department_id = e.department_id 
JOIN   locations l
ON     d.location_id = l.location_id
group by city
order by 1;

-- using having
SELECT l.city, count(*) city_count
FROM   employees e 
JOIN   departments d
ON     d.department_id = e.department_id 
JOIN   locations l
ON     d.location_id = l.location_id
group by city
having count(*) > 20
order by 1;

select * from employees;
-- creating view

create or replace view v_city_count as 
SELECT l.city, count(*) city_count
FROM   employees e 
JOIN   departments d
ON     d.department_id = e.department_id 
JOIN   locations l
ON     d.location_id = l.location_id
group by city
having count(*) > 20
order by 1;

select * from v_city_count;

Oracle Join:
select e.* 
from employees e, departments d 
where (e.DEPARTMENT_ID = d.department_id);

ANSI JOIN(ON):
select  e.* 
from employees e JOIN departments d 
on (e.department_id = d.department_id);

ANSI JOIN(Natural)
select *
from employees NATURAL JOIN departments; 

ANSI JOIN(Using)
select * 
from employees e JOIN departments d
using (department_id);



-------------------------------------------------------------------
EQUI JOIN - Natural 

-- Natural Join will automatically identify the common column

select * 
from t_test_emp e JOIN t_test_dept d
ON (e.department_id = d.department_id);

select * 
from t_test_emp e Natural JOIN t_test_dept d;

-- Employees, Departments

select * 
from employees e JOIN departments d
ON (e.department_id = d.department_id);

select * 
from employees e Natural JOIN departments d
ON (e.department_id = d.department_id);
3 ORA-00933: SQL command not properly ended.

Correction
select * 
from employees e Natural JOIN departments d;
-- the output is very less 
Reason : It automatically check the common column and results the output.(manager_id, department_id)

-- Acts similar to above natural join because the two common columns are listed below
select * 
from employees e JOIN departments d
ON (e.department_id = d.department_id and e.manager_id = d.manager_id);

Natural Join is risky.....

-- Using where condition in natural join

  SELECT  department_id, department_name,
          location_id, city
  FROM    departments 
  NATURAL JOIN locations 
  WHERE   department_id IN (20, 50);
 

  SELECT  department_id, department_name,
          location_id, city
  FROM    departments d
  JOIN locations l
  ON ( d.location_id = l.location_id)
  WHERE   department_id IN (20, 50);
3 ORA-00918: column ambiguously defined D:\oracleLearning2019\sql\mail\ANSI Join.sql 201 11 

Difference between EQUI(ON) and EQUI(Natural):
1.) Common Column (In ON Clause we should specify common column but in natural oracle will automatically specify the common columns)

2.) Ambiguous error cause in ON clause whenever common columns are not specified with alias name (For natural join oracle will take control of 
    chosing the table for common column. We should not specify alias name for common column in natural join)

EG:
  SELECT  d.department_id, d.department_name,
          l.location_id, l.city
  FROM    departments d
  NATURAL JOIN locations l
  WHERE   department_id IN (20, 50);
 3 ORA-25155: column used in NATURAL join cannot have qualifier

-----------------------------------------------------------

27/05/2019   
a.)
--employees <=> departments
(Try to get the department name, employee id and department id)

Oracle Join (OLD Join):

select e.employee_id, d.department_name, d.department_id
from departments d, employees e
where e.department_id = d.department_id
order by 3;


ANSI JOIN(ON CLAUSE):

select e.employee_id, d.department_name, d.department_id
from departments d JOIN employees e
ON (e.department_id = d.department_id)
order by 3;

ANSI JOIN (NATURAL CLAUSE):

select employee_id, department_name, department_id
from departments d NATURAL JOIN employees e
order by 3;
-- We can't able to get the output correctly because natural join automatically detects the common column and we cannot able to declare.

b.) departments <=> locations

ORACLE JOIN:

select city 
from locations l, departments d
where l.location_id = d.location_id
order by 1;

ANSI JOIN(on):

select d.department_id, d.department_name, l.city
from locations l JOIN departments d
ON (l.location_id = d.location_id)
order by 3;

ANSI JOIN (NATURAL)

select d.department_id, d.department_name, l.city
from locations l NATURAL JOIN departments d
order by 3;

c.) Three table join:

locations<=> countries <=> regions

select l.location_id, r.region_name
from locations l, countries c, regions r
where l.country_id = c.country_id 
and c.region_id = r.region_id;
 

ANSI (ON):

select l.location_id, r.region_name
from locations l
JOIN countries c
on(l.country_id = c.country_id)
JOIN regions r
on(c.region_id = r.region_id);
 
 ANSI(NATURAL JOIN):

select l.location_id, r.region_name
from locations l
NATURAL JOIN countries c
NATURAL JOIN regions r;

-- tried three table join using Natural
select city
from employees Natural join DEPARTMENTS
Natural join Locations;

-------------------------------------------------------------------
ANSI Join - EQUI Join - USING.

Using 
a.) Half our control and half oracle control.

select * from t_test_emp 
join t_test_dept
on (t_test_emp.DEPARTMENT_ID = T_TEST_DEPT.DEPARTMENT_ID);


select * from t_test_emp 
natural join t_test_dept;

select * from t_test_emp e join t_test_dept d
using (DEPARTMENT_ID);

select e.first_name, d.department_name, department_id
from t_test_emp e Join T_TEST_DEPT d
using (department_id);

select e.first_name, d.department_name, d.department_id
from t_test_emp e Join T_TEST_DEPT d
using (department_id);

1 ORA-25154: column part of USING clause cannot have qualifier

--------------------------

Regions and Countries

select r.region_name, region_id, c.country_id
from regions r Join countries c
using (region_id);


Equii vs Natural vs Using vs old oracle Join syntax
----------------------------------------------------

SELECT *
FROM employees e JOIN departments d
on (e.department_id = d.department_id and e.manager_id = d.manager_id);

select *
from employees e  natural join departments d;

select *
from employees e JOIN departments d 
Using (department_id, manager_id);

select *
from employees e, departments d
where (e.department_id = d.department_id)
and (e.manager_id = d.manager_id);
---

Three table join using EQUI Join (USING)

select city
from employees e JOIN departments d USING (department_id)
JOIN locations l USING (location_id);

------------------------------------------------------------------------------

Equii, Natural and Using in a single query
   
SELECT *
FROM employees e 
JOIN departments d
ON (e.department_id = d.department_id)
NATURAL JOIN locations l
JOIN countries c
USING (country_id)
JOIN regions r 
USING (region_id);

-- Fetch the employee_id, first_name, salary, city, country_name

select e.employee_id, e.first_name, e.salary, l.city, c.country_name
from employees e, departments d, locations l, countries c
WHERE (e.department_id = d.department_id)
and (d.location_id = l.location_id)
and (l.country_id = c.country_id); 

select e.employee_id, e.first_name, e.salary, l.city, c.country_name
from employees e JOIN departments d
ON (e.department_id = d.department_id)
JOIN locations l
ON (d.location_id = l.location_id)
JOIN countries c
ON (l.country_id = c.country_id); 

select e.employee_id, e.first_name, e.salary, l.city, c.country_name
from employees e Natural JOIN departments d 
Natural JOIN locations l 
Natural JOIN countries c;

select e.employee_id, e.first_name, e.salary, l.city, c.country_name
from employees e JOIN departments d USING (department_id)
JOIN locations l USING (location_id)
JOIN countries c USING (country_id); 

select e.employee_id, e.first_name, e.salary, l.city, c.country_name
from employees e JOIN departments d 
ON (e.department_id = d.department_id)
JOIN locations l USING (location_id)
JOIN countries c
USING (country_id); 


select e.employee_id, e.first_name, e.salary, l.city, c.country_name
from employees e JOIN departments d 
ON (e.department_id = d.department_id)
JOIN locations l USING (location_id)
JOIN countries c
USING (country_id)
where e.employee_id IN (105,106,107);


Group by + Join 

select d.department_name, count(*) count_of_employees 
from employees e, departments d
WHERE (e.department_id = d.department_id)
group by d.department_name;

select d.department_name, count(*) count_of_employees 
from employees e JOIN departments d
ON (e.department_id = d.department_id)
group by d.department_name;


select d.department_name, count(*) count_of_employees 
from employees e NATURAL Join departments d
group by d.department_name;

select d.department_name, count(*) count_of_employees 
from employees e JOIN departments d
USING (department_id)
group by d.department_name;


select td.DEPARTMENT_NAME, count(*) count_of_employees  
from t_test_emp te, t_test_dept td
WHERE (te.DEPARTMENT_ID = td.DEPARTMENT_ID)
group by td.DEPARTMENT_Name;



select d.department_name, count(*) count_of_employees 
from employees e, departments d
WHERE (e.department_id = d.department_id)
group by d.department_name;

select d.department_name, count(*) count_of_employees 
from employees e JOIN departments d
ON (e.department_id = d.department_id)
group by d.department_name;


select d.department_name, count(*) count_of_employees 
from employees e NATURAL Join departments d
group by d.department_name;

-- usinig having

select d.department_name, count(*) count_of_employees 
from employees e JOIN departments d
USING (department_id)
group by d.department_name
having count(*) > 20
order by 2;

create or replace view emp_count
as select d.department_name, count(*) count_of_employees 
from employees e JOIN departments d
USING (department_id)
group by d.department_name
order by 2;

select * from emp_count;

-- Fetch departmentwise total salary

select *
from t_test_emp te JOIN t_test_dept td
ON (te.DEPARTMENT_ID = td.DEPARTMENT_ID);

select td.department_name, sum(salary) total_salary
from t_test_emp te JOIN t_test_dept td
ON (te.DEPARTMENT_ID = td.DEPARTMENT_ID)
group by td.department_name;

select td.department_name, sum(salary) total_salary
from t_test_emp te Natural JOIN t_test_dept td
group by td.department_name;

select td.department_name, sum(salary) total_salary
from t_test_emp te JOIN t_test_dept td
USING (DEPARTMENT_ID)
group by td.department_name;

--------------------------------------
--Trying all Group Functions

select td.department_name, sum(salary) total_salary, max(salary) max_salary, min(salary) min_salary, 
avg(nvl(salary,0)) avg_salary, count(*) count_of _employees
from t_test_emp te JOIN t_test_dept td
ON (te.DEPARTMENT_ID = td.DEPARTMENT_ID)
group by td.department_name;

-- tried in employees and departments
select d.department_name, sum(salary) total_salary, max(salary) max_salary, min(salary) min_salary, 
avg(nvl(salary,0)) avg_salary, count(*) count_of_employees
from employees e JOIN departments d
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
group by d.department_name;


select d.department_name, sum(salary) total_salary, max(salary) max_salary, min(salary) min_salary, 
avg(nvl(salary,0)) avg_salary, count(*) count_of_employees
from employees e JOIN departments d
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
where d.department_name in ('Administration','Accounting','Purchasing','Public Relations','Shipping','Sales')
group by d.department_name;

select d.department_name, sum(salary) total_salary, max(salary) max_salary, min(salary) min_salary, 
avg(nvl(salary,0)) avg_salary, count(*) count_of_employees
from employees e JOIN departments d
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
where d.department_name in ('Administration','Accounting','Purchasing','Public Relations','Shipping','Sales')
group by d.department_name;

where (d.department_name LIKE ('A%')
OR d.department_name LIKE ('P%')
OR d.department_name LIKE ('S%')); 


select d.department_name, sum(salary) total_salary, max(salary) max_salary, min(salary) min_salary, 
avg(nvl(salary,0)) avg_salary, count(*) count_of_employees
from employees e JOIN departments d
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
where d.department_name like 'A%'
group by d.department_name;
AND d.department_name LIKE ('S%')

select d.department_name, sum(salary) total_salary, max(salary) max_salary, min(salary) min_salary, 
avg(nvl(salary,0)) avg_salary, count(*) count_of_employees
from employees e JOIN departments d
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
where d.department_name in ('Administration','Accounting','Purchasing','Public Relations','Shipping','Sales')
group by d.department_name
having count(*) > 5
order by 6;

-- REQ: count > 5 and avg > 4000

select d.department_name, sum(salary) total_salary, max(salary) max_salary, min(salary) min_salary, 
avg(nvl(salary,0)) avg_salary, count(*) count_of_employees
from employees e JOIN departments d
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
where d.department_name in ('Administration','Accounting','Purchasing','Public Relations','Shipping','Sales')
group by d.department_name
having count(*) > 5 and avg(nvl(salary,0)) > 4000
order by 6;

create or replace view dname_with_cal 
as 
select d.department_name, sum(salary) total_salary, max(salary) max_salary, min(salary) min_salary, 
avg(nvl(salary,0)) avg_salary, count(*) count_of_employees
from employees e JOIN departments d
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
where d.department_name in ('Administration','Accounting','Purchasing','Public Relations','Shipping','Sales')
group by d.department_name
having count(*) > 5 and avg(nvl(salary,0)) > 4000
order by 6;

select * from dname_with_cal;

---------------------------------------------------------------

select * from jobs;
DESC Jobs;


Practise

select e.* from employees e join departments d on (e.DEPARTMENT_ID = d.DEPARTMENT_ID);

e.* and department_name

select e.*, d.department_name
from employees e JOIN departments d 
on (e.department_id = d.department_id);

select e.*, (select department_name from departments where department_id = e.department_id) from employees e; 


select * from departments d, locations l
where (d.LOCATION_ID =l.LOCATION_ID)

select * from locations l, countries c 
where (l.country_id = c.country_id)

select * from countries c, regions r
where (c.region_id = r.region_id)













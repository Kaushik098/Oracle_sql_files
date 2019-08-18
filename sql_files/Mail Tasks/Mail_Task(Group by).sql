GROUP BY				

1	Fetch COUNT of employees joined in each hire date in company 
  order by count desc			
  like				
  HIRE_DATE	COUNT(*)			
  03-Jan-15	10			
  06-Dec-14	8			

 select hire_date, count(*) count_of_employees 
 from EMPLOYEES
 group by HIRE_DATE
 order by 2 desc;


2	Add SUM of sal, AVG, MAX, MIN of sal in SELECT in above query

  select hire_date, count(*) count_of_employees_joinned, sum(salary), avg(salary), max(salary), min(salary)
  from employees
  group by HIRE_DATE
  order by 2 desc;
  
  --cross check 

select sum(salary), avg(salary), min(salary), max(salary) from employees where hire_date = '07-JUN-2002'

3	Fetch the hire dates where more than 1 employee joined the company (count > 1)
  
 select hire_date, count(*) count_of_employees 
 from EMPLOYEES
 group by HIRE_DATE
 having count(*) > 1
 order by 2 desc;
 

4	Fetch COUNT of employees joined in each hire date in company in departments 50 and 60
order by count desc			

 select hire_date, count(*) count_of_employees  
 from EMPLOYEES
 where DEPARTMENT_ID IN (50,60)
 group by HIRE_DATE
 order by 2 desc;
  
  ROW COUNT: 48

--Cross Check
  select * from employees 
  where DEPARTMENT_ID IN (50,60);

5	Add SUM of sal, AVG, MAX, MIN of sal in SELECT in above query
 
  select sum(salary), avg(salary), max(salary), min(salary) from employees 
  where DEPARTMENT_ID IN (50,60)
 
  sum : 185200 (156400 + 28800)

 --Cross Check
   select sum(salary) from employees where department_id = 50;  -- sum = 156400
  
   select sum(salary) from employees where department_id = 60;  -- sum = 28800

6	Fetch the hire dates where more than 1 employee joined the company (count > 1) in departments 50 and 60

 select hire_date, count(*) count_of_employees  
 from EMPLOYEES
 where DEPARTMENT_ID IN (50,60)
 group by HIRE_DATE
 having count(*) > 1
 order by 2 desc;
 

7	Fetch the count of employees joined in each year like	
Order the output based on COUNT desc		
Year	COUNT(*)			
1990	30			
1992	10			
2007	5			

select extract(year from hire_date) as year, count(*) count_of_employees
from EMPLOYEES
group by extract (year from HIRE_DATE)
order by 2 desc;

7b	Fetch the year where more than 20 employees joined in the company
 
select extract(year from hire_date) as year, count(*) count_of_employees
from EMPLOYEES
group by extract (year from HIRE_DATE)
having count(*) > 20
order by 2 desc;


8	Add SUM of sal, AVG, MAX, MIN of sal in SELECT in above query

select extract(year from hire_date) year, sum(salary), avg(salary), max(salary), min(salary)
from EMPLOYEES
group by extract (year from HIRE_DATE)
order by year;


9	Fetch the count of employees joined in each year in department_id 50 and 60

select extract(year from hire_date) as year, count(*) count_of_employees
from EMPLOYEES
where department_id IN (50,60)
group by extract (year from HIRE_DATE)
order by year;

10	Fetch the count of employees joined in each month like	
Order the output based on COUNT desc		
Month	COUNT(*)			
Jan	30			
Feb	10			
Mar	5			

select to_char(to_date(hire_date,'DD-MM-YYYY'),'Month') as year, count(*) count_of_employees
from EMPLOYEES
group by to_char(to_date(hire_date,'DD-MM-YYYY'),'Month')
order by count(*) desc;

-- convert month number to letters or with month name

select to_char(to_date('15-11-2010', 'DD-MM-YYYY'), 'Month') from dual;
select to_char(to_date(hire_date, 'DD-MM-YYYY'), 'Month') from employees;

11	Add SUM of sal, AVG, MAX, MIN of sal in SELECT in above query

select to_char(to_date(hire_date, 'DD-MM-YYYY'), 'Month') month, sum(salary), avg(salary), max(salary), min(salary)
from EMPLOYEES
group by to_char(to_date(hire_date, 'DD-MM-YYYY'), 'Month')
order by 1;


12	Fetch the count of employees joined in each month in department_id 50 and 60


select to_char(to_date(hire_date, 'DD-MM-YYYY'), 'Month') as month, count(*) count_of_employees
from EMPLOYEES
where department_id IN (50,60)
group by to_char(to_date(hire_date, 'DD-MM-YYYY'), 'Month')
order by 2 desc;

-- 12 month hire_date occured in hire_date in department_id (50,60)

select * from employees where department_id IN (50,60)
order by extract(month from hire_date);

13	Fetch the count of employees joined in each month in department_id 50 and 60 and fetch only those months where recruitment count > 10
ORDER BY count desc	

select to_char(to_date(hire_date, 'DD-MM-YYYY'), 'Month') as month, count(*) count_of_employees
from EMPLOYEES
where department_id IN (50,60)
group by to_char(to_date(hire_date, 'DD-MM-YYYY'), 'Month')
having count(*) >= 10
order by month desc;		

14	Try 2 level grouping, 3 level grouping in employees table and manually check the output


-- single level grouping
select manager_id,  count(*) count_of_employees_managerwise
from employees 
group by manager_id
order by manager_id;

-- two level grouping
select manager_id, department_id, count(*) managerwise_empcount, count(*) departmentwise_empcount
from employees
group by (manager_id, department_id)
order by department_id, manager_id;

-- three level grouping
select manager_id, department_id, COMMISSION_PCT, count(*) managerwise_empcount, count(*) departmentwise_empcount  
from EMPLOYEES
where commission_pct is not null
group by (manager_id, department_id, commission_pct)
having commission_pct > 0.2
order by 1;

 

15	Fetch count of employees under each manager id		

select manager_id, count(*) count_of_employees
from employees 
group by manager_id
order by manager_id;

16	Fetch the count of employees joined in leap year in each department id

SELECT DEPARTMENT_ID, COUNT(*)			
FROM employees			
WHERE MOD(TO_CHAR(hire_Date,'YYYY'),4) = 0		
GROUP BY department_id			
ORDER BY 2 DESC;			

17	Print department name in above query		

select d.department_name, count(*) count_of_employees
from employees e JOIN departments d
ON (e.department_id = d.department_id)
where MOD(TO_CHAR(hire_date,'YYYY'),4) = 0
group by department_name
order by 2 desc;

18	Requirement for this query			

-- REQ: fetching the department id and checking whether the department id is leap year or not. 

SELECT D_ID, NVL(to_char(NULLIF(COUNT(e1.employee_id),0)),'No leap year emps in dept '||d_id) status
FROM employees e1, (SELECT DISTINCT department_id D_ID FROM employees WHERE department_id IS NOT NULL) e2
WHERE e1.department_id (+) = e2.D_ID		
AND MOD(TO_CHAR(hire_Date (+),'YYYY'),4) = 0		
GROUP BY D_ID				
ORDER BY COUNT(e1.employee_id) DESC;		


19	Print like below			
department_id	description			

10	no leap year emps in 10		
20	1 leap year emps in 10		
30	no leap year emps in 30		
40	no leap year emps in 40		
50	8 leap year emps in 50

NULLIF -- two parameter( Compares two expressions and returns null if they are equal,returns the first expression if they are not equal.)
NVL    -- Converts null value to an actual value.
NVL2   -- If first expression is not null, return second expression
          --If first expression is null, return third expression. the first expression can have any data type.
COALESCE --  Return first not null expression in the expression list

/*
NULLIF(COUNT(e.EMPLOYEE_ID),0)
NVL2 (to_char( NULLIF(COUNT(e.EMPLOYEE_ID),0)), 1, null)
NVL2 ( , concat(e.employee_id),concat(' leap year emps in ', e.department_id)) , 'no leap year emps in')  
*/

SELECT D_ID, 
NVL2(to_char(NULLIF(COUNT(e1.employee_id),0)),
     concat(count(e1.EMPLOYEE_ID),concat(' leap year emps in ', e2.D_ID)),
     'No leap year emps in dept '||d_id) status
FROM employees e1, (SELECT DISTINCT department_id D_ID FROM employees WHERE department_id IS NOT NULL) e2
WHERE e1.department_id (+) = e2.D_ID		
AND MOD(TO_CHAR(hire_Date (+),'YYYY'),4) = 0		
GROUP BY D_ID				
ORDER BY D_ID;


(SELECT DISTINCT department_id D_ID FROM employees WHERE department_id IS NOT NULL)


20	Print like below			
department_id	department_name	description		

10	Administration	no leap year emps in Administration
20	Marketing	1 leap year emps in Marketing
30	Purchasing	no leap year emps in Purchasing
40	Human Resources	no leap year emps in Human Resources
50	Shipping	8 leap year emps in Shipping
120	Treasury	no emps in Treasury	
130	Corporate Tax	no emps in Corporate Tax

-- one way

select department_id, department_name, concat(count(*),concat(' no of leap year emps in ', department_name)) count_of_employees from (
    select e.department_id, d.department_name, DECODE(MOD(to_char(e.hire_date, 'yyyy'),4),0,1,0) check_leap_or_not
    from employees e RIGHT JOIN departments d 
    ON (e.department_id = d.department_id)
)
where check_leap_or_not > 0
group by (department_id,department_name)
order by 1; 

-- second way

select department_id, department_name, 
     NVL2(to_char(  NULLIF(COUNT(employee_id),0)),

     concat(count(EMPLOYEE_ID),concat(' leap year emps in ', department_name)),
     
     'No leap year emps in dept '||department_name) status 

from (
    select e.hire_date, e.employee_id, e.department_id, d.department_name
    from employees e JOIN departments d 
    ON (e.department_id = d.department_id)
)
where MOD(TO_CHAR(hire_Date,'YYYY'),4) = 0
group by (department_id,department_name)
order by 1; 



select department_id, hire_date, MOD(TO_CHAR(hire_Date,'YYYY'),4)
from (
    select e.hire_date, e.employee_id, e.department_id, d.department_name
    from employees e JOIN departments d 
    ON (e.department_id = d.department_id)
)

0        - leap
non-zero - nonleap
 
Example:

m dID
0 10  
1 10
0 10
2 10 

1 20
2 20

create table sample (dID, m) as
select 10 dID, 0 m from dual
union all 
select 10 dID, 1 m from dual
union all 
select 10 dID, 0 m from dual
union all 
select 10 dID, 2 m from dual
union all 
select 20 dID, 1 m from dual
union all
select 20 dID, 2 m from dual;

select * from sample;

select dID, count(*) leap_year_emps
from sample
group by dID;

10  4
20  2

select dID, count(mod(DECODE(m,0,0,1),4)) count_of_leap_year_emps
from sample
group by dID;

select dID, sum(mod(DECODE(m,0,0,1),4)) count_of_leap_year_emps
from sample
group by dID;

select dID, count(mod(DECODE(m,0,0,1),4)) count_of_leap_year_emps
from sample
group by dID;


m - 10 
0    1
1    0
0    1
2    0

m - 20
1    0
2    0




----------------------------------------------------------------------------------------------------------
-- find the percenatge salary of each employee comparing to whole organization.

emp_id    first_name       sal    per_sal
-------------------------------------------------
100        Steve          1000     20
101        King.          9000     30

select employee_id, first_name, salary, ROUND((salary/691416)*100,2) percentage_salary
from EMPLOYEES;

select employee_id, first_name, salary, ROUND(salary/(select sum(salary) from employees)*100,2) percentage_salary
from EMPLOYEES;

-- Results of Fetching the count of distinct hire dates in employees table

select count(distinct hire_date) from employees;



----------------------------------------------------------------------------------------------------


-- 14/06/2019

create table employees_table1 ( id integer, name varchar2(10), salary integer);

insert into employees_table1 (id, name, salary) values (10, 'Ashok', 10000);
insert into employees_table1 (id, name, salary) values (20, 'Bala', 20000);
insert into employees_table1 (id, name, salary) values (30, 'Charles', 30000);

select * from employees_table1;

create table employees_table1_retired ( id integer, name varchar2(10), salary integer);

insert into employees_table1_retired (id, name, salary) values (10, 'Ashok', 80000);
insert into employees_table1_retired (id, name, salary) values (20, 'Bala', 90000);
insert into employees_table1_retired (id, name, salary) values (30, 'Charles', 100000);

select * from employees_table1_retired;

SELECT SUM(tot_sal)
FROM
(
SELECT SUM(salary) tot_sal FROM employees_table1
UNION
SELECT SUM(salary) tot_sal FROM employees_table1_retired
);

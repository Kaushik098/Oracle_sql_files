--GROUP or AGGREGATE FUNCTION

SELECT SUM(salary) s, MIN(salary) m, MAX(salary) m2, COUNT(*) c, AVG(NVL(salary,0)) a 
FROM t_test_emp;

SELECT e.*, SUM(salary) FROM employees e;
ORA-00937: not a single-group group function


--ANALYTICAL FUNCTION
SELECT e.*, SUM(salary) OVER() s FROM T_TEST_EMP e;

SELECT e.*, MIN(salary) OVER() m, MAX(salary) OVER() m2, COUNT(*) OVER() c, AVG(nvl(salary,0))  OVER() a  FROM t_test_emp e;

SELECT e.*, MIN(salary) OVER() m, MAX(E.COMMISSION_PCT) OVER() comm, COUNT(E.EMPLOYEE_ID) OVER() c, AVG(nvl(salary,0))  OVER() a  FROM t_test_emp e;

-- Find the percentage of salary for each employee

select e.*, round((e.salary/sum(salary) over())*100,2) Percentage_salary
from T_TEST_EMP e;

select sum(percentage_salary) from (
select e.*, round((e.salary/sum(salary) over())*100,2) Percentage_salary
from T_TEST_EMP e
);

select e.*, round(e.salary/(select sum(salary) ss from T_TEST_EMP)*100,2)  Percentage_salary
from T_TEST_EMP e;

select sum(ss) from (
select e.*, round(e.salary/(select sum(salary) from T_TEST_EMP)*100,2)  ss
from T_TEST_EMP e
);

select e.EMPLOYEE_ID,
       e.salary,
       sum(salary) over() total_sal,
       round((e.salary/sum(salary) over())*100,2) percentage_sal1,       
       round(RATIO_TO_REPORT(salary) over() * 100,2) percentage_sal2
from t_test_emp e;

RANK()
DENSE_RANK()
ROW_NUMBER()

id      name        salary  department_id     rank   dense_rank  row_number
------------------------------------------------------------------------------
100     A           9000       10               1     1             1
101     B           9000       10               1     1             2
102     C           8000       20               3     2             3
103     D           7000       30               4     3             4
104     E           6000       30               5     4             5
105     F           6000       30               5     4             6
106     G           6000       10               5     4             7
107     H           5000       40               8     5             8
108     I           4000       40               9     6             9

create table empl_af as
select 100 emp_id, 'A' emp_name, 9000 salary, 10 dept_id from dual
union all 
select 100 emp_id, 'B' emp_name, 9000 salary, 10 dept_id from dual
union all 
select 100 emp_id, 'C' emp_name, 8000 salary, 20 dept_id from dual
union all 
select 100 emp_id, 'D' emp_name, 7000 salary, 30 dept_id from dual
union all 
select 100 emp_id, 'E' emp_name, 6000 salary, 30 dept_id from dual
union all 
select 100 emp_id, 'F' emp_name, 6000 salary, 30 dept_id from dual
union all 
select 100 emp_id, 'G' emp_name, 6000 salary, 10 dept_id from dual
union all 
select 100 emp_id, 'H' emp_name, 5000 salary, 40 dept_id from dual
union all 
select 100 emp_id, 'I' emp_name, 4000 salary, 40 dept_id from dual

select * from empl_af;

select e.*, 
       rank() over (order by salary desc) r1,
       dense_Rank() over (order by salary desc) r2,
       row_number() over (order by salary desc) r3
from empl_af e;


select e.*, 
       rank() over (order by salary) r1,
       dense_Rank() over (order by salary) r2,
       row_number() over (order by salary) r3
from empl_af e;


-- Fetch the details of employee getting the fifth highest salary in company.
-- Rank wise 

select * from(
select e.*, 
       rank() over (order by salary desc) r1,
       dense_Rank() over (order by salary desc) r2,
       row_number() over (order by salary desc) r3
from empl_af e)
where r1 = 5;

-- dense rank wise

select * from(
select e.*, 
       rank() over (order by salary desc) r1,
       dense_Rank() over (order by salary desc) r2,
       row_number() over (order by salary desc) r3
from empl_af e)
where r2 = 5;


-- row_number

select * from(
select e.*, 
       rank() over (order by salary desc) r1,
       dense_Rank() over (order by salary desc) r2,
       row_number() over (order by salary desc) r3
from empl_af e)
where r3 = 5;

-- Fetch the details of employees getting the sixth least salary in company

-- rank wise
select * from(
select e.*, 
       rank() over (order by salary) r1,
       dense_Rank() over (order by salary) r2,
       row_number() over (order by salary) r3
from empl_af e)
where r1 = 6;


-- dense_rank
select * from(
select e.*, 
       rank() over (order by salary) r1,
       dense_Rank() over (order by salary) r2,
       row_number() over (order by salary) r3
from empl_af e)
where r2 = 6;

-- row_number

select * from(
select e.*, 
       rank() over (order by salary) r1,
       dense_Rank() over (order by salary) r2,
       row_number() over (order by salary) r3
from empl_af e)
where r3 = 6;

-- Fetch the details of employees who joined second in the company.

select * from employees
order by hire_date;

select * from (
select e.EMPLOYEE_ID, e.FIRST_NAME, e.HIRE_DATE, 
       rank() over(order by hire_date) rank1,
       DENSE_RANK() over(order by hire_date) dense_rank1,
       row_number() over(order by hire_date) row_number1
from employees e
       )  
where rank1 = 2;


-- Fetch the details of employees who are getting the maximum salary in the company using rank 

select * from (
select e.EMPLOYEE_ID, e.FIRST_NAME, e.salary, 
       rank() over(order by salary desc) rank1,
       DENSE_RANK() over(order by salary desc) dense_rank1,
       row_number() over(order by salary desc) row_number1
from t_test_emp e
       )  
where rank1 = 1;


-- Fetch the details of employees who are getting the maximum salary in the each department in the company using rank 

select * from t_test_emp;

select e.EMPLOYEE_ID, e.department_id, e.FIRST_NAME, e.salary, 
       rank() over(partition by department_id order by salary desc) rank1,
       DENSE_RANK() over(partition by department_id order by salary desc) dense_rank1,
       row_number() over(partition by department_id order by salary desc) row_number1
from t_test_emp e

select * from 
(
select e.EMPLOYEE_ID, e.department_id, e.FIRST_NAME, e.salary, 
       rank() over(partition by department_id order by salary desc) rank1,
       DENSE_RANK() over(partition by department_id order by salary desc) dense_rank1,
       row_number() over(partition by department_id order by salary desc) row_number1
from t_test_emp e
)
where rank1 = 1;

-- Fetch the details of employees who joined second recently in each dept;

select * from 
(
select e.EMPLOYEE_ID, e.department_id, e.FIRST_NAME, e.hire_date, 
       rank() over(partition by department_id order by hire_date desc) rank1,
       DENSE_RANK() over(partition by department_id order by hire_date desc) dense_rank1,
       row_number() over(partition by department_id order by hire_date desc) row_number1
from employees e
)
where dense_rank1 = 2;

-- Task

Google for other easy analytical functions - lag, lead(find some more)
Use partition by in sum, min, max, avg, count (analytical function department wise)


LAG/Lead ( expression [, offset [, default] ] )
OVER ( [ query_partition_clause ] order_by_clause )

LAG Example(Fetched data from previous rows):
select employee_id, first_name, hire_date, LAG(hire_Date,1) over (ORDER BY hire_date) prev_hire_Date from employees;

LEAD Example(Fetches data from next rows):
select employee_id, first_name, hire_date, Lead(hire_Date,1) over (ORDER BY hire_date) next_hired_Date from employees;

select employee_id, first_name, hire_date, Lead(hire_Date,5) over (ORDER BY hire_date) next_hired_Date from employees;


-- Use partition by in sum, min, max, avg, count (analytical function department wise)

select wkr.employee_id, wkr.first_name, wkr.department_id, mgr.first_name manager_name
from t_test_emp wkr JOIN t_test_emp mgr
on (wkr.manager_id = mgr.employee_id)
order by wkr.employee_id

select employee_id, first_name, department_id, salary, sum(salary) over(partition by department_id) sum_of_sal_deptwise,
                                                       min(salary) over(partition by department_id) min_sal_deptwise,
                                                       max(salary) over(partition by department_id) max_sal_deptwise,
                                                       round(avg(salary) over(partition by department_id),2) avg_sal_deptwise,
                                                       round(ratio_to_report(salary) over(partition by department_id),2) percentage_of_sal_dept_wise
from t_test_emp order by employee_id;


select e.EMPLOYEE_ID, e.department_id, e.FIRST_NAME, e.salary, 
       rank() over(partition by department_id order by salary desc) rank1,
       DENSE_RANK() over(partition by department_id order by salary desc) dense_rank1,
       row_number() over(partition by department_id order by salary desc) row_number1
from t_test_emp e

-dept_id, dpet-name, max(salary) in particular dept

select * from t_test_emp;

select d.department_id,
       d.department_name,
       nvl((select max(salary) from t_test_emp where department_id = d.DEPARTMENT_ID),0) max_sal 
from t_test_dept d;



--------------------------------------------------------------------------------------------------------------


emp_Details
ID  FNAME   GENDER
---------------------
1   C       F
2   Z       M
3   C       F
4   D       F
5   A       M
6   A       M
7   A       F

 Expected output:
ID  FNAME   GENDER
---------------------
5   A       M
7   A       F
6   A       M
1   C       F
2   Z       M
3   C       F
4   D       F

* Gender should be shown in alternative starting with 'M' as shown above
* Fname should be sorted in ascending order under each gender 
   - e.g., order in M should be 5 A then 6 A then 2 Z
* If fname is same then it should be additionally sorted based on id in ascending under each gender

Clue - using row_number, partition by


drop table gender_play purge;
create table gender_play (id number primary key, fname varchar2(100), gender char(1));

select  * from gender_play;

insert into gender_play (id,fname,gender) values (7,'A','F');

commit;

select id, fname, gender from GENDER_PLAY where gender = 'M'
order by fname;

select id, fname, gender from GENDER_PLAY where gender = 'F'
order by fname; 

select * from GENDER_PLAY;

select id, fname, gender, row_number() over(partition by gender order by fname) row_num from gender_play
order by row_num, gender desc;










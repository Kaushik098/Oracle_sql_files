
-------------------------------------------
GROUP BY

id  name   gender degree language
------------------------------------
100 bala    M     BE      TAMIL
102 john    M     MTECH   HINDI
103 Sarala  F     BE      HINDI
104 KAvitha F     MTECH   MALAYALAM

grouping - GROUP BY
--------------------

step 1 - on what basis
step 2 - purpose of grouping


--------------------------------------------------------------
step 1 - on what basis GENDER
step 2 - purpose of grouping COUNT


gender  count
--------------
M       2
F       2

--------------------------------------------------------------
step 1 - on what basis degree
step 2 - purpose of grouping COUNT


degree count
--------------
BE      2
MTECH   2

--------------------------------------------------------------
step 1 - on what basis language
step 2 - purpose of grouping COUNT


language  count
------------------
TAMIL       1
HINDI       2
MALAYALAM   1


CONSTRAINTS
---------------
PRIMARY KEY
FOREIGN KEY
NOT NULL
CHECK
UNIQUE


CREATE TABLE grp_by
(
id NUMBER PRIMARY KEY,
name VARCHAR2(100) NOT NULL,
gender CHAR(1) CHECK (gender IN ('M','F')),
degree VARCHAR2(10) NOT NULL,
language VARCHAR2(100) NOT NULL
);

insert into grp_by values (101, 'Adam', 'm', 'BE', 'Tamil');
1 ORA-02290: check constraint (HR.SYS_C007193) violated  

insert into grp_by values (101, 'Adam', 'M', 'BE', 'Tamil');

insert into grp_by values (102, 'Mani', 'm', 'BE', null);
2 ORA-01400: cannot insert NULL into ("HR"."GRP_BY"."LANGUAGE") 

select * from grp_by; 
rollback;

insert into grp_by
select 100 id, 'Caira' name, 'F' gender, 'MTECH' degree, 'Spanish' language from dual
UNION ALL
select 101 id, 'David' name, 'M' gender, 'MTECH' degree, 'French' language from dual
union all 
select 102 id, 'Ramos' name, 'M' gender, 'BE' degree, 'Tamil' language from dual
union all 
select 103 id, 'Zampa' name, 'M' gender, 'BE' degree, 'Turkish' language from dual;
commit;
rollback;

select  language, count(*) from GRP_BY
group by gender; 

- oracle allows to select only related table while performing select operation
1 ORA-00979: not a GROUP BY expressions

SELECT gender, Count(*) from grp_by
GROUP BY gender
having count(*) >= 1;

select language, count(*) from GRP_BY
group by language;


select degree, count(*) count_of_degree from GRP_BY
group by degree order by count_of_degree;

--------------------------------------------------------------------
Group by with employees table:

select * from employees;

select department_id, count(*) from EMPLOYEES
group by department_id order by department_id;


select department_id, count(*) from EMPLOYEES
group by department_id
having count(*) > 3 
 order by department_id;

select job_id, count(*) from employees
group by job_id;


select job_id, count(*) from employees
group by job_id
having count(*) > 1;


select commission_pct, count(*) from employees
group by commission_pct;


-----------------------------------------
CREATE TABLE t_grp_example
(
 stu_name VARCHAR2(100),
 gender CHAR(1),
 city VARCHAR2(10),
 course_fees NUMBER
);

INSERT INTO t_grp_example VALUES ('Bala', 'M', 'Chennai', 1000);
INSERT INTO t_grp_example VALUES ('Suresh', 'M', 'Coimbatore', 2000);
INSERT INTO t_grp_example VALUES ('Malathy', 'F', 'Bangalore', 3000);
INSERT INTO t_grp_example VALUES ('Bindhu', 'F', 'Chennai', 4000);
INSERT INTO t_grp_example VALUES ('John', 'M', NULL, NULL);
INSERT INTO t_grp_example VALUES ('Bupesh', 'M', 'Chennai', 4000);
COMMIT;
select * from T_GRP_EXAMPLE;

select gender, count(*) from T_GRP_EXAMPLE
group by gender order by gender;

select city, count(*) from T_GRP_EXAMPLE
group by city order by city;

select city, count(*) from T_GRP_EXAMPLE
group by city order by 2 desc;

insert into t_grp_example(stu_name, gender, city, course_fees) values ('Zaire', 'M', null, 2000);
commit;
select * from T_GRP_EXAMPLE;

- Req: Fetch the count of employees in each department
 
select department_id, count(*) no_of_employees from employees
group by department_id order by no_of_employees;  

select * from employees where department_id = 100;

- Req: Fetch the count of employees under each manager

select manager_id, count(*) count_of_employees 
from employees
group by manager_id
order by manager_id;

select * from employees;

select manager_id, count(*) no_of_employees from employees
group by manager_id order by no_of_employees;

select * from employees where manager_id = 103;

- Req: Fetch the count of employees in departments 10,20,30

select department_id, count(*) no_of_employees 
from employees
where department_id in (10,20,30)
group by department_id 
order by no_of_employees;

select manager_id, count(*) no_of_employees 
from employees
where manager_id in (100,102,103)
group by manager_id 
order by no_of_employees;
 
----------------------------
--Order of Execution
/*
FROM
WHERE
GROUP BY
SELECT
ORDER BY
*/

- Fetch the max salary in each department

select salary, max(salary) from employees
group by salary;

select * from T_GRP_EXAMPLE

-- Req: Fetch the count of students in each city
select city, count(*) from t_grp_example
group by city;

--Req: Fetch the max course fees in each city
select city, max(course_fees)from T_GRP_EXAMPLE
group by city;

select city, max(course_fees)from T_GRP_EXAMPLE
group by city
having max(course_fees) > 3000;

select gender, max(course_fees)from T_GRP_EXAMPLE
group by gender;

select * from T_GRP_EXAMPLE;

-- Fetch the max salary in each department

- Step1 : department_id
- Step2 : max salary

select department_id, max(salary) from employees
group by department_id order by 2;

---------------------------------------------------

select department_id, 
 max(salary),
 min(salary),
 count(*), 
 sum(salary), 
 avg(nvl(salary,0)) 
from employees
group by department_id 
order by 1;


select department_id, 
 max(salary),
 min(salary),
 count(*), 
 sum(salary), 
 avg(nvl(salary,0)) 
from employees
group by department_id
having count(*) > 10 and avg(nvl(salary,0)) > 5000
order by 1;

select * from t_grp_example where city = 'Chennai';

-Req: Fetch the count of students in each gender in chennai

Step1 : gender
Step2 : count of students 

gender    count_of_students 
 M              2
 F              1

select gender, count(*) count_of_students
from T_GRP_EXAMPLE
where city = 'Chennai'
group by gender;

-- Fetch the count of students in city chennai gender wise. Fetch the group having 2 students. 
select gender, count(*) count_of_students
from T_GRP_EXAMPLE
where city = 'Chennai'
group by gender
having count(*) = 2
order by gender;

setserveroutput on
BEGIN

dbms_output.put_line('Hi');
dbms_output.put_line('Hello');

end;

select f_multiply(1,5,3) from dual;


-- get the count of students in each city

City       Count
--------   ------
Chennai    3
Coimbatore 1
Banglore   1
null       2

step1:  cities
step2: count of students

select city,count(*) from T_GRP_EXAMPLE
group by city order by city desc;


City       Count
--------   ------
Chennai    3
Coimbatore 1
Banglore   1
null       2

select * from t_grp_example;


Sub Grouping:
---------------

City      Gender    Count
--------   ------   ------
Chennai      F         1
Chennai      M         2

Coimbatore   M         1

Banglore     F         1

null         M         2


-- Fetch the count of students in each gender in each city

step1: city, gender
step2: count of students in each city gender wise

select city, gender, count(*) from T_GRP_EXAMPLE
group by city,gender order by gender;

-- Fetch the count of employees under each manager in each department

select count(*) from employees where manager_id = 100;

step1: manager_id, department_id
step2: count of employees under each manager

select manager_id, department_id, count(*) from employees
group by manager_id, department_id order by manager_id;

-----------------------------------------------------------------------------
HAVING: (filtering the output of group by)
- Where vs Having :
        Where - Filtering the output of table.
        Having - Filtering the output of group by.


select city,count(*) from T_GRP_EXAMPLE
group by city order by city desc;

-- REQ: Fetch the count of students in each city. Show only the cities having more than two students.
 
select city,count(*) from T_GRP_EXAMPLE
group by city
having count(*) > 2 
order by city desc;

--------------------------------------------------------

-- 16/06/19

SELECT * FROM
(
   SELECT department_id,
          SUM(DECODE(MOD(TO_CHAR(hire_date,'YYYY'),4), 0, 1, 0)) sum_leap_joiners      
   FROM EMPLOYEES
   WHERE department_id IS NOT NULL
   GROUP BY department_id
   ORDER BY department_id
)
WHERE sum_leap_joiners > 0
ORDER BY department_id;


-- 1st break down 
SELECT department_id,
       hire_date, 
       to_char(hire_date,'YYYY') yr
FROM EMPLOYEES
WHERE department_id IS NOT NULL
ORDER BY department_id;

-- 2nd 
SELECT department_id,
       hire_date, 
       to_char(hire_date,'YYYY') yr,
       MOD(to_char(hire_date,'YYYY'), 4) mod_output
FROM EMPLOYEES
WHERE department_id IS NOT NULL
ORDER BY department_id;


--3rd 
SELECT department_id,
       hire_date, 
       to_char(hire_date,'YYYY') yr,
       MOD(to_char(hire_date,'YYYY'), 4) mod_output,
       DECODE(MOD(TO_CHAR(hire_date,'YYYY'),4), 0, 1, 0) leap      
FROM EMPLOYEES
WHERE department_id IS NOT NULL
ORDER BY department_id;



------------------------------------------

Fetch the table name which has only data type as 'DATE'


select table_name, sum(decode(data_type, 'DATE', 1, 0)) count_of_data_types, count(*) count_of_columns
from user_tab_columns
group by table_name
having sum(decode(data_type, 'DATE', 1, 0)) = count(*);

select table_name, sum(decode(data_type, 'DATE', 1, 0)) count_of_data_types
from user_tab_columns
group by table_name
having sum(decode(data_type, 'DATE', 1, 0)) = count(*);

select table_name, count(decode(data_type, 'DATE', null, 0)) count_of_data_types
from user_tab_columns
group by table_name
having sum(decode(data_type, 'DATE', 1, 0)) = count(*);














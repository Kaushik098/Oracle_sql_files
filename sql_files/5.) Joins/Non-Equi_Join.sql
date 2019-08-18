Non-Equi Join:
---------------------
Select * from jobs;

select * from employees;

desc title;
select * from title;

create table title as 
select 'A' title, 1000 min_sal, 2000 max_sal from dual
union all
select 'B' title, 2001 min_sal, 3000 max_sal from dual;

select * from title;

insert into title
select 'C' title, 3001 min_sal, 4000 max_sal from dual
union all
select 'D' title, 4001 min_sal, 5000 max_sal from dual
union all 
select 'E' title, 5001 min_sal, 6000 max_sal from dual;

insert into title (title, min_sal, max_sal) values ('F', 20000, 24000);
commit;
select * from title;

drop table title;
commit;

select * from employees;

SELECT e.last_name, e.salary, j.title
FROM  employees e JOIN title j
ON e.salary BETWEEN j.min_sal AND j.max_sal;

----
select 1 from dual where 6000 between 5000 and 6000;
----

SELECT e.last_name, e.salary, j.title
FROM  employees e , title j
Where (e.salary BETWEEN j.min_sal AND j.max_sal);


-- Fetch the count of employees in each title 

select * from title;

select t.title title_name, count(*) count_of_employees  
from employees e JOIN title t
on (e.salary BETWEEN t.min_sal AND t.max_sal)
group by t.title
order by 1;

-- cross check

select count(*) from employees
where salary between 2000 and 3000;


----------------------------------------------------------------------------------

--b.) 

create table title_B as
select 'A' name, 5000 min_sal, 6000 max_sal from dual
union all 
select 'B' name, 6001 min_sal, 7000 max_sal from dual
union all 
select 'C' name, 7001 min_sal, 8000 max_sal from dual
union all
select 'D' name, 8001 min_sal, 9000 max_sal from dual;

select * from title_B;

select e.first_name, e.salary, b.name
from employees e JOIN title_B b
ON (e.salary between b.min_sal and b.max_sal);
------------------

c.) 

select * from locations;
select * from departments;

select d.DEPARTMENT_ID, d.DEPARTMENT_NAME,l.CITY
from departments d JOIN locations l 
on (d.location_id between 1800 and 2400);


d.) 

select * from regions;
select * from countries;

select c.COUNTRY_ID, c.COUNTRY_NAME, r.REGION_NAME
from countries c join regions r 
on (c.REGION_ID between 2 and 3);



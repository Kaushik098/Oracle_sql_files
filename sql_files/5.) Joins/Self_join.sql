eid  en   did   mid
1   King   -     -
2   Bala   10    1

did  dname
10    oracle 

a.) d_name         :  Bala -- oracle(department_id)
b.) manager_name   :  Bala -- emp_name(manager_id)

select d.department_name
from t_test_emp e JOIN t_test_dept d 
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
where e.FIRST_NAME = 'Bala Ora Mgr';

-- selecting manager_name 

select mgr.FIRST_NAME
from t_test_emp mgr JOIN t_test_emp wkr
on (wkr.MANAGER_ID = mgr.EMPLOYEE_ID) 
where wkr.first_name = 'Bala Ora Mgr';

-- Getting worker name and manager name

select mgr.first_name manager_name, wkr.first_name worker_name
from t_test_emp mgr JOIN t_test_emp wkr
on (wkr.manager_id = mgr.EMPLOYEE_ID);

select mgr.first_name manager_name, wkr.first_name worker_name, d.DEPARTMENT_NAME worker_deptartment_name
from t_test_emp mgr JOIN t_test_emp wkr
on (wkr.manager_id = mgr.EMPLOYEE_ID)
JOIN t_test_dept d 
on (d.DEPARTMENT_ID = wkr.DEPARTMENT_ID);

select mgr.first_name manager_name, wkr.first_name worker_name, d.DEPARTMENT_NAME manager_deptartment_name
from t_test_emp mgr JOIN t_test_emp wkr
on (wkr.manager_id = mgr.EMPLOYEE_ID)
JOIN t_test_dept d 
on (d.DEPARTMENT_ID = mgr.DEPARTMENT_ID);

select mgr.first_name manager_name, wkr.first_name worker_name, d.DEPARTMENT_NAME manager_deptartment_name
from t_test_emp mgr, t_test_emp wkr, t_test_dept d
where (wkr.manager_id = mgr.EMPLOYEE_ID)
and (d.DEPARTMENT_ID = mgr.DEPARTMENT_ID);


-- Fetch the employees reporting to king
select mgr.first_name manager_name, wkr.first_name worker_name
from t_test_emp mgr JOIN t_test_emp wkr
on (wkr.manager_id = mgr.EMPLOYEE_ID)
where mgr.first_name = 'King';




-- OLD join

select mgr.first_name manager_name, wkr.first_name worker_name
from t_test_emp mgr, t_test_emp wkr
where (wkr.manager_id = mgr.EMPLOYEE_ID)
and mgr.first_name = 'King';


-- Fetch the count of employees under each manager_id

select e.MANAGER_ID, count(*) count_of_employees
from EMPLOYEES e
group by manager_id
order by 1;

-- Fetch the count of employees undet each manager_name

select e.manager_id, m.FIRST_NAME, count(*) count_of_employees
from employees e JOIN employees m
on (e.MANAGER_ID = m.employee_id)
group by (e.manager_id, m.FIRST_NAME) 
order by 3;


select e.manager_id, m.FIRST_NAME, count(*) count_of_employees
from employees e JOIN employees m
on (e.MANAGER_ID = m.employee_id)
group by (e.manager_id, m.FIRST_NAME) 
order by 3;

-- Fetch the manager_name, manager_id, count of empl reporting to the manager

select wkr.manager_id manager_id, mgr.first_name manager_name, count(*) count_of_employees
from t_test_emp wkr join t_test_emp mgr
on (wkr.MANAGER_ID = mgr.EMPLOYEE_ID)
group by (wkr.manager_id, mgr.first_name)
order by 1;






---------------------------------------------
part_id part_name sub_part_id
------------------------------
1       tyre        
2       tube        1
3       spoke       1

-- creation and insertion of vehicle 
create table vehicle (part_id number, part_name varchar2(20), sub_part_id number);

select * from vehicle;

insert into vehicle 
select 1 part_id, 'tyre' part_name, null sub_part_id from dual;

insert into vehicle 
select 2 part_id, 'tube' part_name, 1 sub_part_id from dual;

insert into vehicle 
select 3 part_id, 'spoke' part_name, 1 sub_part_id from dual;

insert into vehicle 
select 4 part_id, 'seat' part_name, null sub_part_id from dual
union all 
select 5 part_id, 'front seat' part_name, 4 sub_part_id from dual
union all 
select 6 part_id, 'back seat' part_name, 4 sub_part_id from dual;



-- Working with vehicle

select * from vehicle;


select mp.part_name
from vehicle mp join vehicle sp
on (mp.PART_ID = sp.SUB_PART_ID);

select mp.part_name
from vehicle mp join vehicle sp
on (mp.PART_ID = sp.SUB_PART_ID)
where sp.PART_NAME = 'spoke';

select mp.part_name
from vehicle mp join vehicle sp
on (mp.PART_ID = sp.SUB_PART_ID)
where sp.PART_NAME = 'tube';

select mp.part_name
from vehicle mp join vehicle sp
on (mp.PART_ID = sp.SUB_PART_ID)
where sp.PART_NAME = 'front seat';


item_id item_name       sub_item_id
-------------------------------------
1       burger combo
2       burger          1
3       chicken fry     1
4       sauce           1 


-- creation and insertion 
create table junk_food (item_id number, item_name varchar2(100), sub_item_id number);


insert into junk_food
select 1 item_id, 'burger combo' item_name, null sub_item_id from dual
union ALL
select 2 item_id, 'burger' item_name, 1 sub_item_id from dual
union all 
select 3 item_id, 'chicken fry' item_name, 1 sub_item_id from dual
union all 
select 4 item_id, 'sauce' item_name, 1 sub_item_id from dual; 

select * from junk_food;

-- working with junk food

select mi.ITEM_NAME
from junk_food mi join junk_food si
on (mi.ITEM_ID = si.SUB_ITEM_ID);


select mi.ITEM_NAME
from junk_food mi join junk_food si
on (mi.ITEM_ID = si.SUB_ITEM_ID)
where si.ITEM_NAME = 'burger';

Practice:

select * from t_test_emp;
select * from t_test_dept;


select mgr.employee_id, mgr.first_name manager_nme,wkr.EMPLOYEE_ID worker_employee_id, wkr.FIRST_NAME worker_name 
from t_test_emp wkr JOIN t_test_emp mgr
on (wkr.manager_id = mgr.EMPLOYEE_ID)




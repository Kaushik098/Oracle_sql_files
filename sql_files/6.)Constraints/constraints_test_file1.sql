
CREATE TABLE t_test_pk1    
(
    employee_id number constraint pk_t_test_emp_id primary key,
    first_name VARCHAR2(100) constraint nn_t_test_fn not null,
    salary NUMBER constraint chk_t_test_sal CHECK(salary > 0) constraint nn_t_test_sal not null,
    e_pin NUMBER constraint nn_t_test_epin not null constraint uq_t_test_epin unique
);

-- Req: 

select * from user_constraints where table_name = 'T_TEST_PK1';

select * from USER_CONS_COLUMNS where table_name = 'T_TEST_PK1';

select uc.constraint_name, uc.table_name, uc.constraint_type, uc.r_constraint_name, uc.status, uc.search_condition, cc.column_name, cc.position     
from user_constraints uc, user_cons_columns cc 
where (uc.constraint_name = cc.constraint_name)
and (uc.table_name = cc.table_name)
and uc.table_name = 'T_TEST_PK1';


-- REQ: Drop the not null for epin

alter table t_test_pk1 drop constraint nn_t_test_epin;
select * from t_test_pk1;
insert into t_test_pk1 (employee_id, first_name, salary, e_pin) values 
                       (101, 'Amir', 1000, '999901');

insert into t_test_pk1 (employee_id, first_name, salary, e_pin) values 
                       (102, 'Amir', 1000, null);

commit;

insert into t_test_pk1 (employee_id, first_name, salary, e_pin) values 
                       (103, 'Casy', 1000, null);

alter table t_test_pk1 add constraint nn_t_test_epin check (e_pin is not null);

update t_test_pk1 set e_pin = 98001  
where employee_id = 103;

commit;

select * from t_test_pk1;

alter table t_test_pk1 add emp_department number constraint r_t_test_emp_dept references departments (department_id); 

-- Fetch the children of departments using sub_query


select * 
from user_constraints 
where table_name IN ('T_TEST_PK1','DEPARTMENTS');
 
select table_name
from user_constraints 
where r_constraint_name = (select constraint_name from user_constraints where table_name = 'DEPARTMENTS' and constraint_type = 'P');


---------------------------------------------------------------------------------------------------


create table mother_dairy_employees (m_emp_id number constraint pk_mother_dairy_emp_id primary key, 
                                     m_emp_name varchar2(100) constraint nn_mother_dairy_ename not null,
                                     m_salary number constraint chk_mother_dairy_salary CHECK (m_salary > 0),
                                     m_email_id varchar2(100) constraint nn_mother_dairy_email_id not null constraint uq_mother_dairy_emp_id unique);

select * from user_constraints where table_name = 'MOTHER_DAIRY_EMPLOYEES';

-- Possitive scenario
insert into mother_dairy_employees (m_emp_id, m_emp_name, m_Salary, m_email_id)
values (1001, 'Vishnu', 3000, 'vichu@gmail.com');

select * from mother_dairy_employees;

-- negative scenario 

-- primary key 
insert into mother_dairy_employees (m_emp_id, m_emp_name, m_Salary, m_email_id)
values (null, 'Vishnu', 3000, 'vichu@gmail.com');
1 ORA-01400: cannot insert NULL into ("HR"."MOTHER_DAIRY_EMPLOYEES"."M_EMP_ID") SQL.sql 82 9 

insert into mother_dairy_employees (m_emp_id, m_emp_name, m_Salary, m_email_id)
values (1001, 'Vishnu', 3000, 'vichu@gmail.com');
1 ORA-00001: unique constraint (HR.PK_MOTHER_DAIRY_EMP_ID) violated SQL.sql 84 1 

-- Adding column departments and adding constraints references 

alter table mother_dairy_employees add m_dept_id constraint r_mother_dairy_deptID references departments (department_id);

select * from user_constraints where table_name = 'MOTHER_DAIRY_EMPLOYEES';
select * from user_cons_columns where table_name = 'MOTHER_DAIRY_EMPLOYEES';

select table_name 
from user_constraints 
where r_constraint_name = (select constraint_name from user_constraints where table_name = 'DEPARTMENTS' and  constraint_type = 'P');

update MOTHER_DAIRY_EMPLOYEES set m_email_id = 'vichu12@gmail.com' where m_emp_id = 1001;

select * from MOTHER_DAIRY_EMPLOYEES;

-------------------------

S_id  Test1  Test2   Test3
-----------------------------------------
1         50        80       45
2         70        40       90


create table test_val (s_id number primary key, test1 number, test2 number, test3 number);

insert into test_val values (1, 50,80,45);
insert into test_val values (2, 70,40,90);

select * from test_val;

SQL requirement:
Fetch the highest and lowest marks of students like below


Expected output:

S_id    highest    lowest
--------------------------------------
1          80             45
2          90             40

select * from test_val;

select s_id, 
from test_val
where s_id = 1;

















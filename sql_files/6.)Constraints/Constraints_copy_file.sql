
CONSTRAINTS in Oracle
-----------------------------------------
PRIMARY KEY
FOREIGN KEY (References)
NOT NULL
UNIQUE
CHECK

Example 1:

CREATE TABLE employees123
(
  employee_id NUMBER PRIMARY KEY,
  first_name VARCHAR2(100) NOT NULL,
  salary NUMBER CHECK (salary > 0) NOT NULL,
  department_id NUMBER REFERENCES departments(department_id),
  mobile_no NUMBER UNIQUE CHECK (LENGTH(mobile_no) = 10)
);

insert into employees123 values (101, 'Akash', 10000, 10, 9998887770);
commit;

select * from employees123;

Neg_Scenario:

--violating primary key
insert into employees123 values (101, 'Bala', 9000, 20, 9998887760);
1 ORA-00001: unique constraint (HR.SYS_C007350) violated

-- violating not null
insert into employees123 values (102, null, 8000, 30, 9997776660);
1 ORA-01400: cannot insert NULL into ("HR"."EMPLOYEES123"."FIRST_NAME") 

Salary
-- a. violating check constraint
insert into employees123 values (103, 'Chandru', 0, 90, 9997776661);
1 ORA-02290: check constraint (HR.SYS_C007348) violated 

b.) not null
insert into employees123 values (103, 'Chandru', null, 90, 9997776661);
1 ORA-01400: cannot insert NULL into ("HR"."EMPLOYEES123"."SALARY") 


-- violating foriegn key
insert into employees123 values (104, 'Chandru', 6000, 900, 9997776600); 
1 ORA-02291: integrity constraint (HR.SYS_C007352) violated - parent key not found 

- checking positive scenario for departments 
insert into employees123 values (104, 'Chandru', 6000, null, 9997776600); 


-- violating unique and check constraint

 a.) unique
insert into employees123 values (104, 'Chandru', 6000, 900, 9997776600); 
1 ORA-00001: unique constraint (HR.SYS_C007350) violated 

b.) check 
insert into employees123 values (105, 'David', -10, 900, 999777660); 
1 ORA-02290: check constraint (HR.SYS_C007349) violated

insert into employees123 values (105, 'David', 10, 90, null); 

select * from employees123;

>  select * from user_constraints where table_name = 'EMPLOYEES123';

  select * from user_cons_columns where table_name = 'EMPLOYEES123';

select uc.R_CONSTRAINT_NAME, uc.CONSTRAINT_TYPE, uc.SEARCH_CONDITION,cc.constraint_name, cc.table_name, cc.COLUMN_NAME, cc.POSITION
from user_constraints uc JOIN USER_CONS_COLUMNS cc
on (uc.TABLE_NAME = cc.TABLE_NAME
and uc.CONSTRAINT_NAME = cc.CONSTRAINT_NAME)
where uc.TABLE_NAME = 'EMPLOYEES123'


-------------------------------------------------------------------------------

CREATE TABLE employees321
(
  employee_id NUMBER PRIMARY KEY,
  first_name VARCHAR2(100) NOT NULL,
  salary NUMBER CHECK (salary > 0) NOT NULL,
  department_id NUMBER REFERENCES departments(department_id) not null,
  mobile_no NUMBER UNIQUE CHECK (LENGTH(mobile_no) = 10) not null
);

Neg_Scenario:

a.) departments:
    insert into employees321 values (103, 'Vishnu', 10, null, 9999000011); 
    1 ORA-01400: cannot insert NULL into ("HR"."EMPLOYEES321"."DEPARTMENT_ID") 

select * from employees321;

b.) mobile 
    insert into employees321 values (104, 'David', 10, 90, null); 
    1 ORA-01400: cannot insert NULL into ("HR"."EMPLOYEES321"."MOBILE_NO") 


select uc.R_CONSTRAINT_NAME, uc.CONSTRAINT_TYPE, uc.SEARCH_CONDITION,cc.constraint_name, cc.table_name, cc.COLUMN_NAME, cc.POSITION
from user_constraints uc JOIN USER_CONS_COLUMNS cc
on (uc.TABLE_NAME = cc.TABLE_NAME
and uc.CONSTRAINT_NAME = cc.CONSTRAINT_NAME)
where uc.TABLE_NAME = 'EMPLOYEES321'


-----------------------------------------------------------------------------
select * from departments;
Example 2:

CHECK CONSTRAINT EXAMPLE
-------------------------
DROP TABLE t_test_check PURGE;
CREATE TABLE t_test_check
(
 id NUMBER PRIMARY KEY,
 first_name VARCHAR2(100),
 mobile_no NUMBER CHECK(LENGTH(mobile_no) = 10),
 gender CHAR(1) CHECK(gender IN ('M','F')),
 rep_id VARCHAR2(10) CHECK (rep_id LIKE 'REP\_%' ESCAPE '\'),
 salary NUMBER,
 CHECK (8000 <= CASE WHEN gender = 'M' THEN salary + 500  ELSE salary  END)
);

update T_TEST_CHECK set mobile_no = 9988221100;
update T_TEST_CHECK set mobile_no = 998822110;
4 ORA-02290: check constraint (HR.SYS_C007382) violated 

Positive_input
insert into t_test_check values (100, 'Shamir', 9988776655, 'M', 'REP_MGMT', 8000);
insert into t_test_check values (101, 'Shamira', 9988776654, 'F', 'REP_MGMT', 8000);
insert into t_test_check values (102, 'Rakshitha', 9988776674, 'M', 'REP_MGMT', 7500);

commit;
select * from t_test_check;

select * from user_constraints where table_name = 'T_TEST_CHECK';
a.) ID:

-- violating primary key for ID
insert into t_test_check values (102, 'Rakshitha', 9988776674, 'M', 'REP_MGMT', 7500);
1 ORA-00001: unique constraint 


-- violating not null
insert into t_test_check values (null, 'Rakshitha', 9988776674, 'M', 'REP_MGMT', 7500); 
1 ORA-01400: cannot insert NULL into ("HR"."T_TEST_CHECK"."ID")

b.)Mobile number

-- violating check 
insert into t_test_check values (103, 'Gambir', 978787980, 'M', 'REP_PG', 9000);
1 ORA-02290: check constraint (HR.SYS_C007382) violated 

c.) Gender

-- violating check by entering gender as 'O'
insert into t_test_check values (103, 'Gambir', 9787879800, 'O', 'REP_PG', 9000);
1 ORA-02290: check constraint (HR.SYS_C007383) violated
 
d.) REP_ID

--violating 
insert into t_test_check values (103, 'Gambir', 9787879800, 'M', 'REPPG', 9000);
1 ORA-02290: check constraint (HR.SYS_C007384) violated 

e.) Salary

-- Salary should be atleast 8000.
-- If male's salary is less than 8000 we can check whether the male's salary will reaach 8000 when adding 500 to his salary. If it reaches
8000 or above then row will be inserted.
-- If Female salary is less than 8000 the row will not be inserted. If salary is 8000 or more row will be inserted.
 
 Positive_Scenario:
 --M
 insert into t_test_check values (103, 'Gambir', 9988776688, 'M', 'REP_MGMT', 7500);

 --F
 insert into t_test_check values (104, 'Manimegalai', 9988776651, 'F', 'REP_MGMT', 8000);
select * from t_test_check; 

 Negative_Scenario:
 --M
insert into t_test_check values (105, 'Thakur', 9988771188, 'M', 'REP_MGMT', 7300);
1 ORA-02290: check constraint (HR.SYS_C007385) violated 

--F

insert into t_test_check values (106, 'Yazhini', 9988771189, 'F', 'REP_ID', 7500);
1 ORA-02290: check constraint (HR.SYS_C007385) violated 

 Questions:
 1) Will the above insert work? If not why?
 2) Why is the last CHECK constraint created separately in the above table creation?
 3) Why do we use ESCAPE generally in Oracle and why it is used in above table creation?
 4) What is the use of PURGE?
 
 
 * Analyze the purpose of other CHECK constraints used in the above table creation
 * Try out in system and analyze various success and failure (error) insert scenarios for above table - for better understanding and for answering the questions

--------------------------------------

Find the child tables of departments 

--a.) SUB QUERY
select * from
(
select uc.table_name
from user_constraints uc
where UC.R_CONSTRAINT_NAME = 'DEPT_ID_PK'
)

--b.) 
select table_name
from user_constraints uc
where UC.R_CONSTRAINT_NAME = (select constraint_name from user_constraints where table_name = 'DEPARTMENTS' and constraint_type = 'P')

SELECT * FROM user_constraints WHERE r_constraint_name = (/*parent table*/SELECT constraint_name FROM user_constraints WHERE 
                                                           table_name = 'DEPARTMENTS' AND constraint_type = 'P');

-- SELF JOIN
select *
from user_constraints uc1 JOIN user_constraints uc2 
on (uc1.R_CONSTRAINT_NAME = uc2.CONSTRAINT_NAME)
where uc2.TABLE_NAME = 'DEPARTMENTS' and uc2.CONSTRAINT_TYPE = 'P'

select * from user_constraints where table_name = 'DEPARTMENTS'
select * from user_constraints where table_name = 'EMPLOYEES'
-----------------------------------------------------------------

--You can name a constraint, or the Oracle server generates a name by using the SYS_Cn format.
--drop the table and create again with proper constraint names
--best practice
--follow naming standards
select * from t_constraint_test;
DROP TABLE t_constraint_test; --note: when you drop a table, the data in it will also be lost
CREATE TABLE t_constraint_test --table name, constraint name, column name should not exceed 30 characters
(
 emp_no NUMBER CONSTRAINT pk_t_cons_test__emp_no PRIMARY KEY, --------------rule1 constraint1
 ename VARCHAR2(100) CONSTRAINT nn_t_cons__test_ename NOT NULL, --------------rule2 constraint2
 hire_date DATE DEFAULT SYSDATE,
 salary NUMBER CONSTRAINT chk_t_cons__test_sal CHECK (salary>0), ----------------rule3 constraint3
 commission_pct NUMBER,
 dept_no NUMBER CONSTRAINT fk_t_cons__test_dept_no REFERENCES departments(department_id), ---------------------rule4 constraint4
 city VARCHAR2(100) DEFAULT 'CHENNAI',
 email_id VARCHAR2(100) CONSTRAINT uk_t_cons__test_email UNIQUE -------------rule5 constraint5
);

-- Without constraint name 
CREATE TABLE t_constraint_test --table name, constraint name, column name should not exceed 30 characters
(
 emp_no NUMBER  PRIMARY KEY, --------------rule1 constraint1
 ename VARCHAR2(100)  NOT NULL, --------------rule2 constraint2
 hire_date DATE DEFAULT SYSDATE,
 salary NUMBER  CHECK (salary>0), ----------------rule3 constraint3
 commission_pct NUMBER,
 dept_no NUMBER REFERENCES departments(department_id), ---------------------rule4 constraint4
 city VARCHAR2(100) DEFAULT 'CHENNAI',
 email_id VARCHAR2(100)  UNIQUE -------------rule5 constraint5
);

Common column names: 'constraint_name' and 'table_name'
 
select * from user_constraints where table_name = 'T_CONSTRAINT_TEST'; 
select * from user_cons_columns where table_name = 'T_CONSTRAINT_TEST';
select * from user_cons_columns where table_name = 'EMP_SKILLS';

SELECT  u.table_name,
       u.constraint_name, 
       u.constraint_type, 
       u.search_condition, 
       u.r_constraint_name, 
       uc.column_name, 
       uc.position
FROM user_constraints u, user_cons_columns uc
WHERE u.constraint_name = uc.constraint_name
 AND u.table_name = uc.table_name
 AND u.table_name = 'EMPLOYEES'
 ORDER BY u.constraint_type,u.constraint_name,uc.position;


SELECT  u.table_name,
       u.constraint_name, 
       u.constraint_type, 
       u.search_condition, 
       u.r_constraint_name, 
       uc.column_name, 
       uc.position
FROM user_constraints u, user_cons_columns uc
WHERE u.constraint_name = uc.constraint_name
 AND u.table_name = uc.table_name
 AND u.table_name = 'EMP_SKILLS'
 ORDER BY u.constraint_type,u.constraint_name,uc.position;






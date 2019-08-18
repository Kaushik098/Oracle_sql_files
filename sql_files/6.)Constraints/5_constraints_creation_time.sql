/*
Types of constraints
--------------------
NOT NULL
UNIQUE
PRIMARY KEY
FOREIGN KEY
CHECK
*/

--constraints (rules)
/*
Constraints can be created:
- At the same time as the creation of the table
  - column level
  - table level
- After the creation of the table

*/

--Constraints can be created:
-- * At the same time as the creation of the table
-- * column level

DROP TABLE t_constraint_col_level;
CREATE TABLE t_constraint_col_lev --table name, constraint name, column name should not exceed 30 characters
(
  emp_no NUMBER CONSTRAINT pk_t_cons_test_emp_no PRIMARY KEY, --------------rule1 constraint1
  ename VARCHAR2(100) CONSTRAINT nn_t_cons_test_ename NOT NULL, --------------rule2 constraint2
  hire_date DATE DEFAULT SYSDATE,
  salary NUMBER CONSTRAINT chk_t_cons_test_sal CHECK (salary>0), ----------------rule3 constraint3
  commission_pct NUMBER,
  dept_no NUMBER CONSTRAINT fk_t_cons_test_dept_no REFERENCES departments(department_id), ---------------------rule4 constraint4
  city VARCHAR2(100) DEFAULT 'CHENNAI',
  email_id VARCHAR2(100) CONSTRAINT uk_t_cons_test_email UNIQUE -------------rule5 constraint5
);

select * from T_CONSTRAINT_COL_LEV;
--------------------------------------------------------------------------------
ORA : 00904
--The column name must begin with a letter.
--The column name can not be longer than 30 characters.
--The column name must be made up of alphanumeric characters or the following special characters: $, _, and #. If the column name uses any other characters, it must be enclosed in double quotation marks.
--The column name can not be a reserved word.

-- * At the same time as the creation of the table
-- * table level
DROP TABLE tctl;
CREATE TABLE tctl --table name, constraint name, column name should not exceed 30 characters
(
  emp_no NUMBER, --------------rule1 constraint1
  ename VARCHAR2(100), --------------rule2 constraint2
  hire_date DATE DEFAULT SYSDATE,
  salary NUMBER, ----------------rule3 constraint3
  commission_pct NUMBER,
  dept_no NUMBER, ---------------------rule4 constraint4
  city VARCHAR2(100) DEFAULT 'CHENNAI',
  email_id VARCHAR2(100), -------------rule5 constraint5
  --adding table level constraints
 CONSTRAINT pk_tctl_eno PRIMARY KEY (emp_no),
 -- CONSTRAINT nn_tctl_ename NOT NULL (ename)
 CONSTRAINT nn_tctl_ename CHECK (ename is not null),
 CONSTRAINT chk_tctl_sal CHECK (salary>0),
 CONSTRAINT fk_tctl_dept_no FOREIGN KEY (dept_no) REFERENCES departments(department_id), 
 CONSTRAINT uk_tctl_email UNIQUE (email_id)
);

select * from tctl; 
select * from user_constraints where table_name = 'TCTL';
--what is the error?

-Exceeds more than 30 characters. Hence, changed the column name from t_constraints_tab_level to tctl
 -CONSTRAINT nn_tctl_ename NOT NULL (ename) (Resulting error)
--correct it
--------------------------------------------------------------------------------
-- After the creation of the table
--assume, they created table 3 months before without adding any rules/constraints
DROP TABLE t_constraint_after_tab;
CREATE TABLE t_constraint_after_tab --table name, constraint name, column name should not exceed 30 characters
(
  emp_no NUMBER, --------------rule1 constraint1
  ename VARCHAR2(100), --------------rule2 constraint2
  hire_date DATE DEFAULT SYSDATE,
  salary NUMBER, ----------------rule3 constraint3
  commission_pct NUMBER,
  dept_no NUMBER, ---------------------rule4 constraint4
  city VARCHAR2(100) DEFAULT 'CHENNAI',
  email_id VARCHAR2(100) -------------rule5 constraint5
);


select *  from t_constraint_after_tab;

--Now the requirement is to add constraints without dropping and recreating the table
--After the creation of the table

ALTER TABLE t_constraint_after_tab ADD CONSTRAINT pk_t_cons_after_tab_emp_no PRIMARY KEY (emp_no);

select * from user_constraints where table_name = 'T_CONSTRAINT_AFTER_TAB';

ALTER TABLE t_constraint_after_tab ADD CONSTRAINT nn_t_cons_after_tab_ename NOT NULL (ename);
--what is the error?
2 ORA-00904: : invalid identifier 
--how to add NOT NULL?   (ALTER TABLE mytable MODIFY mycolumn NOT NULL NOVALIDATE)
--indirectly
ALTER TABLE t_constraint_after_tab ADD CONSTRAINT chk_t_cons_after_ename CHECK (ename IS NOT NULL);

ALTER TABLE t_constraint_after_tab ADD CONSTRAINT chk_t_cons_after_sal CHECK (salary>0);
ALTER TABLE t_constraint_after_tab ADD CONSTRAINT fk_t_cons_after_dept_no FOREIGN KEY (dept_no) REFERENCES departments(department_id);
ALTER TABLE t_constraint_after_tab ADD CONSTRAINT uk_t_cons_after_email UNIQUE (email_id);

--all these are DDLs
--------------------------------------------------------------------------------
--try to violate each constraint and check - during INSERT and UPDATE
--try DISABLE/ENABLE constraint
--try DROPPING constraint
--------------------------------------------------------------------------------

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'T_CONSTRAINT_TEST';
ALTER TABLE t_constraint_test DISABLE CONSTRAINT SYS_C007446;

--Checking after diabling 
insert into t_constraint_test (emp_no, ename, hire_date, salary, commission_pct, dept_no, email_id) values (1011, null, '10-JUL-2010', 2000, 2, 60, 'King123@gmail.com')
select * from t_constraint_test;

-- while enabling it will throw an error as "Check constraint violated"
--Hence dropping and re-creating
 
ALTER TABLE t_constraint_test ENABLE CONSTRAINT SYS_C007451;
1 ORA-02293: cannot validate (HR.SYS_C007446) - check constraint violated 

(
drop table t_constraint_test;
ALTER TABLE t_constraint_test DROP CONSTRAINT SYS_C007456;
)



--------------------------------

Column wise

create table tt01( emp_id number constraint eID primary key , 
                   emp_name varchar2(10) constraint ename not null);

create table tt02(emp_id number, emp_name varchar2(10),
                  constraint emp_id primary key (emp_id),
                  constraint emp_name unique (emp_name));

create table tt03( emp_id number constraint e_ID primary key , 
                   emp_name varchar2(10) constraint e_name not null unique);


create table tt02(emp_id number, emp_name varchar2(10),
                  constraint emp_id primary key (emp_id),
                  constraint emp_name not null unique (emp_name));


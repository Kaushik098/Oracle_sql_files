Disable/Enable Constraints:

alter table t_constraint_test disable constraint pk_t_cons_test_emp_no;
 
select * from user_constraints where table_name = 'T_CONSTRAINT_TEST'

select * from t_constraint_test;


insert into t_constraint_test (emp_no, ename, hire_date, salary, commission_pct, dept_no, city, email_ID) values 
            (1001, 'Danie', '01-JAN-2012', 2000, 2, 100, 'Washington DC', 'ruise@gmail.com');

-- After disabling primary key checking negative scenarios

insert into t_constraint_test (emp_no, ename, hire_date, salary, commission_pct, dept_no, city, email_ID) values 
            (null, 'Danie', '01-JAN-2012', 2000, 2, 100, 'Washington DC', 'cruise@gmail.com');

insert into t_constraint_test (emp_no, ename, hire_date, salary, commission_pct, dept_no, city, email_ID) values 
            (1001, 'Danie', '01-JAN-2012', 2000, 2, 100, 'Washington DC', 'Cruise@gmail.com');

alter table t_constraint_test enable constraint pk_t_cons_test_emp_no; 
(Refer down)
1 ORA-02437: cannot validate (HR.PK_T_CONS_TEST_EMP_NO) - primary key violated D
Cause : You tried to enable a primary key constraint, but the columns in the primary key either contained NULL values or duplicates.

rollback;

drop table t_constraint_test;

select * from t_constraint_test;
select rowID, e.* from t_constraint_test e;

delete from t_constraint_test where EMP_NO IS null;
delete from t_constraint_test where rowID = 'AAAFiDAAEAAAAUUAAC';
commit;

alter table t_constraint_test enable constraint pk_t_cons_test_emp_no;


Positive Scenario

insert into t_constraint_test (emp_no, ename, salary, commission_pct, dept_no, city, email_ID) values 
            (1002, 'Danie', 3000, 2, 110, 'Washington DC', 'ramos@gmail.com');
commit;

select * from t_constraint_test;
Negative Scenario

insert into t_constraint_test (emp_no, ename, salary, commission_pct, dept_no, city, email_ID) values 
            (null, 'Danie', 2000, 2, 100, 'Washington DC', 'abc@gmail.com');
            1 ORA-01400: cannot insert NULL into ("HR"."T_CONSTRAINT_TEST"."EMP_NO")


insert into t_constraint_test (emp_no, ename,  salary, commission_pct, dept_no, city, email_ID) values 
            (1002, 'Danie',  2000, 2, 100, 'Washington DC', 'Cruise@gmail.com');
            1 ORA-00001: unique constraint (HR.PK_T_CONS_TEST_EMP_NO) violated 



-- Check the status coulmn in user_constraints table to check whether the constraint is enabled or disabled.
alter table t_constraint_test disable constraint pk_t_cons_test_emp_no;
 
select * from user_constraints where table_name = 'T_CONSTRAINT_TEST'


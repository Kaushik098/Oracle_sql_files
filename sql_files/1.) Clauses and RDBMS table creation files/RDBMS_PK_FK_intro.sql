RDBMS - tables design
--We will create test table to understand data and relationship between tables (PK-FK) - RDBMS

--create departments table
DROP TABLE t_Test_dept;
CREATE TABLE t_test_dept
(
  department_id NUMBER,
  department_name VARCHAR2(100)
);

INSERT INTO t_test_dept (department_id,department_name) VALUES (10,'Oracle');
INSERT INTO t_test_dept (department_id,department_name) VALUES (20,'Java');
INSERT INTO t_test_dept (department_id,department_name) VALUES (30,'Dotnet');
COMMIT;

--can you insert another department with same id? - duplicate key
INSERT INTO t_test_dept (department_id,department_name) VALUES (30,'SAP');

--can you insert NULL key
INSERT INTO t_test_dept (department_id,department_name) VALUES (NULL,'Testing');

select * from T_TEST_DEPT;

DROP TABLE t_Test_emp;
CREATE TABLE t_test_emp
(
  employee_id NUMBER,
  first_name VARCHAR2(100),
  department_id NUMBER,
  salary NUMBER,
  commission_pct NUMBER,
  manager_id NUMBER,
  mail_id VARCHAR2(100),
  mobile_no NUMBER
);

--------------------------------------------------------------------------------
--add a President for this company
INSERT INTO t_test_emp (
                          employee_id, -----1
                          first_name, ----2
                          dept_id, ----3
                          salary, ----4
                          commission_pct, ----5
                          manager_id, ----6
                          mail_id, ----7
                          mobile_no ----8
                        )
                VALUES (
                          1,  ----1
                          'King', ----2
                          NULL, ----3 -- no dept for him
                          70000, ----4
                          1500, ----5
                          NULL, ----6 --no manager for King -- he is the top most guy
                          'king@abc.com', ----7
                          1111111111 ----8
                        );
COMMIT;

SELECT * FROM t_test_emp;
--------------------------------------------------------------------------------
--add a Manager for Oracle department
--his boss will be King
INSERT INTO t_test_emp (
                          employee_id, -----1
                          first_name, ----2
                          department_id, ----3
                          salary, ----4
                          commission_pct, ----5
                          manager_id, ----6
                          mail_id, ----7
                          mobile_no ----8                          
                        )
                VALUES (
                          2,  ----1
                          'Bala Ora Mgr', ----2 --Adding Ora Mgr just for easy understanding
                          10, ----3
                          10000, ----4
                          1500, ----5
                          1, ----6 King is his manager
                          'king@abc.com', ----7 --since you have not yet set any rule saying that this column should be unique - you can insert duplicate values
                          1111111111  ----8                         
                        );
COMMIT;
--------------------------------------------------------------------------------
--add 2 employees for Oracle under Manager Bala
INSERT INTO t_test_emp (
                          employee_id, -----1
                          first_name, ----2
                          dept_id, ----3
                          salary, ----4
                          commission_pct, ----5
                          manager_id, ----6
                          mail_id, ----7
                          mobile_no ----8                          
                        )
                VALUES (
                          3,  ----1
                          'Ashok Ora', ----2
                          10, ----3
                          5000, ----4
                          500, ----5
                          2, ----6
                          'king@abc.com', ----7
                          1111111111  ----8                         
                        );

INSERT INTO t_test_emp (
                          employee_id, -----1
                          first_name, ----2
                          dept_id ----3
                          salary, ----4
                          commission_pct, ----5
                          manager_id, ----6
                          mail_id, ----7
                          mobile_no ----8                          
                        )
                VALUES (
                          4,  ----1
                          'Augustin Ora', ----2
                          10, ----3
                          6000, ----4
                          600, ----5
                          2, ----6
                          'king@abc.com', ----7
                          1111111111  ----8                         
                        );
COMMIT;
SELECT * FROM t_test_emp;
--------------------------------------------------------------------------------
--add a Manager for Java department
INSERT INTO t_test_emp (
                          employee_id, -----1
                          first_name, ----2
                          dept_id, ----3
                          salary, ----4
                          commission_pct, ----5
                          manager_id, ----6
                          mail_id, ----7
                          mobile_no ----8                          
                        )
                VALUES (
                         5,  ----1
                          'Suresh Java Mgr', ----2
                          20, ----3
                          12000, ----4
                          1500, ----5
                          1, ----6
                          'king@abc.com', ----7
                          1111111111  ----8                         
                        );
COMMIT;
--------------------------------------------------------------------------------
--add 2 employees for Oracle under Manager Bala
INSERT INTO t_test_emp (
                          employee_id, -----1
                          first_name, ----2
                          dept_id, ----3
                          salary, ----4
                          commission_pct, ----5
                          manager_id, ----6
                          mail_id, ----7
                          mobile_no ----8                          
                        )
                VALUES (
                          6,  ----1
                          'Keerthi Java', ----2
                          20, ----3
                          5000, ----4
                          500, ----5
                          5, ----6
                          'king@abc.com', ----7
                          1111111111 ----8                         
                        );

INSERT INTO t_test_emp (
                          employee_id, -----1
                          first_name, ----2
                          dept_id, ----3
                          salary, ----4
                          commission_pct, ----5
                          manager_id, ----6
                          mail_id, ----7
                          mobile_no ----8                          
                        )
                VALUES (
                          7,  ----1
                          'Surya Java', ----2
                          10, ----3
                          6000, ----4
                          600, ----5
                          5, ----6
                          'king@abc.com', ----7
                          1111111111  ----8                         
                        );
COMMIT;
--------------------------------------------------------------------------------
SELECT * FROM t_test_emp;
--------------------------------------------------------------------------------
--no employees for Dotnet for now
--------------------------------------------------------------------------------
--can you insert like this?
INSERT INTO t_test_emp (
                          employee_id, -----1
                          first_name, ----2
                          department_id, ----3
                          salary, ----4
                          commission_pct, ----5
                          manager_id, ----6
                          mail_id, ----7
                          mobile_no ----8                            
                        )
                VALUES (
                          8,  ----1
                          'Test', ----2
                          9999999, ----3 --there is no department_id like 9999999 in t_test_dept table
                          6000, ----4
                          600, ----5
                          9999999, ----6 --there is no employee_id like 9999999 in t_test_emp table
                          'king@abc.com', ----7
                          1111111111 ----8                        
                        );

SELECT * FROM t_test_emp;
--there is no relationship established between t_test_dept and t_test_emp
--Oracle is RDBMS - we can and should establish PK-FK relationship
--we will see the PK-FK in detail later - in another chapter
--------------------------------------------------------------------------------
--establish PK-FK relation and then insert
DROP TABLE t_Test_dept;
DROP TABLE t_test_emp;

--every table should have a PK
CREATE TABLE t_test_dept
(
  department_id NUMBER PRIMARY KEY, --important
  department_name VARCHAR2(100)
);

INSERT INTO t_test_dept (department_id,department_name) VALUES (10,'Oracle');
INSERT INTO t_test_dept (department_id,department_name) VALUES (20,'Java');
INSERT INTO t_test_dept (department_id,department_name) VALUES (30,'Dotnet');
COMMIT;

--try to violate the PK rule
--can you insert another department with same id? - duplicate key
INSERT INTO t_test_dept (department_id,department_name) VALUES (30,'SAP');
--read the error carefully

--try to violate the PK rule
--can you insert NULL key
INSERT INTO t_test_dept (department_id,department_name) VALUES (NULL,'Testing');
--read the error carefully

--no change in data
--you have just added rule - PK
SELECT * FROM t_test_dept;
--------------------------------------------------------------------------------
--adding rules in emp table
--every table should have a PK
DROP TABLE t_Test_emp;
CREATE TABLE t_test_emp
(
  employee_id NUMBER PRIMARY KEY, --important
  first_name VARCHAR2(100),
  department_id NUMBER REFERENCES t_test_dept(department_id), --important
  salary NUMBER CHECK (salary > 0),
  commission_pct NUMBER,
  manager_id NUMBER  REFERENCES t_test_emp (employee_id), --important
  mail_id VARCHAR2(100) UNIQUE,  --important
  mobile_no NUMBER UNIQUE  --important
);

select * from T_TEST_EMP;
--add a President for this company
--you can insert NULL value in FK
INSERT INTO t_test_emp (
                          employee_id, -----1
                          first_name, ----2
                          department_id, ----3
                          salary, ----4
                          commission_pct, ----5
                          manager_id, ----6
                          mail_id, ----7
                          mobile_no ----8  
                        )
                VALUES (
                          1,  ----1
                          'King', ----2
                          NULL, ----3 -- no dept for him. FK column can accept NULL value
                          70000, ----4
                          1500, ----5
                          NULL, ----6 --no manager for King -- he is the top most guy.  FK column can accept NULL value
                          'king@abc.com', ----7
                          1111111111 ----8                         
                        );
COMMIT;

SELECT * FROM t_test_emp;


--add a Manager for Oracle department
--his boss will be King
--try to give the same mail_id and phone number as his Boss
--you are violating unique rule set on email_id or mobile_no column. Rule was set by you only - so Oracle will strictly follow it
--we will read about these rules (constraints) in another chapter
INSERT INTO t_test_emp (
                          employee_id, -----1
                          first_name, ----2
                          department_id, ----3
                          salary, ----4
                          commission_pct, ----5
                          manager_id, ----6
                          mail_id, ----7
                          mobile_no ----8  
                        )
                VALUES (
                          2,  ----1
                          'Bala Ora Mgr', ----2 --Adding Ora Mgr just for easy understanding
                          10, ----3
                          10000, ----4
                          1500, ----5
                          1, ----6 King is his manager
                          'king@abc.com', ----7
                          1111111111  ----8                           
                        );
--read the error carefully

--correcting the above bad data
INSERT INTO t_test_emp (
                          employee_id, -----1
                          first_name, ----2
                          department_id, ----3
                          salary, ----4
                          commission_pct, ----5
                          manager_id, ----6
                          mail_id, ----7
                          mobile_no ----8  
                        )
                VALUES (
                          2,  ----1
                          'Bala Ora Mgr', ----2 --Adding Ora Mgr just for easy understanding
                          10, ----3
                          10000, ----4
                          1500, ----5
                          1, ----6 King is his manager
                          'bala@abc.com', ----7
                          2222222222  ----8                           
                        );


COMMIT;

SELECT * FROM t_test_emp;
--------------------------------------------------------------------------------
--add 2 employees for Oracle under Manager Bala
INSERT INTO t_test_emp (
                          employee_id, -----1
                          first_name, ----2
                          department_id, ----3
                          salary, ----4
                          commission_pct, ----5
                          manager_id, ----6
                          mail_id, ----7
                          mobile_np ----8  
                        )
                VALUES (
                          3,  ----1 PK will check for unique and not null
                          'Ashok Ora', ----2
                          10, ----3
                          5000, ----4
                          500, ----5
                          2, ----6
                          'ashok@abc.com', ----7
                          3333333333 ----8
                        );
						

INSERT INTO t_test_emp (
                          employee_id, -----1
                          first_name, ----2
                          department_id, ----3
                          salary, ----4
                          commission_pct, ----5
                          manager_id, ----6
                          mail_id, ----7
                          mobile_np ----8  
                        )
                VALUES (
                          4,  ----1
                          'Augustin Ora', ----2
                          10, ----3
                          6000, ----4
                          600, ----5
                          2, ----6
                          'augustin@abc.com', ----7
                          4444444444   ----8                          
                        );
COMMIT;
SELECT * FROM t_test_emp;
--------------------------------------------------------------------------------
--add a Manager for Java department
INSERT INTO t_test_emp (
                          employee_id, -----1
                          first_name, ----2
                          department_id, ----3
                          salary, ----4
                          commission_pct, ----5
                          manager_id, ----6
                          mail_id, ----7
                          mobile_no ----8  
                        )
                VALUES (
                         5,  ----1
                          'Suresh Java Mgr', ----2
                          20, ----3
                          12000, ----4
                          1500, ----5
                          1, ----6
                          'suresh@abc.com', ----7
                          5555555555      ----8                       
                        );
COMMIT;
--------------------------------------------------------------------------------
--add 2 employees for Oracle under Manager Bala
INSERT INTO t_test_emp (
                          employee_id, -----1
                          first_name, ----2
                          department_id, ----3
                          salary, ----4
                          commission_pct, ----5
                          manager_id, ----6
                          mail_id, ----7
                          mobile_np ----8  
                        )
                VALUES (
                          6,  ----1
                          'Keerthi Java', ----2
                          20, ----3
                          5000, ----4
                          500, ----5
                          5, ----6
                          'keerthi@abc.com', ----7
                          6666666666    ----8                         
                        );

INSERT INTO t_test_emp (
                          employee_id, -----1
                          first_name, ----2
                          department_id, ----3
                          salary, ----4
                          commission_pct, ----5
                          manager_id, ----6
                          mail_id, ----7
                          mobile_np ----8  
                        )
                VALUES (
                          7,  ----1
                          'Surya Java', ----2
                          10, ----3
                          6000, ----4
                          600, ----5
                          5, ----6
                          'surya@abc.com', ----7
                          7777777777   ----8                          
                        );
COMMIT;
--------------------------------------------------------------------------------
--pin it
SELECT * FROM t_test_emp;
--------------------------------------------------------------------------------
--no employees for Dotnet for now
--------------------------------------------------------------------------------
--can you insert like this?
INSERT INTO t_test_emp (
                          employee_id, -----1
                          first_name, ----2
                          department_id, ----3
                          salary, ----4
                          commission_pct, ----5
                          manager_id, ----6
                          mail_id, ----7
                          mobile_np ----8  
                        )
                VALUES (
                          8,  ----1
                          'Test', ----2
                          9999999, ----3 --there is no department_id like 9999999 in t_test_dept table
                          6000, ----4
                          600, ----5
                          9999999, ----6 --there is no employee_id like 9999999 in t_test_emp table
                          'test@abc.com', ----7
                          1234567890  ----8                           
                        );
--read the error carefully             
--- ERROR:   ORA-02291: integrity constraint (HR.SYS_C007046) violated - parent key not found         
--------------------------------------------------------------------------------
--A new employee has joined
--He is in bench - no department assigned yet
--For now map him under Bala
INSERT INTO t_test_emp (
                          employee_id, -----1
                          first_name, ----2
                          department_id, ----3
                          salary, ----4
                          commission_pct, ----5
                          manager_id, ----6
                          mail_id, ----7
                          mobile_no ----8  
                        )
                VALUES (
                          8,  ----1
                          'Cyrus fresher', ----2
                          NULL, ----3 --he is in bench, FK column can accept NULL values
                          1000, ----4
                          100, ----5
                          2, ----6 --there is no employee_id like 9999999 in t_test_emp table
                          NULL, ----7 --unqiue will accept NULL values like FK
                          NULL ----8 --unqiue will accept NULL values like FK
                        );
COMMIT;
/*
PK - given data should be NOT NULL and UNIQUE
FK - accepts NULL (remember bench employee)
   - the value should be available in another table which is linked
UNIQUE - value should be unique
       - accepts NULL

*/
--------------------------------------------------------------------------------
SELECT * FROM t_test_emp;
SELECT * FROM t_test_dept;

-- To fetch the count of employees in all department_ids
select department_id, count(*) count_of_employees 
from T_TEST_EMP
group by DEPARTMENT_ID;


-- To fetch the count of employees in department id 30
select count(*) count_of_employees 
from T_TEST_EMP
where DEPARTMENT_ID = 30;


desc t_test_dept;
desc t_test_emp;
--------------------------------------------------------------------------------

-- Fetch the count of employees in each departments. Fetch only those departments having more than 5 employees.

select department_id, count(*) count_of_employees 
from T_TEST_EMP
group by DEPARTMENT_ID
having count(*) > 3;


UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
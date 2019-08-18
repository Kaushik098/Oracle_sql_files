Please add these analysis too in your constraints file 

CREATE TABLE t_test_pk
(
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(100),
    salary NUMBER,
    e_pin NUMBER NOT NULL UNIQUE --behaves like primary key
);

SELECT  u.constraint_name, 
        u.constraint_type, 
        u.search_condition, 
        u.status, 
        u.r_constraint_name, 
        uc.column_name, 
        uc.position
FROM user_constraints u, user_cons_columns uc
WHERE u.constraint_name = uc.constraint_name
AND u.table_name = uc.table_name
AND u.table_name = 'T_TEST_PK'
ORDER BY uc.column_name;

ALTER TABLE t_test_pk DROP CONSTRAINT SYS_C007461; --dropping NOT NULL constraint of e_pin

INSERT INTO t_test_pk VALUES (1,'aa',100,NULL);
COMMIT;

--Another question
e-pin is unique. Can we insert NULL into Unique - Yes

INSERT INTO t_test_pk VALUES (2,'bb',200,NULL);
COMMIT;

Can we insert multiple NULL into e-pin. 
Will unique allow to insert duplicate NULLs? - Yes
In Oracle one NULL is not equal to another NULL

INSERT INTO t_test_pk VALUES (3,'cc',300,NULL);
INSERT INTO t_test_pk VALUES (4,'rr',300,NULL);
INSERT INTO t_test_pk VALUES (5,'5c',100,NULL);

COMMIT;
select * from t_test_pk;
Proof:
NULL is always special case

SELECT * FROM DUAL WHERE 1 = 1;

SELECT * FROM DUAL WHERE NULL = NULL;


---------------------------------------------------------

--Rules of RDBMS
CREATE TABLE t_test1_pk
(
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(100),
    salary NUMBER,
    e_pin NUMBER NOT NULL UNIQUE --behaves like primary key
);

ALTER TABLE t_test1_pk add department_id NUMBER REFERENCES departments(department_id);

--Foreign key is added
SELECT  u.constraint_name, 
        u.constraint_type, 
        u.search_condition, 
        u.status, 
        u.r_constraint_name, 
        uc.column_name, 
        uc.position
FROM user_constraints u, user_cons_columns uc
WHERE u.constraint_name = uc.constraint_name
AND u.table_name = uc.table_name
AND u.table_name = 'T_TEST1_PK'
ORDER BY uc.column_name;
  
select * from user_constraints where table_name IN ('EMPLOYEES', 'DEPARTMENTS'); 
--fetch the children of departments
SELECT * FROM user_constraints 
WHERE r_constraint_name = (SELECT constraint_name FROM user_constraints WHERE table_name = 'DEPARTMENTS' and constraint_type = 'P');

--Rules of RDBMS

--Insertion rules
Top to Bottom
Example: You have to insert a new department first into Departments table, then only insert employees for this new department in employees table

--Deletion rules
Bottom to Top
Example:
You cannot DELETE/DROP/TRUNCATE parent table when child tables are dependant on it

DELETE from departments;
DROP TABLE departments;
TRUNCATE TABLE departments;

Error report
ORA-02292: integrity constraint (HR.EMP_DEPT_FK) violated - child record found
ORA-02266: unique/primary keys in table referenced by enabled foreign keys

Solution:
You have to delete the rows in child tables first and then the parent table



There was a problem previewing this document.



------------------


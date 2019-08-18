
/*
DDL - Data Definition Language
--will create objects like
Table	- Basic unit of storage; composed of rows
View	- Logically represents subsets of data from one or more tables
Sequence	- Generates numeric values
Index	- Improves the performance of some queries
Synonym	- Gives alternative name to an object

DDLs - auto commit
CREATE
ALTER
RENAME
DROP
TRUNCATE
*/

---------------

create table my_table (id number);

RENAME my_table to your_table;

ALTER TABLE your_table RENAME TO my_table;

select * from my_table;
---------------
create table table_11 (id number);

select * from table_11;

alter table table_11 add name varchar2(100);

desc table_11;

-- Renaming the table name

alter table table_11 rename to table_21;

select * from table_21;
select * from table_11;

ALTER TABLE
-----------
ADD
MODIFY
DROP
RENAME - column_name, table_name

ALTER TABLE table_11
ADD (e_name VARCHAR2(100), salary NUMBER, commission_pct NUMBER NOT NULL);

desc table_11;

MODIFY: We can modify the data type and also the width of the data type

ALTER TABLE table_11
MODIFY (e_name VARCHAR2(300), salary VARCHAR2(100));

DROP:

ALTER TABLE table_11
DROP (e_name, salary);

desc table_11;

RENAME:

ALTER TABLE table_11 RENAME COLUMN name TO first_name;

SELECT * FROM USER_TABLES
where table_name = 'TABLE_11';

SELECT * FROM USER_TAB_COLUMNS
where TABLE_NAME = 'TABLE_11';

------------------------------------------------------

CREATE TABLE t_char_test
(
 name1 varchar2(10),
 name2 char(10)
);

INSERT INTO t_char_test (name1, name2) VALUES ('Bala','Bala');
COMMIT;

SELECT LENGTH(name1), LENGTH(name2) FROM t_char_Test;

--CHAR is used for Fixed Length Size Variable
--VARCHAR is used for Variable Length Size Variable.

--To use storage space efficiently must use VARCHAR2
--If your content is a fixed size, you'll get better performance with CHAR e.g., GENDER (M/F), STATUS (A/I) (ACTIVE/INACTIVE)


--NUMBER(p,s)
--p - precision, s - scale
CREATE TABLE t_Test_number
(
 num1 NUMBER,
 num2 NUMBER(3,2),
 num3 NUMBER(5,2)
);
INSERT INTO t_Test_number VALUES (10.33334, 1.03,110.33);
COMMIT;
SELECT * FROM t_Test_number;


INSERT INTO t_Test_number VALUES (10.33334, 21.03,110.33);
-- If we try to enter larger number following error occurs EG:21.03
1 ORA-01438: value larger than specified precision allowed for this column 

-- If we add more values after decimal, the digit gets truncated.


--check precision scale of commission_pct in employees table

desc employees;

select * from employees;

Number(4,2)

4 - total digits 
2 - after decimals

------------------------------------------------------------

LONG

create table table_12 (id number, name varchar2(30000))
1 ORA-00910: specified length too long for its datatype 

--LONG is an Oracle data type for storing character data of variable length up to 
--2 Gigabytes in length (bigger version of the VARCHAR2 datatype). 

/*
- A LONG column cannot be included in a GROUP BY or an ORDER BY clause.
- Only one LONG column can be used per table.
- No constraints can be defined on a LONG column.
- You might want to use a CLOB column rather than a LONG column.
*/


CREATE TABLE t_long_table
(
 employee_id NUMBER,
 e_resume LONG,
 e_offer_letter LONG
);
1 ORA-01754: a table may contain only one column of type LONG 


CREATE TABLE t_long_table
(
 employee_id NUMBER,
 e_resume LONG
 /*e_offer_letter LONG*/
);

INSERT INTO t_long_table (employee_id, e_resume) VALUES (100, 'blah bla blah');
COMMIT;

SELECT * FROM t_long_table;

--------------------------------------------------------------------------------
--A CLOB (Character Large Object) is an Oracle data type that can hold up to 4 GB of data. 
--CLOBs are handy for storing text. 

DROP TABLE t_clob_table;
CREATE TABLE t_clob_table
(
 employee_id NUMBER,
 e_resume CLOB,
 e_offer_letter CLOB
);
INSERT INTO t_clob_table VALUES (100, 'blah bla blah', 'blah bla blah');

select * from t_clob_table;

------------------------------------------------


-------------------------------
/*
DDL - Data Definition Language
--will create objects like
Table	- Basic unit of storage; composed of rows
View	- Logically represents subsets of data from one or more tables
Sequence	- Generates numeric values
Index	- Improves the performance of some queries
Synonym	- Gives alternative name to an object

DDLs - auto commit
CREATE
ALTER
DROP
TRUNCATE

*/

rename table table_11 to table_21;

ALTER TABLE
ADD
MODIFY
DROP
RENAME

ALTER TABLE t_Test
ADD (e_name VARCHAR2(100), salary NUMBER, commission_pct NUMBER NOT NULL);
ALTER TABLE t_Test
MODIFY (e_name VARCHAR2(300), salary VARCHAR2(100));
-----------------------------------
ALTER TABLE t_Test
DROP (e_name, salary);
------------------
ALTER TABLE t_Test RENAME COLUMN e_name TO first_name;
----------------------
SELECT * FROM USER_TABLES;
SELECT * FROM USER_TAB_COLUMNS;
------------------------------------
CREATE TABLE t_char_test
(
 name1 varchar2(10),
 name2 char(10)
);

INSERT INTO t_char_test (name1, name2) VALUES ('Bala','Bala');
COMMIT;

SELECT LENGTH(name1), LENGTH(name2) FROM t_char_Test;

--CHAR is used for Fixed Length Size Variable
--VARCHAR is used for Variable Length Size Variable.

--To use storage space efficiently must use VARCHAR2
--If your content is a fixed size, you'll get better performance with CHAR e.g., GENDER (M/F), STATUS (A/I) (ACTIVE/INACTIVE)
-----------------------------------------------
--NUMBER(p,s)
--p - precision, s - scale
CREATE TABLE t_Test_number
(
 num1 NUMBER,
 num2 NUMBER(3,2),
 num3 NUMBER(5,2)
);
INSERT INTO t_Test_number VALUES (10.33334, 1.03,110.33);
COMMIT;
SELECT * FROM t_Test_number;

--check precision scale of commission_pct in employees table
--------------------------------------------------------
--LONG is an Oracle data type for storing character data of variable length up to 
--2 Gigabytes in length (bigger version of the VARCHAR2 datatype). 

/*
- A LONG column cannot be included in a GROUP BY or an ORDER BY clause.
- Only one LONG column can be used per table.
- No constraints can be defined on a LONG column.
- You might want to use a CLOB column rather than a LONG column.
*/


CREATE TABLE t_long_table
(
 employee_id NUMBER,
 e_resume LONG,
 e_offer_letter LONG
);
---------------------------------------
INSERT INTO t_long_table (employee_id, e_resume) VALUES (100, 'blah bla blah');
COMMIT;
SELECT * FROM t_long_table;
---------------------------------
--Since Oracle 8i, Oracle advised against using the LONG datatype. Users should convert to CLOB 
--but still Oracle will support LONG - backward compatibility
--------------------------------------------------------------------------------
--A CLOB (Character Large Object) is an Oracle data type that can hold up to 4 GB of data. 
--CLOBs are handy for storing text. 

DROP TABLE t_clob_table;
CREATE TABLE t_clob_table
(
 employee_id NUMBER,
 e_resume CLOB,
 e_offer_letter CLOB
);
INSERT INTO t_clob_table VALUES (100, 'blah bla blah', 'blah bla blah');
---------------------------------------


--A BLOB (Binary Large Object) is an Oracle data type that can hold up to 4 GB of data. 
--BLOB's are handy for storing digitized information (e.g., images, audio, video). 

DROP TABLE t_blob_table;
CREATE TABLE t_blob_table
(
 employee_id NUMBER,
 e_photo BLOB,
 e_spouse_photo BLOB
);

select * from t_blob_table;

--------------------------------------------------------------------


Truncate:

Truncate will delete all the rows from the table and remove the space occupied also

Truncate VS delete:
1.) truncate is DDL          Delete is DML
2.) We cannot rollback       We can rollback the changes
3.) Cannot use WHERE        We can use WHERE condition
4.) Truncate is fast since   
there is no rollback and 
deletes along with the 
space


PURGE:

CREATE TABLE t_purge_test
(
 NUM NUMBER
);

INSERT INTO t_purge_test VALUES (1);
INSERT INTO t_purge_test VALUES (2);
COMMIT;

SELECT * FROM t_purge_Test;
--------------------------------------------------------------------------------
--drop this table
DROP TABLE t_purge_test;

SELECT * FROM RECYCLEBIN;

--important columns
--ORIGINAL_NAME
--OPERATION
--TYPE
--CREATETIME
--DROPTIME

SELECT * FROM RECYCLEBIN
WHERE ORIGINAL_NAME = 'T_PURGE_TEST';

--how to revert your DROP? or make T_PURGE_TEST alive again?
FLASHBACK TABLE t_purge_test TO BEFORE DROP;

select * from t_purge_test;
--------------------------------------------------------------------------------
--how to do Shift + Delete of a table?
DROP TABLE t_purge_test PURGE;

--no rows
SELECT * FROM RECYCLEBIN
WHERE ORIGINAL_NAME = 'T_PURGE_TEST';

After dropping table with purge we can''t retrive the date. 
If trying to retrieve the dropped table the following error occurs:
2 ORA-38305: object not in RECYCLE BIN 
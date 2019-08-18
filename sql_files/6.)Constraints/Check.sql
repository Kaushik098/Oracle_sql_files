ORACLE SQL - CONSTRAINTS

TYPES OF CONSTRAINTS
--------------------
PRIMARY KEY
FOREIGN KEY
UNIQUE
NOT NULL
CHECK - A check constraint allows you to specify a condition on each row in a table.


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
 salary NUMBER
 ,CHECK (8000 <= CASE WHEN gender = 'M' THEN salary + 500  ELSE salary  END)  -- MALE min salary is 7500 and females min salary is 8000
);

select * from t_test_check;

 insert into t_test_check(id, first_name, mobile_no, gender, rep_id, salary) values 
 (1001, 'Donald', 9900990099, 'M', 'REP_MGMT', 8000);
 
 insert into t_test_check(id, first_name, mobile_no, gender, rep_id, salary) values 
 (1002, 'Manik', 9900990099, 'M', 'REP_MGMT', 8100);

 insert into t_test_check(id, first_name, mobile_no, gender, rep_id, salary) values 
 (1003, 'Gowri', 9900990090, 'F', 'REP_MGMT', 9000);

   insert into t_test_check(id, first_name, mobile_no, gender, rep_id, salary) values 
 (1004, 'Nadeem', 9900990190, 'M', 'REP_MGMT', 7500);

   insert into t_test_check(id, first_name, mobile_no, gender, rep_id, salary) values 
 (1005, 'Qureshi', 9900910190, 'F', 'REP_MGMT', 7500);
ORA: 02290 Check constraint violated



 insert into t_test_check(id, first_name, mobile_no, gender, rep_id, salary) values 
 (1001, 'Donald', 9900990099, 'M', 'REP_MGMT', 1000);
ORA: 02290 Check constraint violated.



 Questions:
 1) Will the above insert work? If not why?
    No, because the check constraint is violated ORA-02290.

 2) Why is the last CHECK constraint created separately in the above table creation?
       
       Check constraint can be created in two ways:
            *Inline
            *Out-of-line

 3) Why do we use ESCAPE generally in Oracle and why it is used in above table creation?

     Use of Escape:
     - There are there concepts in oracle for special characters:
          a.) Group Characters
          b.) Escape Characters
          c.) Reserved words and Characters

         In that Escape characters is used to operate with special characters:
              EG:
                  Check (name1 like 'ad\_%' escape '\');
                  String ad_min will be accepted.
                
                create table example_of_escape (
                name1 varchar2(20) check (name1 like '%\_%' escape '\')
                );

                insert into EXAMPLE_OF_ESCAPE values ('adam_gilchrist');
                insert into EXAMPLE_OF_ESCAPE values ('adam gilchrist'); -- Check constraint violated ORA 02290


 4) What is the use of PURGE?
    Use the PURGE statement to remove a table or index from your recycle bin and release all of the space associated with the object,
    or to remove the entire recycle bin, or to remove part of all of a dropped tablespace from the recycle bin.
    
 * Analyze the purpose of other CHECK constraints used in the above table creation
 * Try out in system and analyze various success and failure (error) insert scenarios for above table - for better understanding
   and for answering the questions

 ----------------------------------------------------------------------------------------------
CREATE TABLE t_test_check1
(
 id NUMBER PRIMARY KEY,
 first_name VARCHAR2(100),
 mobile_no NUMBER CHECK(LENGTH(mobile_no) = 10),
 gender CHAR(1) CHECK(gender IN ('M','F')),
 rep_id VARCHAR2(10) CHECK (rep_id LIKE 'REP\_%' ESCAPE '\')
);

 select * from T_TEST_CHECK1;
 
 insert into t_test_check1(id, first_name, mobile_no, gender, rep_id) values 
 (1001, 'Donald', 9900990099, 'M', 'REP_MGMT');

 INSERT INTO t_test_check VALUES (1,'GG',1234567890,'F','REP110',7500);

-----------------------------------------------------------------------------------------------
----------------------------------------------------------------------

-Trying to create a table using check constraint

create table fnd_length
(emp_id number check (LENGTH(emp_id) = 3)
, name varchar(10) check (LENGTH(name) = 4));

insert into fnd_length (emp_id, name) values (1001, 'Ashok');
Error: Check constraint violated ORA-02290

insert into fnd_length (emp_id, name) values (101, 'Adam');
SUCCESS!!

Select * from fnd_length;

-Trying to use check constraint along with escape:

CHECK (rep_id LIKE 'REP\_%' ESCAPE '\')

create table manager_table(
manager_id varchar2(20) check (manager_id like 'REP\_%' ESCAPE '\'));

insert into manager_table values ('REP_');
insert into manager_table values ('REP_MGMT');

select * from manager_table;

----------------------------------------------------------------------------------------


a.)
CREATE TABLE table_name
(
  column1 datatype null/not null,
  column2 datatype null/not null,
  ...
  CONSTRAINT constraint_name CHECK (column_name condition) [DISABLE]
);


The DISABLE keyword is optional.
If you create a check constraint using the DISABLE keyword, the constraint will be created, but the condition will not be enforced.

----------------------------------------------------------------------------------------------------------
b.) 
CREATE TABLE pets(
        ID INT NOT NULL,
        Name VARCHAR(30) NOT NULL,
        Breed VARCHAR(20) NOT NULL,
        Age INT,
        GENDER VARCHAR(9),
        PRIMARY KEY(ID),
        check(GENDER in ('Male', 'Female', 'Unknown'))
        );

select * from pets;

insert into pets (ID,Name, Breed, Age, GENDER) values (101,'Barbie', 'Golden Retriver', 10, 'MALE');
ORAA:02290 Check constraint violated
insert into pets (ID,Name, Breed, Age, GENDER) values (101,'Barbie', 'Golden Retriver', 10, 'Male');

---------------------------------------------------------------------------------------------------
c.) 
CREATE TABLE student(
        StudentID INT NOT NULL,
        Name VARCHAR(30) NOT NULL,
        Age INT NOT NULL,
        GENDER VARCHAR(9),
        PRIMARY KEY(StudentID),
        check(Age >= 17)
        );


select * from student;

insert into student (StudentID, Name, Age, GENDER) values (101, 'Ajax', 11, 'MALE');
ORA:02290 Check constraint violated
insert into student (StudentID, Name, Age, GENDER) values (101, 'Ajax', 18, 'MALE');
--------------------------------------------------------------------------------------------------------------






With alter: alter table TABLE_NAME modify COLUMN_NAME check(Predicate);

Giving variable name to check constraint: alter table TABLE_NAME add constraint CHECK_CONST check (Predicate);

Remove check constraint: alter table TABLE_NAME drop constraint CHECK_CONSTRAINT_NAME;

Drop check constraint: alter table TABLE_NAME drop check CHECK_CONSTRAINT_NAME;


----------------------------------------------------------------------------
----------------

CHECK (8000 <= CASE WHEN gender = 'M' THEN salary + 500  ELSE salary  END)

LHS: 8000
RHS:   CASE WHEN gender = 'M' 
       THEN salary + 500 
       ELSE salary  
       END

Gender:  M 
         Salary: 9000
         8000 <= 9500   Pass
         
         M
         Salary: 7000
         8000 <= 7500   Fail

         M 
         Salary: 7500
         8000 <= 8000   Pass
---------------------------
         F 
         Salary: 9000
         8000 <= 9000 Pass
         
         F
         Salary: 7000
         8000 <= 7000 Fail

         F
         Salary: 7500
         8000 <= 7500  Fail

-------------------------------------------------------------------------------------

16-05-2019

create table student_admission_table
(
 student_id number primary key,
 student_name varchar2(20) not null,
 student_gender char(1) CHECK(student_gender IN ('M','F'))
);



create table student_admission_table1
(
 student_id number primary key,
 student_name varchar2(20) not null,
 student_gender char(1) CHECK(student_gender IN ('M','F')),
 student_language varchar2(20) check (student_language IN ('Tamil','French')),
 student_admission_fees number not null
  , CHECK (10000 <= CASE WHEN student_language = 'French' THEN student_admission_fees + 1000 ELSE student_admission_fees END)
);

select * from STUDENT_ADMISSION_TABLE1;

insert into STUDENT_ADMISSION_TABLE1 
(student_id, student_name, STUDENT_GENDER,STUDENT_LANGUAGE, STUDENT_ADMISSION_FEES)
values 
('1002', 'Jordi Alba', 'M', 'French', 9500)
union all 
insert into STUDENT_ADMISSION_TABLE1 
(student_id, student_name, STUDENT_GENDER,STUDENT_LANGUAGE, STUDENT_ADMISSION_FEES)
values 
('1003', 'Luiz Suarez', 'M', 'Tamil', 10000);


insert into STUDENT_ADMISSION_TABLE1 
(student_id, student_name, STUDENT_GENDER,STUDENT_LANGUAGE, STUDENT_ADMISSION_FEES)
values 
('1004', 'Leo Messi', 'M', 'Tamil', 10000);

select * from STUDENT_ADMISSION_TABLE1;
----------------------------------------------------------------------------------------

create or replace function
arithmetic
(
  p_num1 number,
  p_num2 number,
  p_num3 number,
  p_num4 number
)
return number
as

begin
return (p_num1+(p_num2 * p_num3) / p_num4);

select arithmetic(10,20,3,2) from dual;


end;
/


-- To allow naming of the constraint is written as follows
-- CHK_Person is the check constraint name 


CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);

desc Persons;

insert into Persons (ID, LastName, FirstName, Age, City)
VALUES
(101, 'Semedo','Countinho', 18, 'Sandnes');

select * from Persons;


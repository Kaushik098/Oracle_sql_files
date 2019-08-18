CREATE TABLE courses ( course_id NUMBER PRIMARY KEY, course_name VARCHAR2(100));

DESC courses;

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 COURSE_ID                                 NOT NULL NUMBER
 COURSE_NAME                                        VARCHAR2(100)


--POSITIVE SCENARIO
--1st insertion
INSERT INTO courses (course_id, course_name) values (101, 'Database');
COMMIT;

--2nd insertion
INSERT INTO courses (course_id, course_name) VALUES (102, 'Programming and Data Structures');
COMMIT;

--3rd insertion
INSERT INTO courses (course_id, course_name) VALUES (103, 'Computer Networks');
COMMIT;

-- CHECKING NEGATIVE SCENARIO 1
INSERT INTO courses (course_id, course_name) values (101, 'Database');

    ORA-00001: unique constraint (HR.SYS_C007034) violated
	
--  CHECKING NEGATIVE SCENARIO 2	
INSERT INTO courses (course_id, course_name) values (NULL, 'Database');	
	
    ORA-01400: cannot insert NULL into ("HR"."COURSES"."COURSE_ID")
	
--------------------------------------------------------------------------------------------------------------------------	

CREATE TABLE students(
          student_id NUMBER PRIMARY KEY,
          student_name VARCHAR2(100),
          course_id NUMBER REFERENCES courses(course_id),
          gender varchar(20)
    );

DESC students;

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 STUDENT_ID                                NOT NULL NUMBER
 STUDENT_NAME                                       VARCHAR2(100)
 COURSE_ID                                          NUMBER
 GENDER                                             VARCHAR2(20)	
	

-- 1st insertion
INSERT INTO students (student_id, student_name, course_id, gender) VALUES( 1111, 'Sri', 101, 'female');
COMMIT;

-- 2nd insertion
INSERT INTO students (student_id, student_name, course_id, gender) VALUES( 1112, 'Amar', 102, 'male');
COMMIT;

--3rd insertion
INSERT INTO students (student_id, student_name, course_id, gender) VALUES( 1113, 'Tharun', 103, 'male');
COMMIT;

-- 4th insertion 
-- checking whether the foreign key accepts the null or not 
INSERT INTO students (student_id, student_name, course_id, gender) VALUES (1114, 'Leo', null, 'male');
COMMIT;

-- NEGATIVE SCENARIO 1
-- trying to insert a not entered number in students (course_id)
INSERT INTO students (student_id, student_name, course_id, gender) VALUES( 1114, 'Mahi', 1004, 'male');
ORA-02291: integrity constraint (HR.SYS_C007049) violated - parent key not









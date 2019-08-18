--Less4
--Single row functions
--character manipulation functions
--requirement: combine/concat Hello and World and print using dual
SELECT 'Hello'||'World' FROM DUAL;

--another way of doing this is using inbuilt function -CONCAT
SELECT CONCAT('Hello','World') FROM DUAL;
--but you can concat only 2 parameters

--will throw error
--understand the error - important for developers
SELECT CONCAT('Hello','World','Welcome') FROM DUAL;
  
  Error : Invalid NUMBER OF arguments 

--in employees table
--will act on each row
--what will be thet output?
SELECT CONCAT(last_name, first_name) FROM DUAL;

SELECT CONCAT(last_name, first_name) FROM employees;

SELECT CONCAT(first_name, last_name) FROM employees;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--SUBSTR - Extracts a string of determined length
--requirement: Cut/extract 'name is Bala' from 'Hi my name is Bala. I am from Chennai'
SELECT 'Hi my name is Bala' sentence FROM DUAL;
        123456789012345678
        
SELECT SUBSTR('Hi my name is Bala', 1,8) sentence FROM DUAL;
               123456789012345678

SELECT SUBSTR('Hi my name is Bala', 1,10) sentence FROM DUAL;
               123456789012345678

SELECT SUBSTR('Hi my name is Bala', 1) sentence FROM DUAL;
               123456789012345678

SELECT SUBSTR('Hi my name is Bala', 2, 8) sentence FROM DUAL;
               123456789012345678

SELECT SUBSTR('Hi my name is Bala', 2, 9) sentence FROM DUAL;
               123456789012345678

SELECT SUBSTR('Hi my name is Bala', 2) sentence FROM DUAL;
               123456789012345678

--this is done only for display purpose
--no changes in data in the table
SELECT first_name, SUBSTR(first_name,1,3) FROM employees;
--try with other columns
--give alias name
--------------------------------------------------------------------------------
--you can use SUBSTR in WHERE too
SELECT * FROM employees
WHERE SUBSTR(first_name,1,3) = 'Don';

SELECT * FROM employees
WHERE UPPER(SUBSTR(first_name,1,3)) = UPPER('Don');

SELECT * FROM employees
WHERE SUBSTR(UPPER(first_name),1,3) = UPPER('Don');--nested functions
--------------------------------------------------------------------------------
--LENGTH --Shows the length of a string as a numeric value
SELECT LENGTH('BalaMurali'), LENGTH('Hi my name is Bala'), LENGTH(NULL) FROM DUAL;

--emp_id i number column - but no issues - we can find length if it too
SELECT first_name, LENGTH(first_name), employee_id, LENGTH(employee_id) FROM employees;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--INSTR --Finds the numeric position of a named character
--what will be the output?
SELECT INSTR('BalaMurali','B') example FROM DUAL;

SELECT INSTR('BalaMurali','b') example FROM DUAL;

SELECT INSTR('BalaMurali','M') example FROM DUAL;

--which 'a' will be considered?
SELECT INSTR('BalaMurali','a') example FROM DUAL;

--third parameter - start searching from first
SELECT INSTR('BalaMurali','a', 1) example FROM DUAL;

--third parameter - start searching from first
--fourth parameter - which occurence of 'a'
SELECT INSTR('BalaMurali','a', 1, 2) example FROM DUAL;

SELECT INSTR('BalaMurali','a', 3) example FROM DUAL;

SELECT INSTR('BalaMurali','a', 5, 3) example FROM DUAL;

--try changing the third and fourth parameter

SELECT first_name, last_name,CONCAT(first_name, last_name) NAME, 
       job_id, LENGTH (last_name), 
       INSTR(last_name, 'a')
FROM   employees
WHERE  SUBSTR(job_id, 4) = 'REP';


SELECT first_name, last_name,CONCAT(first_name, last_name) NAME, 
       job_id, LENGTH (last_name), 
       INSTR(last_name, 'a')
FROM   employees
WHERE  SUBSTR(job_id, 4) = 'ACCOUNT';
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--LPAD Returns an expression left-padded to the length of n characters with a character expression

/*
--Requirement: 
I have emp names as
Bala
Suresh
Parthi
Govindan
Gopi

I want to see all emp names
but display only 7 characters of all names
if a name doesnot have 7 characters, fill it with '*' and make it 7
like

Bala***
Suresh*
Parthi*
Govindan -- no need to add '*' - he has more than required - but show only 7 letters for him
Gopi***

*/

DROP TABLE t_pad_test;
CREATE TABLE t_pad_test
(
  emp_name VARCHAR2(100)
);
INSERT INTO t_pad_test VALUES ('Bala');
INSERT INTO t_pad_test VALUES ('Suresh');
INSERT INTO t_pad_test VALUES ('Parthi');
INSERT INTO t_pad_test VALUES ('Govindan');
INSERT INTO t_pad_test VALUES ('Gopi');
COMMIT;

SELECT * FROM t_pad_test;

SELECT RPAD(emp_name,7,'*') FROM t_pad_test;
SELECT LPAD(emp_name,7,'s') FROM t_pad_test;
SELECT LPAD(emp_name,7,'?') FROM t_pad_test;
SELECT LPAD(emp_name,7,'s?') FROM t_pad_test;


SELECT RPAD(emp_name,10,'*') FROM t_pad_test;
--------------------------------------------------------------------------------
--REPLACE
--lette input
SELECT REPLACE('JACK and JUE J','J','BL') FROM DUAL;
--word input
SELECT REPLACE('The theatre owner caught the thief the other day','the','xyz') FROM DUAL;

--pin it
SELECT REPLACE('the theatre owner caught the thief the other day','the','xyz') FROM DUAL;

SELECT TRANSLATE('the theatre owner caught the thief the other day','the','xyz') FROM DUAL;
--------------------------------------------------------------------------------
--TRIM
/*
 Trims leading or trailing characters (or both) from a character string 
 (If trim_character or trim_source is a character literal, 
 you must enclose it within single quotation marks.)
*/
--removes - first and last - leading and trailing
SELECT TRIM ('H' FROM 'HI, HELLO, HOW ARE YOU, H') FROM DUAL;

--removes all first and last occurrences of 'H'
SELECT TRIM ('H' FROM 'HHHHHI, HELLO, HOW ARE YOU, HHHHHH') FROM DUAL;

--now only leading H will be removed
SELECT TRIM ('H' FROM 'HI, HELLO, HOW ARE YOU, IH D') FROM DUAL;

--last I removed
SELECT TRIM ('I' FROM 'HI, HELLO, HOW ARE YOU, HI') FROM DUAL;

--case sensitive
SELECT TRIM ('I' FROM 'HI, HELLO, HOW ARE YOU, Hi') FROM DUAL;
-------------------------
--removes all first occurrences of 'H'
SELECT TRIM (LEADING 'H' FROM 'HHHHHI, HELLO, HOW ARE YOU, HHHHHH') FROM DUAL;

SELECT TRIM (TRAILING 'H' FROM 'HHHHHI, HELLO, HOW ARE YOU, HHHHHH') FROM DUAL;

-------------------------
--what will be the output?
--read the error
SELECT TRIM ('HI' FROM 'HI, HELLO, HOW ARE YOU, HI') FROM DUAL;
--only LTRIM, RTRIM can trim words

  -- Error: Trail should have only one character
--------------------------
--what will be the output?
--you have space
SELECT TRIM (LEADING 'H' FROM ' HHHHHI, HELLO, HOW ARE YOU, HHHHHH ') FROM DUAL;
--------------------------
--also used for numbers
SELECT TRIM (1 FROM 11111213141511111) FROM DUAL;


--LTRIM
SELECT LTRIM('IIII IN SDFDF III','I') FROM DUAL;
SELECT LTRIM('IN SDFDF III','I') FROM DUAL;
--similarly try RTRIM

--TRIM
--removes leading and trailing spaces
SELECT TRIM('  ffgf   ') FROM DUAL;

--LTRIM and RTRIM can trim words
SELECT LTRIM('IN SDFDF III','IN') FROM DUAL;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--try in lab
SELECT  SUBSTR(&input,1,1)||
        TRANSLATE(
                  SUBSTR(&input,2,LENGTH(&input)-2),
                  '1234567890',
                  '**********'
                  )       ||
        SUBSTR(&input,LENGTH(&input)) D
FROM DUAL;


SELECT 'Hello'||'World'||'Welcome' FROM DUAL;

--how to add space?
SELECT last_name||' '|| first_name full_name FROM employees;

--how to add using CONCAT?
SELECT CONCAT(last_name,' '|| first_name) full_name FROM employees;


--Requirement: extract and show this - 'name is Bala. I am from Chennai'
SELECT SUBSTR('Hi my name is Bala. I am from Chennai', 7) sentence FROM DUAL;

SELECT SUBSTR('BalaMurali',1, 4) word FROM DUAL;

SELECT SUBSTR('BalaMurali',1) word FROM DUAL;

--what will be the output?
SELECT SUBSTR('BalaMurali',20) word FROM DUAL;

--assume if parameter 1 and 2 are passed from Java/Dotnet?
SELECT INSTR(UPPER('BalaMurali'),UPPER('b')) example FROM DUAL;

--converting the above - using substitution variable for learning purpose
SELECT INSTR(UPPER('&input_string'),UPPER('&search_letter')) example FROM DUAL;

Doubt:

SELECT INSTR(UPPER('&input_string'),UPPER('&input_string')) example FROM DUAL;

SELECT  SUBSTR(&input,1,1)||
        TRANSLATE(
                  SUBSTR(&input,2,LENGTH(&input)-2),
                  '1234567890',
                  '**********'
                  )       ||
        SUBSTR(&input,LENGTH(&input)) D
FROM DUAL;


-- fetch the emp who have 5 letters in their first_name

  select * from employees where Length(first_name) = 5;

  select first_name, Length(first_name) from employees;

  -- fetch and show the first_name and phone_number of emp who are having 5 letters in their first_name. 
  -- Do not show the first four letters of phone number 

    select first_name, substr(phone_number,5) from employees where Length(first_name) =5;

    -- fetch the employees having letter 'a' in their first_name

    select first_name from employees where UPPER(first_name) like UPPER('%a%'); 

    select * from employees where first_name = 'Alberto';

    -- fetch the employees having letter 'a' in their first_name using INSTR

    select first_name from employees where instr(UPPER(first_name),UPPER('a')) >= 1;

    select  first_name, instr(UPPER(first_name),UPPER('a')) from employees;

    -- fetch the details of emp having first_name starting with ALE

    select first_name from employees where first_name like 'Ale%';

    select first_name from employees where substr(UPPER(first_name), 1, 3) = 'ALE';

    select first_name, substr(UPPER(first_name), 1, 4) from employees;

  
 select first_name from employees where instr(UPPER(first_name),UPPER('a')) >= 1;
-- fetch the emp having two or more a's in their first_name

    select first_name, instr(UPPER(first_name),UPPER('a'),) FROM employees;

    select first_name from employees where INSTR(UPPER(first_name), UPPER('a'), 1, 2) > 1;

    select first_name, INSTR(UPPER(first_name), UPPER('a'), 1, 2) from employees;

    ALEXANDER
    select instr('ALEXANDER', 'A', 1,1) from dual;  -- 1

    select instr('ALEXANDER', 'A', 1,2) from dual;  -- 5

    select instr('ALEX', 'A', 1,2) from dual;       -- 0


    -- two or more 'a's' in last name

    select last_name from employees where instr(UPPER(last_name), UPPER('a'),1,2) > 1;

    -- only two a's in last name

    select last_name from employees where instr(UPPER(last_name), UPPER('a'),1,2) > 2;

     select last_name,instr(UPPER(last_name), UPPER('a'),1,2) from employees;

-------------------------------------------------------------------------------------------------------------------------------------

select * from employees;


select * from employees where employee_id like '1__';
select * from employees where employee_id > 100 and employee_id <= 200;

Working with substr:

-- SUBSTR
    1st parameter (normal string)
    2nd parameter (starting index to search the substring)
    3rd parameter (the count to check the letters after second parameter number) 

select first_name, last_name from employees
where substr(UPPER(first_name),3,3) = 'EVE';

select last_name from employees 
where substr(UPPER(last_name),4,3) = 'KLE'

select job_id from employees 
where substr(upper(job_id),4,7) = 'ACCOUNT';


 -- working with INSTR
  --INSTR is to find the position 
  -- 1st parameter (string)
  -- 2nd parameter (the letter to find)
  -- 3rd parameter (starting position)
  -- 4th parameter (checks the second parameter character position from starting position and returns the position of character occurence)

select instr('Hai sir, I am fine', 'a', 10, 2) from dual;

select first_name from employees where instr(upper(first_name),upper('a'),1,2) > 1

select first_name from employees where instr(upper(first_name),upper('a'),1,2) > 0

select last_name from employees where instr(upper(last_name),upper('aa'),1,3) > 0





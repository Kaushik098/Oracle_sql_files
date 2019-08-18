
** STRING FUNCTIONS
*** UPPER

    SELECT upper(first_name) FROM employees;

*** LOWER

    SELECT upper(first_name), lower(last_name) FROM employees;

*** INITCAP
   
    SELECT INITCAP(job_id) FROM employees;

*** CONCAT 

    SELECT concat(first_name, last_name) FROM employees;

    SELECT concat(employee_id, concat('-', concat(first_name,concat (' ',last_name)))) FROM employees;

*** SUBSTR
     it is used to get a substring from a normal string 
     syntax :  substr(column_name, initial pos, final pos)

    SELECT substr(first_name, 2,8) FROM employees; 

    SELECT job_id FROM employees ORDER BY substr(job_id,2,4);

*** INSTR
     -- it is used to find the  starting location of a string pattern
     SELECT * FROM DEPARTMENTS;

     SELECT instr(department_name,'i') letter_existence FROM departments WHERE department_name = 'Shipping';

     SELECT instr(department_name,'i',1,2) letter_existence FROM departments WHERE department_name = 'Shipping';

*** LENGTH
     it is used to find the length of a string
     space is also counted in between the string  

      SELECT length('Hello World') FROM dual;

      SELECT length(first_name), length(last_name) FROM employees;

      SELECT first_name, last_name, NVL2(NULLIF(length(first_name),length(last_name)),'NOT SAME','SAME')length_same_or_not  FROM employees;


  -- LPAD AND RPAD are the two functions used to add extra characters at left or right side
  -- excessive characters will be trimmed (removed)

*** LPAD
     padding LEFT side

     SELECT amount, LPAD(amount, 12, '*') result  FROM dual; 

     SELECT first_name, LPAD(salary, 5, '0') result FROM employees;
     
     SELECT first_name, LPAD(last_name, 10, 'xxxx') AS last_name FROM employees; 

*** RPAD

    SELECT first_name, RPAD(salary, 5, '/') result FROM employees;
    
    SELECT first_name, RPAD(last_name, 10, 'xxxx') AS last_name FROM employees; 

*** TRIM
      -- trim(), ltrim(), rtrim()
      
        SELECT TRIM('    naina    ') FROM dual;
         
        SELECT LTRIM('    naina   kumar') FROM dual;  

        SELECT RTRIM('    naina   kumar   ') FROM dual;  

        TRIM -- removes white spaces in both left anf right side
        LTRIM -- removes white spaces in left side
        RTRIM -- removes white spaces in right side



*** REPLACE

    SELECT * FROM countries;

    SELECT REPLACE(country_name,'Argentina','argentina-messi country') FROM countries;

*** REVERSE

    SELECT REVERSE(region_name) FROM regions;

*** TRANSLATE (Doubt)

    syntax :
       TRANSLATE (input STRING, CHARACTERS need TO be replaced, the replacing characters)
     
       SELECT TRANSLATE('fun','fn', 'bn') FROM dual;    

       SELECT TRANSLATE('Karthick','ck','k') FROM dual;
       
select TRUNC(SYSDATE), sysdate from dual;

SELECT LOWER('BALA') name, UPPER('good morning') sentence FROM DUAL;

SELECT INITCAP('HI GOODMORNING'), INITCAP('hi goodmorning') FROM DUAL;

SELECT first_name original_fn, LOWER(first_name) modified_fn,
      last_name original_ln, UPPER(last_name) modified_ln,
      job_id original_job_id,INITCAP(job_id) modified_job_id
FROM employees;

 INBUILT FUNCTIONS WILL BE CALLED FOR EACH AND EVERY ROW
 
 

SELECT * FROM employees
WHERE first_name = INITCAP('donald');

SELECT * FROM employees
WHERE first_name = INITCAP('doNald');

SELECT INITCAP('doNald') FROM dual;

SELECT INITCAP('dONALD'), UPPER('donald'), lower('Akash') FROM DUAL

SELECT * FROM employees
WHERE INITCAP(first_name) = INITCAP('michael');

SELECT * FROM employees
WHERE upper(first_name) = upper('donald');

SELECT upper('donald') FROM dual;

SELECT * FROM employees
WHERE lower(first_name) = lower('donald');

SELECT * FROM employees
WHERE first_name = first_name;

SELECT * FROM employees
WHERE first_name = lower('donald');

SELECT * FROM employees
WHERE upper(first_name) = lower('donald');

SELECT * FROM employees;

SELECT * FROM employees WHERE email = upper(email);



 Req: fetch employees having last_name with these 2 letters 'ca'
SELECT * FROM employees WHERE INITCAP(last_name) LIKE INITCAP('%ca%');

SELECT * FROM employees WHERE UPPER(last_name) LIKE UPPER('%ca%');

SELECT * FROM employees WHERE LOWER(last_name) LIKE LOWER('%ca%');

-- USING UPPER, LOWER ON LHS AND RHS IS SAFER


REq2: fetch employees having email ending with 'de'

  SELECT * FROM employees WHERE upper(email) LIKE upper('%de');

print first_name, last_name , full_name for all employees

  -- only two parameters are alalowed in concat, so we can't able to leave space in between

  SELECT first_name, last_name, CONCAT(first_name,last_name) full_name FROM employees;

  select first_name, last_name , (first_name || ' ' || last_name) full_name from employees;
 
    SELECT first_name, last_name, CONCAT(first_name,CONCAT (' ',last_name)) full_name FROM employees;
  
SELECT CONCAT('bala','kumar') full_name FROM dual;

SELECT concat('bala'CONCAT(' ',' ')'kumar') full_name FROM dual;

SELECT CONCAT(last_name, concat(' ',first_name)) FROM employees;

SELECT concat('bala', CONCAT(' ','kumar')) full_name FROM dual;

fetch the details of Abel Ellen

SELECT * FROM employees WHERE first_name = 'Abel'

SELECT * FROM employees WHERE concat(first_name, concat(' ',last_name)) = 'Steven King';

SELECT * FROM employees WHERE concat(first_name, ' '||last_name) = 'Steven King';

SELECT CONCAT(last_name, ' '||first_name) FROM employees;


--------------------------------------------------------------------------------------------------------


work with substr:

  select last_name from employees 
  where substr(UPPER(last_name),4,3) = 'KLE'

  select first_name from employees 
  where substr(UPPER(first_name),3,3) = 'EVE';

  select first_name, last_name, job_id from employees 
  where substr(UPPER(job_id),4,7) = 'ACCOUNT';

  select last_name from employees 
  where substr(UPPER(LAST_NAME),1) = 'ABEL';

SYNTAX:  SUBSTR(STRING, STARTING POSITION, COUNT TO MOVE THE INDEX)
        
        - IT ACCEPTS TWO PARAMETERS AND THREE PARAMETERS


INSTR: 
 
  using instr with dual:

  select instr('Manikandan', 'a', 1) from dual;
  
  select instr('Manikandan', 'a', 1,1) from dual;
  select instr('Manikandan', 'a', 1,2) from dual;

  select instr('Manikandan', 'a', 3,2) from dual;

  using where clause aloong with instr

- FETCHING THE STRING WHICH HAS EXACTLY ONE 'A' 
 
  select first_name from employees
  where instr(UPPER(first_name), UPPER('a'), 1, 1) > 0;

  select instr('Manikandan', 'a', 1,1) from dual;

  select instr('Manikandan', 'a', 1,2) from dual;

  create table find_str(first_name1 varchar(20));

  insert into find_str values('Amaaaar');
  insert into find_str values('Amar');
  insert into find_str values('Manikandan');
  insert into find_str values ('Nainika');
  insert into find_str values('Madona');
  insert into find_str values('Amit');
  commit;

  select * from find_str;

  select * from find_str 
  where instr(upper(first_name1),upper('a'),1,1) > 0;

  select * from find_str 
  where instr(upper(first_name1),upper('a'),1,2) > 0;
  
  select * from find_str 
  where instr(upper(first_name1),upper('a'),1,3) > 0;
 
  select * from find_str 
  where(instr(upper(first_name1),upper('a'),1,2) > 0)
  and  (instr(upper(first_name1),upper('a'),1,3) = 0);

 -- fetching employees last_names who has exactly two a's:

  select last_name from EMPLOYEES
  where instr(upper(last_name), upper('a'),1,2) > 0
  and instr(upper(last_name),upper('a'),1,3) = 0;

  
  select first_name from EMPLOYEES
  where instr(upper(first_name), upper('a'),1,2) > 0
  and instr(upper(first_name),upper('a'),1,3) = 0;

  fetching employees last_names who has exactly one a: 
 
   select first_name from EMPLOYEES
  where instr(upper(first_name), upper('a'),1,1) > 0
  and instr(upper(first_name),upper('a'),1,2) = 0;


  working with job_id:

  -more than one A:
  select job_id from employees 
  where instr(upper(job_id),upper('a'),1,1) >0    -- 53 recors

  - more than two A:
    select job_id from employees 
  where instr(upper(job_id),upper('a'),1,2) >0    -- 7 records

  - trying with different letter

- having two or more R:
      select job_id from employees
      where instr(upper(job_id), upper('r'),1,2) > 0;

- not having p in job_id
          select job_id from employees
          where instr(upper(job_id), upper('p'),1,1) = 0;  -- 60 records

- not having a in job_id
          select job_id from employees 
          where instr(upper(job_id), upper('a'),1,1) = 0;  -- 54 records

- not having _ in job_id

          select job_id from employees 
          where instr(upper(job_id), upper('_'),1,1) = 0;  -- 0 records

- not having capital A in lastname

          select last_name from EMPLOYEES
          where instr(last_name,'A',1,1) = 0; -- 103 records

- having A in last_name

          select last_name from EMPLOYEES
          where instr(last_name,'A',1,1) > 0;   -- 4 records



- reverse, translate, trim, rtrim, ltrim, lpad, rpad
          
          reverse in dual

          select reverse('Hello World')  from dual;
          select upper(reverse('Hello World'))  from dual;

          reverse in employees using where clause

          select first_name from employees
          where reverse(first_name) = 'nellE';

          select first_name from employees
          where upper(reverse(first_name)) = 'REDNAXELA';
          


  - translate ( translates acoording to each letter) 

           For eg: 'Hello World', 'el', 'xy' 
                    e - letter 'e' will be changed as 'x'
                    l - letter 'l' will be changed as 'y'

          select translate('Hello World', 'el', 'xy') from dual; 
             
 - reverse in quite different from translate
             For eg: 'Hello World', 'el', 'xy' 
                    only change appears when the 'el' letters occurs together
 
           select replace('Hello World', 'el', 'xy') from dual;
          
           -- only el changed but l is not changed with y


PAD: Adding extra either in left side or right side

          LPAD
            select 1000, LPAD(1000, 5, '*') from dual;
            select salary, LPAD(salary, 10, '-') from employees;
            select RPAD(salary,5,'/') from employees;
            select RPAD(salary,3) from employees;

          RPAD:
            select salary from EMPLOYEES
            where RPAD(salary,5) = 24000;


LPAD: ADDs character or number or special symbols to left side
RPAD: ADDs character or number or special symbols to right side          

            Trim: Trim used to delete or remove the leading and trail character or empty white spaces:

              White space examples:
               select trim('     Hello world     ') from dual;
               select ltrim('     Hello world     ') from dual;
               select rtrim('     Hello world     ') from dual;

              trim - also removes leading and trailing position
               select trim('H' from 'Hello World') from dual;
               select trim('l' from 'Hello World') from dual;    -- it doesn't work because it is present in between          

               select trim('H' from 'HHHHello worldH') from dual;
               select trim('H' from 'HHH Hello world') from dual;
              
               select trim(Leading 'H' from 'HHHHello world') from dual;
               select trim(Trailing 'H' from 'HHHHello worldH') from dual;

              select ltrim('HHH Hello world','H') from dual;
              select rtrim('HHH Hello worldHHH','H') from dual;

              ---------------------------------------------------------
              select last_name from EMPLOYEES
              where instr(upper(last_name), upper('a'),1,2) > 0
              and instr(upper(last_name),upper('a'),1,3) = 0;
              ---------------------------------------------------------


String functions requirements

UPPER LOWER INITCAP

1	what will be the output?
SELECT LOWER('BALA') name, UPPER('good morning'), INITCAP('good morning'),UPPER(LOWER(INITCAP('bala'))) sentence FROM DUAL;

name     UPPER('good morning') INITCAP('good morning') sentence
-------  --------------------- ----------------------- ----------
bala      GOOD MORNING          Good Morning            BALA

2	Fetch and display data from employees table for all employees like below
     
     select * from employees where first_name = 'Steven';

2a	My name is STEVEN and my mail id is sking. King''s full name is STEVEN KING
For STEVEN KING use 3 logics as below


* Use 2 UPPER and bring out STEVEN KING
    
    select 'My name is '||upper(first_name)||' and my mail id is '||email||'. '||
    last_name || '''s full name is ' || upper(first_name) || ' ' || upper(last_name) as sentence
    from employees order by employee_id;


* Use 1 UPPER and bring out STEVEN KING

    select 'My name is '||upper(first_name)||' and my mail id is '||email||'. '||
    last_name || '''s full name is ' || UPPER(concat(first_name, concat(' ',last_name))) as sentence
    from employees order by employee_id;

* Use CONCAT and UPPER to bring out STEVEN KING 
    
    select 'My name is '||upper(first_name)||' and my mail id is '||email||'. '||
    last_name || '''s full name is ' || concat(upper(first_name), concat(' ',upper(last_name))) as sentence
    from employees order by employee_id;



2b	KING''s JOB ID is Ad_Pres and email IS Sking
     
    select upper(last_name) || '''s JOB ID is '|| INITCAP(job_id)|| ' and email is '|| INITCAP(email) from employees;

    
3	Fetch the details of donald from employees table
Fetch the details of STEVEN KING from employees table. Note that the word 'STEVEN KING' comes as a single word from screen

   select * from employees where first_name = 'Donald';
   select * from employees where upper(first_name)||' '|| upper(last_name) = 'STEVEN KING';

4	Add TRIM in above query RHS and LHS
  
   select * from employees where upper(trim(first_name))||' '|| upper(trim(last_name)) = 'STEVEN KING';
       
   select * from employees where first_name = ' Alexander';

   select * from employees where first_name = ' Alexander     ';

select * from employees where first_name = '        Alexander     ';  

select * from employees where first_name = TRIM(' Alexander     ');

select trim(' Alexanader  ') from dual;

SELECT * FROM   employees where UPPER(first_name) = UPPER(TRIM('   Alexander   '))  



5	Fetch employees having letter 'a' or 'A' in their first_names
     
     select * from employees where Upper(first_name) like Upper('%a%'); 
     
    -- select first_name from employees where upper(first_name) not like upper('%a%'); 
     

CONCAT						

6	What will be the output						
6a	SELECT CONCAT(last_name, first_name||INITCAP(job_id)) col1, UPPER(CONCAT(employee_id||NVL(manager_id,0),department_id)) col2 FROM employees;
       
6b	Modify above query to bring expected output like below		
King-Steven-Ad_Pres	100-0-90	
Kochhar-Neena-Ad_Vp	101-100-90

   SELECT CONCAT(last_name, '-'||first_name||'-'||INITCAP(job_id)) col1,
   UPPER(CONCAT(employee_id||'-'||NVL(manager_id,0),'-'||department_id)) col2 FROM employees;

6c	Modify above query - remove CONCAT and use pipe and bring the same output
   
   SELECT (last_name||'-'||first_name||'-'||INITCAP(job_id)) col1,
   (employee_id||'-'||NVL(manager_id,0)||'-'||department_id) col2 FROM employees;
  
6d	What is the error?

SELECT CONCAT(last_name, '-'|| first_name||'-'||initcap(job_id)) from employees;
        
6e	Try your own example for CONCAT in WHERE
    select * from employees 
    where concat(first_name,last_name) = 'Steven'||'King';
 
 6f	What will be the output for this query
SELECT Length('HI'||' '), 'BYE'||NULL FROM DUAL;
    

6g	Can we use CONCAT for NUMBER and DATE columns? Check it : YES
    select concat(employee_id, hire_date) from employees;     
    
SUBSTR
7	Fetch the employee having first name like Don
7a	Use LIKE + UPPER + TRIM
     select * from employees where UPPER(first_name) LIKE UPPER(trim('Don%'));
7b	Use SUBSTR + UPPER + TRIM
     select * from employees where UPPER(substr(first_name,1,3)) LIKE UPPER(TRIM('Don%'));
     
8	Fetch the employee having 3rd letter as 'e'/'E' in his first name   
8a	Use LIKE + UPPER + TRIM
    select * from employees where UPPER(first_name) LIKE UPPER(TRIM('__E%'));
8b	Use SUBSTR + UPPER + TRIM
    select * from employees where UPPER(substr(first_name,3,1)) = UPPER(TRIM('E'));
    
9	What will be the output?
SELECT LENGTH(TRIM(UPPER(SUBSTR('  hello WORLD   ',2, 8)))) FROM DUAL;

10	What will be the output?
SELECT TRIM(INSTR(' hello ','e')), INSTR (TRIM(' hello '),'e') FROM DUAL;

11	What will be the output?
SELECT TRIM(SUBSTR(' hello ',1,2)), SUBSTR(TRIM(' hello '),1,2) FROM DUAL;

12	Fetch the employees having letter 'x' in their first names
a	using LIKE

    select * from employees
    where upper(first_name) like upper('%x%');

b	using INSTR
    
    select * from employees
    where instr(upper(first_name),upper('x')) > 0; 
 
13	Fetch the employees having letter 'x' in 3rd position in their first names
a	using LIKE
    select * from employees
    where upper(first_name) like upper('__x%'); 

b	using INSTR
    select * from employees
    where instr(upper(first_name),'X',3,1) = 3;

c	using SUBSTR
    select * from employees
    where substr(upper(first_name),3,1) = 'X';

14	What will be the output?
SELECT INSTR(UPPER('BalaMurali'),UPPER('b')) example FROM DUAL;

18	Fetch the REPs using

LIKE
    select * from EMPLOYEES
    where job_id like '%REP%';    --33 recors
SUBSTR
    select * from EMPLOYEES
    where upper(substr(job_id,4,6)) like upper('REP');

REPLACE
    select replace(upper(job_id),'REP','XYZ') from EMPLOYEES
    where job_id like '%REP%';

  
19	In employees table
Replace all phone numbers like 515.123.4567 to 515-123-4567 and display in SELECT
Use REPLACE
    select replace(phone_number,'.','-') from employees;  

use TRANSLATE
    select translate(phone_number,'.','-') from employees;  

20a	Remove all dots in phone numbers like 515.123.4567 to 5151234567 and display in SELECT

Use REPLACE
    select replace(phone_number,'.','') from employees;
Use TRANSLATE
    select replace(phone_number,'.','') from employees;

20b	try above in dual and employees table
        
20c	try above in dual and employees table

20d	Fetch the employee having phone number 5151234568
   select * from employees  
   where replace(phone_number,'.','') = 5151234568;

20e	Fetch the employees having phone numbers 5151234568 and 5151234567
   select * from employees  
   where replace(phone_number,'.','') = 5151234568
   or replace(phone_number,'.','') = 5151234567

   select * from employees  
   where replace(phone_number,'.','') in (5151234568,5151234567)
   

    where department_id in (10,20)
21	What will be the output?
SELECT TRANSLATE ('the one theatre theory knocked down','theo','xyz') FROM DUAL;


22	What will be the output for this query?

SELECT TRIM(LOWER(TRIM(' ' || 'H'))
FROM LOWER('HHHHI, HELLO, HOW ARE YOU, HHHHBhhHHhhh')) HHH
FROM dual;  
 
select SUBSTR(UPPER('Arithmetic'), LENGTH(DUMMY) + 4, INSTR(DUMMY, 'X', 1, 1)) from dual;
select dummy,length(dummy), INSTR(DUMMY, 'X', 1, 1) from dual;

substr('Arithmetic',5,1)


23	Fetch the names having "same" first letter and last letter in first_name column in employees table irrespective of upper/lower case

    select * from EMPLOYEES
    where substr(upper(first_name),1,1) = substr(upper(first_name), Length(first_name), 1); 
    
24	Fetch the employees having same 
    First name first letter = last name first letter
    
      select * from EMPLOYEES
      where substr(upper(first_name),1,1) = substr(upper(last_name), 1, 1); 
            

25	What will be the output?
SELECT SUBSTR('BalaB',1,1) , SUBSTR('BalaB',LENGTH('BalaB'),1) FROM DUAL;

column1 column2
B       B

26	Consider the following first_names in employees table
FIRST_NAME
Abhinaya
Jagan
xerox
Ariya

select first_name,substr(first_name,2,Length(first_name)-2) from employees;

select * from employees 
where substr(upper(first_name),1,1) != substr(upper(first_name), Length(first_name), 1);

select * from employees 
where substr(upper(first_name),1,1) = substr(upper(first_name), Length(first_name), 1);

select first_name, nvl2(NULLIF(substr(upper(first_name),1,1),substr(upper(first_name),length(first_name),1)),
                   first_name,
                   substr(first_name,2,length(first_name)-2)) 
from employees;


Expected output
bhinay
Jagan
ero
riy


select * from employees where department_id = &id;

select * from employees where department_id = 200;


------------------------------------------------------


SELECT CONCAT ('RESULT IS :  ', CASE DECODE ( MOD (LENGTH ( LPAD (UPPER (TRIM (REPLACE (TRIM (TRAILING '!' FROM (CONCAT (
SUBSTR (' Good afternoon', 2, 4), ' night !!!!!'))), 'night','day'))), 10, '*')), 2), 0, 'EVEN', 1, 'ODD' ) 
WHEN 'EVEN' THEN 'output is even' ELSE 'output is odd' END ) result FROM DUAL;

SUBSTR (' Good afternoon', 2, 4)  -- Go

CONCAT (SUBSTR (' Good afternoon', 2, 4), ' night !!!!!') -- Go night !!!!!

TRAILING '!' FROM (CONCAT (SUBSTR (' Good afternoon', 2, 4), ' night !!!!!')) -- Go night
 
REPLACE (TRIM (TRAILING '!' FROM (CONCAT (SUBSTR (' Good afternoon', 2, 4), ' night !!!!!'))), 'night','day') -- Go day

UPPER (TRIM (REPLACE (TRIM (TRAILING '!' FROM (CONCAT (
SUBSTR (' Good afternoon', 2, 4), ' night !!!!!'))), 'night','day')))  GO DAY 

LPAD (UPPER (TRIM (REPLACE (TRIM (TRAILING '!' FROM (CONCAT (
SUBSTR (' Good afternoon', 2, 4), ' night !!!!!'))), 'night','day'))), 10, '*') -- **********GO DAY

LENGTH ( LPAD (UPPER (TRIM (REPLACE (TRIM (TRAILING '!' FROM (CONCAT (
SUBSTR (' Good afternoon', 2, 4), ' night !!!!!'))), 'night','day'))), 10, '*')) -- 16

MOD (LENGTH ( LPAD (UPPER (TRIM (REPLACE (TRIM (TRAILING '!' FROM (CONCAT (
SUBSTR (' Good afternoon', 2, 4), ' night !!!!!'))), 'night','day'))), 10, '*')), 2)  -- 16%2 = 0

DECODE ( MOD (LENGTH ( LPAD (UPPER (TRIM (REPLACE (TRIM (TRAILING '!' FROM (CONCAT (
SUBSTR (' Good afternoon', 2, 4), ' night !!!!!'))), 'night','day'))), 10, '*')), 2), 0, 'EVEN', 1, 'ODD' ) -- EVEN

CONCAT ('RESULT IS :  ', CASE DECODE ( MOD (LENGTH ( LPAD (UPPER (TRIM (REPLACE (TRIM (TRAILING '!' FROM (CONCAT (
SUBSTR (' Good afternoon', 2, 4), ' night !!!!!'))), 'night','day'))), 10, '*')), 2), 0, 'EVEN', 1, 'ODD' ) 
WHEN 'EVEN' THEN 'output is even' ELSE 'output is odd' END ) result   -- Output is even


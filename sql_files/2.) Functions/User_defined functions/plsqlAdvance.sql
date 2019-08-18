PLSQL:

Plsql objects
- procedures
- functions
- packages
- triggers

For example,


Create a table T_1 with 2 columns and those 2 columns should be DATE...

drop table T_1;

CREATE TABLE T_1
(
col1 DATE,
col2 DATE
);

Create another table T_2 with 2 columns. One is DATE and another number

CREATE TABLE T_2
(
col1 DATE,
col2 NUMBER
);

so for this requirement -
fetch the tables having "ONLY" date column
Answer is - T_1

select table_name from USER_TAB_COLUMNS
group by table_name 
having sum(decode(DATA_TYPE,'DATE',1,0)) = count(*);

So you have to fetch from USER_TAB_COLUMNS

---

set server output on
declare

--------
IN – is the default mode.

- When you define an IN parameter in a stored procedure, the calling program has to pass an argument to the stored procedure.

- In addition, the value of an IN parameter is protected. It means that even the value of the IN parameter is changed inside the stored procedure, 
its original value is retained after the stored procedure ends.

- In other words, the stored procedure only works on the copy of the IN parameter.

OUT - 

-the value of an OUT parameter can be changed inside the stored procedure and its new value is passed back to the calling program.

- Notice that the stored procedure cannot access the initial value of the OUT parameter when it starts.

INOUT

- an INOUT  parameter is a combination of IN  and OUT  parameters. It means that the calling program may pass the argument, and the stored 
procedure can modify the INOUT parameter, and pass the new value back to the calling program.

 Procedure

drop function p_test1;
create or replace procedure p_test1(p_in_emp_id IN number,
                                  p_out_sal out number,
                                  p_out_dept_name out varchar2)
as
  v_dept_id number;
begin
  select salary, department_id
  into p_out_sal, V_DEPT_ID
  from EMPLOYEES
  where employee_id = p_in_emp_id;
  
  select department_name
  into p_out_dept_name
  from departments 
  where department_id = v_dept_id;
  
END;
/  

desc p_test1;    

- Tried following plsql code in sqlplus                             

SET SERVEROUTPUT ON

DECLARE
 v_sal NUMBER;
 v_dept_name VARCHAR2 (100);
BEGIN

p_test1 (100, v_sal, v_dept_name);

DBMS_OUTPUT.PUT_LINE(v_sal);
DBMS_OUTPUT.PUT_LINE(v_dept_name);

END;
/



CREATE OR REPLACE FUNCTION calculate_date_years
(in_date DATE, in_years IN number, in_months IN number default 0)
RETURN DATE AS 
    new_date DATE;
BEGIN
   IF in_date is null or in_years is null then 
      raise NO_DATA_FOUND;
   END IF;
   new_date := ADD_MONTHS(in_date, 12 * in_years);
   -- Additional code to add the number of months to the calculated date
    IF in_months != 0 then 
        new_date := ADD_MONTHS(new_date, in_months);
    END IF;
    RETURN new_date;
END;	


create or replace function f_change_name
(p_name IN VARCHAR2)
RETURN VARCHAR
AS 
BEGIN

RETURN UPPER(p_name);

END;
/

create or replace function f_add_numbers
(p_in_no1 IN NUMBER,
 p_in_no2 IN NUMBER)
 RETURN NUMBER
 AS 
 BEGIN
 
 RETURN p_in_no1 + p_in_no2;
 
 END;
 /
 
 select mod(12,2) from dual;
 
 select mod(13,2) from dual;
 
CREATE OR REPLACE FUNCTION f_get_remainder_add (
p_in_no1 IN NUMBER, 
p_in_no2 IN NUMBER, 
p_in_no3 IN NUMBER)
RETURN NUMBER
AS

BEGIN

RETURN (MOD(p_in_no1 , p_in_no2) ) + p_in_no3;

END;
/
 
 
 -- TRYING TO CREATE A FUNCTION FOR MULTIPLICATION
 create or replace function fun_multiply (
    p_in_no1 IN NUMBER,
    p_in_no2 IN NUMBER)
    RETURN NUMBER
    AS
    BEGIN
  
    return (p_in_no1 * p_in_no2);
  
   END;
   /
   
 DECLARE
    a number := 100;
    b number := 200;
 BEGIN
	IF (a > b) THEN
       	  dbms_output.put_line ('A is greater than B');
    ELSIF (b > a) THEN
           dbms_output.put_line('B is greater than A');  
    END IF;
 END; 
   
     
 DECLARE
    name1 varchar2(20) := 'apple';
	name2 varchar2(20) := 'grape';
 BEGIN
	IF (name1 like ('apple')) THEN
       	  dbms_output.put_line ('Apple is the fruit');
    ELSIF (name1 like 'Grape') THEN
           dbms_output.put_line('Grape is the fruit');  
    END IF;
 END; 
   
 -- CASE

DECLARE
  a integer:= 1000;
Begin
  case a
     when 200 then dbms_output.put_line ('1st');
     when 400 then dbms_output.put_line ('2nd');
     when 600 then dbms_output.put_line ('3rd');
     when 800 then dbms_output.put_line ('4th');
     when 1000 then dbms_output.put_line ('5th');
  END CASE;	 
END;


DECLARE
  a boolean:= true;
Begin
  case a
     when false then dbms_output.put_line ('1st');
     when true then dbms_output.put_line ('2nd');
  END CASE;	 
END;



eid  en   did   mid
1   King   -     -
2   Bala   10    1

did  dname
10    oracle  







 
 
   
   
   
   
   
   create or replace function fun_division(
   p_in_no1 IN number,
   p_in_no2 IN NUMBER)
   return NUMBER
   AS
   BEGIN
   
   return (p_in_no1 / p_in_no2);
   end;
   /
   
   
setserveroutput on
BEGIN

dbms_output.put_line('Hi');
dbms_output.put_line('Hello');

end;

select f_multiply(1,5,3) from dual;
   
   
-------------------------------------------------------

12/05/2019
 create or replace function t_get_added
  2  ( p1_num1 IN NUMBER,
  3  p2_num2 IN NUMBER,
  4  p3_num3 IN NUMBER)
  5  RETURN NUMBER
  6  AS
  7  BEGIN
  8  RETURN (p1_num1+p2_num2+p3_num3);
  9  end;
 10  /
 
 create or replace function rev_string 
 (str1 IN VARCHAR2)
 RETURN VARCHAR2
 AS
 BEGIN 
 RETURN (REVERSE(str1) );
 end;
 /
    
 ------------------------------------------------------
 
 
 SET SERVEROUTPUT ON 
 declare
 
 v_abcd number := 10;
 xyz number := 20;
 lmn varchar2(100);
 
 Begin
 
 dbms_output.put_line('v_abcd is :'||v_abcd);
 dbms_output.put_line('xyz is :'||xyz);
 
  dbms_output.put_line('A) lmn is :'||lmn);
  
  lmn := v_abcd + xyz;
  
  dbms_output.put_line('B) lmn is :'||lmn);

  Select dummy 
  into lmn 
  from dual;

   dbms_output.put_line('C) lmn is :'||lmn);

END;
/

  
  
  
  
  
    
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
 
 
 
 
 
 
 
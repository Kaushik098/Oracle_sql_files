Control Statements:

PL/SQL IF
PL/SQL Case
PL/SQL Loop
PL/SQL Exit Loop
PL/SQL For Loop
PL/SQL Continue
PL/SQL GOTO

set serveroutput on

a.) PL/SQL IF:

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
/ 

--------------
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
/ 

-------------------------------------------------------------------------------------------------

b.) PL/SQL CASE:


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
/

-----------

DECLARE
  a boolean:= true;
Begin
  case a
     when false then dbms_output.put_line ('1st');
     when true then dbms_output.put_line ('2nd');
  END CASE;	 
END;
/

----------------------------------------------------------------------------------------------


c.) PL/SQL Loop:

  Loop : To repeat the excecution one or more times.

  Types of Loop :
  >>  Basic Loop / Exit Loop
  >>  While Loop
  >>  For Loop
  >>  Cursor For Loop

 Basic Loop / Exit Loop:

DECLARE  
  i NUMBER := 1;  
BEGIN  
LOOP  
EXIT WHEN i>10;  
DBMS_OUTPUT.PUT_LINE(i);  
i := i+1;  
END LOOP;  
END;  
/

-------------------

DECLARE  
  i NUMBER := 11; 
  j NUMBER := 20;
BEGIN  
LOOP  
EXIT WHEN i>j;  
DBMS_OUTPUT.PUT_LINE(i);  
i := i+1;  
END LOOP;  
END;  
/
 

-- try in SQLPLUSs


DECLARE  
  i NUMBER := 11; 
  j NUMBER := 11;
BEGIN  
LOOP  
EXIT WHEN i>j;  
DBMS_OUTPUT.PUT_LINE(i);  
i := i+1;  
END LOOP;  
END;  
/

-- prints atleast once because exit loop exceutes atleast once when condition is not correct (Acts as Do while loop)
------------------

DECLARE   
   VAR1 NUMBER;  
   VAR2 NUMBER;  
BEGIN   
   VAR1:=100;  
   VAR2:=1;  
       LOOP  
          DBMS_OUTPUT.PUT_LINE (VAR1*VAR2);  
            IF (VAR2=10) THEN  
                  EXIT;  
            END IF;  
            VAR2:=VAR2+1;  
            END LOOP;  
            END;  
/

-------------------------------------------------------------------------------------------------------------------------

PL/SQL While loop


DECLARE
   a number := 4;
Begin
  while ( a <= 10 ) LOOP
      dbms_output.put_line(a);
      a := a+1;
  END loop;
END;

------

DECLARE
   a number := 10;
Begin
  while ( a < 10 ) LOOP
      dbms_output.put_line(a);
      a := a+1;
  END loop;
END;
-- results no output because it loops only when the condition is true

---------

DECLARE
   a number := 1;
   b number := 5;
Begin
  while ( a <= b ) LOOP
      dbms_output.put_line(a);
      a := a+1;
  END loop;
END;


---------------------------------------------------------------------------------------------------

PL/SQL For Loop
-- Auto increment has been done without increment operator 
-- only range has to be declared.

BEGIN  
FOR k IN 1000..1005 LOOP  
DBMS_OUTPUT.PUT_LINE(k);  
END LOOP;  
END;   

-------------


DECLARE   
VAR1 NUMBER;  
BEGIN   
VAR1:=10;  
FOR VAR2 IN 1..5  
LOOP  
DBMS_OUTPUT.PUT_LINE (VAR1*VAR2);  
END LOOP;  
END;  

------------------------------------------------------------------------------

PL/SQL For Loop Reverse

 
Begin 
   FOR k in reverse 90 .. v LOOP
    DBMS_OUTPUT.PUT_LINE(k);
   END Loop;
END;

------------------------------------------------------------------------------














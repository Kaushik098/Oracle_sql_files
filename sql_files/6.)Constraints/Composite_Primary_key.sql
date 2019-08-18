Composite Primary key (EMP_SKILLS)

- A table can have only one primary key 
- A primary can have more than one column - Composite primary key


create table emp123 (emp_id integer primary key, emp_name varchar2(20));

insert into emp123 (emp_id, emp_name) values (1, 'A');
insert into emp123 (emp_id, emp_name) values (2, 'B');

commit;
select * from emp123;

select * from user_constraints where table_name = 'EMP123';

select * from user_cons_columns where table_name = 'EMP123';

select distinct constraint_type from user_constraints;


R - Reference Key
U - Unique
P - Primary
C - Check and not null
O

select * from user_constraints where table_name = 'EMPLOYEES';
select * from USER_CONS_COLUMNS where table_name = 'EMPLOYEES'; 

select * from user_constraints where table_name = 'DEPARTMENTS';
select * from user_cons_columns where table_name = 'DEPARTMENTS';

create table skills (skill_id integer primary key, skill_name varchar2(20));

insert into skills(skill_id, skill_name) values (100, 'Java')

insert into skills(skill_id, skill_name) values (200, 'Oracle')

commit;
select * from skills;

select * from user_constraints where table_name = 'SKILLS';
select * from user_cons_columns where table_name = 'SKILLS';

-----------

DATA:

A knows oracle 
B knows oracle and java

EMP_ID   SKILL_ID
1         200
2         100 
2         200

create table emp_skills(emp_id number, skill_id number); 

insert  into emp_skills (emp_id, skill_id) values (1, 200)
insert  into emp_skills (emp_id, skill_id) values (2, 100)
insert  into emp_skills (emp_id, skill_id) values (2, 200)

commit;

select * from emp_skills;

Negative_Scenario:

insert  into emp_skills (emp_id, skill_id) values (999, 999)
commit;
select * from emp_skills;

drop table emp_skills;

---------------

create table emp_skills(emp_id number references emp123(emp_id), skill_id number references skills(skill_id)); 

insert  into emp_skills (emp_id, skill_id) values (1, 200)
insert  into emp_skills (emp_id, skill_id) values (2, 100)
insert  into emp_skills (emp_id, skill_id) values (2, 200)
commit;

NEG Scenario
insert  into emp_skills (emp_id, skill_id) values (999, 999)
1 ORA-02291: integrity constraint (HR.SYS_C007363) violated - parent key not found 


select * from emp_skills;

select * from user_constraints where table_name = 'EMP_SKILLS'; 
select * from user_cons_columns where table_name = 'EMP_SKILLS';


select * from emp_skills;
insert into emp_skills (emp_id, skill_id) values (2, 100);
commit;
E_ID SKILL_ID
1	   200
2	   100
2	   200
2	   100

-We should not allow duplicate values like above 
-We should use composite primary key to achieve this 

drop table emp_skills;

-Composite primary key role

create table emp_skills(
emp_id number references emp123(emp_id),
skill_id number references skills(skill_id),
primary key(emp_id, skill_id)  -- composite primary key 
); 

insert  into emp_skills (emp_id, skill_id) values (1, 200)

insert  into emp_skills (emp_id, skill_id) values (2, 100)

insert  into emp_skills (emp_id, skill_id) values (2, 200)
commit;


NEGATIVE SCENARIO:
insert  into emp_skills (emp_id, skill_id) values (2, 200)
1 ORA-00001: unique constraint (HR.SYS_C007364) violated 

select * from user_constraints where table_name = 'EMP_SKILLS' 
select * from user_cons_columns where table_name = 'EMP_SKILLS'

Check the position columns in user_cons_columns for composite column primary key.











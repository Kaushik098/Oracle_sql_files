
create table my_countries
(
country_id number constraint pk_mc_country_id primary key,
country_name varchar2(100) constraint nn_mc_country_name not null,
region_id1 number constraint r_mc_region_id1 references regions(region_id), --->regions
region_id2 number constraint r_mc_region_id2 references regions(region_id), --->regions not null
capital varchar2(100), 
ct_code1 number default 100,
ct_code2 number default 200,
constraint chk_mc_ct_code CHECK (ct_code2 > ct_code1)
);

add this constraint at table level - ct_code2 should be greater than ct_code1 

select * from user_constraints where table_name = 'MY_COUNTRIES';
select * from user_cons_columns where table_name = 'MY_COUNTRIES';


select uc.constraint_name, uc.table_name, uc.constraint_type, uc.r_constraint_name, uc.status, uc.search_condition, cc.column_name, cc.position     
from user_constraints uc, user_cons_columns cc 
where (uc.constraint_name = cc.constraint_name)
and (uc.table_name = cc.table_name)
and uc.table_name = 'MY_COUNTRIES';

Insert positive and negative scenarios for ct_code1, 2

-- Positive scenario
select * from my_countries;
insert into my_countries (country_id, country_name, region_id1, region_id2, capital, ct_code1, ct_code2)
values (1001, 'England', 1, 2, 'London', 100, 200);

insert into my_countries (country_id, country_name, region_id1, region_id2, capital)
values (1002, 'England', 1, 2, 'London');

insert into my_countries (country_id, country_name, region_id1, region_id2, capital, ct_code1, ct_code2)
values (1003, 'England', 1, 2, 'London', default, default);

-- trying to insert null in checkc constraint 
insert into my_countries (country_id, country_name, region_id1, region_id2, capital, ct_code1, ct_code2)
values (1004, 'England', 1, 2, 'London', null, null);

commit;

Negative Scenario:

insert into my_countries (country_id, country_name, region_id1, region_id2, capital, ct_code1, ct_code2)
values (1004, 'England', 1, 2, 'London', 200, 100);
1 ORA-02290: check constraint (HR.CHK_MC_CT_CODE) violated

insert into my_countries (country_id, country_name, region_id1, region_id2, capital, ct_code1, ct_code2)
values (1004, 'England', 1, 2, 'London', null, null);

----------------
 add this CONSTRAINT after table creation
check given value country_name is upper case

alter table my_countries add constraint chk_mc_country_name CHECK (country_name = upper(COUNTRY_NAME));

select * from my_countries;

UPDATE my_countries set country_name = 'ENGLAND';

2.)capital length should be > 2

alter table my_countries add constraint chk_mc_capital check (length(capital) > 2);


ct_code2 is not null

alter table my_countries add constraint chk_mc_ct_code2 check (ct_code2 is not null);

update my_countries set ct_code2 = 300 where country_id = 1004;

  select * from my_countries;

5) Write a query to fetch children of Regions

select distinct table_name 
from user_constraints 
where r_constraint_name = (select constraint_name from user_constraints where table_name = 'REGIONS' and constraint_type = 'P');


6) Write a query to fetch the distinct tables having foreign key

select distinct table_name 
from user_constraints 
where constraint_type = 'R';

select * from user_constraints where table_name IN ('EMPLOYEES', 'DEPARTMENTS');

desc my_countries;

select * from user_cons_columns where table_name = 'MY_COUNTRIES';

alter table my_countries disable constraint chk_mc_ct_code;

select uc.constraint_name, uc.table_name, uc.constraint_type, uc.r_constraint_name, uc.status, uc.search_condition, cc.column_name, cc.position     
from user_constraints uc, user_cons_columns cc 
where (uc.constraint_name = cc.constraint_name)
and (uc.table_name = cc.table_name)
and uc.table_name = 'MY_COUNTRIES';

insert into my_countries values (1005, 'SCOTLAND', 1, 2, 'Cardiff', 100, 40); 

commit;

alter table my_countries enable constraint chk_mc_ct_code;
1 ORA-02293: cannot validate (HR.CHK_MC_CT_CODE) - check constraint violated 

alter table my_countries drop constraint chk_mc_ct_code;

drop table regions;
1 ORA-02449: unique/primary keys in table referenced by foreign keys

delete from regions;
1 ORA-02292: integrity constraint (HR.COUNTR_REG_FK) violated - child record found

truncate table regions;
1 ORA-02266: unique/primary keys in table referenced by enabled foreign keys 


DDL:
alter 
create 
drop 
truncate - cannot rollback, faster than delete operation, full table space will be deleted

DML:
insert 
delete - 'rollback segment available', space will be available even after deletion.
update 


1) Fetch the tables having only DATE column
INTERSECT
JOIN
SUM(DECODE(
COUNT(DECODE(


2) nested functions

3) Find the children of regions using SELF JOIN

4) Analyse last plsql anonymous block

5) Fetch highest and lowest 

6) Arrange all folders properly - 18 Jul


1) Fetch the tables having only DATE columns 👆👆👆

Select a.table_name from  (select table_name, count (1) cnt from user_tab_columns where data_type = 'DATE' GROUP by table_name) a, 
(select table_name, count (1) cnt from user_tab_columns group by table_name) b where a.table_name = b.table_name and a.cnt =  B.cnt

2) analyze this nested function
👇👇👇

SELECT CONCAT ('RESULT IS :  ', CASE DECODE ( MOD (LENGTH ( LPAD (UPPER (TRIM (REPLACE (TRIM 
(TRAILING '!' FROM (CONCAT (SUBSTR (' Good afternoon', 2, 4), ' night !!!!!'))), 'night','day'))), 10, '*')), 2), 0, 'EVEN', 1, 'ODD' ) 
WHEN 'EVEN' THEN 'output is even' ELSE 'output is odd' END ) result FROM DUAL;




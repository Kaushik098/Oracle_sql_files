
Types of Index:

- Normal index 
- Unique index 


Unique constraints will automatically create unique index 

But we are trying to create unique index on mobile number column of our own.

And we are trying to find the difference between normal index and unique index on mobile number.



create table index_details(mobile_no number);

-- Befor creating index 
explain plan for select * from index_details where mobile_no = 111;
select plan_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());

Id  | Operation         | Name          | Rows  | Bytes | Cost (%CPU)| Time  
|   0 | SELECT STATEMENT  |               |     1 |    13 |     2   (0)| 00:00:01 |
|*  1 |  TABLE ACCESS FULL| INDEX_DETAILS |     1 |    13 |     2   (0)| 00:00:01 |


create index idx_index_details on index_details(mobile_no);

-- After creating normal index 
explain plan for select * from index_details where mobile_no = 111;
select plan_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());

Plan hash value: 4024224599
 
--------------------------------------------------------------------------------------
| Id  | Operation        | Name              | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT |                   |     1 |    13 |     1   (0)| 00:00:01 |
|*  1 |  INDEX RANGE SCAN| IDX_INDEX_DETAILS |     1 |    13 |     1   (0)| 00:00:01 |
--------------------------------------------------------------------------------------

select * from user_constraints where table_name = 'INDEX_DETAILS';
select * from user_cons_columns where table_name = 'INDEX_DETAILS';

select * from user_indexes where table_name = 'INDEX_DETAILS';
select * from user_ind_columns where table_name = 'INDEX_DETAILS';

insert into index_details values (11111111);
insert into index_details values (22222222);


INDEX PAGE
MOBILE_NO
-----

11111111 - AAAFvOAAEAAAArvAAA, AAAFvOAAEAAAArvAAC
22222222 - AAAFvOAAEAAAArvAAB

select rowID, e.* from index_details e;

explain plan for select * from index_details where mobile_no = 11111111;
select plan_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());

Plan hash value: 4024224599
 
--------------------------------------------------------------------------------------
| Id  | Operation        | Name              | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT |                   |     2 |    26 |     1   (0)| 00:00:01 |
|*  1 |  INDEX RANGE SCAN| IDX_INDEX_DETAILS |     2 |    26 |     1   (0)| 00:00:01 |
--------------------------------------------------------------------------------------

drop index idx_index_details;

create unique index idx_index_details on index_details(mobile_no);
1 ORA-01452: cannot CREATE UNIQUE INDEX; duplicate keys found 

delete from index_details where rowID = 'AAAFvOAAEAAAArvAAC';

create unique index idx_index_details on index_details(mobile_no);

select * from user_constraints where table_name = 'INDEX_DETAILS';
select * from user_cons_columns where table_name = 'INDEX_DETAILS';

select * from user_indexes where table_name = 'INDEX_DETAILS';
select * from user_ind_columns where table_name = 'INDEX_DETAILS';


Note: Unique index will be faster than normal index because there will be one row ID  associated with one value

explain plan for select * from index_details where mobile_no = 11111111;
select plan_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());

Plan hash value: 376589293
 
---------------------------------------------------------------------------------------
| Id  | Operation         | Name              | Rows  | Bytes | Cost (%CPU)| Time     |
---------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |                   |     1 |     6 |     0   (0)| 00:00:01 |
|*  1 |  INDEX UNIQUE SCAN| IDX_INDEX_DETAILS |     1 |     6 |     0   (0)| 00:00:01 |
 

- Normal index 
--------------------------------------------------------------------------------------
| Id  | Operation        | Name              | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT |                   |     2 |    26 |     1   (0)| 00:00:01 |
|*  1 |  INDEX RANGE SCAN| IDX_INDEX_DETAILS |     2 |    26 |     1   (0)| 00:00:01 |
--------------------------------------------------------------------------------------

Note the difference between range scan and unique scan 

unique scan is faster than range scan 

when you know that your column will have unique values it is better to create unique index (or) create an unique constraint and let oracle 
automatically create unique index.

---------------------------------------------------------------------------


Composite primary key and automatic composite unique index 

select * from user_constraints where table_name = 'EMP_SKILLS';
select * from user_cons_columns where table_name = 'EMP_SKILLS';

select * from user_indexes where table_name = 'EMP_SKILLS';
select * from user_ind_columns where table_name = 'EMP_SKILLS';


---------------------------------------------------

Three important things to remember:

Full table scan
Range scan 
Unique scan 


-------------------------------------------------
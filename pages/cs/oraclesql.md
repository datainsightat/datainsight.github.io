# Oracle SQL

## A 3: Retrieving Data

### Oracle Data Types

* varchar2(size): Variable-length character data
* char(size): Fixed-lenght character data
* number(p,s): Variable-length numeric data (precision  = number of digits, scale = decimals)
* date: Date and time values
* long: Variable-length data up to 2GB
* clob: Unicode character data. Up to 2,147,483,647 characters. Maximum size (4GB - 1) * (DB_BLOCK_SIZE)
* raw and long raw: Raw binary data
* blob: Binary large data. Up to 4GB
* bfile: Binary data stored in external file. Up to 4GB
* rowid: base64 number. Unique Row Address

### Describe Command

	desc[ribe] table_name;

### Select Statement

	select *|{column_name1,column_name2,...} from table;

### Column Aliases

	select first_name as name, last_name "Last Name", salary*12 "Annual Salary" from employees;

### Quote Operator

	select q'[My Name is Steven]' my_text from dual;

### Distinct and Unique Operator

	select distinct job_id from employees;

The distinct operator ist row-based only. One distinct operator is used in one select statement.

### Concatenation Operators

	select first_name || ' ' || last_name as "Names" from employees;

### Artithmetic Expressions

	select employees_id, salary, (salary + 200) * 12 as "Annual Salary" from employees;

	select sysdate + 3 from dual;

## A 4: Restricting Data

### Where Clause

	select *|{[distinct] column [alias],...}
	from table
	[where logical expressions(s)];

### Comparison Operators

* Comparison operators: =, <, >, <=, >=, <>, !=, between, in, like and null
* Logical operators: and, or, not

### Between ... And Operator

	select first_name, last_name, salary
	from employees
	where salary between 12000 and 15000;

### In Operator

	select employee_id, first_name, last_name, salary, manager_id
	from employees
	where employee_id in (100,102,105,200);

### Like Operator

	select first_name, last_name
	from employees
	where first_name like 'A%';

* %: 0 or more characters
* _: 1 character

### Is Null Operator

	select first_name
	from employees
	where manager_id is null;

### Logical Operators (and, or, not)

	select first_name, lats_name, salary, job_id
	from employees
	where job_id = 'IT_PROG' and salary >= 5000;

	select first_name, lats_name, salary, job_id
	from employees
	where job_id = 'IT_PROG' or salary >= 5000;

	select first_name, lats_name, salary, job_id
	from employees
	where salary > 10000 and job_id not in ('SA_MAN','ST_CLERK','SH_CLERK');

### Rules of Precedence

1. Arithmetic operators
2. Concatenation operator
3. Comparison operator
4. is [not] null, like, [not] in
5. [not] between
6. Not equal to
7. Not logical operator
8. And logical operator
9. Or logical operator

## A 5: Sorting Data

### Order By Clause

	select first_name, last_name
	from employees
	order by last_name;

### ASC and DESC Operators

	select first_name, last_name
	from employees
	order by first_name desc, last_name asc;

### NULLS FIRST and NULLS LAST Operators

	select first_name, last_name
	from employees
	order by 1 desc nulls first, 2 asc nulls last;

## A 7: Single-Row Functions

	select function_name [(arg1, arg2,...)] from dual;

### Overview

* Character functions
* Number functions
* Date functions
* Conversion functions
* General functions

### Case Conversion Functions

	select lower('Test') from dual; -> 'test'

	select upper('Test') from dual; -> 'TEST'

	select initcap('TEST') from dual; -> 'Test'

### Character Manumuplation Functions

	select substr('Sql Course',1,3) from dual; -> 'Sql'

	select length('Sql Course') from dual; -> 10

	select concat('Sql','Course') from dual; -> 'SqlCourse'

	select instr('Sql Course','o') from dual; -> '6'

	select trim('   Sql Course   ') from dual; -> 'Sql Course'

	select ltrim('   Sql Course   ') from dual; -> 'Sql Course   '

	select rtrim('   Sql Course   ') from dual; -> '   Sql Course'

	select replace('Sql Course','s','*') from dual; -> 'Sql Cour*e'

	select lpad('sql',10,'-'); -> '-------sql'

	select rpad('sql',10,'-'); -> 'sql-------'

### Number Functions

	select round(12.136,2) from dual; -> 12.14

	select trunc(12.136,2) from dual; -> 12.13

	select ceil(2.67) from dual; -> 3

	select floor(2.67) from dual; -> 2

	select mod(1800,400) from dual; -> 200

### Nesting Functions

	select first_name, last_name lpad(upper(concat(first_name, last_name)),20,'*') nesting
	from employees;

### Date Operations, Date Functions

#### YY, RR

	Current Year	Specified Date	RR	YY
	1990	13-Jun-93	1993	1993
	1990	13-Jun-15	2015	2015
	2015	13-Jun-15	2015	2015
	2015	13-Jun-93	1993	2093

#### SYSDATE, CURRENT_DATE Functions

* Sysdate > Current system date
* Current_Date > Current date of usersession
* Sessiontimezone > Timezone of usersession
* Current_Timestamp > Date and time of userserssion

#### Arithemetic Operations with Dates

Subtracting two dates returns the number of days between these dates.

	select tfirst_name, lats_name(sysdate - hire_date)/365 as "Working Perriod"
	from employees;

#### Date Functions



## B 3: Database Schemaobjects

* Tables
* Synonyms
* Views
* Materialized Views
* Constraints
* Database Links
* Indexes
* Functions and Procedures
* Packages

## B 7: Indexes

* Unique Index
* Nonunique Index
* B-tree Index (High cardinality)
* Bimap Index (Low cardinality)

### Create index

	create [unique|bitmap] index index_name
	on table_name (column_name1[,column_name2,...])

We cannot create more than 1 unique index on the same column.

If the index contains more than 1 column, the where-clause needs to address all columns of the index.

### Create Index on Table Creation

	create table employee_temp
	(employee_id number(6) primary key
		using index (create index temp_idx on employee_temp(employee_id)),
	first_name varchar2(29),
	last_name varchar2(25));

### Create Index after Table Creation

	create table new_emp2
	(employee_id number(6),
	first_name varchar2(20),
	last_name varchar2(25));

	create index emp_id_idx2 on
	new_emp2(employee_id);

	alter table new_emp2 
	add primary key (employee_id)
	using index emp_id_idx2;

### Function Based Index

	create index first_name_idx on employees
		(upper(first_name));

Index is active, if the propper function is used in the where clause.

	select * from employees
	where upper(first_name) = 'ALEX';

### Multiple Indexes on the same Column

	create index temp_idx on employees
		(first_name, last_name);

	alter index temp_idx invisible;

	create bitmap index temp_idx on employees
		(first_name, last_name);

### Drop Index

	drop index index_name;

To allow DML operations while the index is dropped use:

	drop index index_name online;

### Index Datadictionary

	select * from user_ind_columns
	where table_name = 'EMPLOYEES'
	order by index_name;

## B 8: Views

### Create View

	create [or replace] [force|noforce] view view_name
	[(alias[,alias]...)] as subquery
	[with check option [constraint contraint_name]]
	[with read only [constraint constraint_name]];

Aliases

	create view empvw20 as
	select employee_id eid, first*name name, last*name surname 
	from employees 
	where department_id = 20;

	create view empvw20 (eid, name, surname) as
	select employee_id, first*name, last*name 
	from employees 
	where department_id = 20;

### View Datadictionary

	select * from user_views;

### Drop View

	drop view view_name;

## B 9: Materialized Views

### Create Materialized View

	create materialized view view_name
	build [immediate|deferred]
	refresh [fast|complete|force] on [commit|demand]
	[[enable|disable] query rewrite]
	[on rebuilt table]
	as subquery;

For fast refreshed materialized views, you need to create a log on the basetable

	create materialized view log on table_name;

### Manually Refresh

	execute dbms_mview.refresh('view*name','F'|'C');

	dbms_mview.refresh_all_mviews(failures,'C','',TRUE,FALSE,FALSE);

### Periodic Refresh

	create materialized view view_name
	build immediate
	refresh force
	start with sysdate + 3/24
	next syssate + 5
	as subquery

## B 10: Advanced Subqueries

### Scalar Subquery

	select employee_id, first*name from employees
	where department_id = (select department_id from employees where upper(first_name) = 'LUIS');

### Multiple Column Subquery

	select employee_id, first_name from employees
	where department_id in (select department_id from employees where upper(first_name) = 'LUIS');

### Pairwise Subquery

	select first_name, department_id from employees
	where (department_id, manager_id) in
	(select department_id, manager_id from employees where upper(first_name) = 'LUIS');

### Correlated Subquery

	select employee_id, department_id from employees a
	where salary = (select max(salary) from employees b
		where b.department_id = a.department_id);

### Exists Operator

	select employee_id, department_id from employees a
		where exists (select 1, employee_id from employees
			where manager_id = a.employee_id);

### Not Exists Operator

	select department_id, department_name
		from departments d
		where not exists
		(select department_id from employees
		where department_id = d.department_id);

### With Clause

	with max_salaries as
		(select department_id, max(salary from employees group by department_id)
	select * from max_salaries;

### Recursive With Clause

	with all_managers (Employee, Manager, Department) as
		(select demployee_id, manager_id, department_id from employees
		union all
		select all_managers.employee, employees.manager_id, all_managers.department from all_managers, employees
		where all_managers.manager = employees.employee_id)
	select employee, manager, department from all_managers order by employee;

### Insert Data by using Subquery as Target

	insert into (select d.department_id, d.department_name
		from departments_temp d
		join locations l
		on (d.location_id = l.location_id)
		where l.city = 'Oxford')
		values (300, 'Marketing', );

	select * from departments_temp;

### Correlated Update

	update table1 alias1
		set (column, column, ...) = (select column, column, ...
			from table2 alias2
			where alias1.column = alias2.column);

### Correlated Delete

	delete from table1 alias1
	where column operator
		(select expression
		from table2 alias2
		where alias1.column = alias2.column);

## B 11: Advanced Data Manipulation

### Default Keyword in Insert and Update Statements

	insert into departments_temp (department_id, department_name, manager_id)
	values (310, 'Temp Department', DEFAULT);

	update departments_temp set manager_id = DEFAULT;

	alter departments_temp modify manager_id number(6) default 100;


### Multitable Insert Statements

* Unconditional Insert
* Conditional Insert
* Conditional Insert First
* Pivoting Insert

#### Unconditional Insert Statements

	insert all
		into insert_statement
		into insert_statement
		...
	subquery;

	insert all
		into employees_history values (employee_id, first_name, last_name, hire_date)
		into salary_history values (employee_id, extract(year from sysdate), extract(month from sysdate), salary, commission_pct)
	select * from emplyees where hire_date > sysdate - 365;

#### Conditional Insert Statements

	insert all
		when condition then
			into insert_statement
			...
		when condition then
			into insert_statement
			...
	subquery;

	insert all
		when hire_date > sysdate-365 then
			into employees_history values(employee_id,first_name,last_name,hire_date)
			into salary_history values(employee_id,extract(year from sysdate),extract(month from sysdate),salary,commission_pct)
		when job_id = 'IT_PROG' then
			into it_progammers values(employee_id,first_name,last_name,hire_date)
		when department_id in
			(select department_id from departments where location_id in 
				(select location_id from locations where country_id = 'US')) then
					into living_in_us values (employee_id, first_name, last_name, hire_date)
	select * from employees;

#### Conditional Insert First Statements

	insert first
		when condition then
			into insert_statement
			...
		when condition then
			into insert_statement
			...
		else
			into insert_statement
			...
	subquery;

	insert first
		when salary < 5000 then
			into low_salaries values(employee_id, department_id, salary)
		when salary between 5000 and 10000 then
			into average_salaries values(employee_id, department_id, salary)
		else
			into high_salaries values(employee_id, department_id, salary)
	select * from employees;

#### Pivoting Insert

job_salaries table:
	year | month | it_prog | sa_man | st_man

job_sal table:
	year | month | job_id | total_salary

	insert all
		into job_sal values (year,month,'IT_PROG',it_prog)
		into job_sal values (year,month,'SA_MAN',sa_man)
		into job_sal values (year,month,'ST_MAN',st_man)
	select * from job_salaries;

### Merging Data

	merge into table_name table_alias
	using (table|view|subquery) alias
	on (join condition)
	when matched then
		update set
			column_name1 = value1,
			column_name2 = value2
	when not matched then
		insert (columns)
			value (values);

	merge into employees_copy c
	using (select * from employees) e
	on (c.employee_id = e.employee_id)
	when matched then
		update set
			c.first_name = e.first_name
			c.last_name = e.last_name
			c.department_id = e.department_id
			c.job_id = e.job_id
			c.salary = e.salary
	delete where department_id is null
	when not matched then
	insert values (e.employee_id, e.first_name, e.last_name, e.department_id, e.job_id, e.salary)

### Flashback Operations

	alter table employees_copy enable row movement;

	select * from recyclebin;

	flashback table [schema.] table
	to {scn|timestamp} expr |
	restore point restore_point [{enable|disable} triggers] |
	before drop [rename to table];

	flashback table employees_copy to timestamp sysdate - 1 / (24 * 60);

Get Systemchange number
	select dbms_flashback.get_system_change_number as sc from dual;

	flashback table employees_copy to timestamp scn 10194783;

### Purge Operations

	drop table employees_copy purge;

	purge recyclebin;

### Tracking Changes in Data in a Particular Time

#### Flashback Query

	select salary from employees_copy
	where employe_id = 100;

	update employees_copy set salary = 1000
	where employee_id = 100;

	select * from employees_copy
	as of timestamp(sysdate - interval '2' minute)
	where employee_id = 100;

#### Flashback Versions Query

	select salary from employees_copy
	where employe_id = 100;

	update employees_copy set salary = 1100
	where employee_id = 100;

	select * from employees_copy
	versions between scn minvalue and maxvalue
	where employee_id = 100;

	select * from employees_copy
	versions between timestamp(sysdate - interval '13' minue) and sysdate
	where employee_id = 100;

## B 12: Constraints (Controlling Schema Objects)

### Add Constraint

	alter table table_name
	add [constraint <constraint_name>]
	type [<column_name>];

	alter table employees_temp
	add constraint temp_cons unique (employee_id);

	alter table employees_temp 
	add unique (employee_id);

	alter table employees_temp 
	modify job_id constraint not_null_job not null;

	alter table employees_temp 
	modify first_name not null;

### Remove Constraint

	alter table table_name drop constraint constraint_name;

The cascade option when dropping a primary key is used to drop all related foreign keys.
	alter table employees_temp 
	drop primary key cascade;

	alter table employees_temp 
	drop constraint constraint name 
	online;

### On Delete Cascade, Set Null

	alter table salary_history 
	add constraint sal_emp_fk foreign key (employee_id)
	references employees_temp(employee_id) 
	on delete cascade;

	alter table high_salaries 
	add constraint hi_emp_fk foreign key (employee_id)
	references employees_temp(employee_id) 
	on delete set null;

### Cascading Constraints

	alter table emplyoees_temp 
	drop column employee_id 
	cascade constraints;

### Rename Constraint

	alter table table_name rename constraint constraint_name to new_constraint_name;

### Disabling Constraints

	alter table table_name 
	disable constraint constraint_name;

### Enabling Constraints

	alter table table_name
	enable constraint constraint_name;

### Constraint Status

* Enable (New data must conform constraint)
* Disable (No conformity check on new data)
* Validate (Existing data must conform)
* Novalidate (No conformity check on existing data)

	alter table employees_temp
	enable novalidate constraint constraint_name;

### Deferring Constraints

* deferrable
** initially immediate: Checks constraint at the time of query execution
** initially deferred: Waits until end of transaction. Rollback on error.
* not deferrable

	alter table dep_tmp
	add constraint dep_id_pk
	primary_key(department_id)
	deferrable initially deferred;

	set constraints dep_id_pk immediate;

	set constraints dep_id_pk deferred;

	set constraints all immediate;

	set constraints all deferred;

	alter session
	set constraints = immediate;

### Temporary Table

	create global temorary table shopping_carts
		(id number,
		type varchar2(20),
		shopping_date(date)
	on commit delete rows;

## B 13: User Privileges

### Create User

	create user temp_user
	identified by 123;

### System Privileges

	select * from system_privilege_map;

### Granting System Privileges

	grant privilege [,privilege...]
	to user [user|role,public...];

	grant create session, create table, create view to temp_user;

### User Roles

	create role developer;

	grant create table, create view, create session, create trigger to developer;

	grant developer to user;

### Change User Password

	alter user temp_user
	identified by 123;

### Granting Object Privileges

	grant object_privileges [columns]
	on object_name to {user|role|public}
	[with grant option];

	grant select, update on employees_temp to temp_user, developer;

	grant update(first_name, last_name) on employees_temp to temp_user;

### Revoking Object Privileges

	revoke {privilege [,privilege...]|all}
	on object_name
	from {user [,user...]|role|public}
	[cascade constraints];

	revoke select, insert on employees_temp from temp_user;

### Privileges in Datadictionary

* role_sys_privs
* role_tab_privs
* user_sys_privs
* user_role_privs
* session_privs
* user_tab_privs
* all_tab_privs
* user_col_privs

## B 14: Hierarchical Queries

### Generating Hierarchical Queries

	select [level], column_name, expression from table_name
	[where condition]
	[start with condition]
	[connected by prior condition];

	select employee_id, first_name, last_name, job_id, manager_id
	from employees 
	start with employee_id = 102
	connect by prior employee_id = manager_id;

### Ranking Rows

	select level, employee_id, first_name, last_name, job_id, manager_id
	from employees
	where level = 2
	start with employee_id = 101
	connect by manager_id = prior employee_id;

### Formatting Tree Structure

	select lpad(last_name, length(last_name)+(level*2)-2,'> ') as employees_hierarchy
	from employees
	start with employee_id = 101
	connect by prior employee_id = manager_id;

### Pruning Branches

	select employee_id, last_name, manager_id
	from employees
	start with employee_id = 101
	connect by prior employee_id = manager_id
	and employee_id <> 108;

## B 15: Generating Dynamic SQL Scripts

	select 'create table ' || table_name || '_backup ' || 'as select * from ' || table_name || ';' as "Backup Scripts" 
	from user_tables;

Copy & Paste results in SQL Developer and execute queries.

## B 16: Regular Expressions

	regexp_like (string, pattern [,match_option]);

Match-Option:

* 'c': Case-Sensitive
* 'i': Non-Case-Sensitive
* 'n': Match any character operator
* 'm': Source string has multiple lines

	select first_name, last_name
	from employees
	where regexp_like (first_name, '^Ste(v|ph)en$');

	regexp_replace (string, pattern [,str_to_replace] [,postition] [,occurence] [,match_option]);

	regexp_substr (string, pattern [,postition] [,occurence] [,match_option]);

	regexp_instr (string, pattern [,postition] [,occurence] [,return_option] [,match_option]);

	regexp_count (string, pattern [,postition] [,match_option]);

## B 17: Analytical SQL Functions

	function (arg1, ...) over ([partition by ...] [order by ...] [windowing clause]);

LEAD, LAG, RANK, DENSE_RANK, ROW_NUMBER, FIRST, FIRST VALUE, LAST, LAST_VALUE, ...

### row_number

	select employee_id, department_id, hire_date, row_number() over (partition by department_id order by hire_date nulls last) row_number
	from employees
	where department_id in (10,20,30)
	order by department_id;

### rank, dense_rank

	select employee_id, department_id, hire_date, 
		rank() over (partition by department_id order by salary desc nulls last) rnk,
		dense_rank() over (partition by department_id order by salary desc nulls last) dns_rnk
	from employees
	where department_id in (10,20,30)
	order by department_id;

### lead, lag

	lead|lag column_name, offset, default over analytic_clause;

	select employee_id, department_id, salary,
		lead(salary,1,0) over (partition by department_id order by salary nulls last) next_salary,
		lag(salary,1,0) over (partition by department_id order by salary nulls last) previous_salary
	from employees
	where department_id in (10,20,30)
	order by department_id;

### Windowing Clause

Start_point & End_point:

* unbounded preceding: First row
* unbounded following: Last row
* current row
* value|expression preceding
* value|expression following

	select employee_id, department_id, salary,
	sum(salary) over (partition by department_id order by salary rows between 0 preceding and 2 following) windowing
	from employees
	where department_id in (10,20,30)
	order by department_id, salary;

	select employee_id, department_id, salary,
	sum(salary) over (partition by department_id order by salary range between 100 preceding and 100 following) windowing
	from employees
	where department_id in (10,20,30)
	order by department_id, salary;

### interval

	select employee_id, department_id, salary, hire_date,
	sum(salary) over (partition by department_id order by hire_date range between interval '1' year preceding and interval '1' year following) sums
	from employees
	where department_id in (10,20,30)
	order by department_id, hire_date;

### first_value, last_value

	first_value(column_name) [respect|ignore} nulls over (analytic_clause);

	select employee_id, department_id, salary
	first_value(salary) ignore nulls over (partition by department_id order by salary) as low_sal,
	last_value(salary) ignore nulls over (partition by department_id order by salary range between unbound preceeding and unbound following) as high_sal,
	from employees
	where department_id in (10,20,30)
	order by department_id, salary;

### top_n

	select * from
		(select employee_id, department_id, salary,
		row_number() over (partition by department_id order by salary desc) row_number
		from employees where department_id in (10,20,30))
	where row_num <= 4;

# PostgreSQL

## Setup

### Get and run Docker Image

```bash
$ docker pull postgres
$ docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres
```

### Connect to PostgreSQL container

|attribute|value|
|-|-|
|Host|localhost|
|Username|postgres|
|Port|5432|
|Password|mysecretpassword|

![01](../drawio/postgresql/01.svg)

## Basic SQL Commands

### Create Table

```sql
create table cities (
    name varchar(50),
    country varchar(50),
    population integer,
    area integer
);
```

### Insert Data into Table

```sql
insert into cities (name,country,population,area)
values
    ('Delhi','India',28125000,2240),
    ('Shanghai','China',22125000,4015),
    ('Sao Paulo','Brazil',20935000,3043);
```

### Select Data from Table

```sql
select * from cities;
select name,country from cities;
```

#### Calculated Columns

|Operator|Function|
|-|-|
|+|Add|
|-|Subtract|
|*|Multiply|
|/|Divice|
|^|Exponent|
|\|/|Square Root|
|@|Absolute Value|
|%|Remainder|

```sql
select
  name,
  population / area as population_denstity
from
  cities;
```

#### String Operators

|Operator|Function|
|-|-|
|\|\||Concatenate|
|concat()|Concatenate|
|lower()|Lowercase|
|upper()|Uppercase|
|length()|Number of characters|

```sql
SELECT
    name || ', ' || country,
    concat(name,', ',country),
    lower(name),
    upper(country),
    length(name)
FROM
    cities;
```

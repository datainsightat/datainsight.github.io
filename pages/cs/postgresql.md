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

## Basic SQL Commands

### *CREATE TABLE* > Create Table

```sql
create table cities (
    name varchar(50),
    country varchar(50),
    population integer,
    area integer
);
```

### *INSERT INTO* > Insert Data into Table

```sql
insert into cities (name,country,population,area)
values
    ('Delhi','India',28125000,2240),
    ('Shanghai','China',22125000,4015),
    ('Sao Paulo','Brazil',20935000,3043);
```

### *SELECT* > Select Data from Table

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

#### *DISTINCT* > Unique Values

```sql
select
    distinct
    country
from
    cities
```

#### *GREATER/LEAST* > Biggest, Smallest values

```sql
select
    name,
    weight,
    greatest(30,2*weight),
    least(30,2*weight)
from
    products;
```

#### *CASE* > If then else Statement

```sql
select
    name,
    price,
    case
        when price > 600 then 'high'
        when price > 300 then 'medium'
        else 'cheap'
    end
```

### *WHERE* > Filter Table

|Operator|Function|
|-|-|
|=|Equal|
|>|Greater|
|<|Smaller|
|>=|Greater or Equal|
|<=|Smaller or Equal|
|<>|Not Equal|
|!=|Not Equal|
|between|Between two values|
|in|Value in list|
|not in|Value not in list|

```sql
SELECT
    name,
    area
FROM
    cities
WHERE
    area between 2000 and 5000
    and name in ('Delhi','Shanghai');
```

### *UPDATE* > Update rows

```sql
UPDATE
    cities
set
    population = 39505000
WHERE
    name = 'Shanghai';
```

### *DELETE* > Delete rows

```sql
DELETE FROM
    cities
WHERE
    name = 'Tokyo';
```

## Tables

### Primary Keys and Foreign Keys

- Primary Key: Uniquely identifies a record in a table
    - You cannot delete a user with a key, that is refenced by a foreign key in another table
        - ON DELETE RESTRICT > error
        - ON DELETE NO ACTION > error
        - ON DELETE CASCADE > delete value in associated table too!
        - ON DELETE SET NULL
        - ON DELETE SET DEFAULT
- Foreign Key: Identifies a record in another table that this record is associated with
    - The foreign key must exist in the associated table
    - You can add a value with user 'NULL'
</a>

```sql
create Table users (
    id serial primary key,
    username varchar(50)
);

insert INTO
    users (username)
VALUES
    ('monahan93'),
    ('pferrer'),
    ('si930nis'),
    ('99stroman');

select * from users;
```
|id|username|
|-|-|
|1|monahan93|
|2|pferrer|
|3|si930nis|
|4|99stroman|

```sql
create Table photos (
    id serial primary key,
    url varchar(200),
    user_id integer REFERENCES users(id) on delete cascade
);

insert INTO
    photos (url,user_id)
VALUES
    ('http://img1.jpg',4),
    ('http://img2.jpg',4),
    ('http://img3.jpg',1),
    ('http://img4.jpg',2),
    ('http://img01.jp2',NULL); 

select * from photos;
```
|id|url|user_id|
|-|-|-|
|1|http://img1.jpg|4|
|2|http://img2.jpg|4|
|3|http://img3.jpg|1|
|4|http://img4.jpg|2|

```sql
create Table comments (
    id serial primary key,
    photo_id integer REFERENCES photos(id) on delete cascade,
    user_id integer REFERENCES photos(id) on delete cascade,
    contents varchar(240)
);

insert INTO
    comments (contents,photo_id,user_id)
VALUES
    ('Quo velit iusto ducimus quos a incidunt nesciunt facilis.', 2, 1),
    ('Non est totam.', 2, 1),
    ('Fuga et iste beatae.', 3, 2),
    ('Molestias tempore est.', 1, 2);

select * from comments;
```
|id|photo_id|user_id|contents|
|-|-|-|-|
|1|2|1|Quo velit iusto ducimus quos a incidunt nesciunt facilis.|
|2|2|1|Non est totam.|
|3|3|2|Fuga et iste beatae.|
|4|1|2|Molestias tempore est.|

## Joins

For each comment, show the contents of the comment and the username of the user who wrote the comment:

```sql
SELECT
  a.contents,
  b.username
FROM
  comments a
JOIN
  users b ON
    a.user_id = b.id;
```
![joins](../drawio/postgresql/joins.svg)

Search for all users that commented on their own photos.

```sql
SELECT
  url, contents, username
FROM
  comments a
JOIN
  photos b on
    b.id = a.photo_id
JOIN
  users c ON
    c.id = a.user_id
    and a.user_id = b.user_id;
```

## Aggregation

|Function|Description|
|-|-|
|COUNT()|Number of values|
|SUM()|Sum of a group of numbers|
|AVG()|Average of a group of numbers|
|MIN()|Minimum|
|MAX()|Maximum|

### *GROUP BY* > Groups rows by a unique set of values

```sql
SELECT
  user_id,
  count(*)
FROM
  photos
GROUP BY
 user_id;
```

### *HAVING* > Filter the set of groups

HAVING filters grouped values

```sql
SELECT
  b.username,
  count(*)
FROM
  photos a
LEFT JOIN
  users b ON
    b.id = a.user_id
GROUP BY
  b.username
HAVING
  count(*) >= 4;
```

## Sorting

### *ORDER BY* > Sort columns

```sql
select
    *
from
    products
order by
    price,
    weight desc;
```

### *OFFSET* > Skip the first n lines

```sql
select
    *
from
    users
offset
    10;
```

### *LIMIT* > Get specific number of records

```sql
select
    *
from
    users
limit
    5;
```

## Union and Intersections

'UNION' removes identical entries. Use the 'UNION ALL' keyword wo keep identical records.

|Keyword|Function|
|-|-|
|UNION|Join together the reults of two queries and remove duplicate rows|
|UNION ALL|Join together results of two queries|
|INTERSECT|Find the rows common in the results of two queries. Remove duplicates|
|INTERSECT ALL|Find the rows common in the results of two queries|
|EXCEPT|Find the rows that are present in first query but not second query. Remove duplicates|
|EXCEPT ALL|Find the rows that are present in first query butg not second query|

```sql
(
    select
        *
    from
        products
    order by
        price desc
    limit
        4
)

union

(
    select
        *
    from
        products
    order by
        price / weight desc
    limit
        4
);
```

## Subqueries

The shape of data matters in the use of subqueries

|Statement|shape|
|-|-|
|select * from orders|Many rows, many columns|
|select id from orders|Many rows, one column|
|select count(*) from orders|Single value|

### Subqueries in SELECT Statements

Any subquery must result in a single value

```sql
select
    name,
    price,
    (select max(price) from products) price_max,
    (select price from products where id = 3) price_id_3
from
    products
where
    price > 867;
```

### Subqueries in FROM Statements

Any subquery compatible to the outer query. Apply alias to subquery.

```sql
select
    avg(p.order_count)
from (
    select
        user_id,
        count(*) as order_count
    from
        orders
    group by
        user_id
) as p;
```

### Subqueries in JOIN Clauses

Any subquery that is compatible to the on statement

```sql
select
    u.first_name
from
    users as u
join (
    select
        user_id
    from
        orders
    where
        product_id = 3
) as o on
    u.id = o.user_id;
```

### Subqueries in WHERE Statements

|Operator|Datastructure|
|-|-|
|>,<,>=,<=,=,<>,!=|Single Value|
|IN, NOT IN|Single Column|
|(>,<,>=,<=,=,<>) ALL/SOME/ANY|Single Column|

```sql
select
    id
from
    orders
where
    product_id in (
        select
            id
        from
            products
        where
            price / weight > 5
);
```

```sql
SELECT
    name, price
FROM
    products
WHERE
    price > (
        SELECT
            max(price)
        FROM
            products
        WHERE
            department = 'toys'
    );
```

|Operator|Description|
|-|-|
|ALL|All items in list|
|SOME/ANY|At least one item in list|

```sql
select
    name,
    department,
    price
from
    products
where
    price > some (
        select
            price
        from
            products
        where
            department = 'Industrial'
);
```

### Correlated Subqueries

Get the most expensive product for each department

```sql
select
    name,
    deparment,
    price
from
    products p1
where
    p1.price = (
        select
            max(price)
        from
            products p2
        where
            p2.department = p1.department
);
```

```sql
select
    p1.name
    (
        select
            count(*)
        from
            orders as o1
        where
            o1.product_id = p1.id
    ) as num_orders
from
    products as p1
```

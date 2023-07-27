## Initial Setup

```bash
mkdir api
cd api
mkdir social-repo
cd social-repo
npm init -y
npm install dedent express jest node-pg-migrate nodemon pg pg-format supertest
```

package.json
```json
"sripts": {
  "migrate": "node-pg-migrate",
  "start": "nodemon index.js"
},
```

## Add Migration Files

### Create Table

```bash
npm run migrate create add users table
```

migrations/XXX_add-users-table.js
```js
/* eslint-disable camelcase */

exports.shorthands = undefined;

exports.up = pgm => {
  pgm.sql(`
    create table users (
      id serial primary key,
      created_at timestamp with time zone default current_timestamp,
      updated_at timestamp with time zone default current_timestamp,
      bio varchar(400),
      username varchar(30) not null
    );
  `);
};

exports.down = pgm => {
  pgm.sql(`
    drop table users;
  `);
};
```

```bash
DATABASE_URL=postgres://USERNAME:PASSWORD@localhost:5432/socialnetwork npm run migrate up
```

## Node API

|Route|Method|Goal|Function|Goal|
|-|-|-|-|-|
|/users|GET|Fetch all users from the users table|find|REturn an array of objects, each object representing a user|
|/users/:id|GET|Fetch a user with a particular ID|findById|Find a user with the provided ID|
|/users|POST|Create a new user|insert|Add a user with some provided properties|
|/users/:id|PUT|Update a user with a particular ID|update|Update a user with the provided ID|
|/users/:id|DELETE|Delete a user with a particular ID|delete|Delete the user with the provided ID|

## Run API

```bash
npm run start
```

Access the API using Postman, or the VSCode REST Client.



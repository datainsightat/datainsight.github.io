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

|Route|Method|Goal|
|-|-|-|
|/users|GET|Fetch all users from the users table|
|/users/:id|GET|Fetch a user with a particular ID|
|/users|POST|Create a new user|
|/users/:id|PUT|Update a user with a particular ID|
|/users/:id|DELETE|Delete a user with a particular ID|

src/app.js
```js

```

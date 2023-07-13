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
|Passwortd|mysecretpassword|


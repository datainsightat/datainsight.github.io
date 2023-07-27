[Documentation](https://github.com/datainsightat/DataScience_Examples/blob/gh-pages/pages/cs/postgresql.md)

## Webserver Install

1) At your terminal in your project directory, run npm install express pg
2) Download the index.js file attached to this lecture and place it in your project directory
3) Open up the index.js file and update the user and password on lines 8 and 9 to the username and password that you use to connect to your PG database. If you are on macOS, the user is your username and the password is probably an empty string. If you are on windows, the user is probably postgres and the password is probably whatever you set it to during the initial Postgres install.
4) Save the file
5) At the terminal, run node index.js
6) Open your browser and navigate to http://localhost:3050/posts
7) Try to create a new post. You should see it appear on the table

### Migration Instructions

Directions:

1) In your project directory, create a new folder inside 'migrations' called 'data'
2) Place the attached '01-lng-lat-to-loc.js' file in that directory
3) Open up the '01-lng-lat-to-loc.js' file and update the user and password on lines 8 and 9 to the username and password that you use to connect to your PG database. If you are on macOS, the user is your username and the password is probably an empty string. If you are on windows, the user is probably postgres and the password is probably whatever you set it to during the initial Postgres install.
4) Save the file
5) At your terminal, change into that 'data' directory and run node 01-lng-lat-to-loc.js

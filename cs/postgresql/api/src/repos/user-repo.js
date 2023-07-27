const pool = require('../pool');

class UserRepo {
  static async find() {
    const { rows } = await pool.query('SELECT * FROM users;');

    return rows;
  }

  static async findById(Id) {
    // WARNING: BIG SECURITY ISSUE! => SQL Injection Exploit
    //const { rows } = await pool.query(`
    //  select * from users where id = ${id}
    //`);
    
    const { rows } = await pool.query(`
      select * from users where id = $1;
    `,[id]);
  }

  static async insert(username, bio) {
    const {
      rows,
    } = await pool.query(
      'INSERT INTO users (username, bio) VALUES ($1, $2) RETURNING *;',
      [username, bio]
    );

    return toCamelCase(rows)[0];
  }

  static async update() {}

  static async delete() {}
}

module.exports = UserRepo;

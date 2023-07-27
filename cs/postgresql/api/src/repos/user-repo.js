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

  static async insert() {}

  static async update() {}

  static async delete() {}
}

module.exports = UserRepo;

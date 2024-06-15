import mysql from 'mysql2/promise';

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'McuR1097_0308',
    database: 'mechanic1'
});

export default pool;

import pool from '../utils/db';

export interface User {
    id?: number;
    username: string;
    password: string;
    role: 'user' | 'admin';
    // created_at?: Date;
}

export const createUser = async (user: User): Promise<void> => {
    console.log("entro")
    const connection = await pool.getConnection();
    try {
        await connection.execute(
            'INSERT INTO users (username, password, role) VALUES (?, ?, ?)',
            [user.username, user.password, user.role]
        );
    } finally {
        connection.release();
    }
};

export const getUserByUsername = async (username: string): Promise<User | null> => {
    const connection = await pool.getConnection();
    try {
        const [rows] = await connection.execute('SELECT * FROM users WHERE username = ?', [username]);
        const users = rows as User[];
        return users.length ? users[0] : null;
    } finally {
        connection.release();
    }
};

export const getAllUsers = async (): Promise<User[]> => {
    const connection = await pool.getConnection();
    try {
        const [rows] = await connection.execute('SELECT * FROM users');
        return rows as User[];
    } finally {
        connection.release();
    }
};

export const getUserById = async (id: number): Promise<User | null> => {
    const connection = await pool.getConnection();
    try {
        const [rows] = await connection.execute('SELECT * FROM users WHERE id = ?', [id]);
        const users = rows as User[];
        return users.length ? users[0] : null;
    } finally {
        connection.release();
    }
};

import { createPool } from 'mysql2/promise'; 
import { config } from 'dotenv';

config(); 

const pool = createPool({
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  host: process.env.MYSQL_HOST,
  database: process.env.MYSQL_DATABASE_NAME,
  port: process.env.MYSQL_PORT,
});

const connectToDatabase = async () => {
  try {
    const connection = await pool.getConnection(); 
    console.log('MySQL Connection Successful');
    connection.release();  // Release connection after checking
  } catch (error) {
    console.error('Database Connection Error', error);
    throw error; // Throw error to handle it outside
  }
};

export { connectToDatabase, pool };
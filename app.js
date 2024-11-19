const express = require('express');
const { Pool } = require('pg');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');

const app = express();
app.use(bodyParser.json());

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'Quiz',
  password: '123',
  port: 5432,
});

// API route to handle user registration
app.post('/register', async (req, res) => {
  const { name, email, password, mobileNo, university } = req.body;

  // Validate inputs (you can expand this validation based on your needs)
  if (!name || !email || !password || !mobileNo || !university) {
    return res.status(400).json({ error: 'All fields are required' });
  }

  try {
    // Hash password for security
    const hashedPassword = await bcrypt.hash(password, 10);

    // Insert user data into Users table (assuming 'mobileno' is lowercase in PostgreSQL)
    const result = await pool.query(
      `INSERT INTO Users (username, email, password, mobileno, university) 
      VALUES ($1, $2, $3, $4, $5) RETURNING *`,
      [name, email, hashedPassword, mobileNo, university]
    );

    res.status(201).json({ message: 'User registered successfully', user: result.rows[0] });
  } catch (error) {
    console.error('Error executing query', error.stack);
    res.status(500).json({ error: 'Failed to register user', details: error.message });
  }
});

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});

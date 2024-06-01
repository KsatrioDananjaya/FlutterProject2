const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');
const app = express();
const port = 3000;
app.use(cors());
app.use(bodyParser.json());
// MySQL connection
const db = mysql.createConnection({
 host: 'localhost',
 user: 'your_mysql_username',
 password: 'your_mysql_password',
 database: 'your_database_name'
});
db.connect(err => {
 if (err) {
 throw err;
 }
 console.log('MySQL connected...');
});
// Create
app.post('/create', (req, res) => {
 const { name, email } = req.body;
 const sql = 'INSERT INTO users (name, email) VALUES (?, ?)';
 db.query(sql, [name, email], (err, result) => {
 if (err) {
 return res.status(500).send(err);
 }
 res.send('User added');
 });
});
// Read
app.get('/read', (req, res) => {
 const sql = 'SELECT * FROM users';
 db.query(sql, (err, results) => {
 if (err) {
 return res.status(500).send(err);
 }
 res.json(results);
 });
});
// Update
app.put('/update/:id', (req, res) => {
 const { id } = req.params;
 const { name, email } = req.body;
 const sql = 'UPDATE users SET name = ?, email = ? WHERE id = ?';
 db.query(sql, [name, email, id], (err, result) => {
 if (err) {
 return res.status(500).send(err);
 }
 res.send('User updated');
 });
});
// Delete
app.delete('/delete/:id', (req, res) => {
 const { id } = req.params;
 const sql = 'DELETE FROM users WHERE id = ?';
 db.query(sql, [id], (err, result) => {
 if (err) {
 return res.status(500).send(err);
 }
 res.send('User deleted');
 });
});
app.listen(port, () => {
 console.log(`Server running on port ${port}`);
});


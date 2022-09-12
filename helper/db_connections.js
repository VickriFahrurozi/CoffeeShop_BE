/** @format */

const mysql = require('mysq2');
const { host, user, password, database } = process.env;
const db = mysql.createPool({
	connectionLimit: 100,
	host: host,
	user: user,
	password: password,
	database: database,
	debug: false,
});

// db.connect((err) => {
// 	if (err) {
// 		console.log(err);
// 	}
// 	console.log('DB CONNECTED');
// });

module.exports = db;

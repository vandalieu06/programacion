const mysql2 = require("mysql2");

const db = mysql2;

const connection = db.createConnection({
  host: "localhost",
  user: "root",
  password: "Vandalieu-06",
  database: "manga"
});

connection.connect((err) => {
  if (err) return console.error("Error en la connexion con la DB", err)
  console.log("Connectado a la DB")
});

module.exports = connection;
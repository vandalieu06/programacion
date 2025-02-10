const sqlite3 = require('sqlite3').verbose();
const dbName = 'library.db';

let db = new sqlite3.Database(dbName, (err) => {
  if (err) return console.error('Error: ', err.message); //Si ha ocurrido algun error al connectarse con la base de datos 
  
  console.log('Connecte to the Databse');
  //db.run('')//Creation databse if this not exist, but the table is created manually 
})

module.exports = db;
const sqlite = require("sqlite3").verbose(); //Iniciamos la connexion

const db = new sqlite.Database("./src/juego.sqlite");

// .serialize() --> se utiliza para assegurase que se ejcuta de forma estrcuturada de arriba a abajo.
// Si es solo una consulta no hace falta utilizarlo.
//db.serialize(() => {[code]});
//Si queremos finalizar la connexion despues de una consulta tenemo que poner .close()
//db.close();

//Creamos una nueva tabla y si esta existe no la crea mediante --> ...IF NOT EXISTS
//.run() --> es para ejecutar el comando sql
db.run(`CREATE TABLE IF NOT EXISTS personaje (
      id      INTEGER UNIQUE,
      nom     TEXT,
      cognom  TEXT
      )`);
db.run(`CREATE TABLE IF NOT EXISTS personaje (
      id            INTEGER UNIQUE,
      autor         TEXT,
      description   TEXT,
      srcFrontpage
      )`);

function jugadorInsert(id, nombre, apellido) {
  //Lo primero que tenemos que hacer es hacer la sql INSERT INTO con  .prepare(), con ? paar que luego le pasamos los parametros con .run(valor1, valor2[,...])
  //Finalemnete hacemos un .finalize() para para que ya no espere valores a insertar.
  const stmt = db.prepare("INSERT INTO personaje VALUES (?, ?, ?);");
  stmt.run(id, nombre, apellido);
  stmt.finalize();
}

function bookSelect(callback) {
  // Recorremos toda una tabla con SELECT mediante el meteodo .each("[consulta sql]", (err, row)=>{}).
  // Aqui pasamos el SELECT y que haremos con lo que obtenemos dentro del segundo callback

  const sql = "SELECT id, nom, cognom FROM personaje";
  const jugadores = {};

  db.all(sql, (err, rows) => {
    if (err !== null) return console.error(err);

    rows.forEach((row) => {
      jugadores[row.id - 1] = {
        id: row.id,
        nombre: row.nom,
        apellido: row.cognom,
      };
    });

    return callback(null, jugadores);
  });
}

//Exportar la funciones utilies
module.exports = { jugadorInsert, bookSelect }; //common.js
// module.js --> export {funcion, variable[,...]}

const db = require('./database');

//CREATE 
const createBook = (title, description, num_chapters, callbalck) => {
  const sql = 'INSERT INTO manga (title, description, num_chapters) VALUES (?, ?, ?)';
  //Parametros db.run() 
  // 1: Comando sql 
  // 2: Si hace falta pasar atributos ponerlos en un array en orden
  // 3: Llama a una funcion que retorna un objectp con error si la ejecucion ha sido incorrecta (si no hay es nulo) y
  //    como segundo parametro un objecto con los parametros lastID y changes. 
  db.run(sql,[title, description, num_chapters], function (err) {
    callbalck(err, {id: this.lastID});
  });
}

//READ
// all(): obtiene todos los elementos de las columnas
// get(): obtiene una sola fila, normalmente a partir de la id de esta
const readBooks = (callback) => {
  const sql = 'SELECT * FROM manga';
  db.all(sql, [], callback);
}

const readBook = (id_manga, callback) => {
  const sql = 'SELECT * FROM manga WHERE id_manga = ?'
  db.get(sql, id_manga, callback);
}


//UPDATE
const updateBook = (id_manga, title, description, num_chapters, callback) => {
  const sql = 'UPDATE manga SET title = ?, description = ?, num_chapters = ? WHERE id_manga = ?';
  db.run(sql, [title, description, num_chapters, id_manga], callback)
}

//DELETE
const deleteBook = (id_manga, callback) => {
  const sql = 'DELETE FROM manga WHERE id_manga = ?';
  db.run(sql, id_manga, callback); 
}

//Exports
module.exports = {readBooks, readBook, createBook, updateBook, deleteBook};
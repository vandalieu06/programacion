const db = require('../config/database.js');

/* NOTAS
  P- arametros db.run(): 
    1: Comando sql 
    2: Si hace falta pasar atributos ponerlos en un array en orden
    3: Llama a una funcion que retorna un objectp con error si la ejecucion ha sido incorrecta (si no hay es nulo) y
       como segundo parametro un objecto con los parametros lastID y changes. 
  - READ:
    all(): obtiene todos los elementos de las columnas
    get(): obtiene una sola fila, normalmente a partir de la id de esta

*/

class BookModel {
  static readAllBooks (callback){
    const sql = 'SELECT * FROM manga LIMIT 10';
    db.all(sql, [], callback);
  }

  static readIdBook (id, callback) {
    const sql = 'SELECT * FROM manga WHERE id_manga = ?';
    db.get(sql, id, callback);
  }

  static createBook (title, description, num_chapters, callback) {
    const sql = 'INSERT INTO manga (title, description, num_chapters) VALUES (?, ?, ?)';
    db.run(sql, [title, description, num_chapters], function (err){
      callback(err, {id: this.lastID})
    })
  }

  static updateBook (id, title, description, num_chapters, callback) {
    const sql = 'UPDATE manga SET title = ?, description = ?, num_chapters = ? WHERE id_manga = ?'; 
    db.run(sql, [title, description, num_chapters, id], callback);
  }

  static deleteBook (id_manga, callback) {
    const sql = 'DELETE FROM manga WHERE id_manga = ?';
    db.run(sql, id_manga, callback); 
  }
};

module.exports = BookModel;

const mangaModel = require('../models/manga.model.js'); 
  
class BookService {
  static getBooks () {
    return new Promise((resolve, reject) => {
      mangaModel.readAllBooks((err, rows) => {
        if (err) return reject(err.message);
        resolve(rows);
      }); 
    })
  };

  static getIdBook (id) {
    return new Promise((resolve, reject) => {
      mangaModel.readIdBook(id, (err, row) => {
        if (err) return reject(err.message);
        resolve(row);
      });
    });
  }

  static createBook (title, description, numChapters) {
    return new Promise((resolve, reject) => {
      mangaModel.createBook(title, description, numChapters, (err, data) => {
        if (err) return reject(err.message);
        resolve(data);
      });
    });   
  }

  static updateBook (id, title, description, numChapters) {
    return new Promise ((resolve, reject) => {
      mangaModel.updateBook(id, title, description, numChapters, (err) => {
        if (err) return reject(err.message);
        resolve(`The item ${id} is updated.`);
      });    
    }); 
  }

  static deleteBook (id) {
    return new Promise((resolve, reject) => {
      mangaModel.deleteBook(id, (err) => {
        if (err) return reject(err.message);
        resolve(`Item ${id} is delete.`);
      });
    });
  };
}

module.exports = BookService;

const Book = require('../models/manga.model.js')

class BookController {
  static getBooks (req, res) {
    Book.readAllBooks((err, rows) => {
      if (err) return res.status(500).send(err.message);
      res.status(200).json(rows);
    });
  }

  static getIdBook (req, res) {
    readBook(req.params.id, (err, row) => {
      if (err) return res.status(500).send(err.message);
      res.status(200).json(row);
    });
  }

  static createBook (req, res) {
    const {title, description, numChapters} = req.body;
    createBook(title, description, numChapters, (err, data) => {
      if (err) return res.status(500).send(err.message);
      res.status(201).send(`Item added ID : ${data.id}`)
    });
  }

  static updateBook (req, res) {
    const {title, description, numChapters} = req.body;
    updateBook(req.params.id, title, description, numChapters, (err) => {
      if (err) return res.status(500).send(err);
      res.status(200).send(`Item is updated`);
    })
  }

  static deleteBook (req, res) {
    deleteBook(req.params.id, (err)=>{
      if(err) return res.status(500).send(err);
      res.status(200).send(`Item ${req.params.id} is deleted`);
    })
  }
}

module.exports = BookController;
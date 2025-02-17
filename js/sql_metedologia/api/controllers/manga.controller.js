const BookService = require('../services/manga.service.js');

class BookController {
  static async getBooks (req, res) {
    try {
      const response = await BookService.getBooks();
      res.status(200).json(response);//rows
    } catch (err) {
      res.status(500).send(err);
    }
  }

  static async getIdBook (req, res) {
    try {
      const response = await BookService.getIdBook(req.params.id);
      res.status(200).json(response);//row
    } catch (err) {
      res.status(500).send(err);
    }
  }

  static async createBook (req, res) {
    try {
      const {title, description, num_chapters} = req.body;
      const response = await BookService.createBook(title, description, num_chapters);
      res.status(201).json(response);
    } catch (err) {
      res.status(500).send(err);
    }
  }

  static async updateBook (req, res) {
    try{
      const {title, description, num_chapters} = req.body;
      const response = await BookService.updateBook(req.params.id, title, description, num_chapters); 
      res.status(201).send(response);
    } catch(err){
      res.status(500).send(err);
    }
  }

  static async deleteBook (req, res) {
    try {
      const response = await BookService.deleteBook(req.params.id);
      send.status(200).send(response);
    } catch (err) {
      res.status(500).send(err)
    }    
  }
}

module.exports = BookController;

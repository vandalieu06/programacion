const BookController = require('../controllers/manga.controller.js')
const express = require('express');
const router = express.Router();

router.get('/', BookController.getBooks);
router.get('/:id', BookController.getIdBook);
router.post('/', BookController.createBook);
router.put('/:id', BookController.updateBook);
router.delete('/:id', BookController.deleteBook);

module.exports = router;
const express = require('express');
const path = require('path');
const BookRouter = require('./routes/manga.route.js');
const app = express();

//Permite que Express analice automáticamente el cuerpo (body) de las solicitudes HTTP que llegan en formato JSON, basado en body-parser.
app.use(express.json());

//Midwelere para que todos los archivos en donde se encuentra main.js sean accecibles para todos 
app.use(express.static(path.join(__dirname, '../')));
//console.log(path.join(__dirname, '../'));

//PAGE HTML
app.get('/', (req, res) => {
  res.sendFile('./index.html');
})

//MANGAS
app.use('/api/books', BookRouter);

module.exports = app;
const express = require('express'); // Ha hehcho falta instalar "@types/express" por que expres utiliza dependecias y pnpm no las instal·lo.
const {readBooks, createBook, updateBook, deleteBook, readBook} = require('./crud');
//4283 --> negra, 4765 --> roja
const app = express();
const port = 3000;

app.listen(port, (err) => {
  if (err) return console.error(err);
  console.log(`Server listening on port: ${port}`);
});

//Permite que Express analice automáticamente el cuerpo (body) de las solicitudes HTTP que llegan en formato JSON, basado en body-parser.
app.use(express.json());
//Midwelere para que todos los archivos en donde se encuentra main.js sean accecibles para todos 
app.use(express.static(__dirname));

//PAGE HTML
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
})

//METHODS
app.get('/books', (req, res) => {
  readBooks((err, rows) => {
    if (err) return res.status(500).send(err.message);
    res.status(200).json(rows);
  });
});

app.get('/book/:id', (req, res) => {
  readBook(req.params.id, (err, row) => {
    if (err) return res.status(500).send(err.message);
    res.status(200).json(row);
  });
})

app.post('/book', (req, res) => {
  const {title, description, numChapters} = req.body;
  createBook(title, description, numChapters, (err, data) => {
    if (err) return res.status(500).send(err.message);
    res.status(201).send(`Item added ID : ${data.id}`)
  });
})

app.put('/book/:id', (req, res) => {
  const {title, description, numChapters} = req.body;

  updateBook(req.params.id, title, description, numChapters, (err) => {
    if (err) return res.status(500).send(err);
    res.status(200).send(`Item is updated`);
  })
})

app.delete('/book/:id', (req, res) => {
  deleteBook(req.params.id, (err)=>{
    if(err) return res.status(500).send(err);
    res.status(200).send(`Item ${req.params.id} is deleted`);
  })
})
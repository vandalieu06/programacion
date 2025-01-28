const express = require('express'); // Ha hehcho falta instalar "@types/express" por que expres utiliza dependecias y pnpm no las instal·lo.
const {readBooks, createBook, updateBook, deleteBook} = require('./crud');

const app = express();
const port = 3000;
app.listen(port, (err) => {
  if (err) return console.error(err);
  console.log(`Server listening on port: ${port}`);
});

//Permite que Express analice automáticamente el cuerpo (body) de las solicitudes HTTP que llegan en formato JSON, basado en body-parser.
app.use(express.json());

//METHODS
app.get('/books', (req, res) => {
  readBooks((err, rows) => {
    if (err) return res.status(500).send(err.message);
    res.status(200).json(rows);
  });
});

app.post('/books', (req, res) => {
  const {title, description, numChapters} = req.body;
  createBook(title, description, numChapters, (err, data) => {
    if (err) return res.status(500).send(err.message);
    res.status(201).send(`Item added ID : ${data.id}`)
  });
})
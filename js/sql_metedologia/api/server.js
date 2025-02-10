const express = require('express'); // Ha hehcho falta instalar "@types/express" por que expres utiliza dependecias y pnpm no las instal·lo.
const BookRouter = require('./routes/manga.route.js');

const app = express();
const port = 3000;

app.listen(port, (err) => {
  if (err) return console.error(err);
  console.log(`Server listening on port: ${port}`);
});

//Permite que Express analice automáticamente el cuerpo (body) de las solicitudes HTTP que llegan en formato JSON, basado en body-parser.
app.use(express.json());
//Midwelere para que todos los archivos en donde se encuentra main.js sean accecibles para todos 
app.use(express.static(__dirname + '../../'));

//PAGE HTML
app.get('/', (req, res) => {
  res.sendFile(__dirname + '../index.html');
})

//MANGAS
app.use('/api/libros', BookRouter)
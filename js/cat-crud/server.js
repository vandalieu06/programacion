const path = require("path");
const express = require("express");
const bodyParser = require("body-parser");
const {getKitten, postKitten, Kitten} = require("./backend/database.js");


//Express configure
const app = express();
const PORT = 3000;

app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "frontend", "index.html"))
});

app.listen(PORT, () => {
  console.log(`Example app listening on port: http://localhost:${PORT}`)
});

//STATICOS

//app.use("/", express.static("public"))
//Igual a :
app.use(express.static(path.join(__dirname, 'frontend')));

// Middleware para procesar JSON
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));


//CRUD

app.get("/api/mongodb", async (req, res) => {
  const mongoConnect = await getKitten();
  res.send(mongoConnect);
})

app.post("/api/mongodb", async (req, res) => {
  const { name } = req.body;
  console.log("Hola", name)
  const kitten = new Kitten({name});
  await postKitten(kitten);
})

//Error 404
app.use((req, res, next) => {
  res.status(404).send('Sorry cant find that!');
});
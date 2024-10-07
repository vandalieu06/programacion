const express = require("express");
const multer = require("multer");
const path = require("path");
const bodyParser = require("body-parser");
const connection = require("./src/js/db.js");
const { off } = require("process");


// Config general
const app = express();
const PORT = 8080;

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, `${__dirname}/src/portadas`)
  }, 
  filename: (req, file, cb) => {
    cb(null, file.originalname);
  }
})

const upload = multer({storage: storage});

// App use
app.use("/", express.static(path.join(__dirname)));
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, '/src')));
// console.log(path.join(__dirname, '/')); //Ver que directprio esta cogiendo el path.join

// Condig server
app.listen(PORT, ( ) => {
  return console.log("Serveridor funcionando en: ", "http://localhost:8080")
});

app.get("/", (req, res) => {
  res.sendFile("index.html");
  return console.log("Arhivo index devuelto.")
});

app.get("/admin", (req, res) => {
  res.sendFile(__dirname + "/src/pages/admin.html");
  return console.log("Arhivo admin devuelto.")
});

// API
app.get("/api/novelas", (req, res) => {
  const limit = parseInt(req.query.limit, 10) || 5;
  const offset = parseInt(req.query.offset, 10) || 0;

  const query = "SELECT title, img_src, url FROM novelas LIMIT ? OFFSET ?"

  connection.query(query, [limit, offset],(err, results) => {
    if (err) return res.status(500).send(err);
    res.json(results);
  });
});

app.post("/src/portadas", upload.single("portada"),(req, res) => {
  const portada = req.file;
  const title = req.body.title;
  const img_src = "./src/portadas/" + portada.filename;

  console.log("POST subido correctamente a: ", img_src);

  const query = "INSERT INTO novelas (title, img_src) VALUES (?, ?)";

  connection.query(query, [title, img_src], (err, results) => {
    if (err) return res.status(500).send(err);
    res.json(results);
  });
});
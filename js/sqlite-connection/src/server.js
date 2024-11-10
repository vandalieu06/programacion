const express = require("express");
const path = require("path");
const { bookSelect } = require("./database.js");

const app = express();
const PORT = 3000;

app.use("/", express.static(path.join(__dirname, "../")));

app.listen(PORT, () => {
  console.log("Listening port: ", PORT);
});

app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname + "../index.html"));
});

// SQLITE
app.get("/api/books", (req, res) => {
 
  bookSelect((err, books) => {
    res.json(books)
  });

});

const express = require('express'); // Ha hehcho falta instalar "@types/express" por que expres utiliza dependecias y pnpm no las instal·lo.
const app = require('./app.js');

const port = 3000;

app.listen(port, (err) => {
  if (err) return console.error(err);
  console.log(`Server listening on port: ${port}`);
});



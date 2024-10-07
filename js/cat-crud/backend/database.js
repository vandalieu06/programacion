const mongoose = require("mongoose");
const URI = "mongodb://127.0.0.1:27017/prueba-mongoose";

//Schema para mongodb
const kittySchema = new mongoose.Schema({
  name: String
});

//Definir un metodo nuevo al Schema
kittySchema.methods.speak = function speak() {
  const greeting = this.name
    ? "Meow name is " + this.name
    : "i don't have a name";
  console.log(greeting)
}

//Copilar el Schema, crea la coleccion en mongodb
const Kitten = mongoose.model('Kitten', kittySchema)

//Crear documentos para insertar
//const kitten = new Kitten({name: "silence"})
//console.log(silence.name)

//const fluffy = new Kitten({name: "fluffy"})
//fluffy.speak();

// Funcion prinipal de connexion
async function getKitten () {
  try{
    await mongoose.connect(URI)
    console.log("La base de datos esta connectada")
  
    //Mostrar datos
    const kittens = await Kitten.find();
  
    await mongoose.disconnect();
    console.log("La base de datos esta desconnectada")
    
    return kittens 
  } catch(err){
    console.log(err)
  }
}

async function postKitten (kitten) {
  try{
    await mongoose.connect(URI)
    console.log("La base de datos esta connectada");

    //Guardar Datos
    await kitten.save();
    kitten.speak();

    await mongoose.disconnect();
  }
  catch (err){
    console.log(err)
  }
}

// Funcione exportadas
module.exports = {
  getKitten,
  postKitten,
  Kitten
}
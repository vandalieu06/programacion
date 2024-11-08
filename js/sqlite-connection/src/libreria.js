const divLibrary = document.querySelector(".library");

const tmpBook = [
  {
    title: "La llamada de Cthulhu",
    autor: "H. P. Lovecraft",
    description:
      "Una historia de terror verdadero y uno de los monstruos más renombrados en la literatura obscura, ambos creados por un autor de culto del terror. La llamada de Cthulhu cuenta una historia que avanza misteriosa y obscura, teniendo acentos de locura, horror y muerte sembrados por todo el relato, creando el camino que poco a poco lo llevará a usted hacia la descripción del terrible Cthulhu y su tenebrosa morada.",
    srcFrontpage:
      "https://m.media-amazon.com/images/I/71+o8hBSD3L._SL1500_.jpg",
    price: "20.90",
  },
  {
    title: "El Arte de la Guerra",
    autor: "Sun Tzu",
    description:
      "El Arte de la Guerra de Sun Tzu no es solo un libro sobre tácticas militares antiguas, es una guía atemporal para ganar en todos los aspectos de la vida. Ya sea que estés navegando por el campo de batalla de los negocios, luchando por el éxito en las relaciones personales, o buscando mejorar tus habilidades de liderazgo, este clásico ofrece profundos conocimientos que han resistido la prueba del tiempo...",
    srcFrontpage:
      "https://m.media-amazon.com/images/I/71uDB7R6MqL._SL1499_.jpg",
    price: "13.52",
  },
];

const books = async () => {
  try {
    const response = await fetch("/api/books");
    if (!response.ok) {
      console.log("Error al obtener los datos...");
      return;
    }

    const data = await response.json();
    console.log(response);
  } catch (e) {
    console.error(e);
  }
};

books();

for (let i = 0; i < tmpBook.length; i++) {
  const divBook = document.createElement("div");
  divBook.classList.add("book");

  const componentBook = `
        <img src="${tmpBook[i].srcFrontpage}" class="book__img" />
        <h3 class="book__title">${tmpBook[i].title}</h3>
        <p class="book__autor">${tmpBook[i].autor}</p>
        <p class="book__description">${tmpBook[i].description}</p>
        <p class="book__price">${tmpBook[i].price}€</p>
    `;
  divBook.innerHTML = componentBook;

  divLibrary.append(divBook);
}

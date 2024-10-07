// DIA 1
// Cuando se añada el boton de siguiente canviar DOMContentLoaded a una funcion
// que se ejecute al dar click al boton. llamar a eta funcion despues para que se 
// sin tener que hacer nada

const manga_container = document.querySelector(".novel__container")
const btn = document.querySelector(".novel__btns--btn1");

let limit = 5;
let offset = 0;

async function cargarNovelas() {
  try{
    const response = await fetch(`/api/novelas?limit=${limit}&offset=${offset}`, {method: "GET"});
    const data = await response.json();

    data.forEach(e => {
      const article = document.createElement("article");
      article.classList.add("novel__box");
      article.innerHTML= `
          <img class="novel__box--img" src="${e.img_src}" alt="portada_light_novelclea">
          <h3 class="novel__box--title">${e.title}</h3>
          <a href="${e.url}" target="_blank">Novela</a>
      `;      
      manga_container.appendChild(article);

    });
   
    offset += limit;
  } catch (error){
    console.error('Error al obtener las novelas:', error);
  };
};


btn.addEventListener("click", cargarNovelas);
cargarNovelas();

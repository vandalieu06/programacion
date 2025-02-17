

const insertElements = async () => {
  try{
    const response = await fetch('/api/books');
    const data = await response.json();
    
    //Imagen por defecto, mas adelante añadir atributo a la bese de datos con la imagenes correpondientes
    //Como estamos en el servidor ya podemos utilizar rutas estaticas sin ../..
    const imgUrl = './src/assets/girl_image.jpg';
  
    for(let i = 0; i < data.length; i++){    
      //Funcions
      const containerMain = document.querySelector(".main > .container");    
      const CajaManga = document.createElement('article')
      CajaManga.className = 'manga';
      CajaManga.innerHTML = ` 
        <div class="manga__container"></div>
        <h4 class="manga__title">${data[i].title}</h1>
        <img class="manga__image" src="${imgUrl}" alt="">
      `;
      containerMain.appendChild(CajaManga);
    }
  }catch(err){
    console.error(err)
  };
}

//Funciones al inizializar la web
insertElements();


const insertElements = async () => {
  try{
    const response = await fetch('/books');
    const data = await response.json();
    console.log(data)
    //Imagen por defecto, mas adelante añadir atributo a la bese de datos con la imagenes correpondientes
    const imgUrl = 'https://images.pexels.com/photos/433989/pexels-photo-433989.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  
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
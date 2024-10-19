//Agregar productos
function agregarProductos(){
  const items = [
    { title: "Figura 1", price: "49,99€", imgSrc: "img/articulos/item1.jpg" },
    { title: "Figura 2", price: "59,99€", imgSrc: "img/articulos/item2.jpg" },
    { title: "Figura 3", price: "39,99€", imgSrc: "img/articulos/item3.jpg" },
    { title: "Figura 4", price: "99,99€", imgSrc: "img/articulos/item4.jpg" },
    { title: "Figura 5", price: "99,99€", imgSrc: "img/articulos/item5.jpg" },
    { title: "Figura 6", price: "99,99€", imgSrc: "img/articulos/item6.jpg" },
    { title: "Figura 7", price: "99,99€", imgSrc: "img/articulos/item7.jpg" },
    { title: "Figura 8", price: "99,99€", imgSrc: "img/articulos/item8.jpg" }
  ];

  let itemsContainer = document.querySelectorAll('.itemsInside')[0];
  
  items.forEach(item => {
      let article = document.createElement('article');
      article.classList.add('item');
      article.innerHTML = `
          <span class="itemTittle">${item.title}</span>
          <img src="${item.imgSrc}" class="itemImg" alt="${item.title}">
          <span class="itemPrice">${item.price}</span>
          <button class="itemButton">Agregar al Carrito</button>
      `;
      itemsContainer.appendChild(article);
    }
  ); 
}
//Añadimos los productos
agregarProductos();

//Variable que matiene el esatdo visible del carrtio
let carritoVisible = false;

//Actualizamos el total del carrito
function actualizarTotalCarrito() {
  //Obtemeos los items del contenedor del carrito y asiganmos el precio del carrito a 0
  let carritoContenedor = document.getElementsByClassName("carrito")[0];
  let carritoItems = carritoContenedor.getElementsByClassName("carritoItem");
  let total = 0;

  //Recorre cada elemento del carrito para actualizar el total
  for (let i = 0; i < carritoItems.length; i++) {
    let item = carritoItems[i];

    //Estoy reciebiendo un precio con el tipo 99,99€ y tengo que canviarlo a 99.99
    let precioElemento = item.getElementsByClassName("carritoItemPrecio")[0];
    let precioQuitarSimbolos = precioElemento.innerText.replace("€", "").replace(",", ".");
    let precioNumero = parseFloat(precioQuitarSimbolos);

    //Comprovamos del producto cuantos se quieren comprar
    let cantidadItems = item.getElementsByClassName("carritoItemCantidad")[0];
    let cantidad = cantidadItems.value;
    total += (precioNumero * cantidad);
  }

  //Actualizamos el total
  let carritoTotal = document.getElementsByClassName("carritoPrecioTotal")[0];
  return carritoTotal.innerText =`${total}€`;
}

// Funcion que oculta el carrito cuando no hay ningun producto (item)
function ocultarCarrito() {
  let carritoItems = document.getElementsByClassName("carritoItems")[0];

  if (carritoItems.childElementCount == 0) {
    let carrito = document.getElementsByClassName("carrito")[0];
    carrito.style.marginRight = "-100%";
    carrito.style.opacity = "0";
    carritoVisible = false;
  }

}

// Eliminamos el item seleccionado del carrito
function eliminarItemCarrito(e) {
  let buttonClicked = e.target;
  buttonClicked.parentElement.remove();
  actualizarTotalCarrito();
  ocultarCarrito();
}

//Funcion que obteine la suma de catidad de productos en el carrito (item)
function sumarCantidad(event) {
  // Vamos al div padre de los btn que es el mismo que el del contador 
  let buttonClicked = event.target.parentElement;
  
  // Obtenemos el elemento con el contador y cogemos el valor actual seguidamente lo summamos y lo
  // aplicamos al contenedor.
  let cantidadActual = buttonClicked.getElementsByClassName("carritoItemCantidad")[0].value;
  cantidadActual++;
  buttonClicked.getElementsByClassName("carritoItemCantidad")[0].value = cantidadActual;

  //Actualizamos el total del producto
  actualizarTotalCarrito();
}

//Funcion que obteine la resta de catidad de productos en el carrito (item)
function restarCantidad(event) {
  //Vamos al padre de los botones + i - y de la cantidad
  let buttonClicked = event.target.parentElement;
  
  //Obtenemos el valor actual de la cantidad del item que deasoms restar
  let cantidadActual = buttonClicked.getElementsByClassName("carritoItemCantidad")[0].value;
  cantidadActual--;
  
  //Comprovamos si el item es 0 y si es asi no hace nada pero sino lo que hace es asignar la nueva cantidad 
  if (cantidadActual == 0) return
  buttonClicked.getElementsByClassName("carritoItemCantidad")[0].value = cantidadActual;
  actualizarTotalCarrito();
}

//Ponemos el carrito visible
function hacerVisibleCarrito() {
  let carrito = document.getElementsByClassName("carrito")[0];
  carritoVisible = true;
  carrito.style.marginRight = "0";
  carrito.style.opacity = "1";
}

//Agregar al carrito el item sleccionado
function agregarAlCarrito(titulo, precio, imageSrc) {
  let itemsCarrito = document.getElementsByClassName("carritoItems")[0];
  let nombresItemsCarrito = itemsCarrito.getElementsByClassName("carritoItemTittle");
  let item = document.createElement("div");

  //Comprovar en el carrito que no haiga un item igual al que deseamos añadir
  for (i = 0; i < nombresItemsCarrito.length; i++) {
    if (nombresItemsCarrito[i].innerText == titulo) {
      alert(`El item que desea añadir ya esta en el carrito`);
      return;
    }
  }

  //Creamos la estructura del item simualdno un componente de react
  let itemCarritoContenido = `
    <img src="${imageSrc}">
    <div class="carritoItemDetalles">
      <span class="carritoItemTittle">${titulo}</span>
      <div class="selectorCantidad">
        <i class='bx bx-chevron-down-square restarCarrito'></i>
        <input type="text" value="1" class="carritoItemCantidad">
        <i class='bx bx-chevron-up-square sumarCarrito' ></i>
      </div>
      <span class="carritoItemPrecio">${precio}</span>
    </div>
    <span class="btnEliminar"><i class='bx bxs-message-alt-x'></i></span>
    `;

  //Añadimos la classe i HTML al item
  item.classList.add("carritoItem");
  item.innerHTML = itemCarritoContenido;
  
  //Añadimos al contenedor de items el producto (item)
  itemsCarrito.append(item);
  
  //Añadimos las funcionalidades a los botones del item
  item.getElementsByClassName("btnEliminar")[0].addEventListener("click", eliminarItemCarrito);
  item.getElementsByClassName("sumarCarrito")[0].addEventListener("click", sumarCantidad);
  item.getElementsByClassName("restarCarrito")[0].addEventListener("click", restarCantidad);
}

//Agreagom un producto (item) al carrito y mostramos el carrito si este no es visible
function agregarAlCarritoClicked(event) {
  let button = event.target;
  let item = button.parentElement;
  let titulo = item.getElementsByClassName("itemTittle")[0].innerText;
  let precio = item.getElementsByClassName("itemPrice")[0].innerText;
  let imageSrc = item.getElementsByClassName("itemImg")[0].src;
  agregarAlCarrito(titulo, precio, imageSrc);
  hacerVisibleCarrito();
  actualizarTotalCarrito();
}

// Funcion de pagar
function pagarClicked(event) {
  alert("Gracia por su compra OTAKU.");
  let carritoItems = document.getElementsByClassName("carritoItems")[0];
  while (carritoItems.hasChildNodes()) {
    carritoItems.removeChild(carritoItems.firstChild);
  }
  setTimeout(()=> {
    ocultarCarrito();
  }, 3000)
}

//Funcion que añade funcionalidades a los botones y agregar al carrito a los elementos
function opcionesCarrito() {
  let botonAgregarCarrito = document.getElementsByClassName("itemButton");
  for (let i = 0; i < botonAgregarCarrito.length; i++) {
    let button = botonAgregarCarrito[i];
    button.addEventListener("click", agregarAlCarritoClicked);
  }

  let btnPagar = document.getElementsByClassName("btnPagar")[0];
  btnPagar.addEventListener("click", pagarClicked);
}

//Ejecutamos la funcion que añade la interacion con el carrito
opcionesCarrito();
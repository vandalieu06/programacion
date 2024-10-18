//Variable que matiene el esatdo visible del carrtio
let carritoVisible = false;

//Esperamos que todos los elemntos de la pagina carguen para continuar el script
document.readyState == "loading"
  ? document.addEventListener("DOMContentLoaded", opcionesCarrito)
  : opcionesCarrito();

//Funcion que añade funcionalidades a los botoones de los carritos
function opcionesCarrito() {
  let btnEliminarItem = document.getElementsByClassName("btnEliminar");
  for (let i = 0; i < btnEliminarItem.length; i++) {
    let button = btnEliminarItem[i];
    button.addEventListener("click", eliminarItemCarrito);
  }

  let botonesSumarCantidades = document.getElementsByClassName("sumarCarrito");
  for (let i = 0; i < botonesSumarCantidades.length; i++) {
    let button = botonesSumarCantidades[i];
    button.addEventListener("click", sumarCantidad);
  }
  let botonesRestarCantidades =
    document.getElementsByClassName("restarCarrito");
  for (let i = 0; i < botonesRestarCantidades.length; i++) {
    let button = botonesRestarCantidades[i];
    button.addEventListener("click", restarCantidad);
  }

  let botonAgregarCarrito = document.getElementsByClassName("itemButton");
  for (let i = 0; i < botonAgregarCarrito.length; i++) {
    let button = botonAgregarCarrito[i];
    button.addEventListener("click", agregarAlCarritoClicked);
  }

  document
    .getElementsByClassName("btnPagar")[0]
    .addEventListener("click", pagarClicked);
}
// Eliminamos el item seleccionado del carrito
function eliminarItemCarrito(e) {
  let buttonClicked = e.target;
  buttonClicked.parentElement.remove();
  actualizarTotalCarrito();
  ocultarCarrito();
}

//Actualizamos el total del carrito
function actualizarTotalCarrito() {
  let carritoContenedor = document.getElementsByClassName("carrito")[0];
  let carritoItems = carritoContenedor.getElementsByClassName("carritoItem");
  let total = 0;

  //recorre cada elemnto del carrito para actualizar el total
  for (let i = 0; i < carritoItems.length; i++) {
    let item = carritoItems[i];
    let precioElemento = item.getElementsByClassName("carritoItemPrecio")[0];
    let precio = parseFloat(precioElemento.innerText.replace("€", ""));

    let cantidadItems = item.getElementsByClassName("carritoItemCantidad")[0];
    let cantidad = cantidadItems.value;
    total = total + precio * cantidad;
    console.log(total);
  }
  total = Math.round(total * 10) / 10; //se utiliza para reondear un numero a dos decimales
  document.getElementsByClassName("carritoPrecioTotal")[0].innerText =
    `${total}€`;
}

function ocultarCarrito() {
  let carritoItems = document.getElementsByClassName("carritoItems")[0];
  if (carritoItems.childElementCount == 0) {
    let carrito = document.getElementsByClassName("carrito")[0];
    carrito.style.marginRight = "-100%";
    carrito.style.opacity = "0";
    carritoVisible = false;
  }
}
function sumarCantidad(event) {
  let buttonClicked = event.target;
  let selector = buttonClicked.parentElement;
  let cantidadActual = selector.getElementsByClassName("carritoItemCantidad")[0]
    .value;
  console.log(cantidadActual);
  cantidadActual++;
  selector.getElementsByClassName("carritoItemCantidad")[0].value =
    cantidadActual;
  actualizarTotalCarrito();
}
function restarCantidad(event) {
  let buttonClicked = event.target;
  let selector = buttonClicked.parentElement;
  let cantidadActual = selector.getElementsByClassName("carritoItemCantidad")[0]
    .value;
  console.log(cantidadActual);
  cantidadActual--;
  if (cantidadActual >= 1) {
    selector.getElementsByClassName("carritoItemCantidad")[0].value =
      cantidadActual;
    actualizarTotalCarrito();
  }
}
function agregarAlCarritoClicked(event) {
  let button = event.target;
  let item = button.parentElement;
  let titulo = item.getElementsByClassName("itemTittle")[0].innerText;
  let precio = item.getElementsByClassName("itemPrice")[0].innerText;
  let imageSrc = item.getElementsByClassName("itemImg")[0].src;
  agregarAlCarrito(titulo, precio, imageSrc);
  hacerVisibleCarrito();
}
function agregarAlCarrito(titulo, precio, imageSrc) {
  let item = document.createElement("div");
  item.classList.add("carritoItem");
  let itemsCarrito = document.getElementsByClassName("carritoItems")[0];

  let nombresItemsCarrito =
    itemsCarrito.getElementsByClassName("carritoItemTittle");
  for (i = 0; i < nombresItemsCarrito.length; i++) {
    if (nombresItemsCarrito[i].innerText == titulo) {
      alert(`El item que desea añadir ya estaen el carrito`);
      return;
    }
  }

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

  item.innerHTML = itemCarritoContenido;
  itemsCarrito.append(item);
  item
    .getElementsByClassName("btnEliminar")[0]
    .addEventListener("click", eliminarItemCarrito);
  let botonSumarCantidad = item.getElementsByClassName("sumarCarrito")[0];
  botonSumarCantidad.addEventListener("click", sumarCantidad);
  let botonRestarCantidad = item.getElementsByClassName("restarCarrito")[0];
  botonRestarCantidad.addEventListener("click", restarCantidad);
}

function pagarClicked(event) {
  alert("Gracia por su compra OTAKU.");
  let carritoItems = document.getElementsByClassName("carritoItems")[0];
  while (carritoItems.hasChildNodes()) {
    carritoItems.removeChild(carritoItems.firstChild);
  }
  ocultarCarrito();
}

function hacerVisibleCarrito() {
  carritoVisible = true;
  let carrito = document.getElementsByClassName("carrito")[0];
  carrito.style.marginRight = "0";
  carrito.style.opacity = "1";
}

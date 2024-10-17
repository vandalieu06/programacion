//Creamos las variables de los botones que detectaremo y en que div se pondran todas las notificaciones.
let contenedorBtn = document.querySelector("#contenedor__botones");
let contenedorToast = document.querySelector("#contenedor__toast");

//Creamos una funcion que se encargara de crear el componente segun los valores deseados.
let agregarToast = ({ classCSS, tipo, titulo, descripcion, autoCierre }) => {
  //Creamos el div que contendra la notificacion
  const nuevoToast = document.createElement("div");
  nuevoToast.classList.add("toast");
  nuevoToast.classList.add(classCSS);

  //Miramos si es una notificacion con autocierre, si es true añade una classe que contiene una animacion
  //de barra progresiva. Tambien nos añade un tiempo de 4s para que la notificacion se cierre con la funcion.
  if (autoCierre) {
    nuevoToast.classList.add("toast--autoCierre");
    setTimeout(() => {
      cerrarToast(toastID);
    }, 4000);
  }

  //Creamos una variable para tener una id unica a cada notificacion a partir fe la suma de la decha
  const toastID = Date.now() + Date.now();
  nuevoToast.id = toastID;

  //Creamos un objeto con los iconos que usaremos en las notificaciones
  const iconos = {
    exito: `<i class='bx bx-check-square' ></i>`,
    error: `<i class='bx bxs-error-circle' ></i>`,
    info: `<i class='bx bx-info-circle' ></i>`,
    alerta: `<i class='bx bxs-bell-ring' ></i>`,
  };

  //Creamos el compoennte notificacion con los datos correpondiente:
  //- Tipo de icono
  //- Titulo
  //- Descripcion
  const toastBody = `
        <div class="toast__contenido">
            <div class="toast__icono">
                ${iconos[tipo]}
            </div>
            <div class="toast__texto">
                <p class="toast__tittle">${titulo}</p>
                <p class="toast__descripcion">${descripcion}</p>
            </div>
        </div>
        <button class="toast__btn">
                <i class='bx bx-x'></i>
        </button>
    `;

  //Añadimos el compoenente al div creado anteriormente
  nuevoToast.innerHTML = toastBody;
  contenedorToast.appendChild(nuevoToast);

  // Creamos una funcion que comprueva si el componente tiene una animacion llamada cierre si es true
  // pues lo que haremos sera llamar a la misma funcion para que remueva el componente
  let animacionCierre = (e) => {
    if (e.animationName == "cierre") {
      nuevoToast.removeEventListener("animationend", animacionCierre);
      nuevoToast.remove();
    }
  };

  //Añade una animacion de cierre al componente llamada animacionCierre()
  nuevoToast.addEventListener("animationend", animacionCierre);
};

//Añadimos un evento de click para detectar cuando el usuario quiere obtener una notificacion,
//se puede canviar en vez de cada click a cuando se relize una ccion en concreto.
contenedorBtn.addEventListener("click", (e) => {
  e.preventDefault();

  // Detectamos que tipo de notificacion es, y segun eso pasamos unos valores o otros.
  const TIPO = e.target.id;
  if (TIPO == "btn__exito") {
    agregarToast({
      classCSS: "toast--exito",
      tipo: "exito",
      titulo: "Exito!",
      descripcion: "La operacion fue exitosa",
      autoCierre: true,
    });
  } else if (TIPO == "btn__error") {
    agregarToast({
      classCSS: "toast--error",
      tipo: "error",
      titulo: "Error!",
      descripcion: "La operacion fue un fracaso",
      autoCierre: true,
    });
  } else if (TIPO == "btn__info") {
    agregarToast({
      classCSS: "toast--info",
      tipo: "info",
      titulo: "Información!",
      descripcion: "La Información fue recibida correctamente",
    });
  } else if (TIPO == "btn__alerta") {
    agregarToast({
      classCSS: "toast--alert",
      tipo: "alerta",
      titulo: "Alert!",
      descripcion:
        "Hay un problema con la solicitud del servidor, vuelve a intentarlo",
    });
  }
});

//Creamos una funcion que se encargara de añadir una clase que contiene una animacion de cierre
let cerrarToast = (id) => {
  document.getElementById(id)?.classList.add("cerrando");
  //? es para comprovar el elmento con la id que pasamos existe o no.
};

//Creamo un evento que al clicar el boton de cierre se elimine la notificacion creada
contenedorToast.addEventListener("click", (e) => {
  e.preventDefault();
  const btnCerrar = e.target.classList.value;
  const toastID = e.target.closest(".toast").getAttribute("id");

  if (btnCerrar == "toast__btn" || btnCerrar == "bx bx-x") {
    cerrarToast(toastID);
  }
});

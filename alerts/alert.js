let contenedorBtn = document.querySelector('#contenedor__botones');
let contenedorToast = document.querySelector('#contenedor__toast');

contenedorBtn.addEventListener('click', (e) => {
    e.preventDefault();
    
    const TIPO = e.target.id;

    if (TIPO == 'btn__exito') {
        agregarToast({
            classCSS: 'toast--exito', 
            tipo: 'exito', 
            titulo: 'Exito!', 
            descripcion:'La operacion fue exitosa',
            autoCierre: true
        })
    } else if (TIPO == 'btn__error') {
        agregarToast({
            classCSS: 'toast--error', 
            tipo: 'error', 
            titulo: 'Error!', 
            descripcion:'La operacion fue un fracaso'
,            autoCierre: true
        })
    } else if (TIPO == 'btn__info') {
        agregarToast({
            classCSS: 'toast--info', 
            tipo: 'info', 
            titulo: 'Información!', 
            descripcion:'La Información fue recibida correctamente'
        })
    } else if (TIPO == 'btn__alerta') {
        agregarToast({
            classCSS: 'toast--alert', 
            tipo: 'alerta', 
            titulo: 'Alert!', 
            descripcion:'Hay un problema con la solicitud del servidor, vuelve a intentarlo'
        })
    } 
})

contenedorToast.addEventListener('click', (e) => {
    e.preventDefault();

    const btnCerrar = e.target.classList.value;
    const toastID = e.target.closest('.toast').getAttribute(id);
    
    if (btnCerrar == "toast__btn" || btnCerrar == 'bx bx-x') {
        cerrarToast(toastID)
    }
})

let agregarToast = ({classCSS, tipo, titulo, descripcion, autoCierre}) => {
    const nuevoToast = document.createElement('div');
    
    nuevoToast.classList.add('toast');
    nuevoToast.classList.add(classCSS)
    if (autoCierre) {
        nuevoToast.classList.add('toast--autoCierre');
        setTimeout( () => {
            cerrarToast(toastID)
        },4000 );
    }

   // const numeroRandom = Math.floor(Math.random() * 100);
    const fecha = Date.now();
    const toastID = fecha + fecha;
    nuevoToast.id = toastID;

    const iconos = {
        exito: `<i class='bx bx-check-square' ></i>`,
        error: `<i class='bx bxs-error-circle' ></i>`,
        info: `<i class='bx bx-info-circle' ></i>`,
        alerta: `<i class='bx bxs-bell-ring' ></i>`
    };

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

    nuevoToast.innerHTML = toastBody;
    contenedorToast.appendChild(nuevoToast);

    let animacionCierre = (e) => {
        if (e.animationName == 'cierre') {
            nuevoToast.removeEventListener('animationend', animacionCierre)
            nuevoToast.remove();
        }
    };

    nuevoToast.addEventListener('animationend', animacionCierre)
};

let cerrarToast = (id) => {
    document.getElementById(id)?.classList.add('cerrando')
}
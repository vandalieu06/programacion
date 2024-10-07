let contenedorQR = document.getElementById('contenedorQR');
let formulario = document.getElementById('formulario')

const QR = new QRCode(contenedorQR);

formulario.addEventListener('submit', (e) =>{
    e.preventDefault();
    QR.makeCode(formulario.link.value)
})
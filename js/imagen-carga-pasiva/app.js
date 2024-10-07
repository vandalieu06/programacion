let image1 = document.querySelector('#img1');
let image2 = document.querySelector('#img2');
let parrafos = document.querySelectorAll('p');

let loadImages = (entradas, observador) => {
    entradas.forEach((entrada) => {
        if(entrada.isIntersecting){
            entrada.target.classList.add('visible');
        } else{
            entrada.target.classList.remove('visible')
        }
    });
}

let observador = new IntersectionObserver(loadImages, {
    root: null,
    rootMargin: '0px 500px 0px 0px',
    threshold: 1.0 
});

observador.observe(image1);
observador.observe(image2);
//parrafos.forEach(p => {observador.observe(p);});
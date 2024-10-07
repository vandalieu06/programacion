// Variables Globales
let slider = document.querySelector(".sliderInside");
let sliderImg = document.querySelectorAll(".sliderImg");
let sliderImgLast = sliderImg[sliderImg.length - 1];

//Variables Botones
const btnLeft = document.querySelector(".arrowLeft");
const btnRight = document.querySelector(".arrowRight");

//Imagen final a al principio
slider.insertAdjacentElement('afterbegin', sliderImgLast);

// Funcion paar canviar la imagen a la derecha
function next(){
    let sliderSectionFisrt = document.querySelectorAll('.sliderImg')[0];
    slider.style.transform = "translate(-1050px)";
    slider.style.transition = "all 1s ease-in-out";
    setTimeout(function(){
        slider.style.transition = "none";
        slider.insertAdjacentElement('beforeend', sliderSectionFisrt);
        slider.style.transform = "translate(-525px)";

    }, 1000);
}
btnRight.addEventListener('click', () => next());

function prev(){
    let sliderSection = document.querySelectorAll('.sliderImg');
    let sliderSectionLast = document.querySelectorAll('.sliderImg')[sliderSection.length - 1];
    slider.style.transform = "translate(0px)";
    slider.style.transition = "all 1s ease-in-out";
    setTimeout(function(){
        slider.style.transition = "none";
        slider.insertAdjacentElement('afterbegin', sliderSectionLast);
        slider.style.transform = "translate(-525px)";
    }, 1000);
}
btnLeft.addEventListener('click', () => prev());
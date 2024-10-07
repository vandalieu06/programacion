let line = document.querySelectorAll('.line')[0];
let input = document.querySelector('#progress__input');
let numero = document.querySelector('.progress__number')

function mover (e) {
    let value = input.value;
    numero.innerHTML = value;
    let moveInput =  input.value * 4;
    line.style.width = `${moveInput}px`
}

input.addEventListener('input', mover);
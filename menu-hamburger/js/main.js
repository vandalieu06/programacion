const nav = document.querySelector("#nav");
const abrir = document.querySelector("#abrir");
const cerrar = document.querySelector("#cerrar");

abrir.addEventListener("click", () => {nav.classList.add("visible"); abrir.style.opacity = '0'; abrir.style.transition = 'transform .6s, opacity .6s';})
cerrar.addEventListener("click", () => {nav.classList.remove("visible");abrir.style.opacity = '1'})
window.onclick = (e) => {
    if (!nav.contains(e.target) && !abrir.contains(e.target)) {
      nav.classList.remove("visible");
      abrir.style.opacity = '1';
    }
  };
  
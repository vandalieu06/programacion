const divContenido = document.querySelector('.contenido');

for (let i = 0; i < 10; i++){
  const p = document.createElement('p');
  p.textContent = `Hola desde el ciclo: ${i}`;
  divContenido.insertAdjacentElement('beforeend', p);
}
let tabs = document.querySelector('.tab__header');

function mostrarTabOcultar( tab ) {
    if (tab.target.classList.contains('tab__option')) {
        let tabID = tab.target.getAttribute('id');
        let number = tabID.slice(-1);

        let optionsTab = document.querySelectorAll('.tab__option');
        optionsTab.forEach(( tabOcultar ) => {
            tabOcultar.classList.remove('tab__option--active');
        })
        
        let optionsContent = document.querySelectorAll('.tab__content');
        let mostrarContenido = document.querySelector(`#tab__content${number}`);
        
        setTimeout( () => {
            tab.target.classList.add('tab__option--active')
            optionsContent.forEach((tabOcultar) => {
                tabOcultar.classList.remove('tab__content--show');
            })
            mostrarContenido.classList.add('tab__content--show');       
        }, 200)
        
    }
}

tabs.addEventListener( 'click', mostrarTabOcultar )


let datos = 92929;

document.querySelectorAll('.backgroundImg img').forEach(image =>{
    image.onclick = () =>{
        document.querySelector('section').style.display = 'flex';
        document.querySelector('section .imgBig img').src = image.getAttribute('src');
}});

// document.querySelector('.container i').onclick = ()=>{
//     document.querySelector('section').style.display = 'none';
// }
document.querySelectorAll('.container i').forEach(icon => {
    icon.onclick = () => {
        document.querySelector('section').style.display = 'none';
    };
});

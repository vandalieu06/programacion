const progressBar = document.querySelector('#progress-bar');
const section = document.querySelector('.sec1');

const animateProgressbar = () => {
  let scrollDistance = -section.getBoundingClientRect().top;
  let progressWidth = 
    (scrollDistance / 
      (section.getBoundingClientRect().height - 
      document.documentElement.clientHeight)) * 100;
  let value = Math.floor(progressWidth);
  
  progressBar.textContent = `${value}`;
  progressBar.style.width = `${value}%`;
}

window.addEventListener("scroll", animateProgressbar);
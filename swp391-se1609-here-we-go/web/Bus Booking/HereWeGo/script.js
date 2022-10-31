//script for Toggle menu
var navLinks = document.getElementById('navLinks');

function showMenu() {
    navLinks.style.right = "0";
}

function hideMenu() {
    navLinks.style.right = "-200px";
}

window.addEventListener("scroll", function() {
    var header = document.querySelector('#header');
    header.classList.toggle("sticky", window.scrollY > 0);
})

let width = screen.width;
let height = screen.height;
let depth = screen.pixelDepth;

// const nav = document.querySelector('nav');

// window.addEventListener('scroll', () => {
//     if (window.scrollY >=50) {
//         nav.classList.add('active_nav');
//     } else {
//         nav.classList.remove('active_nav');
//     }
// })

var dt = new Date();
document.getElementById('date-time').innerHTML = dt;
//script for Toggle menu
var mainNavLinks = document.getElementById('mainNavLinks');

function showMenu() {
    mainNavLinks.style.right = "0";
}

function hideMenu() {
    mainNavLinks.style.right = "-200px";
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

function activateNavigation() {
    const sections = document.querySelectorAll(".section");
    const navContainer = document.createElement("nav");
    const navItems = Array.from(sections).map(section => {
        return `
            <div class="vertical-nav-item" data-for-section="${section.id}">
                <a href="#${section.id}" class="ver-nav-link"></a>
                <span class="nav-label">${section.dataset.label}</span>
            </div>
        `;
    });

    navContainer.classList.add("vertical-nav");
    navContainer.innerHTML = navItems.join("");

    const observer = new IntersectionObserver(entries => {
        document.querySelectorAll(".ver-nav-link").forEach(navLink => {
            navLink.classList.remove("ver-nav-link-selected");
        });

        const visibleSection = entries.filter(entry => entry.isIntersecting)[0];
        document.querySelector(`.vertical-nav-item[data-for-section="${visibleSection.target.id}"] .ver-nav-link`).classList.add("ver-nav-link-selected");
    }, { threshold: 0.5 });

    sections.forEach(section => observer.observe(section));

    document.body.appendChild(navContainer);
}

activateNavigation();
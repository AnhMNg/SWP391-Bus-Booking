/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const input = document.getElementById('inputUpload');
const image = document.getElementById('user-photo');

input.addEventListener('change', (e) => {
    const reader=new FileReader();
    
    if (e.target.files.length) {
        const src = URL.createObjectURL(e.target.files[0]);
        image.setAttribute('src',src)
    }
    reader.addEventListener("load",()=>{
        localStorage.setItem("recent-image",reader.result);
    });
    reader.readAsDataURL(e.target.files[0]);
});

document.getElementById("edit-profile").addEventListener("click",function(){
    document.getElementsByClassName("pop-up-profile")[0].classList.add("active");
    document.getElementsByClassName("popup-ques")[0].classList.add("active");
});

document.getElementById("no").addEventListener("click",function(){
    document.getElementsByClassName("popup-ques")[0].classList.remove("active");
    document.getElementsByClassName("pop-up-profile")[0].classList.remove("active");
});

function show(anything){
    document.querySelector('.profile-textbox').value=anything;
}
let dropdown=document.querySelector('.dropdown-profile');
dropdown.onclick=function(){
    dropdown.classList.toggle('active');
}

document.getElementById("add-button").addEventListener("click",function(){
  document.getElementsByClassName("pop-up-profile")[0].classList.add("active");
  document.getElementsByClassName("popup-ques")[0].classList.add("active");
});

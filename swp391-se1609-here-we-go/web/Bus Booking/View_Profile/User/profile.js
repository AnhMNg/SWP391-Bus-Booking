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
document.getElementById("add-button").addEventListener("click",function(){
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
document.getElementById("change-pass").addEventListener("click",function(){
    document.getElementsByClassName("pop-up-password")[0].classList.add("active");
    document.getElementsByClassName("popup-password")[0].classList.add("active");
});
document.getElementById("cancel").addEventListener("click",function(){
  document.getElementsByClassName("pop-up-password")[0].classList.remove("active");
  document.getElementsByClassName("popup-password")[0].classList.remove("active");
});
document.getElementById("no-number").addEventListener("click",function(){
  document.getElementsByClassName("pop-up-number")[0].classList.remove("active");
  document.getElementsByClassName("popup-number")[0].classList.remove("active");
});
document.getElementById("add-number-button").addEventListener("click",function(){
  document.getElementsByClassName("pop-up-number")[0].classList.add("active");
  document.getElementsByClassName("popup-number")[0].classList.add("active");
});
const form = document.querySelector(".form-change-pass"),
  passField = form.querySelector(".new-profile-input"),
  passInput = passField.querySelector(".new-input-password"),
  cPassField = form.querySelector(".confirm-password"),
  cPassInput = cPassField.querySelector(".confirm-input-password");
// Password Validation
function createPass() {
  const passPattern =
    /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$/;

  if (!passInput.value.match(passPattern)) {
    passInput.classList.add("invalid");
    return passField.classList.add("invalid"); //adding invalid class if password input value do not match with passPattern
  }
  passField.classList.remove("invalid"); //removing invalid class if password input value matched with passPattern
}

// Confirm Password Validtion
function confirmPass() {
  if (passInput.value !== cPassInput.value || cPassInput.value === "") {
    cPassInput.classList.add("invalid");
    return cPassField.classList.add("invalid");
  }
  cPassField.classList.remove("invalid");
}
// Calling Funtion on Form Sumbit
form.addEventListener("submit", (e) => {
  e.preventDefault(); //preventing form submitting
  createPass();
  confirmPass();
  //calling function on key up
  passInput.addEventListener("keyup", createPass);
  cPassInput.addEventListener("keyup", confirmPass);
  if (
    !passField.classList.contains("invalid") &&
    !cPassField.classList.contains("invalid")
  ) {
    location.href = form.getAttribute("action");
  }
});



const form2 = document.querySelector(".form-number"),
numField = form2.querySelector(".mobile-input"),
numInput = numField.querySelector(".phone-input")
console.log(numInput);
function checkPhone() {
  const passPattern =/^0\d{9,10}$/;
  if (!numInput.value.match(passPattern)) {
    numInput.classList.add("invalid");
    return numField.classList.add("invalid");
  }
  numField.classList.remove("invalid");
}
form2.addEventListener("submit", (e) => {
  e.preventDefault(); //preventing form submitting
 checkPhone();
  //calling function on key up
  numInput.addEventListener("keyup", checkPhone);
  if (
    !numField.classList.contains("invalid") 
  ) {
    location.href = form2.getAttribute("action");
  }
});
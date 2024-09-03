const passwordField = document.querySelector("form input[type='password']");
const icon = document.querySelector(".show-hide");
const dropDown = document.querySelector(".drop-down");
const selectMenu = document.querySelector("select");

icon.onclick = () => {
  if (passwordField.type === "password") {
    passwordField.type = "text";
    icon.textContent = "@";
  } else {
    passwordField.type = "password";
    icon.textContent = "@";
  }
};

const dropDownIcon = () => {
  if (dropDown.classList.contains("active")) {
    dropDown.classList.remove("active");
  } else {
    dropDown.classList.add("active");
  }
};

try {
  selectMenu.addEventListener("click", dropDownIcon);
} catch (error) {
  console.log(error.message);
}

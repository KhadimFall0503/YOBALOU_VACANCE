console.log("App.js chargé - Yobalou Vacance");

document.addEventListener("DOMContentLoaded", function () {
  const btn = document.getElementById("menu-btn");
  const menu = document.getElementById("mobile-menu");
  btn.addEventListener("click", () => {
    menu.classList.toggle("hidden");
  });
});

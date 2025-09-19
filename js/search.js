// filter.js

document.addEventListener("DOMContentLoaded", () => {
  const searchInput = document.getElementById("search-destination");
  const cards = document.querySelectorAll(".card");

  searchInput.addEventListener("input", () => {
    const query = searchInput.value.toLowerCase();

    cards.forEach((card) => {
      const destination = card
        .querySelector(".card-title")
        .textContent.toLowerCase();
      if (destination.includes(query)) {
        card.style.display = "flex"; // afficher la carte
      } else {
        card.style.display = "none"; // cacher la carte
      }
    });
  });
});

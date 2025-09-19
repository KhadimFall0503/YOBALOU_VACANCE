console.log("App.js chargé - Yobalou Vacance");

// Menu mobile
document.addEventListener("DOMContentLoaded", function () {
  const btn = document.getElementById("menu-btn");
  const menu = document.getElementById("mobile-menu");
  if (btn && menu) {
    btn.addEventListener("click", () => {
      menu.classList.toggle("hidden");
    });
  }

  // Charger les séjours après le DOM
  afficherSejours("sejours-list"); // Tous les séjours
  afficherSejours("sejours-populaires", true); // Séjours populaires
});

// Tableau d'exemple de séjours
const sejours = [
  {
    id: 1,
    destination: "Dakar",
    description: "Plage et culture",
    duree: 5,
    prix: 1200,
    image: "assets/images/dakar.jpg",
    populaire: true,
  },
  {
    id: 2,
    destination: "Saint-Louis",
    description: "Découverte historique",
    duree: 4,
    prix: 1000,
    image: "assets/images/saintlouis.jpg",
    populaire: true,
  },
  {
    id: 3,
    destination: "Ziguinchor",
    description: "Nature et détente",
    duree: 6,
    prix: 1500,
    image: "assets/images/ziguinchor.jpg",
    populaire: false,
  },
  {
    id: 4,
    destination: "Joal-Fadiouth",
    description: "Île et traditions locales",
    duree: 3,
    prix: 900,
    image: "assets/images/joal.jpg",
    populaire: false,
  },
  {
    id: 5,
    destination: "Casamance",
    description: "Nature et détente",
    duree: 7,
    prix: 1700,
    image: "assets/images/casamance.jpg",
    populaire: false,
  },
];

// Fonction pour afficher les séjours dans un conteneur
function afficherSejours(containerId, filterPopular = false) {
  const container = document.getElementById(containerId);
  if (!container) return;

  container.innerHTML = ""; // Vide le conteneur

  const liste = filterPopular ? sejours.filter((s) => s.populaire) : sejours;

  liste.forEach((sejour) => {
    const card = document.createElement("div");
    // Ajout de la classe "card" pour la recherche
    card.className = "card border rounded shadow p-4 bg-white flex flex-col";

    card.innerHTML = `
      <img src="${sejour.image}" alt="${sejour.destination}" class="w-full h-48 object-cover rounded"/>
      <h3 class="text-lg font-bold mt-2">${sejour.destination}</h3>
      <p class="text-gray-700 mt-1">${sejour.description}</p>
      <p class="mt-1"><b>Durée:</b> ${sejour.duree} jours</p>
      <p class="mt-1"><b>Prix:</b> <span class="text-blue-600 font-bold">${sejour.prix} €</span></p>
      <button onclick="addToCart('${sejour.id}','${sejour.destination}','${sejour.prix}')" class="bg-blue-700 text-white px-3 py-1 rounded mt-2 hover:bg-green-500 transition">
        Réserver
      </button>
    `;

    container.appendChild(card);
  });
}

// Fonction pour le bouton Réserver
function addToCart(id, destination, prix) {
  alert(`Séjour "${destination}" ajouté au panier (${prix} €)`);
}

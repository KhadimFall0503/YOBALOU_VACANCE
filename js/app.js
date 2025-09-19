console.log("App.js chargé - Yobalou Vacance");

document.addEventListener("DOMContentLoaded", function () {
  // Menu mobile
  const btn = document.getElementById("menu-btn");
  const menu = document.getElementById("mobile-menu");
  if (btn && menu) {
    btn.addEventListener("click", () => menu.classList.toggle("hidden"));
  }

  // Charger les séjours
  afficherSejours("sejours-list");
  afficherSejours("sejours-populaires", true);

  // Charger les destinations
  afficherDestinations();
});

// Tableau de séjours
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

// Afficher les séjours
function afficherSejours(containerId, filterPopular = false) {
  const container = document.getElementById(containerId);
  if (!container) return;

  container.innerHTML = "";
  const liste = filterPopular ? sejours.filter((s) => s.populaire) : sejours;

  liste.forEach((sejour) => {
    const card = document.createElement("div");
    card.className = "card border rounded shadow p-4 bg-white flex flex-col";

    card.innerHTML = `
      <img src="${sejour.image}" alt="${sejour.destination}" class="w-full h-48 object-cover rounded"/>
      <h3 class="text-lg font-bold mt-2">${sejour.destination}</h3>
      <p class="text-gray-700 mt-1">${sejour.description}</p>
      <p class="mt-1"><b>Durée:</b> ${sejour.duree} jours</p>
      <p class="mt-1"><b>Prix:</b> <span class="text-blue-600 font-bold">${sejour.prix} €</span></p>
      <button onclick="addToCart('${sejour.id}','${sejour.destination}','${sejour.prix}')" 
        class="bg-blue-700 text-white px-3 py-1 rounded mt-2 hover:bg-green-500 transition">Réserver</button>
    `;

    container.appendChild(card);
  });
}

// Ajouter au panier
function addToCart(id, destination, prix) {
  let panier = JSON.parse(localStorage.getItem("panier")) || [];
  const existe = panier.find((item) => item.id === id);

  if (!existe) {
    panier.push({ id, destination, prix });
    localStorage.setItem("panier", JSON.stringify(panier));
    alert(`Séjour "${destination}" ajouté au panier (${prix} €)`);
  } else {
    alert(`Le séjour "${destination}" est déjà dans le panier.`);
  }

  if (document.getElementById("panier")) afficherPanier();
}

// Afficher les destinations

function afficherDestinations() {
  const container = document.getElementById("destinations");
  if (!container) return;

  fetch("Khadim_Fall/destinations.xml") // assure-toi que le chemin est correct
    .then((response) => response.text())
    .then((str) => {
      const parser = new DOMParser();
      const xml = parser.parseFromString(str, "text/xml");
      const destinations = xml.getElementsByTagName("destination");

      container.innerHTML = "";

      Array.from(destinations).forEach((dest) => {
        const ville = dest.getElementsByTagName("ville")[0].textContent;
        const region = dest.getElementsByTagName("region")[0].textContent;
        const description =
          dest.getElementsByTagName("description")[0].textContent;
        const attractions =
          dest.getElementsByTagName("attractions")[0].textContent;
        const image = dest.getElementsByTagName("image")[0].textContent;

        const card = document.createElement("div");
        card.className =
          "border rounded shadow p-4 bg-white flex flex-col hover:shadow-lg transition";

        card.innerHTML = `
          <img src="${image}" alt="${ville}" class="w-full h-48 object-cover rounded"/>
          <h3 class="text-lg font-bold mt-2">${ville}</h3>
          <p class="text-gray-600 font-medium mt-1">${region}</p>
          <p class="text-gray-700 mt-2">${description}</p>
          <p class="text-gray-500 mt-1"><b>Attractions:</b> ${attractions}</p>
        `;

        container.appendChild(card);
      });
    })
    .catch((error) => console.error("Erreur lors du chargement XML:", error));
}

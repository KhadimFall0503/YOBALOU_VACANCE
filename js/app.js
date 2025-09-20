console.log("App.js chargé - Yobalou Vacance");

document.addEventListener("DOMContentLoaded", function () {
  // Menu mobile hamburger
  const btn = document.getElementById("menu-btn");
  const menu = document.getElementById("mobile-menu");
  if (btn && menu) {
    btn.addEventListener("click", () => menu.classList.toggle("hidden"));
  }

  // Charger les séjours
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

// Afficher séjours
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
  if (!panier.find((i) => i.id === id)) panier.push({ id, destination, prix });
  localStorage.setItem("panier", JSON.stringify(panier));
  alert(`Séjour "${destination}" ajouté au panier (${prix} €)`);
}

// Afficher destinations
function afficherDestinations() {
  const container = document.getElementById("destinations");
  if (!container) return;

  fetch("Khadim_Fall/destinations.xml")
    .then((r) => r.text())
    .then((str) => {
      const parser = new DOMParser();
      const xml = parser.parseFromString(str, "text/xml");
      const destinations = xml.getElementsByTagName("destination");

      container.innerHTML = "";
      const wrapper = document.createElement("div");
      wrapper.className =
        "overflow-x-auto md:overflow-x-visible w-full md:max-w-screen-xl md:mx-auto";
      const table = document.createElement("table");
      table.className =
        "min-w-full divide-y divide-gray-200 border border-gray-200 rounded overflow-hidden shadow-lg";

      // Entête
      const thead = document.createElement("thead");
      thead.className = "bg-blue-700";
      thead.innerHTML = `
        <tr>
          <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">Ville</th>
          <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">Région</th>
          <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">Description</th>
          <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">Attractions</th>
        </tr>
      `;
      table.appendChild(thead);

      // Corps
      const tbody = document.createElement("tbody");
      tbody.className = "bg-white divide-y divide-gray-200";

      Array.from(destinations).forEach((dest) => {
        const ville = dest.getElementsByTagName("ville")[0].textContent;
        const region = dest.getElementsByTagName("region")[0].textContent;
        const description =
          dest.getElementsByTagName("description")[0].textContent;
        const attractions =
          dest.getElementsByTagName("attractions")[0].textContent;

        const tr = document.createElement("tr");
        tr.innerHTML = `
          <td class="px-6 py-4 whitespace-nowrap text-gray-900">${ville}</td>
          <td class="px-6 py-4 whitespace-nowrap text-gray-900">${region}</td>
          <td class="px-6 py-4 whitespace-nowrap text-gray-900">${description}</td>
          <td class="px-6 py-4 whitespace-nowrap text-gray-900">${attractions}</td>
        `;
        tbody.appendChild(tr);
      });

      table.appendChild(tbody);
      wrapper.appendChild(table);
      container.appendChild(wrapper);
    })
    .catch((err) => console.error("Erreur XML:", err));
}

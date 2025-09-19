console.log("Cart.js chargé - Yobalou Vacance");

// Fonction pour ajouter un séjour au panier
function addToCart(id, destination, prix) {
  let panier = JSON.parse(localStorage.getItem("panier")) || [];

  // Vérifie si le séjour est déjà dans le panier
  const existe = panier.find((item) => item.id === id);
  if (!existe) {
    panier.push({ id, destination, prix });
    localStorage.setItem("panier", JSON.stringify(panier));
    alert(`Séjour "${destination}" ajouté au panier (${prix} €)`);
  } else {
    alert(`Le séjour "${destination}" est déjà dans le panier.`);
  }

  afficherPanier();
}

// Fonction pour afficher le panier
function afficherPanier() {
  const panierContainer = document.getElementById("panier");
  if (!panierContainer) return;

  const panier = JSON.parse(localStorage.getItem("panier")) || [];

  panierContainer.innerHTML = ""; // Vide le conteneur

  if (panier.length === 0) {
    panierContainer.innerHTML = "<p>Votre panier est vide.</p>";
    return;
  }

  let total = 0;

  panier.forEach((item, index) => {
    total += parseFloat(item.prix);

    const card = document.createElement("div");
    card.className =
      "border rounded shadow p-4 bg-white flex justify-between items-center";

    card.innerHTML = `
      <div>
        <h3 class="font-bold text-lg">${item.destination}</h3>
        <p class="text-gray-700">Prix: <span class="text-blue-600 font-bold">${item.prix} €</span></p>
      </div>
      <button onclick="supprimerDuPanier(${index})" class="bg-red-600 text-white px-3 py-1 rounded hover:bg-red-500 transition">
        Supprimer
      </button>
    `;

    panierContainer.appendChild(card);
  });

  // Ajouter le total
  const totalDiv = document.createElement("div");
  totalDiv.className = "mt-4 text-right font-bold text-lg";
  totalDiv.innerHTML = `Total: <span class="text-blue-600">${total} €</span>`;
  panierContainer.appendChild(totalDiv);

  // Ajouter un bouton "Valider"
  const validerBtn = document.createElement("button");
  validerBtn.className =
    "mt-4 bg-blue-700 text-white px-6 py-2 rounded hover:bg-white hover:text-blue-700 transition";
  validerBtn.textContent = "Valider la réservation";
  validerBtn.onclick = () => {
    alert("Merci pour votre réservation !");
    localStorage.removeItem("panier");
    afficherPanier();
  };
  panierContainer.appendChild(validerBtn);
}

// Fonction pour supprimer un séjour du panier
function supprimerDuPanier(index) {
  let panier = JSON.parse(localStorage.getItem("panier")) || [];
  panier.splice(index, 1);
  localStorage.setItem("panier", JSON.stringify(panier));
  afficherPanier();
}

// Charger le panier au démarrage
document.addEventListener("DOMContentLoaded", afficherPanier);

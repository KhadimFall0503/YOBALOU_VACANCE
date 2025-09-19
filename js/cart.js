let cart = JSON.parse(localStorage.getItem("cart")) || [];

function addToCart(sejourId, sejourName, price) {
  cart.push({ id: sejourId, name: sejourName, prix: price });
  localStorage.setItem("cart", JSON.stringify(cart));
  alert(sejourName + " ajouté au panier !");
}

function afficherPanier() {
  let panierDiv = document.getElementById("panier");
  panierDiv.innerHTML = "";
  cart.forEach((item) => {
    panierDiv.innerHTML += (
      <p>
        ${item.name} - ${item.prix}€
      </p>
    );
  });
}

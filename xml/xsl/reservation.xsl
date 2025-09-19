<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <html lang="fr">
        <head>
            <meta charset="UTF-8"/>
            <title>Réservation - Yobalou Vacance</title>
            <script src="https://cdn.tailwindcss.com"></script>
            <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.10/dist/full.css" rel="stylesheet"/>
        </head>
        <body class="bg-gray-50 text-gray-800">

            <header class="bg-blue-600 p-2 shadow-md fixed w-full z-50">
      <div class="max-w-7xl mx-auto px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
          <!-- Logo -->
          <a href="#" class="flex items-center">
            <img
              src="=#"
              alt="Logo"
              class="h-8 w-auto mr-2"
            />
            <span class="font-bold text-lg text-white">YOBALOU-VACANCE</span>
          </a>

          <!-- Menu Desktop -->
          <nav class="hidden lg:flex space-x-8">
             <a
              href="/xml/sejours.xml"
              class="text-white hover:text-indigo-600 font-semibold"
              >Acceuil</a
            >
            <a
              href="#"
              class="text-white hover:text-indigo-600 font-semibold"
              >A propos</a
            >
            <a
              href="#"
              class="text-white hover:text-indigo-600 font-semibold"
              >Sejours</a
            >
             <a
              href="/xml/destinations.xml"
              class="text-white hover:text-indigo-600 font-semibold"
              >Destinations</a
            >
            
            <a
              href="#"
              class="text-white hover:text-indigo-600 font-semibold"
              >Panier</a
            >
             
            
          </nav>

          <!-- Actions -->
          <div class="hidden lg:flex items-center space-x-4">
            
           <a href="#"
   class="btn bg-gradient-to-r from-blue-500 to-indigo-600 text-white font-semibold rounded-lg px-4 py-2 shadow-lg hover:scale-105 transform transition duration-300">
   Contactez-Nous
</a>

          </div>

          <!-- Menu Mobile Button -->
          <div class="lg:hidden">
            <button
              id="mobile-menu-button"
              class="text-gray-700 hover:text-indigo-600 focus:outline-none"
            >
              <svg
                class="h-6 w-6"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                viewBox="0 0 24 24"
                stroke-linecap="round"
                stroke-linejoin="round"
              >
                <path d="M4 6h16M4 12h16M4 18h16" />
              </svg>
            </button>
          </div>
        </div>
      </div>

      <!-- Menu Mobile -->
      <div id="mobile-menu" class="hidden lg:hidden bg-white shadow-md">
        <nav class="px-6 py-4 space-y-2">
          <a
            href="#"
            class="block text-gray-700 font-semibold hover:text-indigo-600"
            >Produits</a
          >
          <a
            href="#"
            class="block text-gray-700 font-semibold hover:text-indigo-600"
            >Fonctionnalités</a
          >
          <a
            href="#"
            class="block text-gray-700 font-semibold hover:text-indigo-600"
            >Marketplace</a
          >
          <a
            href="#"
            class="block text-gray-700 font-semibold hover:text-indigo-600"
            >Entreprise</a
          >
          <hr class="my-2" />
          <a
            href="#"
            class="block text-gray-700 font-semibold hover:text-indigo-600"
            >Connexion</a
          >
          <a href="#" class="block btn btn-primary w-full mt-2">S'inscrire</a>
        </nav>
      </div>
    </header>
    <div class="relative isolate overflow-hidden bg-gray-900 h-96 sm:h-[500px]">
  <img src="../../assets/images/destination.jpg" alt="" class="absolute inset-0 -z-10 w-full h-full object-cover object-center" />

  <!-- Overlay semi-transparent -->
  <div class="absolute inset-0 -z-5 bg-black opacity-50"></div>

  <!-- Texte centré verticalement et horizontalement -->
  <div class="absolute inset-0 flex flex-col items-center justify-center text-center z-10 px-6">
    <h2 class="text-5xl font-bold tracking-tight text-white sm:text-7xl">Résérvation</h2>
    
  </div>
</div>

            <main class="p-8 max-w-3xl mx-auto bg-white shadow-md rounded-lg mt-5">
                <form class="flex flex-col gap-4 p-6" method="post" action="/reserver">

                    <!-- Sélection de l'utilisateur -->
                    <label class="text-gray-700 font-medium">Utilisateur</label>
                    <select name="user_id" class="select select-bordered w-full">
                        <xsl:for-each select="utilisateurs/utilisateur">
                            <option value="{id}">
                                <xsl:value-of select="prenom"/> <xsl:value-of select="nom"/> - <xsl:value-of select="email"/>
                            </option>
                        </xsl:for-each>
                    </select>

                    <!-- Sélection de la destination -->
                    <label class="text-gray-700 font-medium">Destination</label>
                    <select name="destination" class="select select-bordered w-full">
                        <option value="Dakar">Dakar</option>
                        <option value="Saly">Saly</option>
                        <option value="Saint-Louis">Saint-Louis</option>
                        <option value="Cap Skirring">Cap Skirring</option>
                        <option value="Île de Gorée">Île de Gorée</option>
                    </select>

                    <!-- Nombre de personnes -->
                    <label class="text-gray-700 font-medium">Nombre de personnes</label>
                    <input type="number" name="personnes" min="1" value="1" class="input input-bordered w-full"/>

                    <!-- Date de réservation -->
                    <label class="text-gray-700 font-medium">Date de réservation</label>
                    <input type="date" name="date" class="input input-bordered w-full"/>

                    <!-- Bouton de soumission -->
                    <button type="submit" class="btn btn-primary mt-4">Réserver</button>

                </form>
            </main>

            <footer class="p-6 bg-gray-800 text-white text-center mt-6">
                <p>© 2025 Yobalou Vacance - Tous droits réservés</p>
            </footer>

        </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

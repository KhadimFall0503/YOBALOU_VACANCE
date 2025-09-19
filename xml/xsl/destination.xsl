<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes" encoding="UTF-8" />

    <xsl:template match="/">

        <html lang="fr">
        <head>
            <meta charset="UTF-8"/>
            <title>Destinations - Yobalou Vacance</title>
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
              href="/xml/sejours.xml"
              class="text-white hover:text-indigo-600 font-semibold"
              >Sejours</a
            >
             <a
              href="#"
              class="text-white hover:text-indigo-600 font-semibold"
              >Destinations</a
            >
            
            <a
              href="/xml/utilisateurs.xml"
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
    <h2 class="text-5xl font-bold tracking-tight text-white sm:text-7xl">Déstinations</h2>
    
  </div>
</div>




    
            <!-- Grid avec items-stretch pour hauteur uniforme -->
<!-- Section principale avec texte introductif et grille des destinations -->
<main class="px-6 py-12 max-w-7xl mx-auto">

    <!-- Texte introductif centré -->
    <div class="max-w-4xl mx-auto mb-12 text-center">
        <h2 class="text-3xl font-semibold text-blue-600 mb-4">Découvrez nos destinations</h2>
        <p class="text-gray-600 text-lg leading-relaxed">
            Explorez les plus belles régions du Sénégal. Que vous soyez attiré par les plages paradisiaques, 
            la culture riche ou les villes dynamiques, Yobalou Vacance vous propose une sélection de destinations 
            pour rendre votre séjour inoubliable.
        </p>
        <p class="text-gray-600 text-lg leading-relaxed mt-2">
            Parcourez nos destinations ci-dessous et planifiez votre prochaine aventure avec nous !
        </p>
    </div>

    <!-- Grille des destinations -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 items-stretch">
        <xsl:for-each select="destinations/destination">
            <div class="bg-white shadow-md rounded-lg overflow-hidden hover:shadow-lg transition flex flex-col h-full">
                <img src="{image}" alt="{ville}" class="w-full h-48 object-cover"/>
                <div class="p-4 flex-1 flex flex-col">
                    <h2 class="text-xl font-semibold text-blue-600">
                        <xsl:value-of select="ville"/>
                    </h2>
                    <p class="text-sm italic text-gray-500">
                        Région : <xsl:value-of select="region"/>
                    </p>
                    <p class="mt-2 text-gray-700 flex-1">
                        <xsl:value-of select="description"/>
                    </p>
                    <ul class="mt-3 list-disc list-inside text-gray-600">
                        <xsl:for-each select="attractions/attraction">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>
                </div>
            </div>
        </xsl:for-each>
    </div>

</main>


            <footer class="p-6 bg-gray-800 text-white text-center">
                <p>© 2025 Yobalou Vacance - Tous droits réservés</p>
            </footer>

        </body>
        </html>

    </xsl:template>
</xsl:stylesheet>

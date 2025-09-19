<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <!-- Charger les activités externes -->
    <xsl:variable name="activites" select="document('../activites.xml')/activites"/>

    <html lang="fr">
      <head>
        <meta charset="UTF-8"/>
        <title>Yobalou Vacance - Accueil</title>
        <!-- Tailwind + DaisyUI -->
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.10/dist/full.css" rel="stylesheet"/>
      </head>
      <body class="bg-base-100 font-sans">

        <!-- Navbar -->
        <header class="bg-blue-600 p-2 shadow-md  w-full z-50">
          <div class="max-w-7xl mx-auto px-6 lg:px-8">
            <div class="flex justify-between items-center h-16">
              <a href="#" class="flex items-center">
                <img src="=#" alt="Logo" class="h-8 w-auto mr-2"/>
                <span class="font-bold text-lg text-white">YOBALOU-VACANCE</span>
              </a>

              <nav class="hidden lg:flex space-x-8">
                <a href="#" class="text-white hover:text-indigo-600 font-semibold">Accueil</a>
                <a href="/xml/sejours.xml" class="text-white hover:text-indigo-600 font-semibold">A propos</a>
                <a href="#" class="text-white hover:text-indigo-600 font-semibold">Séjours</a>
                <a href="/xml/destinations.xml" class="text-white hover:text-indigo-600 font-semibold">Destinations</a>
                <a href="/xml/utilisateurs.xml" class="text-white hover:text-indigo-600 font-semibold">Panier</a>
              </nav>

              <div class="hidden lg:flex items-center space-x-4">
                <a href="#" class="btn bg-gradient-to-r from-blue-500 to-indigo-600 text-white font-semibold rounded-lg px-4 py-2 shadow-lg hover:scale-105 transform transition duration-300">
                  Contactez-Nous
                </a>
              </div>

              <div class="lg:hidden">
                <button id="mobile-menu-button" class="text-gray-700 hover:text-indigo-600 focus:outline-none">
                  <svg class="h-6 w-6" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M4 6h16M4 12h16M4 18h16"/>
                  </svg>
                </button>
              </div>
            </div>
          </div>

          <!-- Menu mobile -->
          <div id="mobile-menu" class="hidden lg:hidden bg-white shadow-md">
            <nav class="px-6 py-4 space-y-2">
              <a href="#" class="block text-gray-700 font-semibold hover:text-indigo-600">Produits</a>
              <a href="#" class="block text-gray-700 font-semibold hover:text-indigo-600">Fonctionnalités</a>
              <a href="#" class="block text-gray-700 font-semibold hover:text-indigo-600">Marketplace</a>
              <a href="#" class="block text-gray-700 font-semibold hover:text-indigo-600">Entreprise</a>
              <hr class="my-2"/>
              <a href="#" class="block text-gray-700 font-semibold hover:text-indigo-600">Connexion</a>
              <a href="#" class="block btn btn-primary w-full mt-2">S'inscrire</a>
            </nav>
          </div>
        </header>

        <!-- Hero -->
        <div class="relative isolate overflow-hidden bg-gray-900 h-96 sm:h-[500px]">
          <img src="../../assets/images/destination.jpg" alt="" class="absolute inset-0 -z-10 w-full h-full object-cover object-center"/>
          <div class="absolute inset-0 -z-5 bg-black opacity-50"></div>
          <div class="absolute inset-0 flex flex-col items-center justify-center text-center z-10 px-6">
            <h2 class="text-5xl font-bold tracking-tight text-white sm:text-7xl">Yobalou Vacance</h2>
          </div>
        </div>

        <!-- Séjours populaires -->
        <main id="sejours" class="p-6 max-w-7xl mx-auto mt-10">
          <div class="text-center max-w-3xl mx-auto mb-12">
            <h2 class="text-3xl font-semibold text-blue-600 mb-4">Séjours Populaires</h2>
            <p class="text-gray-600 text-lg leading-relaxed">
              Découvrez nos séjours les plus prisés à travers le Sénégal. Que vous soyez attiré par la plage, 
              la culture ou les excursions nature, Yobalou Vacance vous propose des expériences uniques 
              pour rendre vos vacances mémorables.
            </p>
          </div>

           <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 items-stretch">
  <xsl:for-each select="sejours/sejour">
    <div class="bg-white shadow-md rounded-lg overflow-hidden hover:shadow-lg transition flex flex-col h-full">
      <img src="{image}" alt="{destination}" class="w-full h-48 object-cover"/>
      <div class="p-4 flex-1 flex flex-col">
        <h2 class="text-xl font-semibold text-blue-600 mb-1">
          <xsl:value-of select="destination"/>
        </h2>
        <p class="text-gray-700 text-sm mb-1"><strong>Durée :</strong> <xsl:value-of select="duree"/> jours</p>
        <p class="text-gray-700 text-sm mb-1"><strong>Prix :</strong> $<xsl:value-of select="prix"/></p>
        <p class="mt-2 text-gray-700 flex-1"><strong>Forfait :</strong> <xsl:value-of select="forfait/description"/></p>
        <ul class="mt-3 list-disc list-inside text-gray-600">
          <xsl:for-each select="activites/activite">
            <li><xsl:value-of select="nom"/></li>
          </xsl:for-each>
        </ul>
        <div class="mt-3 card-actions justify-end">
          <button class="btn btn-primary btn-xs">Réserver</button>
        </div>
      </div>
    </div>
  </xsl:for-each>
</div>


          <!-- Activités populaires -->
         <!-- Activités populaires en tableau -->
<div class="text-center max-w-3xl mx-auto mt-16 mb-6">
  <h2 class="text-3xl font-semibold text-blue-600 mb-4">Activités Populaires</h2>
  <p class="text-gray-600 text-lg leading-relaxed">
    Profitez d'activités uniques pour enrichir votre séjour au Sénégal. Excursions, visites culturelles et soirées traditionnelles vous attendent.
  </p>
</div>

<div class="overflow-x-auto rounded-box border border-base-content/5 bg-base-100 max-w-7xl mx-auto">
  <table class="table w-full text-base"> <!-- texte normal -->
    <!-- head -->
    <thead class="text-base"> <!-- texte entête normal -->
      <tr>
        <th>#</th>
        <th>Nom</th>
        <th>Prix Supplémentaire ($)</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody class="text-base"> <!-- texte lignes normal -->
      <xsl:for-each select="$activites/activite">
        <tr>
          <th><xsl:value-of select="id"/></th>
          <td><xsl:value-of select="nom"/></td>
          <td><xsl:value-of select="prix_supplem"/></td>
          <td><xsl:value-of select="description"/></td>
        </tr>
      </xsl:for-each>
    </tbody>
  </table>
</div>


          
        </main>

        <!-- Footer -->
        <footer class="footer sm:footer-horizontal bg-neutral text-neutral-content p-10 mt-16">
          <aside>
            <svg width="50" height="50" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd" class="fill-current">
              <path d="M22.672 15.226l-2.432.811.841 2.515c.33 1.019-.209 2.127-1.23 2.456-1.15.325-2.148-.321-2.463-1.226l-.84-2.518-5.013 1.677.84 2.517c.391 1.203-.434 2.542-1.831 2.542-.88 0-1.601-.564-1.86-1.314l-.842-2.516-2.431.809c-1.135.328-2.145-.317-2.463-1.229-.329-1.018.211-2.127 1.231-2.456l2.432-.809-1.621-4.823-2.432.808c-1.355.384-2.558-.59-2.558-1.839 0-.817.509-1.582 1.327-1.846l2.433-.809-.842-2.515c-.33-1.02.211-2.129 1.232-2.458 1.02-.329 2.13.209 2.461 1.229l.842 2.515 5.011-1.677-.839-2.517c-.403-1.238.484-2.553 1.843-2.553.819 0 1.585.509 1.85 1.326l.841 2.517 2.431-.81c1.02-.33 2.131.211 2.461 1.229.332 1.018-.21 2.126-1.23 2.456l-2.433.809 1.622 4.823 2.433-.809c1.242-.401 2.557.484 2.557 1.838 0 .819-.51 1.583-1.328 1.847m-8.992-6.428l-5.01 1.675 1.619 4.828 5.011-1.674-1.62-4.829z"></path>
            </svg>
            <p>
              ACME Industries Ltd.<br/>
              Providing reliable tech since 1992
            </p>
          </aside>
          <nav>
            <h6 class="footer-title">Social</h6>
            <div class="grid grid-flow-col gap-4">
              <a>Facebook</a>
              <a>YouTube</a>
              <a>LinkedIn</a>
            </div>
          </nav>
        </footer>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>

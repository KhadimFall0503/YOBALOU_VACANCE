<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">

        <html lang="fr">
        <head>
            <meta charset="UTF-8"/>
            <title>Séjours - Yobalou Vacance</title>
            <script src="https://cdn.tailwindcss.com"></script>
            <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.10/dist/full.css" rel="stylesheet"/>
        </head>
        <body class="bg-gray-50 text-gray-800">

            <!-- Header -->
            <header class="bg-blue-600 p-2 shadow-md fixed w-full z-50">
                <div class="max-w-7xl mx-auto px-6 lg:px-8 flex justify-between items-center h-16">
                    <a href="#" class="flex items-center">
                        <img src="=#" alt="Logo" class="h-8 w-auto mr-2"/>
                        <span class="font-bold text-lg text-white">YOBALOU-VACANCE</span>
                    </a>
                    <nav class="hidden lg:flex space-x-8">
                        <a href="/xml/sejours.xml" class="text-white hover:text-indigo-600 font-semibold">Accueil</a>
                        <a href="#" class="text-white hover:text-indigo-600 font-semibold">A propos</a>
                        <a href="#" class="text-white hover:text-indigo-600 font-semibold">Séjours</a>
                        <a href="/xml/destinations.xml" class="text-white hover:text-indigo-600 font-semibold">Destinations</a>
                        <a href="/xml/utilisateurs.xml" class="text-white hover:text-indigo-600 font-semibold">Panier</a>
                    </nav>
                </div>
            </header>

            <!-- Hero -->
            <div class="relative isolate overflow-hidden bg-gray-900 h-96 sm:h-[500px] mt-16">
                <img src="../../assets/images/sejours.jpg" alt="" class="absolute inset-0 -z-10 w-full h-full object-cover object-center"/>
                <div class="absolute inset-0 -z-5 bg-black opacity-50"></div>
                <div class="absolute inset-0 flex flex-col items-center justify-center text-center z-10 px-6">
                    <h2 class="text-5xl font-bold tracking-tight text-white sm:text-7xl">Nos Séjours</h2>
                </div>
            </div>

            <!-- Liste des séjours -->
            <main class="px-6 py-12 max-w-7xl mx-auto">

                <div class="text-center max-w-3xl mx-auto mb-12">
                    <h2 class="text-3xl font-semibold text-blue-600 mb-4">Découvrez nos séjours</h2>
                    <p class="text-gray-600 text-lg leading-relaxed">
                        Explorez nos séjours les plus populaires et planifiez votre aventure au Sénégal.
                    </p>
                </div>

                <!-- Grille des séjours -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 items-stretch">
                    <xsl:for-each select="document('/prenom+nom/sejours.xml')/sejours/sejour">
                        <div class="card bg-base-100 shadow-md hover:shadow-lg rounded-lg overflow-hidden flex flex-col h-full">
                            <figure class="h-48 overflow-hidden">
                                <img class="w-full h-full object-cover" src="{image}" alt="{destination}"/>
                            </figure>
                            <div class="card-body p-5 flex-1 flex flex-col">
                                <h2 class="card-title text-xl mb-2"><xsl:value-of select="destination"/></h2>
                                <p class="text-gray-700 text-sm mb-1"><strong>Durée :</strong> <xsl:value-of select="duree"/> jours</p>
                                <p class="text-gray-700 text-sm mb-1"><strong>Prix :</strong> $<xsl:value-of select="prix"/></p>
                                <p class="text-gray-700 text-sm mb-3"><strong>Forfait :</strong> <xsl:value-of select="forfait/description"/></p>
                                <div class="mt-auto card-actions justify-end">
                                    <button class="btn btn-primary btn-sm">Réserver</button>
                                </div>
                            </div>
                        </div>
                    </xsl:for-each>
                </div>

            </main>

            <footer class="p-6 bg-gray-800 text-white text-center mt-12">
                <p>© 2025 Yobalou Vacance - Tous droits réservés</p>
            </footer>
        
        </body>
        </html>

    </xsl:template>
</xsl:stylesheet>

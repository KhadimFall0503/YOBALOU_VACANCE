<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <xsl:for-each select="sejours/sejour[populaire='true']">
      <div class="card border p-4 rounded shadow">
        <img src="{image}" alt="{destination}" class="w-full h-48 object-cover rounded"/>
        <h3 class="text-lg font-bold mt-2"><xsl:value-of select="destination"/></h3>
        <p class="text-gray-700"><xsl:value-of select="description"/></p>
        <p><b>Durée :</b> <xsl:value-of select="duree"/> jours</p>
        <p><b>Prix :</b> <span class="text-blue-600 font-bold"><xsl:value-of select="prix"/> €</span></p>
        <button onclick="addToCart('{id}','{destination}','{prix}')"
                class="bg-green-600 hover:bg-green-500 text-white px-3 py-1 rounded mt-2">
          Réserver
        </button>
      </div>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/">
    <h2 class="text-xl font-bold mb-4">Récapitulatif de votre réservation</h2>
    <ul class="space-y-2">
      <xsl:for-each select="sejours/sejour[disponibilite='oui']">
        <li class="border p-2 rounded">
          <xsl:value-of select="destination"/> - 
          <xsl:value-of select="duree"/> jours - 
          <xsl:value-of select="prix"/> €
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
</xsl:stylesheet>
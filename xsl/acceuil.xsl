<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/">
    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
      <xsl:for-each select="sejours/sejour[position() &lt;= 3]">
        <div class="card border p-4 rounded shadow">
          <img src="{image}" alt="{destination}" class="w-full h-48 object-cover"/>
          <h3 class="text-lg font-bold mt-2"><xsl:value-of select="destination"/></h3>
          <p><xsl:value-of select="description"/></p>
          <p class="text-blue-600 font-bold"><xsl:value-of select="prix"/> €</p>
        </div>
      </xsl:for-each>
    </div>
  </xsl:template>
</xsl:stylesheet>
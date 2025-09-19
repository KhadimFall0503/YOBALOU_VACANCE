<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/">
    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
      <xsl:for-each select="destinations/destination">
        <div class="border p-4 rounded shadow">
          <h3 class="text-lg font-bold text-blue-700"><xsl:value-of select="ville"/></h3>
          <p><b>Région :</b> <xsl:value-of select="region"/></p>
          <p><xsl:value-of select="description"/></p>
          <p><b>Attractions :</b> <xsl:value-of select="attractions"/></p>
        </div>
      </xsl:for-each>
    </div>
  </xsl:template>
</xsl:stylesheet>
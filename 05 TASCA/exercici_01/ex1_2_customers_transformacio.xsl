<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/DATA">
    <customers_millorat>
      <xsl:for-each select="ROW">
        <customer customerNumber="{customerNumber}">
          <name><xsl:value-of select="customerName"/></name>
          
          <contact>
            <firstName><xsl:value-of select="contactFirstName"/></firstName>
            <lastName><xsl:value-of select="contactLastName"/></lastName>
            <phone><xsl:value-of select="phone"/></phone>
          </contact>
          
          <address> 
            <addressLine1><xsl:value-of select="addressLine1"/></addressLine1>
            <addressLine2><xsl:value-of select="addressLine2"/></addressLine2>
            <city><xsl:value-of select="city"/></city>
            <state><xsl:value-of select="state"/></state>
            <postalCode><xsl:value-of select="postalCode"/></postalCode>
            <country><xsl:value-of select="country"/></country>
          </address>
          
          <stats>
            <creditLimit><xsl:value-of select="creditLimit"/></creditLimit>
            <salesRep><xsl:value-of select="salesRepEmployeeNumber"/></salesRep>
          </stats>
          
        </customer>
      </xsl:for-each>
    </customers_millorat>
  </xsl:template>
</xsl:stylesheet>
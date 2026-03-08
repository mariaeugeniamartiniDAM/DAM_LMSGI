<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/DATA">
    <payments_millorat>
      <xsl:for-each select="ROW">
        <check number="{checkNumber}">
        
          <paymentDate><xsl:value-of select="paymentDate"/></paymentDate>
          <amount><xsl:value-of select="amount"/></amount>
          
          <customer customerNumber="{customerNumber}">
            <customerName><xsl:value-of select="customerName"/></customerName>
            <contactFirstName><xsl:value-of select="contactFirstName"/></contactFirstName>
            <contactLastName><xsl:value-of select="contactLastName"/></contactLastName>
            <salesRepEmployeeNumber><xsl:value-of select="salesRepEmployeeNumber"/></salesRepEmployeeNumber>
            <creditLimit><xsl:value-of select="creditLimit"/></creditLimit>
            
            <address>
               <city><xsl:value-of select="city"/></city>
               <country><xsl:value-of select="country"/></country>
               <addressLine1><xsl:value-of select="addressLine1"/></addressLine1>
            </address>
          </customer>
        </check>
      </xsl:for-each>
    </payments_millorat>
  </xsl:template>
</xsl:stylesheet>

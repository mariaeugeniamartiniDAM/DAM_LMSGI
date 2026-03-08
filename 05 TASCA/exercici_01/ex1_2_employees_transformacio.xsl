<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="'xml" indent="yes"/>
  
  <xsl:template match="/DATA">
    <employees_millorat>
      <xsl:apply-templates select = "ROW"/>
    </employees_millorat>
  </xsl:template>
  <xsl:template match="ROW">
    <employee id="{employeeNumber}">
      <personal_data>
        <firstname><xsl:value-of select="firstName"/></firstname>
        <lastname><xsl:value-of select="lastName"/></lastname>
        <email><xsl:value-of select="email"/></email>
        <extension><xsl:value-of select="extension"/></extension>
      </personal_data>
      
      <job_info>
        <title><xsl:value-of select="jobTitle"/></title>
        <boss><xsl:value-of select="reportsTo"/></boss>
      </job_info>

      <office>
        <code_of><xsl:value-of select="ofCode"/></code_of>
        <city><xsl:value-of select="ofCity"/></city>
        <phone><xsl:value-of select="ofphone"/></phone>
        <address1><xsl:value-of select="ofAdd1"/></address1>
        <address2><xsl:value-of select="ofAdd2"/></address2>
        <state><xsl:value-of select="ofState"/></state>
        <country><xsl:value-of select="ofCountry"/></country>
        <postalCode><xsl:value-of select="ofPostalCode"/></postalCode>
        <territory><xsl:value-of select="ofTerritory"/></territory>
        <full_address>
          <xsl:value-of select="ofAdd1"/>, <xsl:value-of select="ofAdd2"/>
        </full_address>
      </office>
    </employee>
  </xsl:template>
</xsl:stylesheet>

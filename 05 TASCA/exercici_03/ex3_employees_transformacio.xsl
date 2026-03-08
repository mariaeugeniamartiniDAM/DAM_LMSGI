<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Exercici 3 - Llista d'Empleats</title>
      </head>
      <body>
        <h2>Llista d'empleats</h2>
        <ul>
          <xsl:for-each select="employees_millorat/employee">
            <xsl:sort select="personal_data/firstname" order="ascending"/>
            
            <li>
              <h3 style="color: blue; font-size: 24px;">
                Empleat amb id <xsl:value-of select="@id"/>
              </h3>
              
              <ul>
                <li style="font-size: 18px;">
                  <strong>Nom: </strong> 
                  <xsl:value-of select="concat(personal_data/firstname, ' ', personal_data/lastname)"/>
                </li>
                <li><strong>Correu: </strong> <xsl:value-of select="personal_data/email"/></li>
                <li><strong>Id del seu superior: </strong> <xsl:value-of select="job_info/boss"/></li>
                <li><strong>Posició: </strong> <xsl:value-of select="job_info/title"/></li>
                
                <li>
                  <strong>Oficina amb codi: </strong><xsl:value-of select="office/code_of"/>
                  
                  <ul style="color: red; font-style: italic; margin-top: 5px;">
                    <li><strong>Ciutat: </strong> <xsl:value-of select="office/city"/></li>
                    <li><strong>Telèfon: </strong> <xsl:value-of select="office/phone"/></li>
                    <li><strong>Adreça: </strong> <xsl:value-of select="office/full_address"/></li>
                    <li><strong>País: </strong> <xsl:value-of select="office/country"/></li>
                  </ul>
                </li>
              </ul>
              <br/>
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

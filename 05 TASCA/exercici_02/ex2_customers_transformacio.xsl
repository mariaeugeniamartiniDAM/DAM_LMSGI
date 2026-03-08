<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"  indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Llistat de Clients</title>
        <style>
          table { border: 1px solid black; border-collapse: collapse; width: 100%; }
          th, td { border: 1px solid black; padding: 5px; text-align: left; }
          th { background-color: #eeeeee; }
        </style>
      </head>
      
      <body>
        <h2>Customer Details</h2>
        <table>
          <tr>
            <th>Customer Number</th>
            <th>Customer Name</th>
            <th>Phone</th>
            <th>Contact First Name</th>
            <th>Contact Last Name</th>
            <th>Address Line 1</th>
            <th>Address Line 2</th>
            <th>City</th>
            <th>State</th>
            <th>Postal Code</th>
            <th>Country</th>
            <th>Sales Rep Employee Number</th>
            <th>Credit Limit</th>
            
          </tr>
          
          <xsl:for-each select="customers_millorat/customer">
            <tr>
              <td><xsl:value-of select="@customerNumber"/></td>
              <td><xsl:value-of select="name"/></td>
              <td><xsl:value-of select="contact/phone"/></td>
              <td><xsl:value-of select="contact/firstName"/></td>
              <td><xsl:value-of select="contact/lastName"/></td>
              <td><xsl:value-of select="address/addressLine1"/></td>
              <td><xsl:value-of select="address/addressLine2"/></td>
              <td><xsl:value-of select="address/city"/></td>
              <td><xsl:value-of select="address/state"/></td>
              <td><xsl:value-of select="address/postalCode"/></td>
              <td><xsl:value-of select="address/country"/></td>
              <td><xsl:value-of select="stats/salesRep"/> €</td>
              <td><xsl:value-of select="stats/creditLimit"/> €</td>
            </tr>
          </xsl:for-each>
          
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

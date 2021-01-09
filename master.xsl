<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 


<xsl:template match="/">
    <html>
    <head> 
    <title>Otrzymane wyniki</title> 
    </head>
    <body bgcolor="#ffffff">
        <h2>Otrzymane wyniki:</h2>
        <table border="1">
        <tr bgcolor="#9acd32">
        <th>App name</th>
        <th>Rating</th>
        <th>Reviews</th>
        <th>Size</th>
        <th>Installs</th>
        <th>Type</th>
        <th>Content Rating</th>
        <th>Price</th>
        <th>Genres</th>
        <th>Last updated</th>
        <th>Version</th>
        </tr>
        <tr>
         <td><xsl:value-of select="file/appStore/app/appName"/></td>
         <td><xsl:value-of select="file/appStore/app/rating"/></td>
         <td><xsl:value-of select="file/appStore/app/reviews"/></td>
         <td><xsl:value-of select="file/appStore/app/size"/></td>
         <td><xsl:value-of select="file/appStore/app/installs"/></td>
         <td><xsl:value-of select="file/appStore/app/type"/></td>
         <td><xsl:value-of select="file/appStore/app/contentRating"/></td>
         <td><xsl:value-of select="file/appStore/app/price"/></td>
         <td><xsl:value-of select="file/appStore/app/genres"/></td>
         <td><xsl:value-of select="file/appStore/app/lastUpdated"/></td>
         <td><xsl:value-of select="file/appStore/app/version/current"/></td>
         <td><xsl:value-of select="file/appStore/app/version/android"/></td>
        </tr>
         </table>
    </body>
    </html>
</xsl:template>
</xsl:stylesheet>
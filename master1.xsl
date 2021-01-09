<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
<xsl:template match="/">
    <html>
    <head> 
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
        <title>Projekt XML</title>
    </head>
    <body background-color="#ffffff">
     <div class="container-fluid p-3 my-3 bg-dark text-white">
        <h2>Otrzymane wyniki:</h2>
     </div> 
     <div class="container-fluid p-3 my-3">
        <table border="1">
        <tr bgcolor="lightgray" style="font-size:15px" align="center">
        <th>Nazwa aplikacji</th>
        <th>Kategoria:</th>
        <th>Ocena użytkowników</th>
        <th>Opinie użytkowników</th>
        <th>Rozmiar</th> 
        <th>Ilość instalacji</th>
        <th>Typ</th>
        <th>Target</th>
        <th>Cena</th>
        <th>Gatunek</th>
        <th>Ostatnia aktualizacja</th>
        <th colspan="2">Wersja <br />aktualna / Android</th>
        </tr>
        <tr style="font-size:13px" align="center">
         <td><xsl:value-of select="file/appStore/app/appName"/></td>
         <td><xsl:value-of select="file/appStore/app/@category"/></td>
         <td><xsl:value-of select="file/appStore/app/rating"/></td>
         <td><xsl:value-of select="file/appStore/app/appReviews"/></td>
         <td><xsl:value-of select="file/appStore/app/size"/></td>
         <td><xsl:value-of select="file/appStore/app/installs"/></td>
         <td><xsl:value-of select="file/appStore/app/typeOfApp"/></td>
         <td><xsl:value-of select="file/appStore/app/contentRating"/></td>
         <td><xsl:value-of select="file/appStore/app/price"/></td>
         <td><xsl:value-of select="file/appStore/app/genre"/></td>
         <td><xsl:value-of select="file/appStore/app/lastUpdated"/></td>
         <td><xsl:value-of select="file/appStore/app/version/current"/></td>
         <td><xsl:value-of select="file/appStore/app/version/android"/></td>
        </tr>
         </table>
         </div>
         <div class="container-fluid p-3 my-3">
         <h4>Ogólne statystyki</h4>
         <table border="1">
         <tr bgcolor="lightgray" style="font-size:15px" align="center">
         <th>Ilość aplikacji w bazie</th>
         <th>Najczęstsza kategoria</th>
         <th>Ilość kategorii</th>
         <th>Średnia ocena wszystkich aplikacji</th>
         </tr>
         <tr style="font-size:13px" align="center">
         <td><xsl:value-of select="file/appStore/statistics/type/general/testedApplications"/></td>
         <td><xsl:value-of select="file/appStore/statistics/type/general/categoryTop"/></td>
         <td><xsl:value-of select="file/appStore/statistics/type/general/categoryUnique"/></td>
         <td><xsl:value-of select="file/appStore/statistics/type/general/ratingGen"/></td>
         </tr>
         </table>
         </div>
         <div class="container-fluid p-3 my-3">
         <h4>Szczegółowe statystyki</h4>
         <table border="1">
         <tr bgcolor="lightgray" style="font-size:15px" align="center">
         <th>Najwięcej instalacji</th>
         <th>Najczęstszy typ</th>
         <th>Ilość typów</th>
         <th>Najczęstszy target</th>
         <th>Ilość różnych targetów</th>
         <th>Najczęstsza wersja na Androida</th>
         </tr>
         <tr style="font-size:13px" align="center">
         <td><xsl:value-of select="file/appStore/statistics/type/detailed/installsGen"/></td>
         <td><xsl:value-of select="file/appStore/statistics/type/detailed/typeTop"/></td>
         <td><xsl:value-of select="file/appStore/statistics/type/detailed/typeUnique"/></td>
         <td><xsl:value-of select="file/appStore/statistics/type/detailed/contentRatingTop"/></td>
         <td><xsl:value-of select="file/appStore/statistics/type/detailed/contentRatingUnique"/></td>
         <td><xsl:value-of select="file/appStore/statistics/type/detailed/androidVerGen"/></td>
         </tr>
         </table>
         </div>
    </body>
    </html>
</xsl:template>
</xsl:stylesheet>
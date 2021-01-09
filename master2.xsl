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
        <h4>Dane ogólne</h4>
        <th>Nazwa aplikacji</th>
        <th>Ilość recenzji</th>
        </tr>
        <tr style="font-size:13px" align="center">
         <td><xsl:value-of select="file/userReviews/reviewdApp/@name"/></td>
         <td><xsl:value-of select="file/userReviews/reviewdApp/allReviews"/></td>
        </tr>
         </table>
         </div>
         <div class="container-fluid p-3 my-3" >
         <h4>Dane odnośnie recenzji</h4>
         <table border="1">
         <tr bgcolor="lightgray" style="font-size:15px" align="center">
         <th>3 najnowsze recenzje</th>
         <th>3 najstarsze recenzje</th>
         </tr>
         <tr style="font-size:13px" align="center">
         <td><xsl:value-of select="file/userReviews/reviews/sort/newReview1"/></td>
         <td><xsl:value-of select="file/userReviews/reviews/sort/oldReview1"/></td>
         </tr>
         <tr style="font-size:13px" align="center">
        <td><xsl:value-of select="file/userReviews/reviews/sort/newReview2"/></td>
        <td><xsl:value-of select="file/userReviews/reviews/sort/oldReview2"/></td>
         </tr>
         <tr style="font-size:13px" align="center">
        <td><xsl:value-of select="file/userReviews/reviews/sort/newReview3"/></td>
        <td><xsl:value-of select="file/userReviews/reviews/sort/oldReview3"/></td>
         </tr>
         </table>
         </div>
    </body>
    </html>
</xsl:template>
</xsl:stylesheet>
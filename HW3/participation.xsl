<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h1><font face="Nina" style="font-weight: 500"><b><i>Participation Information</i></b></font></h1>
                <table border="3" bgcolor="green">
                    <tr>
                        <th><font face="Nina" style="font-weight: 500"><b><i>Student SSN</i></b></font></th>
                        <th><font face="Nina" style="font-weight: 500"><b><i>Conference Name</i></b></font></th>
                        <th><font face="Nina" style="font-weight: 500"><b><i>Conference Year</i></b></font></th>
                        <th><font face="Nina" style="font-weight: 500"><b><i>Registration Number</i></b></font></th>
                        <th><font face="Nina" style="font-weight: 500"><b><i>Registration Fee</i></b></font></th>
                    </tr>
                    
                    <xsl:for-each select="participationInfo/individualParticipation">
                    <tr>
                        <td><font face="Nina" style="font-weight: 500"><i><xsl:value-of select="studentSSN"/></i></font></td>
                        <td><font face="Nina" style="font-weight: 500"><i><xsl:value-of select="conferenceName"/></i></font></td>
                        <td><font face="Nina" style="font-weight: 500"><i><xsl:value-of select="conferenceYear"/></i></font></td>
                        <td><font face="Nina" style="font-weight: 500"><i><xsl:value-of select="registrationNo"/></i></font></td>
                        <td><font face="Nina" style="font-weight: 500"><i><xsl:value-of select="registrationFee"/>$</i></font></td>
                    </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
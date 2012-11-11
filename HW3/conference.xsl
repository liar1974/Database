<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h1><font face="Arial" style="font-weight: 400"><b>Conference Information</b></font></h1>
                <table border="1" bgcolor="orange">
                    <tr>
                        <th><font face="Arial" style="font-weight: 400"><b>Name</b></font></th>
                        <th><font face="Arial" style="font-weight: 400"><b>Year</b></font></th>
                        <th><font face="Arial" style="font-weight: 400"><b>Topic</b></font></th>
                        <th><font face="Arial" style="font-weight: 400"><b>Chair</b></font></th>
                        <th><font face="Arial" style="font-weight: 400"><b>Original city</b></font></th>
                        <th><font face="Arial" style="font-weight: 400"><b>Original Country</b></font></th>
                        <th><font face="Arial" style="font-weight: 400"><b>Hotel Chain Name</b></font></th>
                        <th><font face="Arial" style="font-weight: 400"><b>Hotel Branch Name</b></font></th>
                    </tr>
                    
                    <xsl:for-each select="conferences/conference">
                    <tr>
                        <td><font face="Arial" style="font-weight: 400"><xsl:value-of select="conference_name"/></font></td>
                        <td><font face="Arial" style="font-weight: 400"><xsl:value-of select="year"/></font></td>
                        <td><font face="Arial" style="font-weight: 400"><xsl:value-of select="topic"/></font></td>
                        <td><xsl:for-each select="chair_name">
				            <font face="Verdana" style="font-weight: 400">
				                <xsl:value-of select="."/>
						            <xsl:if test="position() != last()">,<br/></xsl:if>
						    </font>
				            </xsl:for-each>
				        </td>
                        <td><font face="Arial" style="font-weight: 400"><xsl:value-of select="original_city"/></font></td>
                        <td><font face="Arial" style="font-weight: 400"><xsl:value-of select="original_country"/></font></td>
                        <td><font face="Arial" style="font-weight: 400"><xsl:value-of select="hotel_chain_name"/></font></td>
                        <td><font face="Arial" style="font-weight: 400"><xsl:value-of select="hotel_branch_name"/></font></td>
                    </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
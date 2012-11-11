<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h1><font face="Times" style="font-weight: 600"><b>Hotel Information</b></font></h1>
                <table border="2" bgcolor="blue">
                    <tr>
                        <th><font face="Times" style="font-weight: 600"><b>Hotel Chain</b></font></th>
                        <th><font face="Times" style="font-weight: 600"><b>Hotel Branch Name</b></font></th>
                        <th><font face="Times" style="font-weight: 600"><b>Latitude</b></font></th>
                        <th><font face="Times" style="font-weight: 600"><b>Longitude</b></font></th>
                        <th><font face="Times" style="font-weight: 600"><b>Capacity</b></font></th>
                        <th><font face="Times" style="font-weight: 600"><b>Street No</b></font></th>
                        <th><font face="Times" style="font-weight: 600"><b>Street Name</b></font></th>
                        <th><font face="Times" style="font-weight: 600"><b>City</b></font></th>
                        <th><font face="Times" style="font-weight: 600"><b>State</b></font></th>
                        <th><font face="Times" style="font-weight: 600"><b>Zip</b></font></th>
                    </tr>
                    
                    <xsl:for-each select="hotels/hotel">
                    <tr>
                        <td><font face="Times" style="font-weight: 600"><xsl:value-of select="hotel_chain"/></font></td>
                        <td><font face="Times" style="font-weight: 600"><xsl:value-of select="hotel_branch_name"/></font></td>
                        <td><font face="Times" style="font-weight: 600"><xsl:value-of select="latitude"/></font></td>
                        <td><font face="Times" style="font-weight: 600"><xsl:value-of select="longitude"/></font></td>
                        <td><font face="Times" style="font-weight: 600"><xsl:value-of select="capacity"/></font></td>
                        <td><font face="Times" style="font-weight: 600"><xsl:value-of select="address/street_no"/></font></td>
                        <td><font face="Times" style="font-weight: 600"><xsl:value-of select="address/street_name"/></font></td>
                        <td><font face="Times" style="font-weight: 600"><xsl:value-of select="address/city"/></font></td>
                        <td><font face="Times" style="font-weight: 600"><xsl:value-of select="address/state"/></font></td>
                        <td><font face="Times" style="font-weight: 600"><xsl:value-of select="address/zip"/></font></td>
                    </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
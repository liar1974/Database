<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h1><font face="Verdana" style="font-weight: 400"><b>Student Information</b></font></h1>
                <table border="1" bgcolor="yellow">
                    <tr>
                        <th><font face="Verdana" style="font-weight: 400"><b>SSN</b></font></th>
                        <th><font face="Verdana" style="font-weight: 400"><b>First Name</b></font></th>
                        <th><font face="Verdana" style="font-weight: 400"><b>Last Name</b></font></th>
                        <th><font face="Verdana" style="font-weight: 400"><b>Age</b></font></th>
                        <th><font face="Verdana" style="font-weight: 400"><b>Institution Name</b></font></th>
                        <th><font face="Verdana" style="font-weight: 400"><b>Email</b></font></th>
                    </tr>
                    <xsl:for-each select="students/student">
                    <tr>
                        <td><font face="Verdana" style="font-weight: 400"><xsl:value-of select="SSN"/></font></td>
                        <td><font face="Verdana" style="font-weight: 400"><xsl:value-of select="student_name/first_name"/></font></td>
                        <td><font face="Verdana" style="font-weight: 400"><xsl:value-of select="student_name/last_name"/></font></td>
                        <td><font face="Verdana" style="font-weight: 400"><xsl:value-of select="age"/></font></td>
                        <td><font face="Verdana" style="font-weight: 400"><xsl:value-of select="institutionName"/></font></td>
                        <td><xsl:for-each select="email">
				            <font face="Verdana" style="font-weight: 400">
				                <xsl:value-of select="."/>
						            <xsl:if test="position() != last()"><br/></xsl:if>
						    </font>
				            </xsl:for-each>
				        </td>
                    </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
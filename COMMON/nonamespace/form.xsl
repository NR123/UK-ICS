<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:frm="http://www.lexis-nexis.com/glp/frm"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="clause | frm:body | form">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="clause/@* | frm:body/@* | form/@*">
        <xsl:copy/>
    </xsl:template>
</xsl:stylesheet>
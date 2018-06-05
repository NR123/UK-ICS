<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns:in="http://www.lexis-nexis.com/glp/in"
        version="2.0">
    
    <!-- DAYANAND SINGH: 23May2018-->
    
    <xsl:template match="in:lev1 | in:lev2 | in:lev3 | in:lev4 | in:lev5 | in:lev6">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    

    <xsl:template match="in:entry|in:entry-text|in:index-ref">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    

</xsl:stylesheet>

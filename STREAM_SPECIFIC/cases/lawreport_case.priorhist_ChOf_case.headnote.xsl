<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:case="http://www.lexis-nexis.com/glp/case"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="case:priorhist[ancestor::case:headnote]">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Arun: 02May2018 - Added below template to handle attributes of the element case:priorhist -->
    <xsl:template match="case:priorhist/@*">
        <xsl:copy/>
    </xsl:template>
</xsl:stylesheet>
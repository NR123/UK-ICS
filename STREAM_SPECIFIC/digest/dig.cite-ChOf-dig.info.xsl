<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dig="http://www.lexis-nexis.com/glp/dig"
    xmlns:ci="http://www.lexis-nexis.com/ci"
    exclude-result-prefixes="xs"
    version="2.0">
    
<!--    Dayanand singh 30 May 2018-->
    
    <xsl:template match="dig:cite">
        <xsl:element name="{name()}">
            <xsl:element name="ci:cite">
                <xsl:attribute name="type" select="'cite4thisdoc'"/>
                <xsl:element name="ci:content">
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    
        
        
</xsl:stylesheet>
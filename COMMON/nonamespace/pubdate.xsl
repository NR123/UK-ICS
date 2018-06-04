<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:glp="http://www.lexis-nexis.com/glp"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <!-- Dayanand singh 30 May 2018 -->
    
    <xsl:template match="pubdate">
        <xsl:element name="{name()}">
            <xsl:attribute name="display-name" select="@display-name"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
         
</xsl:stylesheet>

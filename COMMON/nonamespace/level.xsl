<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <!--   Dayanand singh 30 MAY 2018 -->
    <xsl:template match="level">
        <xsl:element name="level">
            <xsl:attribute name="leveltype" select="@leveltype"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
        
</xsl:stylesheet>

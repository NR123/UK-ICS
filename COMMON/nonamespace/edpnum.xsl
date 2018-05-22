<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="edpnum">
        <xsl:element name="{name()}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="edpnum[$selectorID=('commentary','commentaryleghist')]">
        <xsl:element name="{name()}">
            <xsl:attribute name="value" select="replace(translate(self::edpnum,'[]',''),'–','-')"/>
            <xsl:attribute name="inline" select="'false'"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
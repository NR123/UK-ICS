<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="sup">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sup[not(ancestor::fnbody)][$selectorID='cases']">
        <fnr fnrtoken='d121142e64' fntoken='d121142e90'>
            <xsl:apply-templates/>
        </fnr>
    </xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dig="http://www.lexis-nexis.com/glp/dig"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:template match="dig:body">
        
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
        
    </xsl:template>
    
</xsl:stylesheet>
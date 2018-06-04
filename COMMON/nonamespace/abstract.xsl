<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- DAYANAND SINGH: 30May2018-->

    <xsl:template match="abstract">
        <xsl:element name="abstract">
            <xsl:apply-templates select="node()|@*"/>
        </xsl:element>
    </xsl:template>
 
    
</xsl:stylesheet>

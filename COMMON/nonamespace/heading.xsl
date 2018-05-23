<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="heading">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Arun- 18May2018 Updated the below code to handle heading attributes for commentary -->
    <xsl:template match="heading/@*[$selectorID=('journal','commentary','commentaryleghist')]"/>
</xsl:stylesheet>
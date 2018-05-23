<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:leg="http://www.lexis-nexis.com/glp/leg"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="heading">
        <xsl:choose>
            <xsl:when test="ancestor::level/child::heading/@searchtype='LEGISLATION'[$selectorID=('precedents','treatises','commentaryleghist')]">
                <leg:heading xsl:exclude-result-prefixes="#all">
                    <xsl:apply-templates select="@* | node()"/>
                </leg:heading>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
    
    <!-- Arun- 18May2018 Updated the below code to handle heading attributes for commentary -->
    <xsl:template match="heading/@*[$selectorID=('journal','precedents','treatises','commentaryleghist')]"/>
</xsl:stylesheet>
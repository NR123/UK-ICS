<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:case="http://www.lexis-nexis.com/glp/case"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="case:appendix[parent::case:content]">
        <xsl:element name="{name()}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
<!--Dayanand singh 2018-04-30 -->    
    <xsl:template match="case:appendix">
        <xsl:element name="case:appendix">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
 </xsl:stylesheet>
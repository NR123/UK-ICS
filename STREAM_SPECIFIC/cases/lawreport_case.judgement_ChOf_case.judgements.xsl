<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:case="http://www.lexis-nexis.com/glp/case"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="case:judgment[parent::case:judgments] | case:judgmentbody[parent::case:judgment/parent::case:judgments]">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Dayanand singh 2018-05-01 ceated new element case:embeddedcase child element of case:judgmentbody-->
    <xsl:template match="case:embeddedcase">
        <xsl:element name="case:embeddedcase">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>
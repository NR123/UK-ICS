<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:glp="http://www.lexis-nexis.com/glp"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="case:content">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="glp:note[parent::case:content]">
        <xsl:choose>
            <xsl:when test="self::glp:note/following-sibling::*[1][name()='case:appendix']">
                <case:appendix>
                    <xsl:apply-templates/>
                </case:appendix>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>
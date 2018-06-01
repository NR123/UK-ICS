<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:case="http://www.lexis-nexis.com/glp/case"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="case:constituents">
        <xsl:choose>
            <xsl:when test="self::case:constituents/not(preceding-sibling::case:constituents)">
                <xsl:element name="{name()}">
                    <xsl:apply-templates/>
                    <xsl:apply-templates select="following-sibling::case:constituents" mode="grp_case.constituents"/>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="case:constituents[preceding-sibling::case:constituents]" mode="grp_case.constituents">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="case:constituent[parent::case:constituents]">
        <xsl:element name="{name()}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="page[$selectorID = 'cases']">      
        <xsl:choose>
            <xsl:when test="self::page[parent::catchphrase]">
                <xsl:element name="page" inherit-namespaces="no">
                    <xsl:apply-templates select="@*"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:attribute name="text" select="normalize-space(./@text)"/>
                    <xsl:attribute name="reporter" select="./@reporter"/>
                    <xsl:attribute name="count" select="./@count"/>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="page[$selectorID = 'journal']">
        <xsl:element name="{name()}">
            <xsl:attribute name="text" select="./@count"/>
            <xsl:attribute name="count" select="./@count"/>
            <xsl:attribute name="reporter" select="./@reporter"/>            
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!--<xsl:template match="page[parent::catchphrase]">
        <xsl:element name="page" inherit-namespaces="no">
            <xsl:apply-templates select="@*"/>
        </xsl:element>
    </xsl:template>-->

    <xsl:template match="page/@*"/>

</xsl:stylesheet>

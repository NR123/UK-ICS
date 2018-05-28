<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns:in="http://www.lexis-nexis.com/glp/in"
        version="2.0">
    
    <!-- DAYANAND SINGH: 22May2018-->

    <xsl:template match="in:lev1">
        <xsl:element name="in:lev1">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="in:lev2">
        <xsl:element name="in:lev2">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="in:lev3">
        <xsl:element name="in:lev3">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="in:lev4">
        <xsl:element name="in:lev4">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="in:lev5">
        <xsl:element name="in:lev5">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="in:lev6">
        <xsl:element name="in:lev6">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="in:entry">
        <xsl:element name="in:entry">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="in:entry-text">
        <xsl:element name="in:entry-text">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="in:index-ref">
        <xsl:element name="in:index-ref">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>

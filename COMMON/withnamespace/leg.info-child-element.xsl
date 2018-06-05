<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns:leg="http://www.lexis-nexis.com/glp/leg"
    xmlns:ci="http://www.lexis-nexis.com/ci"
    version="2.0">
    
    <!-- DAYANAND SINGH: 30May2018-->
    
    <xsl:template match="leg:info|leg:dates|leg:assentdate|leg:enactdate|leg:officialname">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="leg:officialnum">
        <xsl:element name="leg:officialnum">
            <xsl:attribute name="display-name" select="@display-name"/>
            <xsl:element name="ci:cite">
                <xsl:attribute name="status" select="'valid'"/>
                <xsl:element name="ci:content">
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        
    </xsl:template>
    
    <xsl:template match="leg:relatedleg">
        <xsl:element name="leg:relatedleg">
            <xsl:attribute name="display-name" select="@display-name"/>
            <xsl:attribute name="type" select="@type"/>
            <xsl:element name="ci:cite">
                <xsl:attribute name="status" select="'valid'"/>
                <xsl:element name="ci:content">
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="leg:assentdate/@*|leg:enactdate/@*">
        <xsl:copy/>
    </xsl:template>
    
</xsl:stylesheet>

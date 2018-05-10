<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dict="http://www.lexis-nexis.com/glp/dict"
    xmlns:in="http://www.lexis-nexis.com/glp/in"
    xmlns:docinfo="http://www.lexis-nexis.com/glp/docinfo"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:template match="title[parent::heading/parent::dict:body][not(child::*[name()!='emph'])][$selectorID='dictionary']">
        <xsl:element name="desig" inherit-namespaces="no">
            <xsl:attribute name="value">
                <xsl:value-of select="self::title//text()"/>
            </xsl:attribute>
            <xsl:element name="designum">
                <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="title[parent::heading/parent::in:body][$selectorID='index']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="//in:body/heading/title//text()"/>                       
        </xsl:element>
    </xsl:template>    
    
    <xsl:template match="title[parent::heading/parent::level][$selectorID='journal']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>                       
        </xsl:element>
    </xsl:template>  
    
    <xsl:template match="title">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>                       
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>
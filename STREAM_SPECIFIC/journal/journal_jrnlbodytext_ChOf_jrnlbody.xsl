<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:jrnl="http://www.lexis-nexis.com/glp/jrnl" xmlns:glp="http://www.lexis-nexis.com/glp" exclude-result-prefixes="xs" version="2.0">
     
        
    <xsl:template match="jrnl:bodytext[parent::jrnl:body][$selectorID='journal']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>  
   
    <xsl:template match="level[child::levelprelim][$selectorID='journal']"/>
    
    <xsl:template match="levelprelim[parent::jrnl:bodytext][$selectorID='journal']"/>
    
        
    <xsl:template match="level[not(child::levelprelim)][$selectorID='journal']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
       
    <xsl:template match="level/@*[$selectorID='journal']"/>
    
    <xsl:template match="bodytext[parent::level][$selectorID='journal']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="link[parent::text][$selectorID='journal']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="link[parent::text]/@*[$selectorID='journal']">
        <xsl:copy/>
    </xsl:template>
    
    
</xsl:stylesheet>

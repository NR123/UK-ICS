<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:jrnl="http://www.lexis-nexis.com/glp/jrnl" xmlns:glp="http://www.lexis-nexis.com/glp" exclude-result-prefixes="xs" version="2.0">
     
        
    <xsl:template match="jrnl:info[parent::jrnl:body][$selectorID='journal']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="jrnl:journalcite[parent::jrnl:info][$selectorID='journal']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>  
    
    <xsl:template match="publication[parent::jrnl:info][$selectorID='journal']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="//jrnl:body/jrnl:prelim[1]//child::inlineobject"/>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pubdate[parent::jrnl:info][$selectorID='journal'] | date[parent::pubdate][$selectorID='journal']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="date[parent::pubdate][$selectorID='journal']/@*">        
       <xsl:copy/>
    </xsl:template>
    
</xsl:stylesheet>

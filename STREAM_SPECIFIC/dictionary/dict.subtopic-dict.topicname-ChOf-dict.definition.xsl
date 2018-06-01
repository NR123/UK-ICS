<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dict="http://www.lexis-nexis.com/glp/dict"
    xmlns:in="http://www.lexis-nexis.com/glp/in"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- DAYANAND SINGH: 22May2018 changed and added new element as per need-->
    
    <xsl:template match="dict:subtopic">
        <xsl:element name="{name()}">
            <xsl:attribute name="id" select="@id"/>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
        
    <xsl:template match="dict:topicname">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dict:short-definition">
        <xsl:element name="dict:short-definition">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dict:detailed-definition">
        <xsl:element name="dict:detailed-definition">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dict:equivalent-term">
        <xsl:element name="dict:equivalent-term">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dict:note">
        <xsl:element name="dict:note">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>
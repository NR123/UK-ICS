<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dict="http://www.lexis-nexis.com/glp/dict"
    xmlns:comm="http://www.lexis-nexis.com/glp/comm"
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
    
    <xsl:template match="title[ancestor::comm:body][$selectorID=('commentary','commentaryleghist')]">
        <xsl:choose>
            <xsl:when test="self::title/count(child::emph)=2">
                <desig xsl:exclude-result-prefixes="#all">
                    <xsl:attribute name="value">
                        <xsl:call-template name="Normalize_id_string">
                            <xsl:with-param name="string" select="self::title/emph[1]//text()"/>
                        </xsl:call-template>
                    </xsl:attribute>
                    <designum xsl:exclude-result-prefixes="#all">
                        <xsl:value-of select="self::title/emph[1]//text()"/>
                    </designum>
                </desig>
                <title xsl:exclude-result-prefixes="#all">
                    <xsl:call-template name="replace">
                        <xsl:with-param name="text" select="self::title/emph[2]//text()"/>
                    </xsl:call-template>
                </title>
            </xsl:when>
            <xsl:when test="self::title/child::emph/count(child::emph)=2">
                <desig xsl:exclude-result-prefixes="#all">
				<!-- DATE: 22 May, 2018 - Modified by Himanshu to resolve text of element <emph>/text() = "2 &amp; 3 Edw 6 c 13" for element <desig>/@value.
                        Attribute @value value of type NMTOKEN must be a name token.
                        Old Code: 
                        <xsl:attribute name="value" select="self::title/emph/emph[1]//text()"/>
                    -->
                    <xsl:attribute name="value">
                        <xsl:choose>
                            <xsl:when test="contains(self::title/emph/emph[1]//text(),' ') and contains(self::title/emph/emph[1]//text(),'&amp;')">
                                <xsl:variable name="DESIGVALUE" select="tokenize(self::title/emph/emph[1]//text(),' ')"/>
                                <xsl:value-of select="$DESIGVALUE[1]"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="self::title/emph/emph[1]//text()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>		
                    <designum xsl:exclude-result-prefixes="#all">
                        <xsl:value-of select="self::title/emph/emph[1]//text()"/>
                    </designum>
                </desig>
                <title xsl:exclude-result-prefixes="#all">
                    <xsl:call-template name="replace">
                        <xsl:with-param name="text" select="self::title/emph/emph[2]//text()"/>
                    </xsl:call-template>
                </title>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>
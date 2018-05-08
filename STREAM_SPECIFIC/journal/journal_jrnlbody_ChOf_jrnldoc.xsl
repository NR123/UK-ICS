<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:jrnl="http://www.lexis-nexis.com/glp/jrnl" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="jrnl:body[parent::JOURNALDOC][$selectorID='journal']">      
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="jrnl:prelim[1][parent::jrnl:body][$selectorID='journal']"/>
    
    <xsl:template match="jrnl:prelim[2][parent::jrnl:body][$selectorID='journal']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
            <abstract>
            <xsl:apply-templates select="//jrnl:body/child::jrnl:bodytext//levelprelim/child::abstract" mode="abstract"/>
            </abstract>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="jrnl:prelim/@*[$selectorID='journal'] | jrnl:bodytext/@*[$selectorID='journal']"/>
    
    <xsl:template match="jrnl:articletitle[parent::jrnl:prelim][$selectorID='journal'] | copyright[parent::jrnl:prelim][$selectorID='journal']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="jrnl:topic[ancestor::jrnl:body][$selectorID='journal']">
      
        <xsl:choose>
            <xsl:when test="matches(self::jrnl:topic//text(),'[\s][\w\W]+')">
                <jrnl:articlesubtitle>
                    <xsl:apply-templates select="self::jrnl:topic//text()"/>
                </jrnl:articlesubtitle>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="abstract[ancestor::jrnl:bodytext][$selectorID='journal']" mode="abstract">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="contrib[parent::jrnl:prelim][$selectorID='journal']">
        <xsl:choose>
            <xsl:when test="self::contrib/not(preceding-sibling::contrib)">
            <xsl:element name="{name()}">
                <!--<xsl:attribute name="searchtype">
                    <xsl:value-of select="lower-case(@searchtype)"/>
                </xsl:attribute>-->
                  <xsl:apply-templates select="@* | node()"/>
                  <xsl:apply-templates select="following-sibling::contrib" mode="grp_contrib"/>
            </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="contrib/@searchtype[$selectorID='journal']">
        <xsl:attribute name="searchtype">
            <xsl:value-of select="lower-case(.)"/>
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="contrib" mode="grp_contrib">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="bio[parent::contrib][$selectorID='journal']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addl-info[parent::bio][$selectorID='journal']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="email[$selectorID='journal']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>

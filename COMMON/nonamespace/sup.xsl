<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="sup">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//case:content//text[ancestor::footnote]/sup" mode="fnrtoken">
        <xsl:value-of select="generate-id()"/>
    </xsl:template>
    
    <xsl:template match="sup[not(ancestor::fnbody)][$selectorID=('cases')]">
        
        <!-- Please include 'common/nonamespace/footnotegrp.xsl' in driver file as the named template fntoken and fnrtoken are fetched from there. -->
        <xsl:variable name="fntoken">
            <xsl:call-template name="fntoken">
                <xsl:with-param name="fnlabel_footnote" select="self::sup"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="fnrtoken">
            <xsl:call-template name="fnrtoken">
                <xsl:with-param name="fnlabel_footnote" select="self::sup"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$fntoken!='' and $fnrtoken!=''">
                <fnr fntoken='{$fntoken}' fnrtoken='{$fnrtoken}'>
                    <xsl:apply-templates/>
                </fnr>
            </xsl:when>
            <xsl:otherwise>
                <sup>
                    <xsl:apply-templates/>
                </sup>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template match="sup[not(ancestor::fnbody)][$selectorID=('journal')]">
        
        <!-- Please include 'common/nonamespace/footnotegrp.xsl' in driver file as the named template fntoken and fnrtoken are fetched from there. -->
        <xsl:variable name="fntoken">
            <xsl:call-template name="fntoken">
                <xsl:with-param name="fnlabel_footnote" select="self::sup"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="fnrtoken">
            <xsl:call-template name="fnrtoken">
                <xsl:with-param name="fnlabel_footnote" select="self::sup"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$fntoken!='' and $fnrtoken!=''">
                <fnr fnrtoken='{$fnrtoken}' fntoken='{$fntoken}'>
                    <xsl:apply-templates/>
                </fnr>
            </xsl:when>
            <xsl:otherwise>
                <sup>
                    <xsl:apply-templates/>
                </sup>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
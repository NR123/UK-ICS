<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:glp="http://www.lexis-nexis.com/glp"
    xmlns:case="http://www.lexis-nexis.com/glp/case"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="case:judgments[parent::case:content]">
        <xsl:choose>
            <xsl:when test="self::case:judgments/not(preceding-sibling::case:judgments)">
                <xsl:element name="{name()}">
                    <xsl:if test="parent::case:content/preceding-sibling::case:headnote//case:decisionsummary/p">
                        <prelim>
                            <xsl:apply-templates select="parent::case:content/preceding-sibling::case:headnote//case:decisionsummary/p" mode="prelim"/>
                        </prelim>
                    </xsl:if>
                    <xsl:apply-templates select="@* | node()"/>
                    <xsl:apply-templates select="following-sibling::case:judgments" mode="grp_case.judgements"/>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="case:judgments" mode="grp_case.judgements">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="glp:note[parent::case:judgments]">
        <prelim>
            <!-- This mode is defined in the file "case.judgements_ChOf_case.content.xsl" -->
            <xsl:apply-templates mode="prelim"/>
        </prelim>      
    </xsl:template>
    
    <xsl:template match="*" mode="prelim">
        <xsl:choose>
            <xsl:when test="self::page">
                <xsl:apply-templates select="."/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
            <xsl:choose>
                <xsl:when test="self::text">
                    <xsl:attribute name="align" select="'right'"/>
                    <xsl:apply-templates/>
                </xsl:when>
                <xsl:when test="self::p">
                    <xsl:apply-templates mode="prelim"/>
                </xsl:when>
                <xsl:when test="self::emph"/>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    <xsl:template match="case:dates[parent::case:judgments] | case:disposition[parent::case:judgments]">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="case:decisiondate[parent::case:dates/parent::case:judgments]">
        <xsl:element name="{name()}">
        <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="date[parent::case:decisiondate/parent::case:dates/parent::case:judgments]">
        <xsl:apply-templates/>
    </xsl:template>
    
</xsl:stylesheet>
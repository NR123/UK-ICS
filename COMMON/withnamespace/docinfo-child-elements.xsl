<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:docinfo="http://www.lexis-nexis.com/glp/docinfo"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="docinfo">
        <xsl:element name="{name()}">
            <docinfo:dpsi id-string="000D"/>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="docinfo/@*"/>

    <xsl:template
        match="docinfo:doc-heading | docinfo:bookseqnum[$selectorID = 'cases'] | docinfo:doc-lang | docinfo:doc-country | docinfo:hier | docinfo:hierlev | heading[parent::docinfo:hierlev] | title[ancestor::docinfo:hierlev] | docinfo:lbu-meta | docinfo:metaitem | docinfo:selector | docinfo:alt-renditions | docinfo:alt-rendition | link[parent::docinfo:alt-rendition]">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="docinfo:alt-rendition/link/@*">
        <xsl:copy/>
    </xsl:template>

    <xsl:template match="docinfo:doc-id | docinfo:bookseqnum">
        <xsl:element name="{name()}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="docinfo:*/@*">
        <xsl:copy/>
    </xsl:template>

    <xsl:template
        match="docinfo:custom-metafields[$selectorID='dictionary'] | docinfo:custom-metafields/child::*[$selectorID='dictionary'] | docinfo:assoc-links | docinfo:normcite"/>
    
    <xsl:template match="docinfo:custom-metafields[$selectorID='cases']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
            <xsl:copy-of select="child::docinfo:custom-metafield[@name='date']" copy-namespaces="no"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="docinfo:custom-metafield[$selectorID='cases']">
        <xsl:choose>
            <xsl:when test="@name='courtcode'"><xsl:copy-of select="." copy-namespaces="no"/></xsl:when>
            <xsl:when test="@name='jurisdiction'">
                <xsl:choose>
                    <xsl:when test="self::docinfo:custom-metafield/not(child::node()) and parent::docinfo:custom-metafields/docinfo:custom-metafield[@searchtype='JURIS-CLASSIFY']/not(child::node())">
                        <xsl:element name="{name()}">
                            <xsl:copy-of select="@name" copy-namespaces="no"/>
                            <xsl:value-of select="'EnglandWalesScotlandandNorthernIreland'"/>
                        </xsl:element>
                    </xsl:when>
                    <xsl:when test="self::docinfo:custom-metafield/not(child::node()) and parent::docinfo:custom-metafields/docinfo:custom-metafield[@searchtype='JURIS-CLASSIFY']/child::node()">
                        <xsl:element name="{name()}">
                            <xsl:copy-of select="@name" copy-namespaces="no"/>
                            <xsl:value-of select="translate(parent::docinfo:custom-metafields/docinfo:custom-metafield[@searchtype='JURIS-CLASSIFY'],', ','')"/>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="." copy-namespaces="no"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="@searchtype='COURT-CLASSIFY'">
                <xsl:element name="{name()}">
                    <xsl:attribute name="name" select="./@searchtype"/>
                        <xsl:choose>
                            <xsl:when test="self::docinfo:custom-metafield/not(node())">
                                <xsl:value-of select="'Supreme Court'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="node()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                </xsl:element>
            </xsl:when>
            <xsl:when test="@searchtype='JURIS-CLASSIFY'">
                <xsl:element name="{name()}">
                    <xsl:attribute name="name" select="./@searchtype"/>
                        <xsl:choose>
                            <xsl:when test="self::docinfo:custom-metafield/not(node())">
                                <xsl:value-of select="'England, Wales, Scotland and Northern Ireland'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="node()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="docinfo:custom-metafield[$selectorID='cases'][./@name=('court','juris','date','sh-version','rx-version','sg-version','ng-version','filterType','resultType')]" priority="20"/>


</xsl:stylesheet>

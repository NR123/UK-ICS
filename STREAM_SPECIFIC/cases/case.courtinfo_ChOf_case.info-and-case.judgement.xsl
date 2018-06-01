<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:case="http://www.lexis-nexis.com/glp/case"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="case:courtinfo[parent::case:info or parent::case:judgment]">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template
        match="case:courtname[parent::case:courtinfo] | case:courtcode[parent::case:courtinfo] | case:judges[parent::case:courtinfo] | case:judge[parent::case:judges/parent::case:courtinfo] | case:dates[parent::case:courtinfo] | case:hearingdates[parent::case:dates/parent::case:courtinfo] | case:decisiondate[parent::case:dates/parent::case:courtinfo]">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="case:juris[parent::case:courtinfo[parent::case:info | parent::judgment]]"/>
</xsl:stylesheet>

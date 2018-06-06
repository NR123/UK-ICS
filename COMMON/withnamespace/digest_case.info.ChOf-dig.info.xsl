<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:dig="http://www.lexis-nexis.com/glp/dig" exclude-result-prefixes="xs" version="2.0">

    <xsl:template
        match="case:info | case:casename | case:courtinfo | case:courtcode | case:courtname | case:dates | case:decisiondate | case:judges | case:juris | case:decisiontype | case:importance | case:reportercite">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template
        match="case:casename/@* | case:judges/@* | case:reportercite/@* | case:importance/@*">
        <xsl:copy/>
    </xsl:template>


</xsl:stylesheet>

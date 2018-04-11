<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:case="http://www.lexis-nexis.com/glp/case" exclude-result-prefixes="xs" version="2.0">

    <!-- Uncomment the below xsl:param while unit testing -->
    <!-- Start: For unit-testing -->
    <!--<xsl:param name="selectorID" select="'dictionary'"/>
    <xsl:include href="../nonamespace/l-li.xsl"/>
    <xsl:include href="../nonamespace/p.xsl"/>
    <xsl:include href="../nonamespace/text.xsl"/>
    <xsl:include href="../nonamespace/default.xsl"/>-->
    
    <xsl:template match="blockquote">
        <xsl:choose>
            <xsl:when test="self::blockquote/child::*[1][name()='l'] and $selectorID = 'dictionary'">
                <xsl:apply-templates select="@* | node()"/>
            </xsl:when>
            <xsl:when test="self::blockquote[ancestor::case:appendix]/p/text/matches(text()[1],'^\(([a-z]+|[ivx]+)\)')[$selectorID = 'cases']">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

</xsl:stylesheet>

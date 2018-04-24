<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="p">
        <!--<xsl:message select="$docinfo.selector"></xsl:message>-->
        <xsl:choose>
            <xsl:when
                test="self::p/child::text/not(child::node())[$selectorID = 'cases' and $docinfo.selector = 'PracticeDirection']"/>

            <xsl:when test="self::p/not(child::node())[$selectorID = 'journal']"/>

            <xsl:when test="self::p[child::text[@align = 'center']] and $selectorID = 'journal'">
                <xsl:variable name="starcheck" select="."/>
                <xsl:choose>
                    <xsl:when test="matches($starcheck, '\*\s*\*\s*\*')">
                        <xsl:apply-templates select="self::p" mode="p_suppress"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when
                test="child::text/node()[1][name() = 'emph'] and matches(child::text/node()[1], '^(\([a-zA-Z0-9]+\)|&#x25cf;|&#x2022;)([\t&#160;]*)')">
                <xsl:element name="{name()}">
                    <pnum>
                        <xsl:apply-templates select="child::text/node()[1]/node()"/>
                    </pnum>
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <xsl:template match="//p" mode="p_suppress"/>

</xsl:stylesheet>

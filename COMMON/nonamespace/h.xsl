<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <!-- Uncomment the below xsl:param while unit testing -->
    <!-- Start: For unit-testing -->
    <!--<xsl:include href="../nonamespace/emph.xsl"/>-->
    <!-- End: For unit-testing -->

    <xsl:template match="h">
        <xsl:choose>
            <xsl:when test="self::h[preceding-sibling::*[1][name() = 'h']] and $selectorID = 'cases'">
                <p>
                    <text>
                        <xsl:apply-templates select="self::h//text()"/>
                    </text>
                </p>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:apply-templates select="node()"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>
</xsl:stylesheet>

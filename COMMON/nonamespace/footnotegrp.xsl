<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <!-- Uncomment the below xsl:param while unit testing -->
    <!-- Start: For unit-testing -->
    <!--<xsl:include href="../nonamespace/emph.xsl"/>-->
    <!-- End: For unit-testing -->

    <xsl:template match="footnotegrp">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
        <xsl:apply-templates select="self::footnotegrp//fnbody/page"/>
    </xsl:template>

    <xsl:template match="footnote | fnbody">

        <xsl:apply-templates/>
        
    </xsl:template>

    <xsl:template match="p[parent::fnbody]">
        <footnote type="editorial" fntoken="d121142e90" fnrtokens="d121142e64">
            <xsl:if test="self::p/text/*[1][name() = 'sup']">
                <fnlabel>
                    <xsl:apply-templates select="self::p/text/sup/node()"/>
                </fnlabel>
            </xsl:if>
            <fnbody>
            <p>
            <xsl:apply-templates/>
            </p>
            </fnbody>
        </footnote>
    </xsl:template>

    <xsl:template match="text[parent::p/parent::fnbody]">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="node() except (sup,page)"/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>

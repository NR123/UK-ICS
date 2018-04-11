<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <!-- Uncomment the below xsl:param while unit testing -->
    <!-- Start: For unit-testing -->
    <!--<xsl:include href="../nonamespace/emph.xsl"/>-->
    <!-- End: For unit-testing -->

    <xsl:template match="person[$selectorID = 'cases']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="name.text[parent::person][$selectorID = 'cases']">
        <xsl:element name="{name()}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!--<xsl:template match="name.text[parent::person][$selectorID = 'cases']">
        <xsl:element name="{name()}">
            <xsl:choose>
                <xsl:when test="emph[parent::name.text][$selectorID = 'cases']">
                    <xsl:analyze-string select="." regex="\s*(([A-Z]\w*\-*\.*\s*'*)+)">
                        <xsl:matching-substring>
                            <emph typestyle="it">
                                <xsl:value-of select="regex-group(1)"/>
                            </emph>
                        </xsl:matching-substring>
                        <xsl:non-matching-substring>
                            <xsl:value-of select="."/>
                        </xsl:non-matching-substring>
                    </xsl:analyze-string>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:element name="{name()}">
                        <xsl:apply-templates select="@* | node()"/>
                    </xsl:element>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>-->
</xsl:stylesheet>

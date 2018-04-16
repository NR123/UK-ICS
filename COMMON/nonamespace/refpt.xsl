<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:in="http://www.lexis-nexis.com/glp/in"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <!-- Uncomment the below xsl:param while unit testing -->
    <!-- Start: For unit-testing -->
    <!--<xsl:param name="selectorID" select="'dictionary'"/>-->
    <!-- End: For unit-testing -->
    
    <xsl:template match="refpt[$selectorID='dictionary']">
        <xsl:element name="{name()}">
            <xsl:attribute name="type" select="./@type"/>
            <xsl:choose>
                <xsl:when test="$selectorID = 'dictionary'">
                    <xsl:attribute name="id">
                        <xsl:call-template name="fn_refpt">
                            <xsl:with-param name="id" select="./@id"/>
                        </xsl:call-template>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="id" select="./@id"/>
                </xsl:otherwise>
            </xsl:choose>

        </xsl:element>
    </xsl:template>
    
    
    <xsl:template match="refpt[$selectorID='index']">
        <xsl:element name="{name()}">
            <xsl:attribute name="id">
                <xsl:call-template name="fn_refpt">
                    <xsl:with-param name="id" select="./@id"/>
                </xsl:call-template>
            </xsl:attribute>            
        </xsl:element>
    </xsl:template>

    <xsl:template name="fn_refpt">
        <xsl:param name="id"/>
        <xsl:choose>
            <xsl:when test="self::refpt[$selectorID='dictionary']">
                <xsl:analyze-string select="$id" regex="(0KMN_[0-9]+_[A-Z]+_)([\w_]+)(:HTDICT-TERM)">
                    <xsl:matching-substring>
                        <xsl:value-of select="concat('acronym:WPLD::term:', regex-group(2))"/>
                    </xsl:matching-substring>
                </xsl:analyze-string>
            </xsl:when>
            <xsl:when test="self::refpt[$selectorID='index']">
                <xsl:analyze-string select="$id" regex="([\w]{{4}}_[0-9]+_[A-Z]+_)([\w_]+)(:HTCOMM-INDEXID)">
                    <xsl:matching-substring>
                        <xsl:value-of select="concat('acronym:HALS-INDEX::term:', regex-group(2))"/>
                    </xsl:matching-substring>
                </xsl:analyze-string>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>

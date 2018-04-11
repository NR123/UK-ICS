<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ci="http://www.lexis-nexis.com/ci" xmlns:case="http://www.lexis-nexis.com/glp/case"
    exclude-result-prefixes="xs" version="2.0">
    
    <!-- Uncomment the below xsl:param while unit testing -->
    <!-- Start: For unit-testing -->
    <!-- <xsl:include href="../nonamespace/refpt.xsl"/>
    <xsl:param name="selectorID" select="'dictionary'"/>-->
    <!-- End: For unit-testing -->

    <xsl:template match="ci:*">
        <xsl:choose>
            <xsl:when test="self::ci:cite[matches(child::ci:content,'^&#x2013;[0-9]+')][$selectorID='dictionary']">
                  <xsl:value-of select="self::ci:cite//child::ci:content/node()"/>             
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:apply-templates select="@*"/>
                    <xsl:if
                        test="self::ci:cite[@searchtype = 'LEG-REF' or @searchtype = 'EU-REF']">
                        <xsl:attribute name="normcite">

                            <xsl:variable name="sesslawnum">
                                <xsl:analyze-string select="self::ci:cite//ci:sesslawnum/@num"
                                    regex="([0-9]+_[0-9]+)">
                                    <xsl:matching-substring>
                                        <xsl:value-of select="regex-group(1)"/>
                                    </xsl:matching-substring>
                                </xsl:analyze-string>
                            </xsl:variable>
                            <xsl:value-of
                                select=" normalize-space(upper-case(concat(self::ci:cite//ci:standardname/@normpubcode, ' ', translate($sesslawnum, '_', ' '), ' ', concat(self::ci:cite//ci:hierpinpoint[1]/ci:hierlev[1]/@label, ' ', self::ci:cite//ci:hierpinpoint[1]/ci:hierlev[1]/@num))))"/>

                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates select="node()"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <xsl:template
        match="ci:sesslaw[parent::ci:cite/@searchtype = 'LEG-REF' or parent::ci:cite/@searchtype = 'EU-REF']"/>

    <xsl:template name="fn_normcite">
        <xsl:param name="normcite"/>
        <xsl:variable name="sesslawnum">
            <xsl:analyze-string select="$normcite" regex="([0-9]+_[0-9]+)">
                <xsl:matching-substring>
                    <xsl:value-of select="regex-group(1)"/>
                </xsl:matching-substring>
            </xsl:analyze-string>
        </xsl:variable>
        <xsl:value-of
            select="concat(child::ci:standardname/@normpubcode, ' ', translate($sesslawnum, '_', ' '), ' ', concat(child::ci:hierlev[1]/@label, ' ', child::ci:hierlev[1]/@num))"/>

    </xsl:template>

    <xsl:template match="ci:*/@*">
        <xsl:choose>
            <xsl:when test="parent::ci:cite/@searchtype = 'EU-REF'">
                <xsl:attribute name="searchtype" select="'LEG-REF'"/>
            </xsl:when>
            <xsl:when test="parent::ci:cite/parent::case:parallelcite">
                <xsl:attribute name="searchtype" select="'CASE-REF'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="ci:cite[@searchtype = 'CASE-REF']/@status" priority="20"/>
    
    <xsl:template match="citefragment">
        <xsl:choose>
            <xsl:when test="ancestor::case:parallelcite">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:copy-of select="@*"/>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>

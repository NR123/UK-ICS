<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:glp="http://www.lexis-nexis.com/glp"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:leg="http://www.lexis-nexis.com/glp/leg" exclude-result-prefixes="xs" version="2.0">

    <!-- Uncomment the below xsl:param while unit testing -->
    <!-- Start: For unit-testing -->
    <!--<xsl:include href="../nonamespace/emph.xsl"/>-->
    <!-- End: For unit-testing -->

       
    <!-- Arun: 03May2018 - Added below template to handle date element -->
    
    <!-- Dayanand: 31May2018 - changed below template to handle date element for digestdoc-->
    
    
    <xsl:template match="date">
        <xsl:element name="{name()}">
            <!--
                Old code: <xsl:apply-templates select="@* | node()"/>
            -->
            <xsl:choose>
                <xsl:when test="parent::pubdate">
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:when>
                <xsl:when test="parent::leg:assentdate|parent::leg:enactdate">
                    <xsl:variable name="month" select="'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'"/>
                    <xsl:variable name="DATE" select="tokenize(.,' ')"/>
                    
                    <xsl:choose>
                        <xsl:when test="not(@*)">
                            <xsl:analyze-string select="." regex="([0-9]+)\s+([a-zA-Z]+)\s+([0-9]+)">
                                <xsl:matching-substring>
                                    <xsl:variable name="DAY" select="number($DATE[1])"/>
                                    <xsl:attribute name="day" select="format-number($DAY, '00')"/>
                                    <xsl:attribute name="month" select="format-number(index-of($month,$DATE[2]),'00')"/>
                                    <xsl:attribute name="year" select="$DATE[3]"/>
                                </xsl:matching-substring>
                                <xsl:non-matching-substring/>
                            </xsl:analyze-string>
                            <xsl:apply-templates select="node()"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="@* | node()"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="date/@*">
       <xsl:copy/>
    </xsl:template>
    
</xsl:stylesheet>

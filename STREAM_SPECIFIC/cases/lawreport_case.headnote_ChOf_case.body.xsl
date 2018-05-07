<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:glp="http://www.lexis-nexis.com/glp" exclude-result-prefixes="xs" version="2.0">

    <!--<!-\- Dayanand singh 2018-05-02, updated case:embeddedcase -\->
    <xsl:template match="case:headnote[parent::case:embeddedcase]">
        <xsl:element name="{name()}">
            <xsl:apply-templates/>            
        </xsl:element>
    </xsl:template>-->

    <!-- Revathi: 04May2018 - Commented the above code and included it as a condition into generic case:headnote template -->
    <xsl:template match="case:headnote">
        <xsl:choose>
            <xsl:when test="parent::case:body | parent::case:embeddedcase">
                <xsl:element name="{name()}">
                    <!--<xsl:apply-templates select="@* | node() except (glp:note, case:priorhist)"/>-->
                    <xsl:apply-templates select="@* | node() except (case:priorhist)"/>
                    <xsl:apply-templates select="case:decisionsummary/glp:note" mode="glp.note"/>
                    <xsl:apply-templates select="case:decisionsummary/case:consideredcases"
                        mode="references"/>
                    <xsl:apply-templates select="case:priorhist"/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="self::case:headnote/preceding-sibling::case:headnote"/>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="self::case:headnote/not(preceding-sibling::case:headnote)">
                        <xsl:element name="{name()}">
                            <xsl:apply-templates/>
                            <xsl:apply-templates select="following-sibling::case:headnote"
                                mode="grp_case.headnote"/>
                        </xsl:element>
                    </xsl:when>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <xsl:template match="case:headnote" mode="grp_case.headnote">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Arun: 03May2018 - Added below template to handle case:disposition element -->

    <xsl:template match="case:disposition">
        <xsl:element name="{name()}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>


</xsl:stylesheet>

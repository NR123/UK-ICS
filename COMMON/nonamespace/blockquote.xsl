<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:glp="http://www.lexis-nexis.com/glp"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:case="http://www.lexis-nexis.com/glp/case" exclude-result-prefixes="xs" version="2.0">


    
    <xsl:template match="blockquote">
        <xsl:choose>
            <!-- Revathi: 08Jun2018 - wherever blockquote is appearing within p/text/glp:note, removing the glp:note as per the discussion with Awntika as it is creating validation errors/text drops in rocket-->
            <xsl:when test="self::blockquote[parent::glp:note[ancestor::p]][$selectorID='cases']">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="self::blockquote/child::*[1][name()='l'] and $selectorID = 'dictionary'">
                <xsl:apply-templates select="@* | node()"/>
            </xsl:when>
            <!-- Revathi: 26May2018 - As suggested by Amita - Commented the below code as it is creating issues in rocket conversion. -->
            <!--<!-\-Dayanand singh 2018-05-02 updated in below when condition of parent::case:factsummary -\->
            <xsl:when test="self::blockquote[ancestor::case:appendix|parent::case:factsummary]/p/text/matches(text()[1],'^\(([a-z]+|[ivx]+)\)')[$selectorID = 'cases']">
                <xsl:apply-templates/>
            </xsl:when>-->
            
            <xsl:when test="self::blockquote[child::table][$selectorID='cases'][$docinfo.selector = ('Transcript')]">
                <xsl:element name="{name()}">
                    <xsl:apply-templates select="@* | node() except(table)"/>
                </xsl:element>
                <xsl:apply-templates select="table"/>
            </xsl:when>
            <!-- Revathi: Added the below condition when the child of a blockquote is only blockquote, then we need to suppress the parent blockquote -->
            <xsl:when test="self::blockquote/not(child::node()[name()!='blockquote'])">
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

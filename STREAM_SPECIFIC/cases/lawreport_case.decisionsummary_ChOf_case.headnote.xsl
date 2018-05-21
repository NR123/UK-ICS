<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:glp="http://www.lexis-nexis.com/glp"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="case:decisionsummary[parent::case:headnote]">
        <xsl:choose><!-- Arun: 07May2018 Added the below condition check to suppress the creation of tag case:decisionsummary when there is no child element apart from glp:note and case:consideredcases -->
            <xsl:when test="child::node()[name() != 'glp:note' and name() != 'case:consideredcases']">
                <xsl:element name="{name()}">
                    <xsl:attribute name="summarytype" select="'held'"/>
                    <!-- If there is glp:note within case:headnote and as preceeding sibling of decisionsummary, then we have to move this into decisionsummary and suppress the tag glp:note and retain its child elements -->
                    <xsl:apply-templates select="self::case:decisionsummary/preceding-sibling::glp:note"/>
                    <xsl:for-each select="*">
                        <xsl:if test="self::node()[not(preceding-sibling::glp:note) and not(preceding-sibling::case:consideredcases)]">
                            <xsl:apply-templates select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="glp:note[parent::case:decisionsummary] | case:consideredcases[parent::case:decisionsummary]"/>
    
    <xsl:template match="glp:note[parent::case:headnote and following-sibling::case:decisionsummary]">
        <note>
            <xsl:apply-templates/>  
        </note>
    </xsl:template>
</xsl:stylesheet>
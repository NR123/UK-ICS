<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:glp="http://www.lexis-nexis.com/glp" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="glp:note[parent::case:decisionsummary/parent::case:headnote]"
        mode="glp.note">
        <xsl:choose>
            <xsl:when test="self::glp:note/not(preceding-sibling::glp:note)">
                <xsl:element name="note">
                    <xsl:attribute name="notetype" select="'commentary'"/>
                    <xsl:apply-templates/>
                    <xsl:apply-templates select="following-sibling::glp:note|following-sibling::node()[preceding-sibling::glp:note][not(preceding-sibling::case:consideredcases)]" mode="grp_glp.note"/>                    
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="node()[name()!='glp:note'][preceding-sibling::glp:note][not(preceding-sibling::case:consideredcases)]" mode="grp_glp.note">
        <xsl:apply-templates select="."/>
    </xsl:template>
    
    <xsl:template match="glp:note[parent::case:decisionsummary/parent::case:headnote]" mode="grp_glp.note">
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>

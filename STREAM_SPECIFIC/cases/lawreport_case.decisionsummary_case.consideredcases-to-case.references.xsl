<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:case="http://www.lexis-nexis.com/glp/case"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="case:consideredcases[parent::case:decisionsummary/parent::case:headnote]"
        mode="references">
        <xsl:choose>
            <xsl:when test="self::case:consideredcases/not(preceding-sibling::case:consideredcases)">
                <case:references referencetype="cases" xsl:exclude-result-prefixes="#all">
                    <xsl:apply-templates/>
                    <xsl:apply-templates select="following-sibling::case:consideredcases|following-sibling::node()[name()!=('p')][preceding-sibling::case:consideredcases]" mode="grp_case.references"/>
                </case:references>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="node()[name()!=('p')][name()!=('case:consideredcases')][preceding-sibling::case:consideredcases]" mode="grp_case.references">
        <xsl:apply-templates select="."/>
    </xsl:template>
    
    <xsl:template match="case:consideredcases[parent::case:decisionsummary/parent::case:headnote]" mode="grp_case.references">
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>
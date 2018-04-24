<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:glp="http://www.lexis-nexis.com/glp"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="case:headnote[parent::case:body]">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node() except (glp:note,case:priorhist)"/>
            <xsl:apply-templates select="case:decisionsummary/glp:note" mode="glp.note"/>
            <xsl:apply-templates select="case:decisionsummary/case:consideredcases" mode="references"/>
            <xsl:apply-templates select="case:priorhist"/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>
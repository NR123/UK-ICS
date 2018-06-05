<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ci="http://www.lexis-nexis.com/ci"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="case:info[parent::case:headnote] | case:parallelcite[parent::case:info/ancestor::case:headnote] | case:casename[ancestor::case:headnote] | case:reportercite[ancestor::case:headnote]">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:case="http://www.lexis-nexis.com/glp/case" exclude-result-prefixes="xs" version="2.0">

<!--     Dayanand singh 30-05-2018 -->
    
    <xsl:template match="bodytext">
        <xsl:element name="bodytext">
            <xsl:apply-templates select="node()|@*"/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
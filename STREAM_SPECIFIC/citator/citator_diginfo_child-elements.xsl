<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:comm="http://www.lexis-nexis.com/glp/comm" xmlns:jrnl="http://www.lexis-nexis.com/glp/jrnl" xmlns:cttr="http://www.lexis-nexis.com/glp/cttr" xmlns:dig="http://www.lexis-nexis.com/glp/dig" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="dig:*[$selectorID=('citator')]">      
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>   
    
</xsl:stylesheet>
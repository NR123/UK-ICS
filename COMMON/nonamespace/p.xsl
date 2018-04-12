<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="p">
        <!--<xsl:message select="$docinfo.selector"></xsl:message>-->
        <xsl:choose>
            <xsl:when test="self::p/child::text/not(child::node())[$selectorID='cases' and $docinfo.selector='PracticeDirection' ]"/> 
            <xsl:otherwise>
                <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
</xsl:stylesheet>
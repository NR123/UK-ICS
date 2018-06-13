<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:leg="http://www.lexis-nexis.com/glp/leg"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    
        
    <xsl:template match="LEGDOC">
        <xsl:element name="{name()}">
            <xsl:for-each select="$RosettaNamespaces/*">
                <xsl:sort/>
                <xsl:namespace name="{substring-after(substring-before(., '='), ':')}"
                    select="substring-after(translate(., '&#34;', ''), '=')"/>
            </xsl:for-each>

            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>

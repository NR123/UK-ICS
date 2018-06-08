<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="edpnum">
        <xsl:element name="{name()}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="edpnum[$selectorID=('precedents','treatises','commentaryleghist')]">
        <xsl:element name="{name()}">
            <!--<xsl:attribute name="value" select="replace(translate(self::edpnum,'[]',''),'–','-')"/>-->
            <xsl:attribute name="value">
                <xsl:call-template name="Normalize_id_string">
                    <!-- Revathi: 25May2018 - Added the condition to replace hyphen entity with regular hyphen as its not a NMTOKEN value -->
                    <xsl:with-param name="string" select="replace(.,'‒','-')"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="inline" select="'false'"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
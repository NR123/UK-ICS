<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dict="http://www.lexis-nexis.com/glp/dict"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- Uncomment the below xsl:param while unit testing -->
    <!-- Start: For unit-testing -->
    <!--<xsl:param name="selectorID" select="'dictionary'"/>-->
    <!-- End: For unit-testing -->
    
    <xsl:template match="title[parent::heading/parent::dict:body][not(child::*[name()!='emph'])][$selectorID='dictionary']">
        <xsl:element name="desig">
            <xsl:attribute name="value">
                <xsl:value-of select="self::title//text()"/>
            </xsl:attribute>
            <xsl:element name="designum">
                <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
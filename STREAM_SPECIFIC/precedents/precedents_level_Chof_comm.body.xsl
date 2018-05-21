<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:comm="http://www.lexis-nexis.com/glp/comm" xmlns:jrnl="http://www.lexis-nexis.com/glp/jrnl" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="level[ancestor::comm:body][$selectorID='commentary']">
        <xsl:choose>
          <xsl:when test="self::level[@leveltype=('comm21','comm22')]">
              <xsl:element name="{name()}">
                  <xsl:attribute name="leveltype" select="'section'"/>
                  <xsl:apply-templates/>
              </xsl:element>
          </xsl:when>
            <xsl:when test="self::level[@leveltype=('comm32','comm33')]">
                <xsl:element name="{name()}">
                    <xsl:attribute name="leveltype" select="'subsection'"/>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>   
    
    <xsl:template match="level[ancestor::comm:body][$selectorID='commentary']/@*"/>
    
</xsl:stylesheet>

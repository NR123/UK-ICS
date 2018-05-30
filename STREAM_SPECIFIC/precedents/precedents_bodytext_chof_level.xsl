<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:comm="http://www.lexis-nexis.com/glp/comm" xmlns:jrnl="http://www.lexis-nexis.com/glp/jrnl" xmlns:leg="http://www.lexis-nexis.com/glp/leg" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="bodytext[parent::level][$selectorID=('precedents','treatises','commentaryleghist')]">
        <xsl:choose>
            <xsl:when test="ancestor::level/child::heading/@searchtype='LEGISLATION'[$selectorID=('treatises','commentaryleghist')]">
                <!-- Revathi: Commented the below tags as this handling has been moved to precedents_level_Chof_comm.body.xsl to avoid validation errors -->
                <!--<leg:levelbody xsl:exclude-result-prefixes="#all">
                    <leg:bodytext xsl:exclude-result-prefixes="#all">-->
                        <xsl:apply-templates select="@* | node()"/> 
                    <!--</leg:bodytext>
                </leg:levelbody>-->
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>           
    </xsl:template>   
    
    <xsl:template match="bodytext[$selectorID=('precedents','treatises','commentaryleghist')]/@*"/>
    
    
</xsl:stylesheet>

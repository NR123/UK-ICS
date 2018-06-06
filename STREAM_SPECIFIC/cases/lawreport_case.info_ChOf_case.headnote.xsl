<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ci="http://www.lexis-nexis.com/ci"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="case:info[parent::case:headnote] | case:parallelcite[parent::case:info/ancestor::case:headnote] | case:casename[ancestor::case:headnote] | case:reportercite[ancestor::case:headnote]">
        <xsl:element name="{name()}">      
            <!-- Revathi: 06Jun2018 - Commented the below code as it is dropping the ';' present inside the casename in lawreport content type. -->
        <!--<xsl:choose>
            <xsl:when test="self::case:casename[ancestor::case:headnote] and $docinfo.selector='PracticeDirection'">
                <xsl:variable name="casename" select="."/>
                <xsl:value-of select="translate($casename, ';', '')"/>
            </xsl:when>                          
            <xsl:otherwise>-->
                <xsl:apply-templates select="@* | node()"/>
            <!--</xsl:otherwise>
        </xsl:choose>-->
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
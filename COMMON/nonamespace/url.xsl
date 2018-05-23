<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
  
    
    <xsl:template match="url">
        <xsl:choose>
            <!--   Dayanand Singh 23 May 2018 to added [$selectorID='dictionary'] to retain url element in output xml-->
            <xsl:when test="$selectorID=('journal','cases','precedents','treatises','commentaryleghist','dictionary')">

                <xsl:element name="{name()}">
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:element>
            </xsl:when>
            <!-- Revathi: 22May2018 - Commented the above code and added the $selectorID 'cases' to the above xsl:when to avoid code redundancy -->
            <!-- added url element so choosed cases as selectorID by himanshu -->   
            <!--   Dayanand singh 14 MAY 2018 Added for casse selector id -->
           <!-- <xsl:when test="$selectorID='cases'">
                <xsl:element name="{name()}">
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:element>
            </xsl:when>-->
            <!-- end -->   
            <xsl:otherwise>
                <xsl:apply-templates select="@* | node()"/>        
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
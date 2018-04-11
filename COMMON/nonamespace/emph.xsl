<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dict="http://www.lexis-nexis.com/glp/dict"
    xmlns:glp="http://www.lexis-nexis.com/glp"
    xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:ci="http://www.lexis-nexis.com/ci"
    exclude-result-prefixes="xs"
    version="2.0">
        
    <!-- Uncomment the below xsl:param while unit testing -->
    <!-- Start: For unit-testing -->
   <!-- <xsl:param name="selectorID" select="'dictionary'"/>
    <xsl:include href="../nonamespace/default.xsl"/>-->
    <!-- End: For unit-testing -->
    
    <xsl:template match="emph[ancestor::defterm] | emph[parent::h] | emph[parent::dict:topicname] | emph[parent::remotelink/parent::url] [$selectorID='dictionary']" priority="20">
        <xsl:apply-templates select="node()"/>
    </xsl:template>
    
    <xsl:template match="emph[child::remotelink][$selectorID='dictionary']" priority="20">
        <xsl:apply-templates select="node()"/>
    </xsl:template>
    
    <xsl:template match="emph[ancestor::defterm | child::remotelink | emph[parent::h] | emph[parent::dict:topicname]]/@* [$selectorID='dictionary']" priority="20"/>
    
    <xsl:template match="emph[ancestor::heading/parent::dict:body][$selectorID='dictionary']">
        <xsl:apply-templates/>
    </xsl:template>
    
   <!-- <xsl:template match="emph[self::emph/following-sibling::ci:cite][ancestor::case:priorhist | ancestor::case:consideredcases] [$selectorID='cases']">
        <xsl:apply-templates/>
    </xsl:template>
    -->
    <xsl:template match="emph">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="emph/@*">
        <xsl:copy/>
    </xsl:template>
    
</xsl:stylesheet>
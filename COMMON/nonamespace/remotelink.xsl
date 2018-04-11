<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- Uncomment the below xsl:param while unit testing -->
    <!-- Start: For unit-testing -->
   <!-- <xsl:include href="../nonamespace/refpt.xsl"/>
    <xsl:param name="selectorID" select="'dictionary'"/>-->
    <!-- End: For unit-testing -->
    
    <xsl:template match="remotelink">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="status" select="'valid'"/>
            <xsl:apply-templates select="node()"/>            
        </xsl:element>
    </xsl:template>

    <xsl:template match="remotelink/@*[name()!='refpt']">
        <xsl:copy/>
    </xsl:template>
    
    <xsl:template match="remotelink/@refpt [$selectorID='dictionary']">
        <xsl:variable name="id">
            <xsl:value-of select="."/>
        </xsl:variable>

        <xsl:attribute name="refpt">
            <xsl:call-template name="fn_refpt">
                <xsl:with-param name="id" select="$id"/>
            </xsl:call-template>
        </xsl:attribute>
        <xsl:attribute name="docidref" select="'TBD'"/>
    </xsl:template>
        
    <xsl:template match="remotelink[parent::url][$selectorID='dictionary']">
        <xsl:apply-templates/>
    </xsl:template>
    
</xsl:stylesheet>
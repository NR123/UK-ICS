<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
  
  <!-- Uncomment the below xsl:param while unit testing -->
  <!-- Start: For unit-testing -->
      <!--<xsl:include href="../nonamespace/remotelink.xsl"/>
        <xsl:include href="../nonamespace/emph.xsl"/>-->
    
    <xsl:template match="url">
        <xsl:choose>
            <xsl:when test="$selectorID='journal'">
                <xsl:element name="{name()}">
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="@* | node()"/>        
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
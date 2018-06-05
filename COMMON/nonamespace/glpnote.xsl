<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:glp="http://www.lexis-nexis.com/glp"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:comm="http://www.lexis-nexis.com/glp/comm" exclude-result-prefixes="xs" version="2.0">

    <!-- Uncomment the below xsl:param while unit testing -->
    <!-- Start: For unit-testing -->
    <!--<xsl:include href="../nonamespace/emph.xsl"/>-->
    <!-- End: For unit-testing -->

       
    <!-- Arun: 03May2018 - Added below template to handle glp:note element -->
    
    <xsl:template match="glp:note">
        <xsl:choose>
            <!-- Revathi: 29May2018 - code change for CR by Awntika -->
            <xsl:when test="ancestor::name.text">
                <xsl:apply-templates/>
            </xsl:when>
            <!-- Himanshu: 05June2018 - code change for removing <glp:note> in O/P for CR by Awntika-->
            <xsl:when test="ancestor::comm:body and parent::level">
                <xsl:apply-templates/>
            </xsl:when>
            <!-- end -->
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>       
    </xsl:template>
  
</xsl:stylesheet>

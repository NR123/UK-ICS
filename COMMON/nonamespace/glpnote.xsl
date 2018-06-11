<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:glp="http://www.lexis-nexis.com/glp" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:comm="http://www.lexis-nexis.com/glp/comm" exclude-result-prefixes="xs" version="2.0">

    <!-- Uncomment the below xsl:param while unit testing -->
    <!-- Start: For unit-testing -->
    <!--<xsl:include href="../nonamespace/emph.xsl"/>-->
    <!-- End: For unit-testing -->

       
    <!-- Arun: 03May2018 - Added below template to handle glp:note element -->
    
    <xsl:template match="glp:note">
        <xsl:choose>
            <!-- Revathi: 06June2018 -Commenting the below code to maintain the content as it is in LL file as changing to accomodate current rocket code is causing incorrect data movements -->
            <!-- Revathi: 29May2018 - code change for CR by Awntika -->
            <!-- Revathi: 05June2018 - Included the parent condition check.
            And wherever glp:note is appearing within p/text, removing the glp:note as per the discussion with Awntika as it is creating validation errors/text drops in rocket-->
            <!-- Sunil Kukreti: 11June2018 - Included the parent condition check.
            And wherever footnotegrp is Parent of glp:note then replacing the glp:note to note as per the discussion with Amita as it is creating validation errors/text drops in rocket-->
            <!--<xsl:when test="parent::name.text[parent::person/parent::case:constituent] or self::glp:note/parent::text/parent::p">-->
            <xsl:when test="self::glp:note[not(child::table)][not(parent::case:*)][not(parent::name.text)] and $selectorID='cases'">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="self::glp:note[parent::footnotegrp] and $selectorID='treatises'">
                <note xsl:exclude-result-prefixes="#all">
                    <xsl:apply-templates/>    
                </note>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>       
    </xsl:template>
  
</xsl:stylesheet>

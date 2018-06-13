<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:glp="http://www.lexis-nexis.com/glp" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <!-- Uncomment the below xsl:param while unit testing -->
    <!-- Start: For unit-testing -->
    <!--<xsl:include href="../nonamespace/emph.xsl"/>-->
    <!-- End: For unit-testing -->

    <xsl:template match="person[$selectorID = ('cases','journal')]">
        <!-- Revathi: 06Jun2018 - Commenting the below code as it is creating incorrect data movement/validation errors. -->
        <!-- Revathi: 05June2018 - When glp:note is the only child of case:constituent/person/name.text, then move glp:note outside of case:constituent (as the child of case:constituents) and suppress person/name.text (as we have moved the only child glp:note outside, it will be just empty elements).-->
        <!--<xsl:choose>
            <xsl:when test="self::person[parent::case:constituent]/child::name.text/not(child::node()[name()!='glp:note'])">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>-->
               <xsl:element name="{name()}">
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:element> 
            <!--</xsl:otherwise>
        </xsl:choose>-->        
    </xsl:template>
    
    <xsl:template match="name.text[parent::person][$selectorID = ('cases','journal')]">
        <!-- Revathi: 06Jun2018 - Commenting the below code as it is creating incorrect data movement/validation errors. -->
        <!-- Revathi: 05June2018 - When glp:note is the only child of case:constituent/person/name.text, then move glp:note outside of case:constituent (as the child of case:constituents) and suppress person/name.text (as we have moved the only child glp:note outside, it will be just empty elements).-->
        <!--<xsl:choose>
            <xsl:when test="self::name.text[parent::person/parent::case:constituent]/not(child::node()[name()!='glp:note'])">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>-->
                <xsl:element name="{name()}">
                    <xsl:apply-templates/>
                </xsl:element> 
            <!--</xsl:otherwise>
        </xsl:choose>-->
    </xsl:template>    
    
    <xsl:template match="person/@searchtype">
        <xsl:attribute name="{name()}">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    
</xsl:stylesheet>

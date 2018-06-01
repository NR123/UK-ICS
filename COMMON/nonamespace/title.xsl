<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dict="http://www.lexis-nexis.com/glp/dict"
    xmlns:comm="http://www.lexis-nexis.com/glp/comm"
    xmlns:in="http://www.lexis-nexis.com/glp/in"
    xmlns:docinfo="http://www.lexis-nexis.com/glp/docinfo"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:template match="title[parent::heading/parent::dict:body][not(child::*[name()!='emph'])][$selectorID='dictionary']">
        <xsl:element name="desig" inherit-namespaces="no">
            <xsl:attribute name="value">
                <xsl:value-of select="self::title//text()"/>
            </xsl:attribute>
            <xsl:element name="designum">
                <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="title[parent::heading/parent::in:body][$selectorID='index']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="//in:body/heading/title//text()"/>                       
        </xsl:element>
    </xsl:template>    
    
    <xsl:template match="title[parent::heading/parent::level][$selectorID='journal']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>                       
        </xsl:element>
    </xsl:template>  
    
    <xsl:template match="title | desig | designum | desiglabel">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>                       
        </xsl:element>
    </xsl:template>
    
    <!-- Arun 24May2018 Updated the below code for handling attributes of desig, designum, desiglabel -->
    
    <xsl:template match="desig/@* | designum/@* | desiglabel/@*">
        <xsl:copy/>
    </xsl:template>
    
    <xsl:template match="title[ancestor::comm:body][$selectorID=('precedents','treatises','commentaryleghist')]">
        <xsl:choose>
            <!-- Revathi: 23May2018 - Modified the count check as more than two emph are also appearing in input file  -->
            <xsl:when test="self::title/node()[1]/name()='emph' and self::title/count(child::emph) > 1">
                <desig xsl:exclude-result-prefixes="#all">
                    <xsl:attribute name="value">
                        <!-- Revathi: 29May2018 - (FOR 0PV8) Added the below variable to capture the desig content as the direct passing of parameter to the template "Normalize_id_string" was creating conflicts. -->
                        <xsl:variable name="v_desig" as="xs:string">
                            <xsl:value-of select="self::title/emph[1]//text()"/>
                        </xsl:variable>
                        <xsl:call-template name="Normalize_id_string">
                            <!--<xsl:with-param name="string" select="self::title/emph[1]//text()"/>-->
                            <xsl:with-param name="string" select="$v_desig"/>
                        </xsl:call-template>
                    </xsl:attribute>
                    <designum xsl:exclude-result-prefixes="#all">
                        <xsl:value-of select="self::title/emph[1]//text()"/>
                    </designum>
                </desig>
                <title xsl:exclude-result-prefixes="#all">
                    <!--<!-\- Revathi: 23May2018 - Modified the code as more than two emph are also appearing in input file  -\->
                    <xsl:apply-templates select="self::title/emph[position() > 1]"/>-->
                    <!-- Revathi: Commented the above code and added the below code to ensure that all the nodes inside title are captured. -->
                    <xsl:apply-templates select="self::title/node() except node()[1][name()='emph']"/>
                    <!--<xsl:call-template name="replace">
                        <xsl:with-param name="text" select="self::title/emph[2]//text()"/>
                    </xsl:call-template>-->
                </title>
            </xsl:when>
            <!-- Revathi: 23May2018 - Modified the count check as more than two emph are also appearing in input file  -->
            <xsl:when test="self::title/node()[1]/name()='emph' and  self::title/child::emph/count(child::emph) > 1">
                <xsl:choose>
                    <xsl:when test="self::title/emph/node()[1]/name()!='emph'">
                        <xsl:element name="{name()}">
                            <xsl:apply-templates select="self::title//text()"/>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <desig xsl:exclude-result-prefixes="#all">
                            <!-- DATE: 22 May, 2018 - Modified by Himanshu to resolve text of element <emph>/text() = "2 &amp; 3 Edw 6 c 13" for element <desig>/@value.
                        Attribute @value value of type NMTOKEN must be a name token.
                        Old Code: 
                        <xsl:attribute name="value" select="self::title/emph/emph[1]//text()"/>
                    -->
                            <xsl:attribute name="value">
                                <!--<xsl:choose>
                            <xsl:when test="contains(self::title/emph/emph[1]//text(),' ') and contains(self::title/emph/emph[1]//text(),'&amp;')">
                                <xsl:variable name="DESIGVALUE" select="tokenize(self::title/emph/emph[1]//text(),' ')"/>
                                <xsl:value-of select="$DESIGVALUE[1]"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="self::title/emph/emph[1]//text()"/>
                            </xsl:otherwise>
                        </xsl:choose>-->
                                <!-- Revathi: Commented the above code and added the below to normalise the value -->
                                <!-- Revathi: 29May2018 - (FOR 0PV8) Added the below variable to capture the desig content as the direct passing of parameter to the template "Normalize_id_string" was creating conflicts. -->
                                <xsl:variable name="v_desig" as="xs:string">
                                    <xsl:value-of select="self::title/emph/emph[1]//text()"/>
                                </xsl:variable>
                                <xsl:call-template name="Normalize_id_string">
                                    <!--<xsl:with-param name="string" select="self::title/emph[1]//text()"/>-->
                                    <xsl:with-param name="string" select="$v_desig"/>
                                </xsl:call-template>
                            </xsl:attribute>		
                            <designum xsl:exclude-result-prefixes="#all">
                                <xsl:value-of select="self::title/emph/emph[1]//text()"/>
                            </designum>
                        </desig>
                        <title xsl:exclude-result-prefixes="#all">
                            <!--<!-\- Revathi: 23May2018 - Modified the code as more than two emph are also appearing in input file  -\->
                            <xsl:apply-templates select="self::title/emph/emph[position() > 1]"/>-->
                            <!-- Revathi: Commented the above code and added the below code to ensure that all the nodes inside title are captured. -->
                            <xsl:apply-templates select="self::title/emph/child::node() except self::title/emph/child::node()[1][name()='emph']"/>
                            <!--<xsl:call-template name="replace">
                        <xsl:with-param name="text" select="self::title/emph/emph[2]//text()"/>
                    </xsl:call-template>-->
                        </title>
                    </xsl:otherwise>
                </xsl:choose>                
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:apply-templates select="self::title/node()"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>
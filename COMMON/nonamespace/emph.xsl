<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:dict="http://www.lexis-nexis.com/glp/dict"
    xmlns:glp="http://www.lexis-nexis.com/glp" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:ci="http://www.lexis-nexis.com/ci" xmlns:jrnl="http://www.lexis-nexis.com/glp/jrnl"
    exclude-result-prefixes="xs" version="2.0">


    <xsl:template
        match="emph[ancestor::defterm] | emph[parent::dict:topicname] | emph[parent::remotelink/parent::url][$selectorID = 'dictionary']"
        priority="20">
        <xsl:apply-templates select="@* | node()"/>
    </xsl:template>

    <xsl:template match="emph[child::remotelink][$selectorID = 'dictionary']" priority="20">
        <xsl:apply-templates select="node()"/>
    </xsl:template>

    <xsl:template
        match="emph[ancestor::defterm | child::remotelink | emph[parent::h] | emph[parent::dict:topicname]]/@*[$selectorID = 'dictionary']"
        priority="20"/>

    <xsl:template match="emph[ancestor::heading/parent::dict:body][$selectorID = 'dictionary']">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="emph[@typestyle = 'bf'][$selectorID = 'index']">
        <xsl:choose>
            <xsl:when test="self::emph/parent::remotelink">
                <xsl:apply-templates/>   
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:attribute name="typestyle" select="./@typestyle"/>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>

    <xsl:template
        match="emph[parent::jrnl:articletitle][$selectorID = 'journal'] | emph[parent::name.text][$selectorID = 'journal'] | emph[parent::title][$selectorID = 'journal'] | emph[ancestor::abstract][$selectorID = 'journal']">
        <xsl:apply-templates/>
    </xsl:template>


    <xsl:template match="emph[@typestyle = 'smcaps'][$selectorID = 'index']">
        <xsl:choose>
            <xsl:when test="self::emph[not(child::remotelink)]">
                <emph typestyle="smcaps" xsl:exclude-result-prefixes="#all">
                    <remotelink service="DOC-ID" remotekey1="REFPTID" xsl:exclude-result-prefixes="#all">
                        <xsl:attribute name="refpt">
                            <xsl:variable name="prepend" select="'acronym:HALS-INDEX::term:'"/>
                            <xsl:variable name="remtext" select="self::emph"/>
                            <xsl:value-of
                                select="concat($prepend, translate(upper-case($remtext), ' ', '_'))"/>
                        </xsl:attribute>
                        <xsl:attribute name="docidref" select="'95ed127a-e22e-4234-939e-bf12978c46da'"/>
                        <xsl:attribute name="dpsi" select="'003B'"/>
                        <xsl:attribute name="status" select="'valid'"/>
                        <xsl:apply-templates/>
                    </remotelink>
                </emph>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>

    <xsl:template match="emph">
        <xsl:choose>
            <xsl:when test="self::emph[ancestor::h]">
                <xsl:apply-templates select="node()"/>
            </xsl:when>
            <!-- Revathi: 04May2018 - Added the below condition check -->
            <xsl:when
                test="self::emph[parent::text/node()[1] = self::emph][matches(., '^(\([a-zA-Z0-9]+\)|&#x25cf;|&#x2022;)([\t&#160;]*)')]  and $selectorID = 'journal'">
                
                    <xsl:element name="{name()}">
                        <xsl:analyze-string select="node()[1]"
                            regex="^(\([a-zA-Z0-9]+\)|&#x25cf;|&#x2022;)([\t&#160;]*)">
                            <xsl:non-matching-substring>
                                <xsl:call-template name="replace">
                                    <xsl:with-param name="text" select="."/>
                                </xsl:call-template>
                            </xsl:non-matching-substring>
                        </xsl:analyze-string>
                        <xsl:apply-templates select="node() except node()[1]"/>
                    </xsl:element>
                
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <!-- Revathi: 04May2018 - Commented out the below code and added this as a condition in generic emph template -->
    <!-- <xsl:template match="emph[parent::text/node()[1]=self::emph] [matches(self::emph,'^(\([a-zA-Z0-9]+\)|&#x25cf;|&#x2022;)([\t&#160;]*)')]"/>-->


    <xsl:template match="emph/@*">
        <xsl:copy/>
    </xsl:template>
    
    <!-- DAYANAND SINGH: 10May2018-->
    
    <!--<xsl:template match="emph[parent::h]">
        <xsl:element name="emph">
            <xsl:apply-templates select="node()|@*"/>
        </xsl:element>
    </xsl:template>-->
    <!-- Revathi: 11May2018 - Commented out the above code as whenever emph is occuring inside h element, we need to suppress the emph tag and retain its PCDATA inside h-->
    

</xsl:stylesheet>

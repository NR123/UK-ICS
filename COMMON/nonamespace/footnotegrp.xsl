<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="footnotegrp">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
        <xsl:apply-templates select="self::footnotegrp//fnbody/page"/>
    </xsl:template>

    <xsl:template match="footnote | fnbody">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template name="fntoken">
        <xsl:param name="fnlabel_footnote"/>
        <xsl:choose>
            <xsl:when test="//sup[self::sup/text()=$fnlabel_footnote][ancestor::fnbody]">
                <xsl:apply-templates select="//sup[self::sup/text()=$fnlabel_footnote][ancestor::fnbody]" mode="footnote"/> 
            </xsl:when>
            <!-- Revathi: 04May2018 - Ususally fnlabel is identified by the element sup being first child of footnote//p/text.
                But in some files fnlabel content is present as starting content of the p/text PCDATA. So added below condition to capture it correctly -->
            <xsl:when test="//fnbody/p/text[substring-before(self::text/node()[1],' ')=$fnlabel_footnote]">
                <xsl:apply-templates select="//fnbody/p/text[substring-before(self::text/node()[1],' ')=$fnlabel_footnote]" mode="footnote"/> 
            </xsl:when>
        </xsl:choose>
        <!-- Revathi: 04May2018 - Commented the below code and added the above code -->
        <!--<xsl:apply-templates select="//sup[self::sup/text()=$fnlabel_footnote][ancestor::fnbody]" mode="footnote"/> -->
       
    </xsl:template>
    
    <xsl:template name="fnrtoken">
        <xsl:param name="fnlabel_footnote"/>          
        <xsl:apply-templates select="//sup[self::sup/text()=$fnlabel_footnote][not(ancestor::fnbody)]" mode="footnote"/>        
    </xsl:template>
    
    <!-- Revathi: 04May2018 - Added a condition check -->
    <xsl:template match="//sup | //fnbody/p/text" mode="footnote">
        <xsl:value-of select="generate-id()"/>
    </xsl:template>

    <xsl:template match="p[parent::fnbody]">
        <footnote type="editorial">
            <xsl:attribute name="fntoken">
                <xsl:variable name="v_fnlabel">
                    <xsl:choose>
                        <xsl:when test="self::p/text/sup/text()">
                            <xsl:value-of select="self::p/text/sup/text()"/>
                        </xsl:when>
                        <!-- Revathi: 04May2018 - Added the below code to handle variations of fnlabel content -->
                        <xsl:when test="name(self::p/text/node()[1])='' and matches(substring-before(self::p/text/node()[1],' '),'[0-9]+[\s]?')">
                            <xsl:value-of select="substring-before(self::p/text/node()[1],' ')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:variable>
                
                <xsl:choose>
                    <xsl:when test="$v_fnlabel!=''">
                        <xsl:call-template name="fntoken">
                            <xsl:with-param name="fnlabel_footnote" select="$v_fnlabel"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="generate-id(ancestor::footnote)"/>
                    </xsl:otherwise>
                </xsl:choose>             
            </xsl:attribute>
            
            <xsl:variable name="fnrval">
                <xsl:call-template name="fnrtoken">
                    <xsl:with-param name="fnlabel_footnote">
                        <xsl:choose>
                            <xsl:when test="self::p/text/sup/text()">
                                <xsl:value-of select="self::p/text/sup/text()"/>
                            </xsl:when>
                            <xsl:when test="name(self::p/text/node()[1])='' and matches(substring-before(self::p/text/node()[1],' '),'[0-9]+[\s]?')">
                                <xsl:value-of select="substring-before(self::p/text/node()[1],' ')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
            
            <xsl:if test="$fnrval!=''">
                <xsl:attribute name="fnrtokens" select="$fnrval"/>
            </xsl:if>
            
            <!-- Revathi: 04May2018 - Ususally fnlabel is identified by the element sup being first child of footnote//p/text.
                But in some files fnlabel content is present as starting content of the p/text PCDATA. So added below condition to capture it correctly -->
            <xsl:choose>
                <xsl:when test="self::p/text/*[1][name() = 'sup']">                
                    <fnlabel>
                        <xsl:apply-templates select="self::p/text/sup[1]/node()"/>
                    </fnlabel>
                </xsl:when>
                <xsl:when test="matches(substring-before(self::p/text/node()[1],' '),'^[0-9]+')">
                    <fnlabel>
                        <xsl:value-of select="substring-before(self::p/text/node()[1],' ')"/>
                    </fnlabel>
                </xsl:when>
            </xsl:choose>
            
            <!-- Revathi: 04May2018 - Commented the below code and added the above code -->
            
            <!-- <xsl:if test="self::p/text/*[1][name() = 'sup']">                
                <fnlabel>
                    <xsl:apply-templates select="self::p/text/sup[1]/node()"/>
                </fnlabel>
            </xsl:if>-->
            <fnbody>
                <p>
                    <xsl:apply-templates/>                    
                </p>
            </fnbody>
        </footnote>
    </xsl:template>  
    
    <!-- Revathi: Commented the below code and added the text as a condition in sup.xsl -->
    <!--<xsl:template match="sup[preceding-sibling::sup][parent::text/parent::p/parent::fnbody]">
        <xsl:apply-templates/>
    </xsl:template>-->

<!-- Revathi: Commented the below code and added the text as a condition in text.xsl -->
   <!-- <xsl:template match="text[parent::p/parent::fnbody]">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="node() except (sup[1], page)"/>
        </xsl:element>
    </xsl:template>-->
</xsl:stylesheet>

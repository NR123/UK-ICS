<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:glp="http://www.lexis-nexis.com/glp" xmlns:case="http://www.lexis-nexis.com/glp/case" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="p">
        <xsl:choose>
            <!-- Revathi: 29May2018 - code change for CR by Awntika -->
            <!-- Revathi: 05June2018 - Commenting the below code as the new requirement is,
            When glp:note is the only child of case:constituent/person/name.text, then move glp:note outside of case:constituent (as the child of case:constituents) and suppress person/name.text (as we have moved the only child glp:note outside, it will be just empty elements).-->
            <!--<xsl:when test="ancestor::name.text">
                <xsl:apply-templates/>
            </xsl:when>-->
            <!-- Revathi: 08Jun2018 - Suppress blockquote's child elements p/text whenever blockquote is having parent as glp:note:- as per the discussion with Awntika as it is creating validation errors/text drops in rocket-->
            <xsl:when test="self::p/parent::blockquote/parent::glp:note[not(parent::case:*)][not(parent::name.text)][$selectorID='cases']">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when
                test="self::p/child::text/not(child::node())[$selectorID = 'cases' and $docinfo.selector = 'PracticeDirection']"/>

            <xsl:when test="self::p/not(child::node())[$selectorID = 'journal']"/>

            <xsl:when test="self::p[child::text[@align = 'center']] and $selectorID = 'journal'">
                <xsl:variable name="starcheck" select="."/>
                <xsl:choose>
                    <xsl:when test="matches($starcheck, '\*\s*\*\s*\*')">
                        <xsl:apply-templates select="self::p" mode="p_suppress"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <!-- Revathi: 04May2018 - Added selectorID as it is appropriate for journals content type only -->
            <xsl:when
                test="child::text/node()[1][name() = ('emph', '')] and matches(child::text/node()[1], '^(\([a-zA-Z0-9]+\)|&#x25cf;|&#x2022;)([\t&#160;]*)') and $selectorID = 'journal'">
                <xsl:element name="{name()}">
                    <!-- <pnum>
                        <xsl:apply-templates select="child::text/node()[1]/node()"/>
                    </pnum>
                    <xsl:apply-templates select="@* | node()"/>-->
                    <!-- Revathi - 04MAy2018 - Commented the above code and added the below code to correctly capture pnum -->
                    <xsl:analyze-string select="child::text/node()[1]"
                        regex="^(\([a-zA-Z0-9]+\)|&#x25cf;|&#x2022;)([\t&#160;]*)">
                        <xsl:matching-substring>
                            <pnum xsl:exclude-result-prefixes="#all">
                                <xsl:call-template name="replace">
                                    <xsl:with-param name="text" select="."/>
                                </xsl:call-template>
                            </pnum>
                        </xsl:matching-substring>
                    </xsl:analyze-string>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <!-- Revathi: When p is having edpnum as child element, then the following sibling pgrp's first p's text element should be moved as the child element of this p -->
            <xsl:when test="self::p/node()[1]/name() = 'edpnum'">
                <xsl:element name="{name()}">
                    <xsl:apply-templates/>
                        <xsl:apply-templates select="following-sibling::node()[1][name()='pgrp']/node()[1][name()='p']/text"/>
                </xsl:element>
            </xsl:when>
            <!-- Revathi: 29May2018 - Added the condition self::p/not(preceding-sibling::node()) as in some cases the first p of pgrp and following siblings p has same PCDATA. 
                In that case text drop is happening. So this condition is added to ensure that the current p is the first node of pgrp-->
            <xsl:when
                test="self::p[parent::pgrp/node()[1]=self::p and self::p/not(preceding-sibling::node()) and parent::pgrp/preceding-sibling::node()[1][name()='p']/child::edpnum]"/>            
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:element>         
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <xsl:template match="//p" mode="p_suppress"/>

</xsl:stylesheet>

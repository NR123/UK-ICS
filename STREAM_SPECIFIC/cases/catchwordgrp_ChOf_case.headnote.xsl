<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:ci="http://www.lexis-nexis.com/ci" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="catchwordgrp[parent::case:headnote]">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="catchwords[parent::catchwordgrp/parent::case:headnote]">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="catchphrase[ancestor::catchwordgrp/parent::case:headnote]">
        <xsl:variable name="text_to_process">
            <xsl:choose>
                <xsl:when test="child::ci:cite">
                    <xsl:value-of select="self::catchphrase/text()[1]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:call-template name="catchphrase_split">
            <xsl:with-param name="text" select="$text_to_process"/>
        </xsl:call-template>
        <xsl:apply-templates select="self::catchphrase/ci:cite" mode="catchphrase"/>
    </xsl:template>

    <xsl:template name="catchphrase_split">
        <xsl:param name="text" select="."/>
        <xsl:param name="delimiter">&#x2013;</xsl:param>

        <!-- To check whether the end of catchphrase has been reached. As the end content is not ended with &#x2013;, we need to handle it. -->
        <xsl:variable name="test_for_last_value">
            <xsl:choose>
                <xsl:when test="contains(substring-after($text, $delimiter), $delimiter)">
                    <xsl:value-of select="'no'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'yes'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="normalize-space(substring-before($text, $delimiter)) != ''">
            
                <xsl:choose>
                    <!-- When more delimiter is present, process the text before the delimiter -->
                    <xsl:when test="$test_for_last_value = 'no'">
                        <catchphrase>
                        <xsl:call-template name="replace">
                            <xsl:with-param name="text"
                                select="normalize-space(substring-before($text, $delimiter))"/>
                        </xsl:call-template>
                        </catchphrase>
                    </xsl:when>
                    <!-- When it is the last delimiter and no more delimiter is present, then process both before and after contents of delimiter -->
                    <xsl:when test="$test_for_last_value = 'yes'">
                        <catchphrase>
                        <xsl:call-template name="replace">
                            <xsl:with-param name="text"
                                select="normalize-space(substring-before($text, $delimiter))"/>
                        </xsl:call-template>
                        </catchphrase>
                        <catchphrase>
                        <xsl:call-template name="replace">
                            <xsl:with-param name="text"
                                select="normalize-space(substring-after($text, $delimiter))"/>
                        </xsl:call-template>
                        </catchphrase>
                    </xsl:when>
                </xsl:choose>

            
        </xsl:if>
        <xsl:if test="normalize-space(substring-after($text, $delimiter)) != ''">
            <xsl:call-template name="catchphrase_split">
                <xsl:with-param name="text" select="substring-after($text, $delimiter)"/>
            </xsl:call-template>
        </xsl:if>

    </xsl:template>


    <xsl:template match="ci:cite[parent::catchphrase/ancestor::catchwordgrp/parent::case:headnote]"/>

    <xsl:template match="ci:cite[parent::catchphrase]" mode="catchphrase">
        <catchphrase>
            <xsl:value-of
                select="normalize-space(concat(self::ci:cite//ci:content//text(), translate(following-sibling::node()[1][./name() = ''], '&#x2013;', '')))"
            />
        </catchphrase>
    </xsl:template>

</xsl:stylesheet>

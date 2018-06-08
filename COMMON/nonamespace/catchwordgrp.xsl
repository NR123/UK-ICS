<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:dig="http://www.lexis-nexis.com/glp/dig"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:ci="http://www.lexis-nexis.com/ci" exclude-result-prefixes="xs" version="2.0">
    
    <!-- Dayanand singh 04 June 2018 -->

    <xsl:template match="catchwordgrp[parent::dig:info]">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="catchwords">
        <xsl:element name="{name()}">
            <xsl:variable name="text_to_process" select="."/>
            
                <xsl:call-template name="catchphrase_split">
                    <xsl:with-param name="text" select="$text_to_process"/>
                    <xsl:with-param name="delimiter">
                        <xsl:choose>
                            <xsl:when test="contains($text_to_process,'&#x2014;')">
                                <xsl:text>&#x2014;</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($text_to_process,'&#x2013;')">
                                <xsl:text>&#x2013;</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($text_to_process,'-')">
                                <xsl:text>-</xsl:text>
                            </xsl:when>
                            
                        </xsl:choose>
                    </xsl:with-param>
                </xsl:call-template>
            
           </xsl:element>
        
    </xsl:template>

    <xsl:template name="catchphrase_split">
        <xsl:param name="text" select="."/>       
        <!--<xsl:param name="delimiter">&#x2014;</xsl:param>-->
        <xsl:param name="delimiter" select="."/>
        
        <xsl:choose>
            <xsl:when test="$delimiter!=''">
                <!-- To check whether the end of catchphrase has been reached. As the end content is not ended with the same delimiter, we need to handle it. -->
                <xsl:variable name="test_for_last_value">
                    <xsl:choose>
                        <xsl:when test="contains(substring-after($text, $delimiter), $delimiter)">
                            <!-- It is not the last delimiter -->
                            <xsl:value-of select="'no'"/>
                        </xsl:when>
                        
                        <xsl:otherwise>
                            <!-- End of the delimiter series has been reached -->
                            <xsl:value-of select="'yes'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:if test="normalize-space(substring-before($text, $delimiter)) != ''">
                    
                    <xsl:choose>
                        <xsl:when test="$test_for_last_value = 'no'">
                            <catchphrase xsl:exclude-result-prefixes="#all">
                                <xsl:call-template name="replace">
                                    <xsl:with-param name="text"
                                        select="normalize-space(substring-before($text, $delimiter))"/>
                                </xsl:call-template>
                            </catchphrase>
                        </xsl:when>
                        
                        <xsl:when test="$test_for_last_value = 'yes'">
                            <catchphrase xsl:exclude-result-prefixes="#all">
                                <xsl:call-template name="replace">
                                    <xsl:with-param name="text"
                                        select="normalize-space(substring-before($text, $delimiter))"/>
                                </xsl:call-template>
                            </catchphrase>
                            <catchphrase xsl:exclude-result-prefixes="#all">
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
                        <xsl:with-param name="delimiter" select="$delimiter"/>
                    </xsl:call-template>
                </xsl:if> 
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="catchphrase">
                    <xsl:call-template name="replace">
                        <xsl:with-param name="text"
                            select="normalize-space(substring-after($text, $delimiter))"/>
                    </xsl:call-template>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>

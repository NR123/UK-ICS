<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">


    <xsl:template match="text" name="text">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@*"/>
            <xsl:choose>
                <xsl:when test="ancestor::li/child::*[1][name() != 'blockquote']">
                    <xsl:choose>
                        <xsl:when
                            test="self::text/node()[1]/name() = '' and self::text/node()[1] != '('">
                            <xsl:analyze-string select="self::text/text()[1]"
                                regex="^(\([a-zA-Z0-9]+\)|●|&#x25cf;|&#x2022;)([\t ]*)">
                                <xsl:non-matching-substring>
                                    <xsl:call-template name="replace">
                                        <xsl:with-param name="text"
                                            select="replace(replace(., '^\s*(.+?)\s*$', '$1'), '^ .*$', '')"
                                        />
                                    </xsl:call-template>
                                </xsl:non-matching-substring>
                            </xsl:analyze-string>
                            <xsl:apply-templates select="node() except text()[1]"/>
                        </xsl:when>
                        <xsl:when
                            test="self::text/node()[1]/name() = '' and self::text/node()[1] = '(' and self::text/node()[2]/name() = 'emph' and self::text/node()[3]/matches(., '[a-zA-Z0-9]{1,}') and self::text/node()[3]/starts-with(., ')')">
                            <xsl:analyze-string select="self::text/node()[3]"
                                regex="(\)[\s|&#160;]+)">
                                <xsl:non-matching-substring>
                                    <xsl:call-template name="replace">
                                        <xsl:with-param name="text" select="."/>
                                    </xsl:call-template>
                                </xsl:non-matching-substring>
                            </xsl:analyze-string>
                        </xsl:when>
                        <xsl:when test="self::text/node()[1]/name() = ''">
                            <xsl:analyze-string select="self::text/text()[1]"
                                regex="^(\([a-zA-Z0-9]+\)|&#x25cf;)([\t&#160;]*)">
                                <xsl:non-matching-substring>
                                    <xsl:call-template name="replace">
                                        <xsl:with-param name="text"
                                            select="replace(replace(., '^\s*(.+?)\s*$', '$1'), '^ .*$', '')"
                                        />
                                    </xsl:call-template>
                                </xsl:non-matching-substring>
                            </xsl:analyze-string>
                            <xsl:apply-templates select="node() except text()[1]"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="self::text[parent::p/parent::fnbody]">
                    <xsl:choose>
                        <xsl:when
                            test="name(self::text/node()[1]) = '' and matches(substring-before(self::text/node()[1], ' '), '^[0-9]+')">
                            <xsl:analyze-string select="self::text/node()[1]"
                                regex="(^[0-9]+)[\s]+([\w\W]+)">
                               
                                <xsl:matching-substring>
                                    <xsl:choose>
                                        <xsl:when test="regex-group(2) != ''">
                                            <xsl:call-template name="replace">
                                                <xsl:with-param name="text" select="regex-group(2)"
                                                />
                                            </xsl:call-template>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:matching-substring>
                            </xsl:analyze-string>
                            <xsl:apply-templates select="node() except text()[1]"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="node() except (sup[1], page)"/>
                        </xsl:otherwise>
                    </xsl:choose>


                </xsl:when>
                <!-- Revathi: 04May2018 - Added the below code to handle the content apart from pnum content.-->
                <xsl:when
                    test="self::text/node()[1][name() = ''] and matches(self::text/node()[1], '^(\([a-zA-Z0-9]+\)|&#x25cf;|&#x2022;)([\t&#160;]*)')  and $selectorID = 'journal'">
                    <xsl:element name="{name()}">
                        <xsl:analyze-string select="self::text/node()[1]"
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
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">


    <xsl:template match="text" name="text">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@*"/>
            <xsl:choose>
                <xsl:when test="ancestor::li/child::*[1][name() != 'blockquote']">
                    <xsl:choose>
                        <!-- Revathi: Added the below condition - when lilabel already has PCDATA then p/text should be handled as it is. -->
                        <xsl:when test="ancestor::li/child::lilabel/child::node() and ancestor::li/child::lilabel[not(matches(.,'[\s|&#160;]+'))]">
                            <xsl:apply-templates/>
                        </xsl:when>
                        <xsl:when
                            test="self::text/node()[1]/name() = '' and self::text/node()[1] != '('">
                            <!--<xsl:analyze-string select="self::text/text()[1]"
                                regex="^(\(?[a-zA-Z0-9]+\)?\.?|●|&#x25cf;|&#x2022;)([\t ]*)">-->
                            <!--<xsl:analyze-string select="self::text/text()[1]"
                                regex="(^\(?([0-9]*[a-zA-Z]{{1,2}}|[0-9]+)\.?\)?\.?)(\s|&#160;){{1,}}">-->
                            <!-- Arun- 22May2018 Updated the below code to handle ● and special characters before lilabel content -->
                             <xsl:analyze-string select="self::text/text()[1]"
                                 regex="(^●|^&#x25cf;|^&#x2022;|^\W*\(?([0-9\.]*[a-zA-Z]{{1,2}}[0-9\.]*|[0-9\.]+|XC|XL|L?X{{0,3}}|IX|IV|V?I{{0,3}}|xc|xl|l?x{{0,3}}|ix|iv|v?i{{0,3}})\.?\)?\.?)(\s|&#160;){{1,}}">
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
                        <!-- Revathi: The below condition is to identify the lilabel content which is occuring in the pattern '(<emph typestyle="it">b</emph>)' inside li/p/text -->
                        <xsl:when
                            test="self::text/node()[1]/name() = '' and self::text/node()[1] = '(' and self::text/node()[2]/name() = 'emph' and self::text/node()[3]/matches(., '[a-zA-Z0-9]{1,}') and self::text/node()[3]/starts-with(., ')')">
                           <!-- <xsl:analyze-string select="self::text/node()[3]"
                                regex="(^\)[\s|&#160;]+)">
                                <xsl:non-matching-substring>
                                    <xsl:call-template name="replace">
                                        <xsl:with-param name="text" select="."/>
                                    </xsl:call-template>
                                </xsl:non-matching-substring>
                            </xsl:analyze-string>-->
                            <xsl:analyze-string select="self::text/node()[3]"
                                regex="(^\)\.?[\s|&#160;]*)([\w\W]*)">
                                <xsl:matching-substring>
                                    <xsl:call-template name="replace">
                                        <xsl:with-param name="text" select="regex-group(2)"/>
                                    </xsl:call-template>
                                </xsl:matching-substring>
                            </xsl:analyze-string>
                            <!--Revathi: 08May2018 - To handle the remaining nodes except for the lilabel content -->
                            <xsl:apply-templates select="node()[position()>3]"/>
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
                <!--<xsl:when test="self::text[parent::p/parent::fnbody]">
                    <xsl:choose>
                        <!-\- Revathi: 08May2018 - Added &#160;(non-breaking-space) to the regex match -\->
                        <xsl:when
                            test="name(self::text/node()[1]) = '' and matches(self::text/node()[1], '(^\(?[0-9a-zA-Z]+\.?\)?)[\s|&#160;]+')">
                            <xsl:analyze-string select="self::text/node()[1]"
                                regex="(^\(?[0-9a-zA-Z]+\.?\)?)[\s|&#160;]+([\w\W]+)">
                               
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


                </xsl:when>-->
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
    
    <xsl:template match="text/@align">
        <xsl:attribute name="{name()}">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>

</xsl:stylesheet>

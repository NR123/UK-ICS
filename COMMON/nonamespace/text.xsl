<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- Uncomment the below xsl:param while unit testing -->
    <!-- Start: For unit-testing -->
    <!--<xsl:include href="default.xsl"/>
    <xsl:param name="selectorID" select="'dictionary'"/>-->
    <!-- End: For unit-testing -->
    
    <xsl:template match="text" name="text">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@*"/>
            <xsl:choose>
                <xsl:when test="ancestor::li/child::*[1][name()!='blockquote']">                    
                    <xsl:choose>
                        <xsl:when test="self::text/node()[1]/name()='' and self::text/node()[1]!='('">                            
                            <xsl:analyze-string select="self::text/text()[1]" regex="^(\([a-zA-Z0-9]+\)|●|&#x25cf;|&#x2022;)([\t ]*)">
                                <xsl:non-matching-substring>
                                    <xsl:call-template name="replace">
                                        <xsl:with-param name="text"
                                            select="replace(replace(., '^\s*(.+?)\s*$', '$1'), '^ .*$', '')"/>
                                    </xsl:call-template>
                                </xsl:non-matching-substring>
                            </xsl:analyze-string>
                            <xsl:apply-templates select="node() except text()[1]"/>
                        </xsl:when>
                        <xsl:when test="self::text/node()[1]/name()='' and self::text/node()[1]='(' and self::text/node()[2]/name()='emph' and self::text/node()[3]/matches(.,'[a-zA-Z0-9]{1,}') and self::text/node()[3]/starts-with(.,')')">
                            <xsl:analyze-string select="self::text/node()[3]" regex="(\)[\s|&#160;]+)">
                                <xsl:non-matching-substring>
                                    <xsl:call-template name="replace">
                                        <xsl:with-param name="text"
                                            select="."/>
                                    </xsl:call-template>
                                </xsl:non-matching-substring>
                            </xsl:analyze-string>
                        </xsl:when>
                        <xsl:when test="self::text/node()[1]/name()=''">                            
                            <xsl:analyze-string select="self::text/text()[1]" regex="^(\([a-zA-Z0-9]+\)|&#x25cf;)([\t&#160;]*)">                       
                                <xsl:non-matching-substring>  
                                    <xsl:call-template name="replace">
                                        <xsl:with-param name="text" select="replace(replace(., '^\s*(.+?)\s*$', '$1'), '^ .*$', '')"></xsl:with-param>
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
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>
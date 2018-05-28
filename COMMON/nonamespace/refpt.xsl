<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:in="http://www.lexis-nexis.com/glp/in"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">


    
    <xsl:template match="refpt[$selectorID='dictionary']">
        <xsl:element name="{name()}" inherit-namespaces="no">
            <xsl:attribute name="type" select="./@type"/>
            <xsl:choose>
                <xsl:when test="$selectorID = 'dictionary'">
                    <xsl:attribute name="id">
                        <xsl:call-template name="fn_refpt">
                            <xsl:with-param name="id" select="./@id"/>
                        </xsl:call-template>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="id" select="./@id"/>
                </xsl:otherwise>
            </xsl:choose>

        </xsl:element>
    </xsl:template>
    
    
    <xsl:template match="refpt[$selectorID='index']">
        <xsl:element name="{name()}">
            <xsl:attribute name="id">
                <xsl:call-template name="fn_refpt">
                    <xsl:with-param name="id" select="./@id"/>
                </xsl:call-template>
            </xsl:attribute>            
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="refpt[$selectorID=('precedents','treatises','commentaryleghist')]">
        <xsl:element name="{name()}">
            <xsl:attribute name="id">
                <xsl:call-template name="fn_refpt">
                    <xsl:with-param name="id" select="./@id"/>
                </xsl:call-template>
            </xsl:attribute>            
        </xsl:element>
    </xsl:template>

    <xsl:template name="fn_refpt">
        <xsl:param name="id"/>
        <xsl:choose>
            <xsl:when test="self::refpt[$selectorID='dictionary']">
                <xsl:analyze-string select="$id" regex="(0KMN_[0-9]+_[A-Z]+_)([\w_]+)(:HTDICT-TERM)">
                    <xsl:matching-substring>
                        <xsl:value-of select="concat('acronym:WPLD::term:', regex-group(2))"/>
                    </xsl:matching-substring>
<!-- Dayanand singh, 22 May 2018, changed to fetch non-matcheing id attribute value. -->
                    <xsl:non-matching-substring>
                        <xsl:value-of select="."/>
                    </xsl:non-matching-substring>
                </xsl:analyze-string>
            </xsl:when>
            <xsl:when test="self::refpt[$selectorID='index']">
               <!-- <xsl:choose>
                    <xsl:when test="matches(self::refpt/node()[1], '([\w]{4}_[0-9]+_[A-Z]+_)([\w_]+)(:HTCOMM-INDEXID)')">
                        <xsl:analyze-string select="$id" regex="([\w]{{4}}_[0-9]+_[A-Z]+_)([\w_]+)(:HTCOMM-INDEXID)">
                            <xsl:matching-substring>
                                <xsl:value-of select="concat('acronym:HALS-INDEX::term:', regex-group(2))"/>
                            </xsl:matching-substring>
                        </xsl:analyze-string>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$id"/>
                    </xsl:otherwise>
                </xsl:choose> --> 
                <xsl:variable name="v_normalize">
                    <xsl:call-template name="Normalize_id_string">
                        <xsl:with-param name="string" select="self::refpt/following-sibling::node()"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:value-of select="concat('acronym:HALS-INDEX::term:',$v_normalize)"/>
            </xsl:when>
            <xsl:when test="self::remotelink[$selectorID='index']">
                <xsl:attribute name="refpt">
                    <xsl:variable name="prepend" select="'acronym:HALS::'"/>
                    <xsl:variable name="volume">
                        <xsl:variable name="v_getvalue">
                            <xsl:analyze-string
                                select="$id"
                                regex="(([0-9][0-9a-z]{{3}}_[0-9]+_([0-9a-zA-Z_]+)):[\w]+-VOL)(_([\w]+):[\w]+-PARA)">
                                <xsl:matching-substring>
                                    <xsl:value-of select="regex-group(3)"/>                                    
                                </xsl:matching-substring>
                            </xsl:analyze-string>                          
                        </xsl:variable>
                        <xsl:value-of
                            select="concat('volume:', normalize-space($v_getvalue))"
                        />
                    </xsl:variable>
                    <xsl:variable name="paragraph">
                        <xsl:variable name="v_getvalue">
                            <xsl:analyze-string
                                select="$id"
                                regex="(([0-9][0-9a-z]{{3}}_[0-9]+_([0-9a-zA-Z_]+)):[\w]+-VOL)(_([\w]+):[\w]+-PARA)">
                                <xsl:matching-substring>
                                    <xsl:value-of select="regex-group(5)"/>
                                </xsl:matching-substring>
                            </xsl:analyze-string>
                        </xsl:variable>
                        <xsl:value-of
                            select="concat('paragraph:', normalize-space($v_getvalue))"
                        />
                    </xsl:variable>
                    
                    <!-- attribute @refpt value -->
                    <xsl:value-of
                        select="concat($prepend,$volume,'::',$paragraph)"
                    />
                </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$id"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>

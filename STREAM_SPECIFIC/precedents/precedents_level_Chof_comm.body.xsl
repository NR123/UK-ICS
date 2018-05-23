<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:comm="http://www.lexis-nexis.com/glp/comm" xmlns:jrnl="http://www.lexis-nexis.com/glp/jrnl" 
    xmlns:leg="http://www.lexis-nexis.com/glp/leg" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="level[ancestor::comm:body][$selectorID=('precedents','treatises','commentaryleghist')]">
        <xsl:variable name="v_leveltype">
            <xsl:choose>               
                <xsl:when test="self::level[@leveltype=('comm32','comm33')]">
                    <xsl:value-of select="'subsection'"/>
                </xsl:when>
                <!-- Revathi: This is the temporary code to match all the level types. Awaiting clarification on the @leveltype -->
                <xsl:when test="matches(@leveltype,'comm[0-9]+')">
                    <xsl:value-of select="'section'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="self::level/heading/@searchtype='LEGISLATION'">
                <xsl:element name="{name()}">
                    <bodytext xsl:exclude-result-prefixes="#all">
                        <legfragment xsl:exclude-result-prefixes="#all">
                            <leg:level xsl:exclude-result-prefixes="#all">
                                <leg:level-vrnt leveltype="{$v_leveltype}" xsl:exclude-result-prefixes="#all">
                                    <xsl:apply-templates/>
                                </leg:level-vrnt>
                            </leg:level>
                        </legfragment>
                    </bodytext>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:attribute name="leveltype" select="$v_leveltype"/>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>   
    
    <xsl:template match="level[ancestor::comm:body][$selectorID=('precedents','treatises','commentaryleghist')]/@*"/>
    
</xsl:stylesheet>

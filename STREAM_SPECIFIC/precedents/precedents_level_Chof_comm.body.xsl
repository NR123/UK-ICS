<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:comm="http://www.lexis-nexis.com/glp/comm" xmlns:jrnl="http://www.lexis-nexis.com/glp/jrnl" 
    xmlns:leg="http://www.lexis-nexis.com/glp/leg" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="level[ancestor::comm:body][$selectorID=('precedents','treatises','commentaryleghist','FormsAndPrecedents')]">
        <xsl:variable name="v_leveltype">
            <!-- Revathi: Commented the below code as per the clarification received on 28May2018 - We need to retain the @leveltype as it is in LL input files. -->
            <!--<xsl:choose>               
                <xsl:when test="self::level[@leveltype=('comm32','comm33')]">
                    <xsl:value-of select="'subsection'"/>
                </xsl:when>
                <!-\- Revathi: This is the temporary code to match all the level types. Awaiting clarification on the @leveltype -\->
                <xsl:when test="matches(@leveltype,'comm[0-9]+')">
                    <xsl:value-of select="'section'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="self::level/@leveltype"/>
                </xsl:otherwise>
            </xsl:choose>-->
            <xsl:value-of select="self::level/@leveltype"/>
        </xsl:variable>
        <!-- Revathi: Whenever the level is having heading/@searchtype as LEGISLATION, then we need to create level/bodytext/leg:level/leg:level-vrnt corresponding to the level in the input -->
        <xsl:choose>
            <!-- Revathi: 30May2018 - Changed as per the clarification got from Awntika as legfragment element is not handled in rocket xslt, need to drop this change for precedents. -->
            <xsl:when test="self::level/heading/@searchtype='LEGISLATION' and not($selectorID = 'precedents')">
                <xsl:choose>
                    <!-- Revathi: To check whether there are any ancestor level with @searchtype='LEGISLATION'.
                    If present, then should create leg:level/leg:level-vrnt only corresponding to the level in the input-->
                    <xsl:when test="not(ancestor::level/child::heading/@searchtype='LEGISLATION')">
                        <xsl:element name="{name()}">
                            <bodytext xsl:exclude-result-prefixes="#all">
                                <legfragment xsl:exclude-result-prefixes="#all">
                                    <leg:level xsl:exclude-result-prefixes="#all">
                                        <leg:level-vrnt leveltype="{$v_leveltype}" xsl:exclude-result-prefixes="#all">
                                            <xsl:apply-templates select="heading"/>
                                            <leg:levelbody xsl:exclude-result-prefixes="#all">
                                                <leg:bodytext xsl:exclude-result-prefixes="#all">
                                                    <xsl:apply-templates select="node() except (heading,level)"/>
                                                </leg:bodytext>
                                                <xsl:apply-templates select="level"/>
                                            </leg:levelbody>
                                        </leg:level-vrnt>
                                    </leg:level>
                                </legfragment>
                            </bodytext>
                        </xsl:element>
                    </xsl:when>
                    <!-- Otherwise, if there is no ancestor level with @searchtype='LEGISLATION', then create level/bodytext/leg:level/leg:level-vrnt corresponding to the level in the input -->
                    <xsl:otherwise>
                        <leg:level xsl:exclude-result-prefixes="#all">
                            <leg:level-vrnt leveltype="{$v_leveltype}" xsl:exclude-result-prefixes="#all">
                                <xsl:apply-templates select="heading"/>
                                <leg:levelbody xsl:exclude-result-prefixes="#all">
                                    <leg:bodytext xsl:exclude-result-prefixes="#all">
                                        <xsl:apply-templates select="node() except (heading,level)"/>
                                    </leg:bodytext>
                                    <xsl:apply-templates select="level"/>
                                </leg:levelbody>
                            </leg:level-vrnt>
                        </leg:level>
                    </xsl:otherwise>
                </xsl:choose>
                
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:attribute name="leveltype" select="$v_leveltype"/>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>   
    
    <xsl:template match="level[ancestor::comm:body][$selectorID=('precedents','treatises','commentaryleghist','FormsAndPrecedents')]/@*"/>
    
</xsl:stylesheet>

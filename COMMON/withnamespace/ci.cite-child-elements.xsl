<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:glp="http://www.lexis-nexis.com/glp" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dig="http://www.lexis-nexis.com/glp/dig" xmlns:ci="http://www.lexis-nexis.com/ci" xmlns:case="http://www.lexis-nexis.com/glp/case"
    exclude-result-prefixes="xs" version="2.0">


    <xsl:template match="ci:*">

        <xsl:choose>
            <xsl:when
                test="self::ci:cite[matches(child::ci:content, '^&#x2013;[0-9]+')][$selectorID='dictionary'] or self::ci:cite/ancestor::glp:note/preceding-sibling::*[1][name()='case:disposition'][$selectorID='cases' and $docinfo.selector='Transcript']">
                <xsl:value-of select="self::ci:cite//child::ci:content/node()"/>
            </xsl:when>
            <xsl:when
                test="self::ci:case[ancestor::case:parallelcite][$selectorID='cases' and $docinfo.selector='Transcript']"/>

            <xsl:when
                test="self::ci:content and matches(self::ci:content, '(\[[0-9]{4}\])\s([0-9]+)\s([a-zA-Z\s]+)\s([0-9]+)') and $selectorID='index'">
                <xsl:analyze-string select="self::ci:content"
                    regex="(\[[0-9]{{4}}\])\s([0-9]+)\s([a-zA-Z\s]+)\s([0-9]+)">
                    <xsl:matching-substring>
                        <ci:content xsl:exclude-result-prefixes="#all">
                            <xsl:value-of select="concat(regex-group(1), ' ')"/>
                            <emph typestyle="bf" xsl:exclude-result-prefixes="#all">
                                <xsl:value-of select="regex-group(2), regex-group(3)" separator=" "
                                />
                            </emph>
                            <xsl:value-of select="concat(' ', regex-group(4))"/>
                        </ci:content>
                    </xsl:matching-substring>
                </xsl:analyze-string>
            </xsl:when>

            <xsl:when test="self::ci:cite[@type='cite4thisdoc'][$selectorID='journal']">
                <xsl:element name="{name()}">
                    <xsl:attribute name="type">
                        <xsl:value-of select="'cite4thisdoc'"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>

            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:choose>
                        <xsl:when test="self::ci:cite/not(@*[name() != 'status'])"/>
                        <xsl:otherwise>
                            <!-- <xsl:apply-templates select="@*|node()"/>-->
                            <!-- Arun: 02May2018 - Commented the above applu-templates as it is causing text repetition. Added the below code to handle it. -->
                            <xsl:apply-templates select="@*"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!-- <xsl:apply-templates select="@*"/>-->
                    <xsl:if test="self::ci:cite[@searchtype='LEG-REF' or @searchtype='EU-REF']">
                        <xsl:variable name="normcite" as="xs:string*">
                            <xsl:apply-templates select="ci:sesslaw" mode="normcite"/>
                        </xsl:variable>

                        <xsl:attribute name="normcite">
                            <xsl:value-of select="$normcite"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates select="node()"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <xsl:template match="ci:sesslaw" mode="normcite">
        <xsl:variable name="ci_section_content">
            <xsl:choose>
                <xsl:when test="self::ci:sesslaw//ci:hierpinpoint[1]/ci:hierlev[1]">
                    <xsl:value-of
                        select="concat(upper-case(substring(self::ci:sesslaw//ci:hierpinpoint[1]/ci:hierlev[1]/@label, 1, 4)), ' ', self::ci:sesslaw//ci:hierpinpoint[1]/ci:hierlev[1]/@num)"
                    />
                </xsl:when>
                <xsl:when
                    test="ancestor::ci:cite/following-sibling::node()[1]/name()='' and matches(ancestor::ci:cite/following-sibling::text()[1], '^[\s]*s')">
                    <xsl:analyze-string select="ancestor::ci:cite/following-sibling::text()[1]"
                        regex="^[\s]*s[\W]{{1}}([0-9]+)">
                        <xsl:matching-substring>
                            <xsl:value-of select="concat('SECT ', regex-group(1))"/>
                        </xsl:matching-substring>
                    </xsl:analyze-string>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="''"/>
                </xsl:otherwise>
            </xsl:choose>

        </xsl:variable>
        <xsl:apply-templates select="ci:sesslawref" mode="#current"/>
        <xsl:apply-templates select="ci:sesslawinfo" mode="#current"/>
        <xsl:value-of select="$ci_section_content"/>
    </xsl:template>

    <xsl:template match="ci:sesslawref" mode="normcite">
        <xsl:value-of select="child::ci:standardname/@normpubcode" separator=" "/>
    </xsl:template>

    <xsl:template match="ci:sesslawinfo" mode="normcite">
        <xsl:apply-templates select="ci:sesslawnum" mode="#current"/>
        <xsl:apply-templates select="ci:hierpinpoint" mode="#current"/>
    </xsl:template>

    <xsl:template match="ci:sesslawnum" mode="normcite">
        <xsl:variable name="strip-space" select="translate(@num, ' ', '')"/>
        <xsl:variable name="regex" select="'(\d{4})_(\d+).(_(title))?'"/>
        <xsl:variable name="ci_section_content">
            <xsl:choose>
                <xsl:when test="ancestor::ci:sesslaw//ci:hierpinpoint[1]/ci:hierlev[1]">
                    <xsl:value-of
                        select="concat(upper-case(substring(ancestor::ci:sesslaw//ci:hierpinpoint[1]/ci:hierlev[1]/@label, 1, 4)), ' ', ancestor::ci:sesslaw//ci:hierpinpoint[1]/ci:hierlev[1]/@num)"
                    />
                </xsl:when>
                <xsl:when
                    test="ancestor::ci:cite/following-sibling::node()[1]/name()='' and matches(ancestor::ci:cite/following-sibling::text()[1], '^[\s]*s')">
                    <xsl:analyze-string select="ancestor::ci:cite/following-sibling::text()[1]"
                        regex="^[\s]*s[\W]{{1}}([0-9]+)">
                        <xsl:matching-substring>
                            <xsl:value-of select="concat('SECT ', regex-group(1))"/>
                        </xsl:matching-substring>
                    </xsl:analyze-string>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="''"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="test">
            <xsl:analyze-string select="$strip-space" regex="{$regex}" flags="i">
                <xsl:matching-substring>
                    <xsl:choose>
                        <xsl:when test="$ci_section_content != ''">
                            <xsl:value-of select="(regex-group(1), regex-group(2))" separator=" "/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of
                                select="
                                    (regex-group(1), regex-group(2),
                                    (if (regex-group(4)) then
                                        regex-group(4)
                                    else
                                        ()))"
                                separator=" "/>
                        </xsl:otherwise>
                    </xsl:choose>

                </xsl:matching-substring>
            </xsl:analyze-string>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$test=''">
                <xsl:value-of select="./@num"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$test"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template
        match="ci:sesslaw[parent::ci:cite/@searchtype='LEG-REF' or parent::ci:cite/@searchtype='EU-REF']"/>

    <xsl:template match="ci:*/@*">

        <xsl:choose>

            <xsl:when test="parent::ci:cite/@searchtype='EU-REF'">
                <xsl:attribute name="searchtype" select="'LEG-REF'"/>
            </xsl:when>
            <xsl:when
                test="parent::ci:cite/parent::case:parallelcite and $selectorID='dictionary'">
                <xsl:attribute name="searchtype" select="'CASE-REF'"/>
            </xsl:when>
            <xsl:when
                test="parent::ci:cite/parent::case:parallelcite and $selectorID='cases' and $docinfo.selector=('LawReport', 'PracticeDirection')">
                <xsl:attribute name="searchtype" select="'CASE-REF'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="ci:cite[@searchtype='CASE-REF']/@status" priority="20"/>

    <xsl:template match="citefragment">
        <xsl:choose>
            <xsl:when test="ancestor::case:parallelcite and $selectorID='dictionary'">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when
                test="ancestor::case:parallelcite and $selectorID='cases' and $docinfo.selector=('LawReport', 'PracticeDirection')">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:copy-of select="@*"/>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
<!--Dayanand singh 30 may 2018 -->
    
    <xsl:template match="ci:cite[$selectorID='digest']">
        
            <xsl:element name="{name()}">
                <xsl:copy-of select="@*|node()" copy-namespaces="no"/>
                
            </xsl:element>
        
    </xsl:template>
    
    
    
</xsl:stylesheet>

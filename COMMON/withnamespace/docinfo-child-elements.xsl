<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:docinfo="http://www.lexis-nexis.com/glp/docinfo"
    xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    
    <xsl:variable name="path"
        select="substring-before($document-uri, tokenize($document-uri, '/')[last()])"/>
    
    <xsl:template match="docinfo">       
        <xsl:element name="{name()}">
            <xsl:variable name="v_getDPSI">
                <xsl:analyze-string select="$path" regex="[/]([0-9][0-9A-Z]{{3}})[_|-]?">
                    <xsl:matching-substring>
                        <xsl:value-of select="regex-group(1)"/>
                    </xsl:matching-substring>
                </xsl:analyze-string>
            </xsl:variable>
            
            <docinfo:dpsi id-string="{substring($v_getDPSI,1,4)}"/> 
            <!--<xsl:choose>
                <xsl:when test="$selectorID='dictionary'">
                    <docinfo:dpsi id-string="0KMN"/> 
                </xsl:when>
                <xsl:when test="$selectorID='cases' and $docinfo.selector=('LawReport','PracticeDirection')">
                    <docinfo:dpsi id-string="0T2S"/>
                    <!--<docinfo:dpsi id-string="0GNE"/>-->
                </xsl:when>
                <xsl:when test="$selectorID='cases' and $docinfo.selector='Transcript'">
                    <docinfo:dpsi id-string="02ED"/>
                </xsl:when>
                
                <xsl:when test="$selectorID='index'">
                    <docinfo:dpsi id-string="003B"/> 
                </xsl:when>
                
                <xsl:when test="$selectorID='journal'">
                    <docinfo:dpsi id-string="042E"/> 
                </xsl:when>
                
            </xsl:choose>-->
            
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="docinfo/@*"/>

    <xsl:template
        match="docinfo:doc-heading | docinfo:bookseqnum[$selectorID = 'cases'] | docinfo:doc-lang | docinfo:doc-country | docinfo:hier | docinfo:hierlev | heading[parent::docinfo:hierlev] | title[ancestor::docinfo:hierlev] | docinfo:lbu-meta | docinfo:metaitem | docinfo:selector | docinfo:alt-renditions | docinfo:alt-rendition | link[parent::docinfo:alt-rendition]">
        <xsl:element name="{name()}">
            <xsl:choose>                
                <xsl:when test="self::docinfo:doc-heading and $selectorID = 'cases' and $docinfo.selector = 'Transcript'">
                    <xsl:variable name="docheadval" select="."/>
                    <xsl:analyze-string select="$docheadval" regex="([\w\W]*?)\s*\-\s*$">
                        <xsl:matching-substring>
                            <xsl:value-of select="regex-group(1)"/>
                        </xsl:matching-substring>
                        <xsl:non-matching-substring>
                            <xsl:value-of select="$docheadval"/>
                        </xsl:non-matching-substring>
                    </xsl:analyze-string>
                </xsl:when>
                <xsl:when
                    test="self::docinfo:doc-heading and $docinfo.selector = 'PracticeDirection'">
                    <xsl:variable name="docinfo_dochead" select="//docinfo:doc-heading"/>
                    <xsl:choose>
                        <xsl:when test="starts-with($docinfo_dochead, 'Practice Direction;')">
                            <xsl:value-of
                                select="replace($docinfo_dochead, 'Practice Direction;', 'Practice Direction')"
                            />
                        </xsl:when>
                        <xsl:when test="starts-with($docinfo_dochead, 'Note;')">
                            <xsl:value-of select="replace($docinfo_dochead, 'Note;', 'Note')"/>
                        </xsl:when>
                        <xsl:when test="starts-with($docinfo_dochead, 'Practice Note;')">
                            <xsl:value-of
                                select="replace($docinfo_dochead, 'Practice Note;', 'Practice Note')"
                            />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when
                    test="self::title[ancestor::docinfo:hierlev] and $docinfo.selector = 'PracticeDirection'">
                    <xsl:variable name="docinfo_hierlev_title" select="."/>
                    <xsl:choose>
                        <xsl:when test="starts-with($docinfo_hierlev_title, 'Practice Direction;')">
                            <xsl:value-of
                                select="replace($docinfo_hierlev_title, 'Practice Direction;', 'Practice Direction')"
                            />
                        </xsl:when>
                        <xsl:when test="starts-with($docinfo_hierlev_title, 'Note;')">
                            <xsl:value-of select="replace($docinfo_hierlev_title, 'Note;', 'Note')"
                            />
                        </xsl:when>
                        <xsl:when test="starts-with($docinfo_hierlev_title, 'Practice Note;')">
                            <xsl:value-of
                                select="replace($docinfo_hierlev_title, 'Practice Note;', 'Practice Note')"
                            />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                        </xsl:otherwise>
                    </xsl:choose>

                </xsl:when>
                
                            
                <xsl:when test="self::title[parent::heading[1]/parent::docinfo:hierlev[1]] and $selectorID = 'journal'">
                    <xsl:variable name="docinfo_hierlev_title" select="."/>
                    <xsl:choose>                        
                        <xsl:when test="matches($docinfo_hierlev_title,'[0-9]{4}\s[A-Za-z]+\s[0-9]+\s*$')">
                            <xsl:analyze-string select="$docinfo_hierlev_title" regex="([0-9]{{4}})\s*([A-Za-z]+)\s*([0-9]+)\s*$">
                                <xsl:matching-substring> 
                                    <xsl:value-of select="concat(regex-group(1),' - ',regex-group(2),' ',regex-group(3))"/>
                                </xsl:matching-substring>
                                <xsl:non-matching-substring>
                                    <xsl:value-of select="."/>
                                </xsl:non-matching-substring>
                            </xsl:analyze-string>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                        </xsl:otherwise>
                    </xsl:choose>                    
                </xsl:when>
                               
                
                <xsl:when test="self::docinfo:selector and $docinfo.selector = 'PracticeDirection'">
                    <xsl:variable name="docinfo_selector" select="//docinfo:selector"/>
                    <xsl:value-of select="concat('Case', $docinfo_selector)"/>
                </xsl:when>
                
                <xsl:when test="self::docinfo:selector and $selectorID = 'journal'">
                    <xsl:value-of select="'Article'"/>
                </xsl:when>                
                
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="self::docinfo:lbu-meta and $selectorID = 'cases' and $docinfo.selector = 'Transcript'">
                            <xsl:apply-templates select="@* | node()"/>
                            <xsl:if test="//case:headnote/case:info[1]/child::case:parallelcite[1]">
                            <xsl:element name="docinfo:metaitem">
                                <xsl:attribute name="name" select="'lexiscite'"/>                                
                                <xsl:attribute name="value" select="//case:headnote/case:info[1]/child::case:parallelcite[1]//text()"/>
                            </xsl:element>                            
                            <docinfo:metaitem name="includeInOneCase" value="true" />
                            </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="@* | node()"/>                            
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>



    <xsl:template match="docinfo:alt-rendition/link/@*">
        <xsl:copy/>
    </xsl:template>

    <xsl:template match="docinfo:doc-id | docinfo:bookseqnum">
        <xsl:element name="{name()}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="docinfo:*/@*">
        <xsl:copy/>
    </xsl:template>

    <xsl:template
        match="docinfo:custom-metafields[$selectorID = ('dictionary','index','journal')] | docinfo:custom-metafields/child::*[$selectorID = ('dictionary','index','journal')] | docinfo:assoc-links | docinfo:normcite"/>

    <xsl:template match="docinfo:custom-metafields[$selectorID = 'cases']">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
            <xsl:copy-of select="child::docinfo:custom-metafield[@name = 'date']"
                copy-namespaces="no"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="docinfo:custom-metafield[$selectorID = 'cases']">
        <xsl:choose>
            <xsl:when test="@name = 'courtcode'">
                <xsl:choose>
                    <xsl:when test="@name = 'courtcode' and $docinfo.selector = 'PracticeDirection'">
                        <xsl:element name="{name()}">
                            <xsl:copy-of select="@name" copy-namespaces="no"/>
                            <xsl:value-of
                                select="replace(parent::docinfo:custom-metafields/docinfo:custom-metafield[@name = 'courtcode'], 'temp', '')"
                            />
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="." copy-namespaces="no"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="@name = 'jurisdiction'">
                <xsl:choose>
                    <xsl:when test="self::docinfo:custom-metafield/not(child::node()) and parent::docinfo:custom-metafields/docinfo:custom-metafield[@searchtype = 'JURIS-CLASSIFY']/not(child::node()) and $selectorID='dictionary'">
                        <xsl:element name="{name()}">
                            <xsl:copy-of select="@name" copy-namespaces="no"/>
                            <xsl:value-of select="'EnglandWalesScotlandandNorthernIreland'"/>
                        </xsl:element>
                    </xsl:when>
                    
                    <xsl:when test="self::docinfo:custom-metafield/not(child::node()) and parent::docinfo:custom-metafields/docinfo:custom-metafield[@searchtype = 'JURIS-CLASSIFY']/not(child::node()) and $selectorID='cases' and $docinfo.selector=('PracticeDirection','LawReport')">
                        <xsl:element name="{name()}">
                            <xsl:copy-of select="@name" copy-namespaces="no"/>
                            <xsl:value-of select="'EnglandWalesScotlandandNorthernIreland'"/>
                        </xsl:element>
                    </xsl:when>
                    
                    <xsl:when test="self::docinfo:custom-metafield/not(child::node()) and parent::docinfo:custom-metafields/docinfo:custom-metafield[@searchtype = 'JURIS-CLASSIFY']/not(child::node()) and $selectorID='cases' and $docinfo.selector=('Transcript')">
                        <xsl:element name="{name()}">
                            <xsl:copy-of select="@name" copy-namespaces="no"/>
                            <xsl:value-of select="'England&amp;Wales'"/>
                        </xsl:element>
                    </xsl:when>
                    
                    <xsl:when test="self::docinfo:custom-metafield/not(child::node()) and parent::docinfo:custom-metafields/docinfo:custom-metafield[@searchtype = 'JURIS-CLASSIFY']/child::node() and $selectorID='dictionary'">
                        <xsl:element name="{name()}">
                            <xsl:copy-of select="@name" copy-namespaces="no"/>
                            <xsl:value-of
                                select="translate(parent::docinfo:custom-metafields/docinfo:custom-metafield[@searchtype = 'JURIS-CLASSIFY'], ', ', '')"
                            />
                        </xsl:element>
                    </xsl:when>
                    
                    <xsl:when test="self::docinfo:custom-metafield/not(child::node()) and parent::docinfo:custom-metafields/docinfo:custom-metafield[@searchtype = 'JURIS-CLASSIFY']/child::node() and $selectorID='cases' and $docinfo.selector=('PracticeDirection','LawReport')">
                        <xsl:element name="{name()}">
                            <xsl:copy-of select="@name" copy-namespaces="no"/>
                            <xsl:value-of
                                select="translate(parent::docinfo:custom-metafields/docinfo:custom-metafield[@searchtype = 'JURIS-CLASSIFY'], ', ', '')"
                            />
                        </xsl:element>
                    </xsl:when>                    
                    <xsl:otherwise>
                        <!--<xsl:copy-of select="." copy-namespaces="no"/>-->
                        <xsl:element name="{name()}">
                            <xsl:copy-of select="@name" copy-namespaces="no"/>
                            <!-- Arun: 07May2018 - Updated below condition to handle <docinfo:custom-metafield name="jurisdiction"> when it is not empty -->
                            <xsl:choose>
                                <xsl:when test="parent::docinfo:custom-metafields/docinfo:custom-metafield[@searchtype = 'JURIS-CLASSIFY']!=''">
                                    <xsl:value-of select="translate(replace(parent::docinfo:custom-metafields/docinfo:custom-metafield[@searchtype = 'JURIS-CLASSIFY'], ' and ','&amp;'),' ','')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="translate(replace(self::docinfo:custom-metafield, ' and ','&amp;'),' ','')"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="@searchtype = 'COURT-CLASSIFY'">
                <xsl:element name="{name()}">
                    <xsl:attribute name="name" select="./@searchtype"/>
                    <xsl:choose>
                        <xsl:when test="self::docinfo:custom-metafield/not(node())">
                            <xsl:choose>
                                <xsl:when test="$docinfo.selector=('PracticeDirection','Transcript')">
                                    <xsl:value-of select="//case:courtname"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'Supreme Court'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>                                                                              
                            <xsl:apply-templates select="node()"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:element>
            </xsl:when>
            <xsl:when test="@searchtype = 'JURIS-CLASSIFY'">
                <xsl:element name="{name()}">
                    <xsl:attribute name="name" select="./@searchtype"/>
                    <xsl:choose>
                        <xsl:when test="self::docinfo:custom-metafield/not(node())">
                            <xsl:choose>
                                <xsl:when test="$docinfo.selector=('PracticeDirection','Transcript')">
                                    <xsl:value-of select="'England &amp; Wales'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'England, Wales, Scotland and Northern Ireland'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>                     
                                <xsl:value-of select="replace(.,' and ',' &amp; ')"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

<!--Dayanand Singh 08-05-2018 -->
    <xsl:template match="docinfo:topiccodes">
        <xsl:element name="docinfo:topiccodes">
            <xsl:apply-templates select="node()|@*"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="docinfo:topiccode">
        <xsl:element name="docinfo:topiccode">
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>


    <xsl:template
        match="docinfo:custom-metafield[$selectorID = 'cases'][./@name = ('court', 'juris', 'date', 'sh-version', 'rx-version', 'sg-version', 'ng-version', 'filterType', 'resultType')]"
        priority="20"/>


</xsl:stylesheet>

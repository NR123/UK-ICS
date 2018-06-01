<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:in="http://www.lexis-nexis.com/glp/in" xmlns:ci="http://www.lexis-nexis.com/ci"
    xmlns:docinfo="http://www.lexis-nexis.com/glp/docinfo" exclude-result-prefixes="xs"
    version="2.0">

    <xsl:template match="in:*[self::node()/name() != 'in:entry-text']">
        <xsl:element name="{name()}">
            <xsl:choose>
                <xsl:when test="self::in:body[parent::INDEXDOC]">
                    <xsl:if test="self::in:body[not(child::heading)]">
                        <heading xsl:exclude-result-prefixes="#all">
                            <title xsl:exclude-result-prefixes="#all">
                                <xsl:apply-templates
                                    select="//docinfo:hierlev[@role = 'me']//text()"/>
                            </title>
                        </heading>
                    </xsl:if>
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:when>

                <xsl:when test="self::in:lev1[parent::in:body]">
                    <xsl:if test="self::in:lev1/child::in:entry/child::in:entry-text/child::ci:cite">

                        <xsl:variable name="tocval">
                            <!-- If the PCDATA has '['in it then the content before '[' should be retained inside in:entry-text and the content after '[' should be moved to in:index-ref -->
                            <xsl:variable name="before_sqbracket">
                                <xsl:value-of
                                    select="substring-before(self::in:lev1/child::in:entry/child::in:entry-text/node()[1], '[')"
                                />
                            </xsl:variable>
                            <xsl:choose>
                                <!-- If the PCDATA doesn't have '[' capture it inside in:entry-text -->
                                <xsl:when test="$before_sqbracket = ''">
                                    <xsl:value-of
                                        select="self::in:lev1/child::in:entry/child::in:entry-text/node()[1]"
                                    />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$before_sqbracket"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>

                        <xsl:attribute name="searchtype" select="'1'"/>
                        <xsl:attribute name="subdoc" select="'true'"/>
                        <xsl:attribute name="toc-caption" select="normalize-space($tocval)"/>
                    </xsl:if>
                    <xsl:apply-templates/>
                </xsl:when>


                <xsl:otherwise>
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>

    <!--<xsl:template match="in:entry-text" mode="in-entry">-->

    <xsl:template name="fn-entry-text" as="item()*">
        <xsl:param name="indexref" as="element()*"/>
        <xsl:for-each select="$indexref/child::node()">
            <xsl:choose>
                <!-- When child element is remotelink -->
                <!-- Eg: <emph typestyle="bf">
							<remotelink service="DOC-ID" remotekey1="REFPTID" refpt="0089_2_70:HTCOMM-VOL_5:HTCOMM-EDITION_93:HTCOMM-PARA" dpsi="0089">70</remotelink>
						</emph>
						<remotelink service="DOC-ID" remotekey1="REFPTID" refpt="0089_2_70:HTCOMM-VOL_5:HTCOMM-EDITION_93:HTCOMM-PARA" dpsi="0089"> (5th) 93</remotelink>; -->
                <xsl:when
                    test="self::node()[self::emph[child::remotelink]][following-sibling::node()[1][name() = 'remotelink']]">
                    <xsl:variable name="dpsi">
                        <xsl:value-of select="self::emph/child::remotelink/@dpsi"/>
                    </xsl:variable>

                    <xsl:variable name="volume">
                        <xsl:choose>
                            <!-- If the remotelink PCDATA's string length is more than 1, then the first digit is moved outside of remotelink and the rest of the content is retained as remotelink's PCDATA. -->
                            <xsl:when
                                test="string-length(self::emph//remotelink) > 1 and matches(substring(self::emph//remotelink, 1, 2), '[0-9]{2}')">
                                <xsl:value-of
                                    select="concat('volume:', substring(self::emph//remotelink, 2))"
                                />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="''"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>

                    <xsl:choose>
                        <!-- The volume will be '' when the PCDATA of remotelink is single digit. In this case, the remotelink created in LA should have both emph/remotelink and the following sibling remotelink's PCDATA -->
                        <xsl:when test="$volume = ''">
                            <xsl:value-of select="self::emph"/>
                            <xsl:value-of
                                select="self::emph/following-sibling::*[1][name() = 'remotelink']"/>

                            <!--<xsl:if
                                        test="self::emph/following-sibling::*[1][name() = 'remotelink']/following-sibling::node()[1]/name() = ''">
                                        <xsl:value-of
                                            select="self::emph/following-sibling::*[1][name() = 'remotelink']/following-sibling::node()[1]"
                                        />
                                    </xsl:if>-->
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- The first digit of remotelink's PCDATA is moved outside remotelink  -->
                            <xsl:value-of select="substring(self::emph//remotelink, 1, 1)"/>

                            <remotelink service="DOC-ID" remotekey1="REFPTID" dpsi="{$dpsi}"
                                xsl:exclude-result-prefixes="#all">
                                <xsl:attribute name="refpt">
                                    <xsl:variable name="prepend" select="'acronym:HALS::'"/>
                                    <xsl:variable name="edition">
                                        <xsl:variable name="v_getValue">
                                            <xsl:analyze-string
                                                select="self::emph/following-sibling::*[1][name() = 'remotelink']/@refpt"
                                                regex="(_([\w]+):[\w]+-EDITION)(_([\w]+):[\w]+-PARA)">
                                                <xsl:matching-substring>
                                                  <xsl:value-of select="regex-group(2)"/>
                                                </xsl:matching-substring>
                                            </xsl:analyze-string>
                                        </xsl:variable>
                                        <xsl:if test="$v_getValue != ''">
                                            <xsl:value-of
                                                select="concat('edition:', $v_getValue, '::')"/>
                                        </xsl:if>

                                    </xsl:variable>
                                    <xsl:variable name="paragraph">
                                        <xsl:variable name="v_getValue">
                                            <xsl:analyze-string
                                                select="self::emph/following-sibling::*[1][name() = 'remotelink']/@refpt"
                                                regex="(_([\w]+):[\w]+-EDITION)?(_([\w]+):[\w]+-PARA)">
                                                <xsl:matching-substring>
                                                  <xsl:value-of select="regex-group(4)"/>
                                                </xsl:matching-substring>
                                            </xsl:analyze-string>
                                        </xsl:variable>
                                        <xsl:value-of select="concat('paragraph:', $v_getValue)"/>
                                    </xsl:variable>

                                    <!-- attribute @refpt value -->
                                    <xsl:value-of
                                        select="concat($prepend, $volume, '::', $edition, $paragraph)"
                                    />
                                </xsl:attribute>

                                <xsl:attribute name="status" select="'invalid'"/>
                                <!--the remotelink created in LA should have both emph/remotelink's PCDATA[first digit removed] and the following sibling remotelink's PCDATA -->
                                <xsl:value-of
                                    select="normalize-space(substring(self::emph//remotelink, 2)), normalize-space(self::emph/following-sibling::*[1][name() = 'remotelink'])"
                                />
                            </remotelink>

                            <!-- To handle if there is PCDATA following the remotelink element i.e., emph/remotelink/following-sibling::remotelink/following:sibling::PCDATA -->
                            <!--<xsl:if
                                        test="self::emph/following-sibling::*[1][name() = 'remotelink']/following-sibling::node()[1][name() = '']/following-sibling::node()[1][self::emph/following-sibling::*[1][name() = 'remotelink']]">
                                        <xsl:value-of
                                            select="self::emph/following-sibling::*[1][name() = 'remotelink']/following-sibling::node()[1]"
                                        />
                                    </xsl:if>-->

                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when
                    test="self::remotelink/preceding-sibling::node()[1][name() = 'emph'][matches(.,'^[\s]*[0-9]+')]"/>
                <xsl:when
                    test="self::node()[name() = ('emph', '')][matches(., '[0-9]*\[?[0-9]+\]?')]/preceding-sibling::node()[1][matches(.,'^[\s]*[0-9]+')][name() = 'emph'] and not(self::node()/name()=preceding-sibling::node()/name())"/>
                <xsl:when
                    test="self::node()[name() = ('emph', '')][matches(., '^[\s]*\[?[0-9]+\]?')]/preceding-sibling::node()[1][matches(.,'^[\s]*[0-9]+')][name() = 'emph'] and not(self::node()/name()=preceding-sibling::node()/name())"/>
                
                <xsl:when
                    test="self::node()[(self::emph[matches(., '[0-9]+')] and self::emph/following-sibling::node()[1][matches(., '[\s]*\((([0-9]+)th|rt|st)\)[\s]*([0-9]+)')]/name() = '') or (self::emph[matches(., '[0-9]*\(?[0-9]+\)?')] and self::emph/following-sibling::node()[1][matches(., '[\s]*\[[0-9]+\]')])]"
                > 
                <xsl:choose>
                    <xsl:when
                        test="self::emph[matches(., '[0-9]+')] and self::emph/following-sibling::node()[matches(., '[\s]*\((([0-9]+)th|rt|st)\)[\s]*([0-9]+)')]/name() = ''">
                        <xsl:variable name="dpsi">
                            <xsl:value-of select="substring($v_getDPSI, 1, 4)"/>
                        </xsl:variable>
                        
                        <xsl:variable name="volume">
                            <xsl:choose>
                                <!-- If the remotelink PCDATA's string length is more than 1, then the first digit is moved outside of remotelink and the rest of the content is retained as remotelink's PCDATA. -->
                                <xsl:when test="string-length(self::emph) > 1">
                                    <xsl:value-of
                                        select="concat('volume:', substring(self::emph, 2))"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="''"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        
                        <xsl:choose>
                            <!-- The volume will be '' when the PCDATA of remotelink is single digit. In this case, the remotelink created in LA should have both emph/remotelink and the following sibling remotelink's PCDATA -->
                            <xsl:when test="$volume = ''">
                                <xsl:value-of select="self::emph"/>
                                <xsl:value-of
                                    select="self::emph/following-sibling::*[1][name() = '']/text()"
                                />
                            </xsl:when>
                            <xsl:otherwise>
                                <!-- The first digit of remotelink's PCDATA is moved outside remotelink  -->
                                <xsl:value-of select="substring(self::emph, 1, 1)"/>
                                
                                <remotelink service="DOC-ID" remotekey1="REFPTID" dpsi="{$dpsi}"
                                    xsl:exclude-result-prefixes="#all">
                                    <xsl:attribute name="refpt">
                                        <xsl:variable name="prepend" select="'acronym:HALS::'"/>
                                        <xsl:variable name="edition">
                                            <xsl:variable name="v_getvalue">
                                                <xsl:analyze-string
                                                    select="self::emph/following-sibling::text()"
                                                    regex="[\s]*\((([0-9]+)th|rt|st)\)[\s]*([0-9]+)">
                                                    <xsl:matching-substring>
                                                        <!-- In the above regex, the regex-group 1, matches the content present within the '(' and ')'. So get the numeric content only, we are matching regex-group(2) -->
                                                        <xsl:value-of select="regex-group(2)"/>
                                                    </xsl:matching-substring>
                                                </xsl:analyze-string>
                                            </xsl:variable>
                                            <xsl:value-of
                                                select="concat('edition:', normalize-space($v_getvalue))"
                                            />
                                        </xsl:variable>
                                        <xsl:variable name="paragraph">
                                            <xsl:variable name="v_getvalue">
                                                <xsl:analyze-string
                                                    select="self::emph/following-sibling::text()"
                                                    regex="[\s]*\((([0-9]+)th|rt|st)\)[\s]*([0-9]+)">
                                                    <xsl:matching-substring>
                                                        <xsl:value-of select="regex-group(3)"/>
                                                    </xsl:matching-substring>
                                                </xsl:analyze-string>
                                            </xsl:variable>
                                            <xsl:value-of
                                                select="concat('paragraph:', normalize-space($v_getvalue))"
                                            />
                                        </xsl:variable>
                                        
                                        <!-- attribute @refpt value -->
                                        <xsl:value-of
                                            select="concat($prepend, $volume, '::', $edition, '::', $paragraph)"
                                        />
                                    </xsl:attribute>
                                    
                                    <xsl:attribute name="status" select="'invalid'"/>
                                    <!--the remotelink created in LA should have both emph/remotelink's PCDATA[first digit removed] and the following sibling remotelink's PCDATA -->
                                    <xsl:value-of
                                        select="normalize-space(substring(self::emph, 2)), normalize-space(self::emph/following-sibling::text())"
                                    />
                                </remotelink>
                                
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when
                        test="(self::node()[matches(., '^[0-9]*\(?[0-9]+\)?')] and self::node()/following-sibling::node()[1][matches(., '[\s]*\[[0-9]+\]')])">
                        <xsl:variable name="dpsi">
                            <xsl:value-of select="substring($v_getDPSI, 1, 4)"/>
                        </xsl:variable>
                        
                        <xsl:variable name="volume">
                            <xsl:choose>
                                <!-- If the remotelink PCDATA's string length is more than 1, then the first digit is moved outside of remotelink and the rest of the content is retained as remotelink's PCDATA. -->
                                <xsl:when test="string-length(self::emph) > 1">
                                    <xsl:value-of
                                        select="concat('volume:', substring(self::emph, 2))"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="''"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        
                        <xsl:choose>
                            <!-- The volume will be '' when the PCDATA of remotelink is single digit. In this case, the remotelink created in LA should have both emph/remotelink and the following sibling remotelink's PCDATA -->
                            <xsl:when test="$volume = ''">
                                <xsl:value-of select="self::emph"/>
                                <xsl:value-of
                                    select="self::emph/following-sibling::*[1][name() = '']/text()"
                                />
                            </xsl:when>
                            <xsl:otherwise>
                                <!-- The first digit of remotelink's PCDATA is moved outside remotelink  -->
                                <xsl:value-of select="substring(self::emph, 1, 1)"/>
                                
                                <remotelink service="DOC-ID" remotekey1="REFPTID" dpsi="{$dpsi}"
                                    xsl:exclude-result-prefixes="#all">
                                    <xsl:attribute name="refpt">
                                        <xsl:variable name="prepend" select="'acronym:HALS::'"/>
                                        
                                        <xsl:variable name="paragraph">
                                            <xsl:variable name="v_getvalue">
                                                <xsl:analyze-string
                                                    select="self::emph/following-sibling::node()[1]"
                                                    regex="[\s]*\[?([0-9]+)\]?">
                                                    <xsl:matching-substring>
                                                        <xsl:value-of select="regex-group(1)"/>
                                                    </xsl:matching-substring>
                                                </xsl:analyze-string>
                                            </xsl:variable>
                                            <xsl:value-of
                                                select="concat('paragraph:', normalize-space($v_getvalue))"
                                            />
                                        </xsl:variable>
                                        
                                        <!-- attribute @refpt value -->
                                        <xsl:value-of
                                            select="concat($prepend, $volume, '::', $paragraph)"
                                        />
                                    </xsl:attribute>
                                    
                                    <xsl:attribute name="status" select="'invalid'"/>
                                    <!--the remotelink created in LA should have both emph/remotelink's PCDATA[first digit removed] and the following sibling remotelink's PCDATA -->
                                    <xsl:value-of
                                        select="normalize-space(substring(self::emph, 2)), normalize-space(self::emph/following-sibling::node()[1])"
                                    />
                                </remotelink>                               
                                
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>                                
                    <xsl:otherwise>
                        <xsl:apply-templates select="."/>
                    </xsl:otherwise>
                </xsl:choose>
                </xsl:when>
                <xsl:otherwise>                   
                    <xsl:apply-templates select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="in:entry-text">        
        <xsl:element name="{name()}">
            <xsl:for-each select="child::node()">
                <xsl:choose>
                    <xsl:when
                        test="self::node()[self::remotelink or self::ci:cite[not(self::ci:cite = parent::in:entry-text/node()[1])] or self::emph[@typestyle = 'bf']] or self::node()[preceding-sibling::node()[self::remotelink or self::ci:cite[not(self::ci:cite = parent::in:entry-text/node()[1])] or self::emph[@typestyle = 'bf']]]"/>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when
                                test="self::node()/name() = '' and self::node() = parent::in:entry-text/node()[1] and self::node()/following-sibling::*[1][name() = ('remotelink', 'ci:cite', 'emph')] and contains(self::node(), '[')">
                                <xsl:value-of select="substring-before(., '[')"/>
                            </xsl:when>
                            <xsl:when test="self::ci:cite">
                                <xsl:call-template name="replace">
                                    <xsl:with-param name="text" select="self::ci:cite/ci:content"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="."/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <!--  refpt is created for in:entry-text when the node()[1] is PCDATA -->
            <xsl:if test="self::in:entry-text/node()[1]/name() = ''">
                        <refpt xsl:exclude-result-prefixes="#all">
                            <xsl:attribute name="id">
                                <xsl:variable name="lbu">
                                    <!-- TBD: Awaiting clarification for refpt -->
                                    <xsl:choose>
                                        <xsl:when
                                            test="//docinfo:lbu-meta/docinfo:metaitem[@name = 'lbu-sourcename']/contains(@value, 'All England Law Reports')">
                                            <xsl:value-of select="'AELR'"/>
                                        </xsl:when>
                                        <xsl:when
                                            test="//docinfo:lbu-meta/docinfo:metaitem[@name = 'lbu-sourcename']/contains(@value, 'Halsbury')">
                                            <xsl:value-of select="'HALS'"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="'HALS'"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>

                                <xsl:variable name="text">
                                    <!-- If the PCDATA has '['in it then the content before '[' should be retained inside in:entry-text and the content after '[' should be moved to in:index-ref -->
                                    <xsl:variable name="before_sqbracket">
                                        <xsl:value-of
                                            select="substring-before(self::in:entry-text/node()[1], '[')"
                                        />
                                    </xsl:variable>
                                    <xsl:choose>
                                        <!-- If the PCDATA doesn't have '[' capture it inside in:entry-text -->
                                        <xsl:when test="$before_sqbracket = ''">
                                            <xsl:value-of
                                                select="normalize-space(self::in:entry-text/node()[1])"
                                            />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="$before_sqbracket"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>

                                <!-- Normalise the @id -->
                                <xsl:variable name="normalize_refpt_id">
                                    <xsl:call-template name="Normalize_id_string">
                                        <xsl:with-param name="string" select="$text"/>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:value-of
                                    select="concat('acronym:', $lbu, '-INDEX::term:', upper-case($normalize_refpt_id))"
                                />
                            </xsl:attribute>
                        </refpt>
                    </xsl:if> 
        </xsl:element>
        <!-- The child element ci:cite and remotelink is moved inside in:index-ref -->
        <in:index-ref xsl:exclude-result-prefixes="#all">
            <!-- If the PCDATA has '[', then the content after '[' should be moved inside in:index-ref-->
            <xsl:variable name="after_sqbracket">
                <xsl:value-of select="substring-after(self::in:entry-text/node()[1], '[')"/>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="$after_sqbracket != ''">
                    <xsl:call-template name="replace">
                        <xsl:with-param name="text" select="concat('[', $after_sqbracket)"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="ends-with(self::in:entry-text/node()[1], '[')">
                    <xsl:value-of select="'['"/>
                </xsl:when>
            </xsl:choose>
            
            <xsl:variable name="v-indexref" as="element()">
                <indexref>
                    <xsl:for-each select="self::in:entry-text/child::node()">
                        <xsl:choose>
                            <xsl:when
                                test="self::node()[self::remotelink or self::ci:cite[not(self::ci:cite = parent::in:entry-text/node()[1])] or self::emph[@typestyle = 'bf']] or self::node()[preceding-sibling::node()[self::remotelink or self::ci:cite[not(self::ci:cite = parent::in:entry-text/node()[1])] or self::emph[@typestyle = 'bf']]]">
                                <xsl:copy-of select="." copy-namespaces="no"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </indexref>
            </xsl:variable>            

            <!-- The child elements are run in the in-entry mode -->
            <!--<xsl:apply-templates select="$v-indexref" mode="in-entry"/>-->
            <xsl:call-template name="fn-entry-text">
                <xsl:with-param name="indexref" select="$v-indexref" as="element()*"/>
            </xsl:call-template>
        </in:index-ref>
    </xsl:template>

</xsl:stylesheet>

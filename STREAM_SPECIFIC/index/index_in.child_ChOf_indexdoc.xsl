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
                        <heading>
                            <title>
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
                                <xsl:when test="$before_sqbracket=''">
                                    <xsl:value-of select="self::in:lev1/child::in:entry/child::in:entry-text/node()[1]"/>
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

    <xsl:template match="in:entry-text" mode="in-entry">

        <xsl:choose>
            <!-- When child element is remotelink -->
            <xsl:when
                test="self::in:entry-text/child::emph[not(child::*[name() != 'remotelink'])]/following-sibling::*[1][name() = 'remotelink']">
                <xsl:variable name="count_remotelink">
                    <xsl:value-of select="count(self::in:entry-text//remotelink)"/>
                </xsl:variable>
                <!-- The content emph/remotelink and its immediate following sibling remotelink are grouped under a single remotelink element in LA. 
                The below for-each-group is to group if there is multiple groups of emph/remotelink-following-sibling remotelink pair.-->
                <xsl:for-each-group select="emph" group-by="self::emph">
                    <xsl:variable name="dpsi">
                        <xsl:value-of select="self::emph/child::remotelink/@dpsi"/>
                    </xsl:variable>

                    <xsl:variable name="volume">
                        <xsl:choose>
                            <!-- If the remotelink PCDATA's string length is more than 1, then the first digit is moved outside of remotelink and the rest of the content is retained as remotelink's PCDATA. -->
                            <xsl:when test="string-length(self::emph/child::remotelink/text()) > 1">
                                <xsl:value-of
                                    select="concat('volume:', substring(self::emph/child::remotelink/text(), 2))"
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
                            <xsl:value-of
                                select="self::emph/child::remotelink/text(), self::emph/following-sibling::*[1][name() = 'remotelink']/text()"
                            />
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- The first digit of remotelink's PCDATA is moved outside remotelink  -->
                            <xsl:value-of
                                select="substring(self::emph/child::remotelink/text(), 1, 1)"/>
                            
                            <remotelink service="DOC-ID" remotekey1="REFPTID" dpsi="{$dpsi}">
                                <xsl:attribute name="refpt">
                                    <xsl:variable name="prepend" select="'acronym:HALS::'"/>
                                    <xsl:variable name="edition"
                                        select="concat('edition:', normalize-space(substring-before(substring-after(self::emph/following-sibling::*[1][name() = 'remotelink']/@refpt, 'HTCOMM-VOL_'), ':HTCOMM-EDITION_')))"/>
                                    <xsl:variable name="paragraph"
                                        select="concat('paragraph:', normalize-space(substring-before(substring-after(self::emph/following-sibling::*[1][name() = 'remotelink']/@refpt, 'HTCOMM-EDITION_'), ':HTCOMM-PARA')))"/>
                                       
                                       <!-- attribute @refpt value -->
                                    <xsl:value-of
                                        select="concat($prepend, $volume, '::', $edition, '::', $paragraph)"/>
                                </xsl:attribute>
                                
                                <xsl:attribute name="status" select="'invalid'"/>
                                <!--the remotelink created in LA should have both emph/remotelink's PCDATA[first digit removed] and the following sibling remotelink's PCDATA -->
                                <xsl:value-of
                                    select="normalize-space(substring(self::emph/child::remotelink/text(), 2)), normalize-space(self::emph/following-sibling::*[1][name() = 'remotelink']/text())"
                                />
                            </remotelink>
                            
                            <!-- To handle if there is PCDATA following the remotelink element i.e., emph/remotelink/following-sibling::remotelink/following:sibling::PCDATA -->
                            <xsl:if
                                test="self::emph/following-sibling::*[1][name() = 'remotelink']/following-sibling::node()[1]/name() = ''">
                                <xsl:value-of
                                    select="self::emph/following-sibling::*[1][name() = 'remotelink']/following-sibling::node()[1]"
                                />
                            </xsl:if>

                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each-group>

            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="node() except node()[1]"/>
            </xsl:otherwise>
        </xsl:choose>


    </xsl:template>

    <xsl:template match="in:entry-text" mode="in-entry1">
        <see>
            <xsl:apply-templates select="@* | node() except (self::in:entry-text/node()[1])"/>
        </see>
    </xsl:template>

    <xsl:template match="in:entry-text">
        <xsl:choose>
            <!-- When the child is ci:cite or remotelink, the content before ci:cite or remotelink is retained inside in:entry-text and the child ci:cite and remotelink is moved inside in:index-ref -->
            <xsl:when test="self::in:entry-text/*[name() = ('ci:cite', 'remotelink')]">
                <xsl:element name="{name()}">
                    <xsl:variable name="text">
                        <xsl:choose>
                            <!-- To check whether the PCDATA contains '[' -->
                            <xsl:when test="self::in:entry-text/node()[1]/name() = ''">
                                <xsl:variable name="before_sqbracket">
                                    <xsl:value-of
                                        select="substring-before(self::in:entry-text/node()[1], '[')"
                                    />
                                </xsl:variable>
                                <xsl:variable name="after_sqbracket">
                                    <xsl:value-of
                                        select="substring-after(self::in:entry-text/node()[1], '[')"
                                    />
                                </xsl:variable>
                                
                                <!-- If the PCDATA has '['in it then the content before '[' should be retained inside in:entry-text and the content after '[' should be moved to in:index-ref -->
                                <xsl:choose>
                                    <!-- If the PCDATA doesn't have '[' capture it inside in:entry-text -->
                                    <xsl:when test="$before_sqbracket=''">
                                        <xsl:value-of select="self::in:entry-text/node()[1]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="$before_sqbracket"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                
                            </xsl:when>
                            <!-- This will match when the child node()[1] is emph -->
                            <xsl:otherwise>
                                <xsl:value-of select="self::in:entry-text/node()[1]/text()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:choose>
                        <!-- If the node()[1] is emph, then it should be mapped to emph in LA -->
                        <xsl:when test="self::in:entry-text/node()[1]/name() = 'emph'">
                            <xsl:element name="{self::in:entry-text/node()[1]/name()}">
                                <xsl:copy-of select="self::in:entry-text/node()[1]/@*"/>
                                <xsl:call-template name="replace">
                                    <xsl:with-param name="text" select="$text"/>
                                </xsl:call-template>
                            </xsl:element>
                            
                            <!-- If there is PCDATA following the node()[1] - emph, then this should also be captured -->
                            <xsl:if
                                test="self::in:entry-text/node()[1]/following-sibling::node()[1]/name() = ''">
                                <xsl:value-of
                                    select="self::in:entry-text/node()[1]/following-sibling::node()[1]"
                                />
                            </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- When the node()[1] is PCDATA. -->
                            <xsl:call-template name="replace">
                                <xsl:with-param name="text" select="$text"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    <!-- refpt is created for in:entry-text when the node()[1] is PCDATA -->
                    <xsl:if test="self::in:entry-text/node()[1]/name()=''">
                        <refpt>
                            <xsl:attribute name="id">
                                <xsl:variable name="lbu">
                                    <!-- TBD: Awaiting clarification for refpt -->
                                    <xsl:choose>
                                        <xsl:when test="//docinfo:lbu-meta/docinfo:metaitem[@name='lbu-sourcename']/contains(@value,'All England Law Reports')">
                                            <xsl:value-of select="'AELR'"/>
                                        </xsl:when>
                                        <xsl:when test="//docinfo:lbu-meta/docinfo:metaitem[@name='lbu-sourcename']/contains(@value,'Halsbury')">
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
                                        <xsl:when test="$before_sqbracket=''">
                                            <xsl:value-of select="normalize-space(self::in:entry-text/node()[1])"/>
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
                                <xsl:value-of select="concat('acronym:',$lbu,'-INDEX::term:',upper-case($normalize_refpt_id))"/>
                            </xsl:attribute>
                        </refpt>
                    </xsl:if>
                    
                </xsl:element>
                <!-- The child element ci:cite and remotelink is moved inside in:index-ref -->
                <in:index-ref>
                    <!-- If the PCDATA has '[', then the content after '[' should be moved inside in:index-ref-->
                    <xsl:variable name="after_sqbracket">
                        <xsl:value-of select="substring-after(self::in:entry-text/node()[1], '[')"/>
                    </xsl:variable>
                    <xsl:choose>
                        <xsl:when test="$after_sqbracket!=''">
                            <xsl:call-template name="replace">
                                <xsl:with-param name="text" select="concat('[',$after_sqbracket)"/>
                            </xsl:call-template>
                        </xsl:when>
                    </xsl:choose>
                    
                    <!-- The child elements are run in the in-entry mode -->
                    <xsl:apply-templates select="." mode="in-entry"/>
                </in:index-ref>
            </xsl:when>

            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:apply-templates select="node() except refpt"/>
                    <xsl:apply-templates select="refpt"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>

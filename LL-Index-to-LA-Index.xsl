<?xml version="1.0" encoding="UTF-8"?>
<!--  ***This XSLT conversion file is a stand-alone, generated release created from a module based source code.  Any changes to this conversion must be propagated to its original source. ***
This file is not intended to be edited directly, except in a time critical situation such as a  "sev1" webstar.
Please contact Content Architecture for support and for ensuring the source code is updated as needed and a new stand-alone delivery is released.
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
Compiled:  2018-05-15T17:42:00.298+05:30-->
=======
Compiled:  2018-06-05T16:07:10.39+05:30-->
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:lnvxe="http://www.lexis-nexis.com/lnvxe"
                xmlns:lnv="http://www.lexis-nexis.com/lnv"
                xmlns:lnvni="http://www.lexis-nexis.com/lnvni"
                xmlns:lnclx="http://www.lexis-nexis.com/lnclx"
                xmlns:lncle="http://www.lexis-nexis.com/lncle"
                xmlns:lndel="http://www.lexis-nexis.com/lndel"
                xmlns:lngntxt="http://www.lexis-nexis.com/lngntxt"
                xmlns:lndocmeta="http://www.lexis-nexis.com/lndocmeta"
                xmlns:lnlit="http://www.lexis-nexis.com/lnlit"
                xmlns:lnci="http://www.lexis-nexis.com/lnci"
                xmlns:nitf="urn:nitf:iptc.org.20010418.NITF"
                xmlns:lnvx="http://www.lexis-nexis.com/lnvx"
                xmlns:ci="http://www.lexis-nexis.com/ci"
                xmlns:glp="http://www.lexis-nexis.com/glp"
                xmlns:case="http://www.lexis-nexis.com/glp/case"
                xmlns:jrnl="http://www.lexis-nexis.com/glp/jrnl"
                xmlns:comm="http://www.lexis-nexis.com/glp/comm"
                xmlns:cttr="http://www.lexis-nexis.com/glp/cttr"
                xmlns:dict="http://www.lexis-nexis.com/glp/dict"
                xmlns:dig="http://www.lexis-nexis.com/glp/dig"
                xmlns:docinfo="http://www.lexis-nexis.com/glp/docinfo"
                xmlns:frm="http://www.lexis-nexis.com/glp/frm"
                xmlns:in="http://www.lexis-nexis.com/glp/in"
                xmlns:leg="http://www.lexis-nexis.com/glp/leg"
                xmlns:xhtml="http://www.w3c.org/1999/xhtml"
                xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
                version="2.0"
                exclude-result-prefixes="xs xd">
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
   <xsl:param name="selectorID" select="'index'"/>
=======
   <xsl:param name="selectorID" select="'cases'"/>
   <xsl:variable name="docinfo.selector" select="//docinfo:selector//text()"/>
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
   <xsl:output encoding="utf-8" indent="no"/>
   <xsl:variable name="docinfo.selector" select="//docinfo:selector//text()"/>
   <xsl:strip-space elements="*"/>
   <!-- START OF CONTENT SPECIFIC XSLS -->
   <!-- Please uncomment the below xsl:include while unit-testing -->
   <!-- START: For unit-testing -->
   <!--<xsl:include href="../COMMON/nonamespace/default.xsl"/>-->
   <!-- END: For unit-testing -->
   <xsl:template match="INDEXDOC">
      <xsl:element name="{name()}">
         <xsl:for-each select="$RosettaNamespaces/*">
            <xsl:sort/>
            <xsl:namespace name="{substring-after(substring-before(., '='), ':')}"
                           select="substring-after(translate(., '&#34;', ''), '=')"/>
         </xsl:for-each>
         <!--<xsl:attribute name="type" select="'fulltext'"/>-->
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="in:*[self::node()/name() != 'in:entry-text']">
      <xsl:element name="{name()}">
         <xsl:choose>
            <xsl:when test="self::in:body[parent::INDEXDOC]">
               <xsl:if test="self::in:body[not(child::heading)]">
                  <heading xsl:exclude-result-prefixes="#all">
                     <title xsl:exclude-result-prefixes="#all">
                        <xsl:apply-templates select="//docinfo:hierlev[@role = 'me']//text()"/>
                     </title>
                  </heading>
               </xsl:if>
               <xsl:apply-templates select="@* | node()"/>
            </xsl:when>
            <xsl:when test="self::in:lev1[parent::in:body]">
               <xsl:if test="self::in:lev1/child::in:entry/child::in:entry-text/child::ci:cite">
                  <xsl:variable name="tocval"><!-- If the PCDATA has '['in it then the content before '[' should be retained inside in:entry-text and the content after '[' should be moved to in:index-ref -->
                     <xsl:variable name="before_sqbracket">
                        <xsl:value-of select="substring-before(self::in:lev1/child::in:entry/child::in:entry-text/node()[1], '[')"/>
                     </xsl:variable>
                     <xsl:choose><!-- If the PCDATA doesn't have '[' capture it inside in:entry-text -->
                        <xsl:when test="$before_sqbracket = ''">
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
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
   <!--<xsl:template match="in:entry-text" mode="in-entry">-->
   <xsl:template name="fn-entry-text" as="item()*">
      <xsl:param name="indexref" as="element()*"/>
      <xsl:for-each select="$indexref/child::node()">
         <xsl:choose><!-- When child element is remotelink --><!-- Eg: <emph typestyle="bf">
							<remotelink service="DOC-ID" remotekey1="REFPTID" refpt="0089_2_70:HTCOMM-VOL_5:HTCOMM-EDITION_93:HTCOMM-PARA" dpsi="0089">70</remotelink>
						</emph>
						<remotelink service="DOC-ID" remotekey1="REFPTID" refpt="0089_2_70:HTCOMM-VOL_5:HTCOMM-EDITION_93:HTCOMM-PARA" dpsi="0089"> (5th) 93</remotelink>; -->
            <xsl:when test="self::node()[self::emph[child::remotelink]][following-sibling::node()[1][name() = 'remotelink']]">
               <xsl:variable name="dpsi">
                  <xsl:value-of select="self::emph/child::remotelink/@dpsi"/>
               </xsl:variable>
               <xsl:variable name="volume">
                  <xsl:choose><!-- If the remotelink PCDATA's string length is more than 1, then the first digit is moved outside of remotelink and the rest of the content is retained as remotelink's PCDATA. -->
                     <xsl:when test="string-length(self::emph//remotelink) &gt; 1 and matches(substring(self::emph//remotelink, 1, 2), '[0-9]{2}')">
                        <xsl:value-of select="concat('volume:', substring(self::emph//remotelink, 2))"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="''"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose><!-- The volume will be '' when the PCDATA of remotelink is single digit. In this case, the remotelink created in LA should have both emph/remotelink and the following sibling remotelink's PCDATA -->
                  <xsl:when test="$volume = ''">
                     <xsl:value-of select="self::emph"/>
                     <xsl:value-of select="self::emph/following-sibling::*[1][name() = 'remotelink']"/>
                     <!--<xsl:if
                                        test="self::emph/following-sibling::*[1][name() = 'remotelink']/following-sibling::node()[1]/name() = ''">
                                        <xsl:value-of
                                            select="self::emph/following-sibling::*[1][name() = 'remotelink']/following-sibling::node()[1]"
                                        />
                                    </xsl:if>-->
=======

   <xsl:template match="case:juris[parent::case:courtinfo[parent::case:info | parent::judgment]]"/>
   <!-- case:publishdate element added by himanshu -->
   <xsl:template match="case:publishdate[parent::case:dates[parent::case:courtinfo]]">
      <case:publishdate>
         <xsl:apply-templates select="@*|node()"/>
      </case:publishdate>
   </xsl:template>

   <xsl:template match="catchwordgrp[parent::case:headnote]">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="catchwords[parent::catchwordgrp/parent::case:headnote]">
      <xsl:element name="{name()}"><!-- Revathi: 29May2018 - Added the below condition check as per the CR from Awntika
                When catchphrase is not present as the child of catchwords and catchwords is having PCDATA or other nodes as child, then create catchphrase -->
         <xsl:choose>
            <xsl:when test="self::catchwords/not(child::catchphrase) and self::catchwords/exists(child::node())">
               <catchphrase xsl:exclude-result-prefixes="#all">
                  <xsl:apply-templates select="@* | node()"/>
               </catchphrase>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates select="@* | node()"/>
            </xsl:otherwise>
         </xsl:choose>
         <!--<xsl:apply-templates select="@* | node()"/>-->
      </xsl:element>
   </xsl:template>

   <xsl:template match="catchphrase[ancestor::catchwordgrp/parent::case:headnote]">
      <xsl:variable name="text_to_process">
         <xsl:choose>
            <xsl:when test="child::ci:cite">
               <xsl:value-of select="self::catchphrase/text()[1]"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="."/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <!--START: Revathi: 30May2018 - When catchphrase is not having any delimiter in PCDATA then the tag catchphrase is not getting created as it is directly getting called to the named template catchphrase-split.
        So to handle this the catchphrase element is created in this stage itself when the PCDATA doesnt have any delimiter present.-->
      <xsl:variable name="v_delimiter">
         <xsl:choose>
            <xsl:when test="contains($text_to_process,'—')">
               <xsl:text>—</xsl:text>
            </xsl:when>
            <xsl:when test="contains($text_to_process,'–')">
               <xsl:text>–</xsl:text>
            </xsl:when>
            <!-- Awantika: 2018-05-07: Added new delimeter to split the data in new data set -->
            <xsl:when test="contains($text_to_process,'-')">
               <xsl:text>-</xsl:text>
            </xsl:when>
         </xsl:choose>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="$v_delimiter=''">
            <xsl:element name="{name()}">
               <xsl:apply-templates/>
            </xsl:element>
         </xsl:when>
         <xsl:otherwise>
            <xsl:call-template name="catchphrase_split">
               <xsl:with-param name="text" select="$text_to_process"/>
               <!-- Revathi: 04May2018 - Added below to choose from the type of delimiter present in the input file -->
               <xsl:with-param name="delimiter" select="$v_delimiter"/>
            </xsl:call-template>
            <xsl:apply-templates select="self::catchphrase/ci:cite" mode="catchphrase"/>
            <xsl:apply-templates select="self::catchphrase/page"/>
         </xsl:otherwise>
      </xsl:choose>
      <!--END: Revathi: 30May2018-->
   </xsl:template>

   <xsl:template name="catchphrase_split">
      <xsl:param name="text" select="."/>
      <!--<xsl:param name="delimiter">&#x2014;</xsl:param>-->
      <!-- Revathi: 04May2018 - Commented the above code and added below code as i have included the delimiter selection in the template call itself.  -->
      <xsl:param name="delimiter" select="."/>
      <!-- Revathi - 07May2018 - Added the below check to identify if the delimiter is present in cathphrase. -->
      <xsl:choose>
         <xsl:when test="$delimiter!=''"><!-- To check whether the end of catchphrase has been reached. As the end content is not ended with the same delimiter, we need to handle it. -->
            <xsl:variable name="test_for_last_value">
               <xsl:choose>
                  <xsl:when test="contains(substring-after($text, $delimiter), $delimiter)"><!-- It is not the last delimiter -->
                     <xsl:value-of select="'no'"/>
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
                  </xsl:when>
                  <xsl:otherwise><!-- The first digit of remotelink's PCDATA is moved outside remotelink  -->
                     <xsl:value-of select="substring(self::emph//remotelink, 1, 1)"/>
                     <remotelink service="DOC-ID"
                                 remotekey1="REFPTID"
                                 dpsi="{$dpsi}"
                                 xsl:exclude-result-prefixes="#all">
                        <xsl:attribute name="refpt">
                           <xsl:variable name="prepend" select="'acronym:HALS::'"/>
                           <xsl:variable name="edition">
                              <xsl:variable name="v_getValue">
                                 <xsl:analyze-string select="self::emph/following-sibling::*[1][name() = 'remotelink']/@refpt"
                                                     regex="(_([\w]+):[\w]+-EDITION)(_([\w]+):[\w]+-PARA)">
                                    <xsl:matching-substring>
                                       <xsl:value-of select="regex-group(2)"/>
                                    </xsl:matching-substring>
                                 </xsl:analyze-string>
                              </xsl:variable>
                              <xsl:if test="$v_getValue != ''">
                                 <xsl:value-of select="concat('edition:', $v_getValue, '::')"/>
                              </xsl:if>
                           </xsl:variable>
                           <xsl:variable name="paragraph">
                              <xsl:variable name="v_getValue">
                                 <xsl:analyze-string select="self::emph/following-sibling::*[1][name() = 'remotelink']/@refpt"
                                                     regex="(_([\w]+):[\w]+-EDITION)?(_([\w]+):[\w]+-PARA)">
                                    <xsl:matching-substring>
                                       <xsl:value-of select="regex-group(4)"/>
                                    </xsl:matching-substring>
                                 </xsl:analyze-string>
                              </xsl:variable>
                              <xsl:value-of select="concat('paragraph:', $v_getValue)"/>
                           </xsl:variable>
                           <!-- attribute @refpt value -->
                           <xsl:value-of select="concat($prepend, $volume, '::', $edition, $paragraph)"/>
                        </xsl:attribute>
                        <xsl:attribute name="status" select="'invalid'"/>
                        <!--the remotelink created in LA should have both emph/remotelink's PCDATA[first digit removed] and the following sibling remotelink's PCDATA -->
                        <xsl:value-of select="normalize-space(substring(self::emph//remotelink, 2)), normalize-space(self::emph/following-sibling::*[1][name() = 'remotelink'])"/>
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
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
            </xsl:when>
            <xsl:when test="self::remotelink/preceding-sibling::node()[1][name() = 'emph'][matches(.,'^[\s]*[0-9]+')]"/>
            <xsl:when test="self::node()[name() = ('emph', '')][matches(., '[0-9]*\[?[0-9]+\]?')]/preceding-sibling::node()[1][matches(.,'^[\s]*[0-9]+')][name() = 'emph'] and not(self::node()/name()=preceding-sibling::node()/name())"/>
            <xsl:when test="self::node()[name() = ('emph', '')][matches(., '^[\s]*\[?[0-9]+\]?')]/preceding-sibling::node()[1][matches(.,'^[\s]*[0-9]+')][name() = 'emph'] and not(self::node()/name()=preceding-sibling::node()/name())"/>
            <xsl:when test="self::node()[(self::emph[matches(., '[0-9]+')] and self::emph/following-sibling::node()[1][matches(., '[\s]*\((([0-9]+)th|rt|st)\)[\s]*([0-9]+)')]/name() = '') or (self::emph[matches(., '[0-9]*\(?[0-9]+\)?')] and self::emph/following-sibling::node()[1][matches(., '[\s]*\[[0-9]+\]')])]">
=======
            </xsl:variable>
            <xsl:if test="normalize-space(substring-before($text, $delimiter)) != ''">
               <xsl:choose><!-- When more delimiter is present, process the text before the delimiter -->
                  <xsl:when test="$test_for_last_value = 'no'">
                     <catchphrase xsl:exclude-result-prefixes="#all">
                        <xsl:call-template name="replace">
                           <xsl:with-param name="text"
                                           select="normalize-space(substring-before($text, $delimiter))"/>
                        </xsl:call-template>
                     </catchphrase>
                  </xsl:when>
                  <!-- When it is the last delimiter and no more delimiter is present, then process both before and after contents of delimiter -->
                  <xsl:when test="$test_for_last_value = 'yes'">
                     <catchphrase xsl:exclude-result-prefixes="#all">
                        <xsl:call-template name="replace">
                           <xsl:with-param name="text"
                                           select="normalize-space(substring-before($text, $delimiter))"/>
                        </xsl:call-template>
                     </catchphrase>
                     <catchphrase xsl:exclude-result-prefixes="#all">
                        <xsl:call-template name="replace">
                           <xsl:with-param name="text"
                                           select="normalize-space(substring-after($text, $delimiter))"/>
                        </xsl:call-template>
                     </catchphrase>
                  </xsl:when>
               </xsl:choose>
            </xsl:if>
            <xsl:if test="normalize-space(substring-after($text, $delimiter)) != ''">
               <xsl:call-template name="catchphrase_split">
                  <xsl:with-param name="text" select="substring-after($text, $delimiter)"/>
                  <xsl:with-param name="delimiter" select="$delimiter"/>
               </xsl:call-template>
            </xsl:if>
         </xsl:when>
         <xsl:otherwise>
            <xsl:call-template name="replace">
               <xsl:with-param name="text"
                               select="normalize-space(substring-after($text, $delimiter))"/>
            </xsl:call-template>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="ci:cite[parent::catchphrase/ancestor::catchwordgrp/parent::case:headnote]"/>

   <xsl:template match="ci:cite[parent::catchphrase]" mode="catchphrase">
      <catchphrase xsl:exclude-result-prefixes="#all">
         <xsl:value-of select="normalize-space(concat(self::ci:cite//ci:content//text(), translate(following-sibling::node()[1][./name() = ''], '–', '')))"/>
      </catchphrase>
   </xsl:template>

   <xsl:template match="case:factsummary">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="case:decisionsummary[parent::case:headnote]">
      <xsl:choose><!-- Arun: 07May2018 Added the below condition check to suppress the creation of tag case:decisionsummary when there is no child element apart from glp:note and case:consideredcases -->
         <xsl:when test="child::node()[name() != 'glp:note' and name() != 'case:consideredcases']">
            <xsl:element name="{name()}">
               <xsl:attribute name="summarytype" select="'held'"/>
               <!-- If there is glp:note within case:headnote and as preceeding sibling of decisionsummary, then we have to move this into decisionsummary and suppress the tag glp:note and retain its child elements -->
               <xsl:apply-templates select="self::case:decisionsummary/preceding-sibling::node()[1][name()='glp:note']"/>
               <xsl:for-each select="*">
                  <xsl:if test="self::node()[not(preceding-sibling::glp:note) and not(preceding-sibling::case:consideredcases)]">
                     <xsl:apply-templates select="."/>
                  </xsl:if>
               </xsl:for-each>
            </xsl:element>
         </xsl:when>
      </xsl:choose>
   </xsl:template>
   <!--    Dayanand singh 15 may 2018 commenting the below code for processing the glp:note element-->
   <xsl:template match="glp:note[parent::case:decisionsummary] | case:consideredcases[parent::case:decisionsummary]"/>

   <xsl:template match="glp:note[parent::case:headnote and following-sibling::case:decisionsummary]"><!-- Revathi: 29May2018 - code change for the Correction asked by awntika -->
      <glp:note xsl:exclude-result-prefixes="#all">
         <xsl:apply-templates/>
      </glp:note>
   </xsl:template>

   <xsl:template match="glp:note[parent::case:decisionsummary/parent::case:headnote]"
                 mode="glp.note">
      <xsl:choose>
         <xsl:when test="self::glp:note/not(preceding-sibling::glp:note)">
            <xsl:element name="note" inherit-namespaces="no">
               <xsl:attribute name="notetype" select="'commentary'"/>
               <xsl:apply-templates/>
               <xsl:apply-templates select="following-sibling::glp:note|following-sibling::node()[preceding-sibling::glp:note][not(preceding-sibling::case:consideredcases)]"
                                    mode="grp_glp.note"/>
            </xsl:element>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="node()[name()!='glp:note'][preceding-sibling::glp:note][not(preceding-sibling::case:consideredcases)]"
                 mode="grp_glp.note">
      <xsl:apply-templates select="."/>
   </xsl:template>

   <xsl:template match="glp:note[parent::case:decisionsummary/parent::case:headnote]"
                 mode="grp_glp.note">
      <xsl:apply-templates/>
   </xsl:template>
   <!--Dayanand Singh 2018-4-30 ceated new template match-->
   <xsl:template match="glp:note[parent::case:constituents/parent::case:judgment]">
      <xsl:element name="glp:note" inherit-namespaces="no">
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="case:consideredcases[parent::case:decisionsummary/parent::case:headnote]"
                 mode="references">
      <xsl:choose>
         <xsl:when test="self::case:consideredcases/not(preceding-sibling::case:consideredcases)">
            <case:references referencetype="cases" xsl:exclude-result-prefixes="#all">
               <xsl:apply-templates/>
               <xsl:apply-templates select="following-sibling::case:consideredcases|following-sibling::node()[name()!=('p')][preceding-sibling::case:consideredcases]"
                                    mode="grp_case.references"/>
            </case:references>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="node()[name()!=('p')][name()!=('case:consideredcases')][preceding-sibling::case:consideredcases]"
                 mode="grp_case.references">
      <xsl:apply-templates select="."/>
   </xsl:template>

   <xsl:template match="case:consideredcases[parent::case:decisionsummary/parent::case:headnote]"
                 mode="grp_case.references">
      <xsl:apply-templates/>
   </xsl:template>
   <!-- Modified by Himanshu, Date: 10th May, 2018:
        Added template to handle element /CASEDOC/case:body/case:headnote/case:factsummary/case:consideredcases 
    -->
   <xsl:template match="case:consideredcases[parent::case:factsummary]">
      <case:references referencetype="cases">
         <xsl:apply-templates select="@*|node()"/>
      </case:references>
   </xsl:template>
   <!-- Modified by Himanshu, Date: 10th May, 2018:
        Added template to handle element /CASEDOC/case:body/case:headnote/case:catchwordgrp/case:consideredcases 
    -->
   <xsl:template match="case:consideredcases[parent::catchwordgrp]">
      <case:references referencetype="cases">
         <xsl:apply-templates select="@*|node()"/>
      </case:references>
   </xsl:template>

   <xsl:template match="case:priorhist[ancestor::case:headnote]">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>
   <!-- Arun: 02May2018 - Added below template to handle attributes of the element case:priorhist -->
   <xsl:template match="case:priorhist/@*">
      <xsl:copy/>
   </xsl:template>

   <xsl:template match="case:content">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="glp:note[parent::case:content]">
      <xsl:choose>
         <xsl:when test="self::glp:note/following-sibling::*[1][name()='case:appendix']">
            <case:appendix xsl:exclude-result-prefixes="#all">
               <xsl:apply-templates/>
            </case:appendix>
         </xsl:when>
         <!-- Arun: 07May2018 - Updated below condition to handle the child elements of glp:note-->
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="case:judgments[parent::case:content]">
      <xsl:choose><!-- Revathi: 04May2018 - Added condition to check whether case:judgments id not an empty element -->
         <xsl:when test="self::case:judgments/not(preceding-sibling::case:judgments) and self::case:judgments[child::node()]">
            <xsl:element name="{name()}">
               <xsl:if test="parent::case:content/preceding-sibling::case:headnote//case:decisionsummary/p">
                  <prelim xsl:exclude-result-prefixes="#all">
                     <xsl:apply-templates select="parent::case:content/preceding-sibling::case:headnote//case:decisionsummary/p"
                                          mode="prelim"/>
                  </prelim>
               </xsl:if>
               <xsl:apply-templates select="@* | node()"/>
               <xsl:apply-templates select="following-sibling::case:judgments" mode="grp_case.judgements"/>
            </xsl:element>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="case:judgments" mode="grp_case.judgements">
      <xsl:apply-templates/>
   </xsl:template>

   <xsl:template match="glp:note[parent::case:judgments]">
      <prelim xsl:exclude-result-prefixes="#all"><!-- This mode is defined in the file "case.judgements_ChOf_case.content.xsl" -->
         <xsl:apply-templates mode="prelim"/>
      </prelim>
   </xsl:template>

   <xsl:template match="*" mode="prelim">
      <xsl:choose>
         <xsl:when test="self::page">
            <xsl:apply-templates select="."/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:element name="{name()}">
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
               <xsl:choose>
                  <xsl:when test="self::emph[matches(., '[0-9]+')] and self::emph/following-sibling::node()[matches(., '[\s]*\((([0-9]+)th|rt|st)\)[\s]*([0-9]+)')]/name() = ''">
                     <xsl:variable name="dpsi">
                        <xsl:value-of select="substring($v_getDPSI, 1, 4)"/>
                     </xsl:variable>
                     <xsl:variable name="volume">
                        <xsl:choose><!-- If the remotelink PCDATA's string length is more than 1, then the first digit is moved outside of remotelink and the rest of the content is retained as remotelink's PCDATA. -->
                           <xsl:when test="string-length(self::emph) &gt; 1">
                              <xsl:value-of select="concat('volume:', substring(self::emph, 2))"/>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:value-of select="''"/>
                           </xsl:otherwise>
                        </xsl:choose>
                     </xsl:variable>
                     <xsl:choose><!-- The volume will be '' when the PCDATA of remotelink is single digit. In this case, the remotelink created in LA should have both emph/remotelink and the following sibling remotelink's PCDATA -->
                        <xsl:when test="$volume = ''">
                           <xsl:value-of select="self::emph"/>
                           <xsl:value-of select="self::emph/following-sibling::*[1][name() = '']/text()"/>
                        </xsl:when>
                        <xsl:otherwise><!-- The first digit of remotelink's PCDATA is moved outside remotelink  -->
                           <xsl:value-of select="substring(self::emph, 1, 1)"/>
                           <remotelink service="DOC-ID"
                                       remotekey1="REFPTID"
                                       dpsi="{$dpsi}"
                                       xsl:exclude-result-prefixes="#all">
                              <xsl:attribute name="refpt">
                                 <xsl:variable name="prepend" select="'acronym:HALS::'"/>
                                 <xsl:variable name="edition">
                                    <xsl:variable name="v_getvalue">
                                       <xsl:analyze-string select="self::emph/following-sibling::text()"
                                                           regex="[\s]*\((([0-9]+)th|rt|st)\)[\s]*([0-9]+)">
                                          <xsl:matching-substring><!-- In the above regex, the regex-group 1, matches the content present within the '(' and ')'. So get the numeric content only, we are matching regex-group(2) -->
                                             <xsl:value-of select="regex-group(2)"/>
                                          </xsl:matching-substring>
                                       </xsl:analyze-string>
                                    </xsl:variable>
                                    <xsl:value-of select="concat('edition:', normalize-space($v_getvalue))"/>
                                 </xsl:variable>
                                 <xsl:variable name="paragraph">
                                    <xsl:variable name="v_getvalue">
                                       <xsl:analyze-string select="self::emph/following-sibling::text()"
                                                           regex="[\s]*\((([0-9]+)th|rt|st)\)[\s]*([0-9]+)">
                                          <xsl:matching-substring>
                                             <xsl:value-of select="regex-group(3)"/>
                                          </xsl:matching-substring>
                                       </xsl:analyze-string>
                                    </xsl:variable>
                                    <xsl:value-of select="concat('paragraph:', normalize-space($v_getvalue))"/>
                                 </xsl:variable>
                                 <!-- attribute @refpt value -->
                                 <xsl:value-of select="concat($prepend, $volume, '::', $edition, '::', $paragraph)"/>
                              </xsl:attribute>
                              <xsl:attribute name="status" select="'invalid'"/>
                              <!--the remotelink created in LA should have both emph/remotelink's PCDATA[first digit removed] and the following sibling remotelink's PCDATA -->
                              <xsl:value-of select="normalize-space(substring(self::emph, 2)), normalize-space(self::emph/following-sibling::text())"/>
                           </remotelink>
                           <!--<!-\- To handle if there is PCDATA following the remotelink element i.e., emph/remotelink/following-sibling::remotelink/following:sibling::PCDATA -\->
                                    <xsl:if
                                        test="self::emph/following-sibling::*[1][name() = 'remotelink']/following-sibling::node()[1]/name() = ''">
                                        <xsl:value-of
                                            select="self::emph/following-sibling::*[1][name() = 'remotelink']/following-sibling::node()[1]"
                                        />
                                    </xsl:if>-->
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="(self::node()[matches(., '^[0-9]*\(?[0-9]+\)?')] and self::node()/following-sibling::node()[1][matches(., '[\s]*\[[0-9]+\]')])">
                     <xsl:variable name="dpsi">
                        <xsl:value-of select="substring($v_getDPSI, 1, 4)"/>
                     </xsl:variable>
                     <xsl:variable name="volume">
                        <xsl:choose><!-- If the remotelink PCDATA's string length is more than 1, then the first digit is moved outside of remotelink and the rest of the content is retained as remotelink's PCDATA. -->
                           <xsl:when test="string-length(self::emph) &gt; 1">
                              <xsl:value-of select="concat('volume:', substring(self::emph, 2))"/>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:value-of select="''"/>
                           </xsl:otherwise>
                        </xsl:choose>
                     </xsl:variable>
                     <xsl:choose><!-- The volume will be '' when the PCDATA of remotelink is single digit. In this case, the remotelink created in LA should have both emph/remotelink and the following sibling remotelink's PCDATA -->
                        <xsl:when test="$volume = ''">
                           <xsl:value-of select="self::emph"/>
                           <xsl:value-of select="self::emph/following-sibling::*[1][name() = '']/text()"/>
                        </xsl:when>
                        <xsl:otherwise><!-- The first digit of remotelink's PCDATA is moved outside remotelink  -->
                           <xsl:value-of select="substring(self::emph, 1, 1)"/>
                           <remotelink service="DOC-ID"
                                       remotekey1="REFPTID"
                                       dpsi="{$dpsi}"
                                       xsl:exclude-result-prefixes="#all">
                              <xsl:attribute name="refpt">
                                 <xsl:variable name="prepend" select="'acronym:HALS::'"/>
                                 <xsl:variable name="paragraph">
                                    <xsl:variable name="v_getvalue">
                                       <xsl:analyze-string select="self::emph/following-sibling::node()[1]"
                                                           regex="[\s]*\[?([0-9]+)\]?">
                                          <xsl:matching-substring>
                                             <xsl:value-of select="regex-group(1)"/>
                                          </xsl:matching-substring>
                                       </xsl:analyze-string>
                                    </xsl:variable>
                                    <xsl:value-of select="concat('paragraph:', normalize-space($v_getvalue))"/>
                                 </xsl:variable>
                                 <!-- attribute @refpt value -->
                                 <xsl:value-of select="concat($prepend, $volume, '::', $paragraph)"/>
                              </xsl:attribute>
                              <xsl:attribute name="status" select="'invalid'"/>
                              <!--the remotelink created in LA should have both emph/remotelink's PCDATA[first digit removed] and the following sibling remotelink's PCDATA -->
                              <xsl:value-of select="normalize-space(substring(self::emph, 2)), normalize-space(self::emph/following-sibling::node()[1])"/>
                           </remotelink>
                           <!--<!-\- To handle if there is PCDATA following the remotelink element i.e., emph/remotelink/following-sibling::remotelink/following:sibling::PCDATA -\->
                                    <xsl:if
                                        test="self::emph/following-sibling::*[1][name() = 'remotelink']/following-sibling::node()[1]/name() = ''">
                                        <xsl:value-of
                                            select="self::emph/following-sibling::*[1][name() = 'remotelink']/following-sibling::node()[1]"
                                        />
                                    </xsl:if>-->
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
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

   <xsl:template match="in:entry-text"><!--<xsl:choose>
            <!-\- When the child is ci:cite or remotelink, the content before ci:cite or remotelink is retained inside in:entry-text and the child ci:cite and remotelink is moved inside in:index-ref -\->
            <xsl:when
                test="self::in:entry-text/*[self::ci:cite = parent::in:entry-text/node()[1]] or self::in:entry-text/*[name() = ('ci:cite', 'remotelink')] or self::in:entry-text/child::emph[@typestyle = 'bf']">
                <xsl:element name="{name()}">
                    <!-\-<xsl:for-each select="child::node()[(self::node()[name()='ci:cite']=parent::in:entry-text/node()[1]) or (not(self::node()/preceding-sibling::node()/name()=('remotelink','ci:cite')) and not(self::node()[name()=('remotelink','ci:cite')]) and not(self::node()[matches(.,'[0-9]+')][@typestyle='bf']/name()='emph') and not(self::node()[matches(., '[\s]*\((([0-9]+)th|rt|st)\)[\s]*([0-9]+)')]/preceding-sibling::emph/@typestyle='bf') and not(self::node()/name()='emph' and child::node()/name()=('remotelink','ci:cite')) and self::node()[not(preceding-sibling::node()[remotelink or ci:cite or emph/remotelink])])]">-\->
                    <xsl:for-each
                        select="node()[not(self::node()/name() = ('remotelink', 'ci:cite') or (self::node()[matches(., '[0-9]+')][@typestyle = 'bf'][name() = 'emph']/following-sibling::node()[1][matches(., '[\s]*\((([0-9]+)th|rt|st)\)[\s]*([0-9]+)')]) or (self::node()[matches(., '[\s]*\((([0-9]+)th|rt|st)\)[\s]*([0-9]+)')]/preceding-sibling::node()[1][matches(., '[0-9]+')][@typestyle = 'bf'][name() = 'emph']) or (self::node()[matches(.,'\[?[0-9]+\]?')][name()='emph'][@typestyle='smcaps']) or (self::node()[matches(., '^[0-9]+\(?[0-9]*\)?')][@typestyle = 'bf'][name() = 'emph']/following-sibling::node()[1][matches(., '[\s]*[0-9]*[\s]*\[?[0-9]+\]?')]) or (self::node()[matches(., '[\s]*[0-9]*[\s]*\[?[0-9]+\]?')]/preceding-sibling::node()[1][matches(., '^\(?[0-9]+\)?\(?[0-9]*\)?')][@typestyle = 'bf'][name() = 'emph']) or self::node()[name() = 'emph']/following-sibling::*[1][remotelink] or self::node()[name() = 'emph']/child::remotelink or self::node()/preceding-sibling::node()[name() = ('remotelink', 'ci:cite')] or self::node()[name() = '']/preceding-sibling::node()[remotelink or ci:cite or emph/remotelink] or self::node()/preceding-sibling::emph/child::node()[name() = ('remotelink', 'ci:cite')]) or self::node() = parent::in:entry-text/node()[1]]">
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
                    </xsl:for-each>

                    <!-\- refpt is created for in:entry-text when the node()[1] is PCDATA -\->
                    <!-\-<xsl:if test="self::in:entry-text/node()[1]/name() = ''">
                        <refpt xsl:exclude-result-prefixes="#all">
                            <xsl:attribute name="id">
                                <xsl:variable name="lbu">
                                    <!-\\- TBD: Awaiting clarification for refpt -\\->
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
                                    <!-\\- If the PCDATA has '['in it then the content before '[' should be retained inside in:entry-text and the content after '[' should be moved to in:index-ref -\\->
                                    <xsl:variable name="before_sqbracket">
                                        <xsl:value-of
                                            select="substring-before(self::in:entry-text/node()[1], '[')"
                                        />
                                    </xsl:variable>
                                    <xsl:choose>
                                        <!-\\- If the PCDATA doesn't have '[' capture it inside in:entry-text -\\->
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

                                <!-\\- Normalise the @id -\\->
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
                    </xsl:if>-\->
=======
                     <xsl:apply-templates/>
                     <!-- New code from here -->
                     <!-- 31-May-2018 Modified by Himanshu for <pgrp>/<p>/<text><glp:note> placed outside <pgrp>/<p> and inside <pgrp>.
                        Old Code: <xsl:apply-templates/> -->
                     <xsl:if test="self::pgrp/p/text/glp:note">
                        <xsl:apply-templates select="self::pgrp/p/text/glp:note"/>
                     </xsl:if>
                     <xsl:for-each select="self::pgrp/p/text/node()[not(self::glp:note)][preceding-sibling::glp:note]">
                        <p>
                           <text>
                              <xsl:apply-templates select="."/>
                           </text>
                        </p>
                     </xsl:for-each>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="case:dates[parent::case:judgments] | case:disposition[parent::case:judgments]">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="case:decisiondate[parent::case:dates/parent::case:judgments]">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@*|node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="date[parent::case:decisiondate/parent::case:dates/parent::case:judgments]">
      <xsl:apply-templates/>
   </xsl:template>
   <!-- Dayanand singh 2018-05-01 ceated new element case:embeddedcase child element of case:judgmentbody-->
   <xsl:template match="case:embeddedcase[parent::case:judgmentbody]">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@*|node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="case:constituents">
      <xsl:choose>
         <xsl:when test="self::case:constituents/not(preceding-sibling::case:constituents)">
            <xsl:element name="{name()}">
               <xsl:apply-templates/>
               <xsl:apply-templates select="following-sibling::case:constituents"
                                    mode="grp_case.constituents"/>
            </xsl:element>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="case:constituents[preceding-sibling::case:constituents]"
                 mode="grp_case.constituents">
      <xsl:apply-templates/>
   </xsl:template>

   <xsl:template match="case:constituent[parent::case:constituents]"><!-- Revathi: 05June2018 - When glp:note is the only child of case:constituent/person/name.text, then move glp:note outside of case:constituent (as the child of case:constituents) and suppress person/name.text (as we have moved the only child glp:note outside, it will be just empty elements).-->
      <xsl:choose>
         <xsl:when test="self::case:constituent/child::person/child::name.text/not(child::node()[name()!='glp:note'])">
            <xsl:apply-templates/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="case:judgment[parent::case:judgments] | case:judgmentbody[parent::case:judgment/parent::case:judgments]">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="case:appendix[parent::case:content]">
      <xsl:element name="{name()}">
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>
   <!--Dayanand singh 2018-04-30 -->
   <xsl:template match="case:appendix">
      <xsl:element name="case:appendix" inherit-namespaces="no">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl

                </xsl:element>
                <!-\- The child element ci:cite and remotelink is moved inside in:index-ref -\->
                <in:index-ref xsl:exclude-result-prefixes="#all">
                    <!-\- If the PCDATA has '[', then the content after '[' should be moved inside in:index-ref-\->
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
                        <xsl:for-each select="node()[self::node()[matches(.,'^[\s]*\(?\[?[0-9]+\)?\]?')][name()='ci:cite' or name()='remotelink' or self::emph//remotelink]][preceding-sibling::node()[not(matches(.,'^[\s]*\(?\[?[0-9]+\)?\]?'))]][name()='ci:cite' or name()='remotelink' or emph//remotelink]">
                        <xsl:copy-of select="." copy-namespaces="no"/>
                    </xsl:for-each>
                    </xsl:variable>
                       
                    <!-\-<xsl:variable name="v-indexref" as="element()">
                        <indexref>
                            <xsl:for-each
                                select="node()[self::node()/name() = ('remotelink', 'ci:cite') or (self::node()[matches(., '[0-9]+')][@typestyle = 'bf'][name() = 'emph']/following-sibling::node()[1][matches(., '[\s]*\((([0-9]+)th|rt|st)\)[\s]*([0-9]+)')]) or (self::node()[matches(., '[\s]*\((([0-9]+)th|rt|st)\)[\s]*([0-9]+)')]/preceding-sibling::node()[1][matches(., '[0-9]+')][@typestyle = 'bf'][name() = 'emph']) or (self::node()[matches(.,'\[?[0-9]+\]?')][name()='emph'][@typestyle='smcaps']) or (self::node()[matches(., '^[0-9]+\(?[0-9]*\)?')][@typestyle = 'bf'][name() = 'emph']/following-sibling::node()[1][matches(., '[\s]*[0-9]*[\s]*\[?[0-9]+\]?')]) or (self::node()[matches(., '[\s]*[0-9]*[\s]*\[?[0-9]+\]?')]/preceding-sibling::node()[1][matches(., '^\(?[0-9]+\)?\(?[0-9]*\)?')][@typestyle = 'bf'][name() = 'emph']) or self::node()[name() = 'emph']/following-sibling::*[1][remotelink] or self::node()[name() = 'emph']/child::remotelink or self::node()/preceding-sibling::node()[name() = ('remotelink', 'ci:cite')] or self::node()[name() = ''][not(self::node() = parent::in:entry-text/node()[1])]/preceding-sibling::node()[remotelink or ci:cite or emph/remotelink] or self::node()/preceding-sibling::emph/child::node()[name() = ('remotelink', 'ci:cite')]]">
                                <xsl:copy-of select="." copy-namespaces="no"/>
                            </xsl:for-each>
                        </indexref>
                    </xsl:variable>-\->
                    <xsl:message select="$v-indexref"/>
                    <!-\- The child elements are run in the in-entry mode -\->
                    <!-\-<xsl:apply-templates select="$v-indexref" mode="in-entry"/>-\->
                    <xsl:call-template name="fn-entry-text">
                        <xsl:with-param name="indexref" select="$v-indexref" as="element()*"/>
                    </xsl:call-template>
                </in:index-ref>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:apply-templates select="node() except refpt"/>
                    <xsl:apply-templates select="refpt"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>-->
      <xsl:element name="{name()}">
         <xsl:for-each select="child::node()">
            <xsl:choose>
               <xsl:when test="self::node()[self::remotelink or self::ci:cite[not(self::ci:cite = parent::in:entry-text/node()[1])] or self::emph[@typestyle = 'bf']] or self::node()[preceding-sibling::node()[self::remotelink or self::ci:cite[not(self::ci:cite = parent::in:entry-text/node()[1])] or self::emph[@typestyle = 'bf']]]"/>
               <xsl:otherwise>
                  <xsl:choose>
                     <xsl:when test="self::node()/name() = '' and self::node() = parent::in:entry-text/node()[1] and self::node()/following-sibling::*[1][name() = ('remotelink', 'ci:cite', 'emph')] and contains(self::node(), '[')">
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
         <!--<xsl:if test="self::in:entry-text/node()[1]/name() = ''">
                        <refpt xsl:exclude-result-prefixes="#all">
                            <xsl:attribute name="id">
                                <xsl:variable name="lbu">
                                    <!-\- TBD: Awaiting clarification for refpt -\->
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
                                    <!-\- If the PCDATA has '['in it then the content before '[' should be retained inside in:entry-text and the content after '[' should be moved to in:index-ref -\->
                                    <xsl:variable name="before_sqbracket">
                                        <xsl:value-of
                                            select="substring-before(self::in:entry-text/node()[1], '[')"
                                        />
                                    </xsl:variable>
                                    <xsl:choose>
                                        <!-\- If the PCDATA doesn't have '[' capture it inside in:entry-text -\->
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

                                <!-\- Normalise the @id -\->
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
                    </xsl:if> -->
      </xsl:element>
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
      <!-- The child element ci:cite and remotelink is moved inside in:index-ref -->
      <in:index-ref xsl:exclude-result-prefixes="#all"><!-- If the PCDATA has '[', then the content after '[' should be moved inside in:index-ref-->
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
                     <xsl:when test="self::node()[self::remotelink or self::ci:cite[not(self::ci:cite = parent::in:entry-text/node()[1])] or self::emph[@typestyle = 'bf']] or self::node()[preceding-sibling::node()[self::remotelink or self::ci:cite[not(self::ci:cite = parent::in:entry-text/node()[1])] or self::emph[@typestyle = 'bf']]]">
                        <xsl:copy-of select="." copy-namespaces="no"/>
                     </xsl:when>
                  </xsl:choose>
               </xsl:for-each>
            </indexref>
         </xsl:variable>
         <xsl:message select="$v-indexref"/>
         <!--<xsl:variable name="v-indexref" as="element()">
                <indexref>
                    <xsl:for-each
                        select="node()[self::node()/name() = ('remotelink', 'ci:cite') or (self::node()[matches(., '[0-9]+')][@typestyle = 'bf'][name() = 'emph']/following-sibling::node()[1][matches(., '[\s]*\((([0-9]+)th|rt|st)\)[\s]*([0-9]+)')]) or (self::node()[matches(., '[\s]*\((([0-9]+)th|rt|st)\)[\s]*([0-9]+)')]/preceding-sibling::node()[1][matches(., '[0-9]+')][@typestyle = 'bf'][name() = 'emph']) or (self::node()[matches(.,'\[?[0-9]+\]?')][name()='emph'][@typestyle='smcaps']) or (self::node()[matches(., '^[0-9]+\(?[0-9]*\)?')][@typestyle = 'bf'][name() = 'emph']/following-sibling::node()[1][matches(., '[\s]*[0-9]*[\s]*\[?[0-9]+\]?')]) or (self::node()[matches(., '[\s]*[0-9]*[\s]*\[?[0-9]+\]?')]/preceding-sibling::node()[1][matches(., '^\(?[0-9]+\)?\(?[0-9]*\)?')][@typestyle = 'bf'][name() = 'emph']) or self::node()[name() = 'emph']/following-sibling::*[1][remotelink] or self::node()[name() = 'emph']/child::remotelink or self::node()/preceding-sibling::node()[name() = ('remotelink', 'ci:cite')] or self::node()[name() = ''][not(self::node() = parent::in:entry-text/node()[1])]/preceding-sibling::node()[remotelink or ci:cite or emph/remotelink] or self::node()/preceding-sibling::emph/child::node()[name() = ('remotelink', 'ci:cite')]]">
                        <xsl:copy-of select="." copy-namespaces="no"/>
                    </xsl:for-each>
                </indexref>
            </xsl:variable>-->
         <!-- The child elements are run in the in-entry mode -->
         <!--<xsl:apply-templates select="$v-indexref" mode="in-entry"/>-->
         <xsl:call-template name="fn-entry-text">
            <xsl:with-param name="indexref" select="$v-indexref" as="element()*"/>
         </xsl:call-template>
      </in:index-ref>
=======
   </xsl:template>

   <xsl:template match="case:dates">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="case:decisiondate">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
   </xsl:template>
   <!-- END OF CONTENT SPECIFIC XSLS -->   <!-- START OF GENERIC XSLS -->   <xsl:variable name="path"
                 select="substring-before($document-uri, tokenize($document-uri, '/')[last()])"/>
   <xsl:variable name="v_getDPSI">
      <xsl:analyze-string select="$path" regex="[/]([0-9][0-9A-Z]{{3}})[_|-]?">
         <xsl:matching-substring>
            <xsl:value-of select="regex-group(1)"/>
         </xsl:matching-substring>
      </xsl:analyze-string>
   </xsl:variable>
   <xsl:template match="docinfo">
      <xsl:element name="{name()}">
         <docinfo:dpsi id-string="{substring($v_getDPSI,1,4)}"
                       xsl:exclude-result-prefixes="#all"/>
         <!--<xsl:choose>
                <xsl:when test="$selectorID='dictionary'">
                    <docinfo:dpsi id-string="0KMN"/> 
                </xsl:when>
                <xsl:when test="$selectorID='cases' and $docinfo.selector=('LawReport','PracticeDirection')">
                    <docinfo:dpsi id-string="0T2S"/>
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

   <xsl:template match="docinfo:doc-heading | docinfo:bookseqnum[$selectorID = 'cases'] | docinfo:doc-lang | docinfo:doc-country | docinfo:hier | docinfo:hierlev | heading[parent::docinfo:hierlev] | title[ancestor::docinfo:hierlev] | docinfo:lbu-meta | docinfo:metaitem | docinfo:selector | docinfo:alt-renditions | docinfo:alt-rendition | link[parent::docinfo:alt-rendition]">
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
            <xsl:when test="self::docinfo:doc-heading and $docinfo.selector = 'PracticeDirection'">
               <xsl:variable name="docinfo_dochead" select="//docinfo:doc-heading"/>
               <xsl:choose>
                  <xsl:when test="starts-with($docinfo_dochead, 'Practice Direction;')">
                     <xsl:value-of select="replace($docinfo_dochead, 'Practice Direction;', 'Practice Direction')"/>
                  </xsl:when>
                  <xsl:when test="starts-with($docinfo_dochead, 'Note;')">
                     <xsl:value-of select="replace($docinfo_dochead, 'Note;', 'Note')"/>
                  </xsl:when>
                  <xsl:when test="starts-with($docinfo_dochead, 'Practice Note;')">
                     <xsl:value-of select="replace($docinfo_dochead, 'Practice Note;', 'Practice Note')"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="."/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:when test="self::title[ancestor::docinfo:hierlev] and $docinfo.selector = 'PracticeDirection'">
               <xsl:variable name="docinfo_hierlev_title" select="."/>
               <xsl:choose>
                  <xsl:when test="starts-with($docinfo_hierlev_title, 'Practice Direction;')">
                     <xsl:value-of select="replace($docinfo_hierlev_title, 'Practice Direction;', 'Practice Direction')"/>
                  </xsl:when>
                  <xsl:when test="starts-with($docinfo_hierlev_title, 'Note;')">
                     <xsl:value-of select="replace($docinfo_hierlev_title, 'Note;', 'Note')"/>
                  </xsl:when>
                  <xsl:when test="starts-with($docinfo_hierlev_title, 'Practice Note;')">
                     <xsl:value-of select="replace($docinfo_hierlev_title, 'Practice Note;', 'Practice Note')"/>
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
                     <xsl:analyze-string select="$docinfo_hierlev_title"
                                         regex="([0-9]{{4}})\s*([A-Za-z]+)\s*([0-9]+)\s*$">
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
                           <xsl:attribute name="value"
                                          select="//case:headnote/case:info[1]/child::case:parallelcite[1]//text()"/>
                        </xsl:element>
                        <docinfo:metaitem name="includeInOneCase" value="true"/>
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

   <xsl:template match="docinfo:custom-metafields[$selectorID = ('dictionary','index','journal','precedents','treatises','commentaryleghist')] | docinfo:custom-metafields/child::*[$selectorID = ('dictionary','index','journal','precedents','treatises','commentaryleghist')] | docinfo:assoc-links | docinfo:normcite"/>

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
                     <xsl:value-of select="replace(parent::docinfo:custom-metafields/docinfo:custom-metafield[@name = 'courtcode'], 'temp', '')"/>
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
                     <xsl:value-of select="translate(parent::docinfo:custom-metafields/docinfo:custom-metafield[@searchtype = 'JURIS-CLASSIFY'], ', ', '')"/>
                  </xsl:element>
               </xsl:when>
               <xsl:when test="self::docinfo:custom-metafield/not(child::node()) and parent::docinfo:custom-metafields/docinfo:custom-metafield[@searchtype = 'JURIS-CLASSIFY']/child::node() and $selectorID='cases' and $docinfo.selector=('PracticeDirection','LawReport')">
                  <xsl:element name="{name()}">
                     <xsl:copy-of select="@name" copy-namespaces="no"/>
                     <xsl:value-of select="translate(parent::docinfo:custom-metafields/docinfo:custom-metafield[@searchtype = 'JURIS-CLASSIFY'], ', ', '')"/>
                  </xsl:element>
               </xsl:when>
               <xsl:otherwise><!--<xsl:copy-of select="." copy-namespaces="no"/>-->
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
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
=======
   <!--Dayanand Singh 30-05-2018 for digestdoc -->
   <xsl:template match="docinfo:custom-metafields|docinfo:custom-metafield">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="docinfo:lbu-indexing-terms|docinfo:lbu-subj">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl

   <xsl:template match="docinfo:custom-metafield[$selectorID = 'cases'][./@name = ('court', 'juris', 'date', 'sh-version', 'rx-version', 'sg-version', 'ng-version', 'filterType', 'resultType')]"
                 priority="20"/>

   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <!--   Dayanand singh 30 MAY 2018 Added Digestdoc content type namespace -->   <xsl:variable name="RosettaNamespaces" as="element()">
      <RosettaNamepaces>
         <RosettaNamespace>xmlns:docinfo="http://www.lexis-nexis.com/glp/docinfo"</RosettaNamespace>
         <RosettaNamespace>xmlns:comm="http://www.lexis-nexis.com/glp/comm"</RosettaNamespace>
         <RosettaNamespace>xmlns:dict="http://www.lexis-nexis.com/glp/dict"</RosettaNamespace>
         <RosettaNamespace>xmlns:leg="http://www.lexis-nexis.com/glp/leg"</RosettaNamespace>
         <RosettaNamespace>xmlns:ci="http://www.lexis-nexis.com/ci"</RosettaNamespace>
         <RosettaNamespace>xmlns:case="http://www.lexis-nexis.com/glp/case"</RosettaNamespace>
         <RosettaNamespace>xmlns:glp="http://www.lexis-nexis.com/glp"</RosettaNamespace>
         <RosettaNamespace>xmlns:in="http://www.lexis-nexis.com/glp/in"</RosettaNamespace>
         <RosettaNamespace>xmlns:jrnl="http://www.lexis-nexis.com/glp/jrnl"</RosettaNamespace>
         <RosettaNamespace>xmlns:frm="http://www.lexis-nexis.com/glp/frm"</RosettaNamespace>
         <RosettaNamespace>xmlns:dig="http://www.lexis-nexis.com/glp/dig"</RosettaNamespace>
         <RosettaNamespace>xmlns:cttr="http://www.lexis-nexis.com/glp/cttr"</RosettaNamespace>
      </RosettaNamepaces>
   </xsl:variable>
   <xsl:template match="comment() | processing-instruction()">
      <xsl:copy-of select="."/>
   </xsl:template>
   <xsl:variable name="quot">'</xsl:variable>
   <xsl:variable name="openquote">‘</xsl:variable>
   <xsl:variable name="closequote">’</xsl:variable>
   <xsl:template match="text()" priority="20">
      <xsl:param name="text" select="."/>
      <xsl:param name="usequote" select="$openquote"/>
      <xsl:choose><!-- Revathi: Commented the below code as per the clarification received from Awntika regarding smart quote conversion --><!--<xsl:when test="contains($text,$quot)">
                <xsl:variable name="strlen" select="string-length(substring-before($text,$quot))"/>
                <xsl:choose>
                    <xsl:when test="matches(substring-after($text,$quot),'^\s')">
                        <xsl:value-of select="concat(substring-before($text, $quot), $closequote)"/>
                    </xsl:when>
                    
                    <xsl:when test="substring-before($text,$quot)!='' and substring-after($text,$quot)!='' and matches(substring(substring-before($text,$quot),number($strlen),1),'[a-zA-Z]') and matches(substring(substring-after($text,$quot),1,1),'[a-zA-Z]')">
                        <xsl:value-of select="concat(substring-before($text, $quot), $closequote)"/>
                    </xsl:when>
                    <xsl:otherwise>  
                        <xsl:value-of select="concat(substring-before($text, $quot), $usequote)"/>                      
                    </xsl:otherwise>
                </xsl:choose>
                
                <xsl:call-template name="replace">
                    <xsl:with-param name="text" select="substring-after($text,$quot)"/>
                    <xsl:with-param name="usequote"
                        select="substring(concat($openquote, $closequote), 2 - number($usequote=$closequote), 1)"/>
                </xsl:call-template>
            </xsl:when>-->
         <xsl:when test="matches($text,'\([0-9]{4}\)\s[0-9]+\s[A-Z]+\s[0-9]+[,\s]*$') and self::text()/not(ancestor::ci:cite) and self::text()/not(ancestor::docinfo)"><!-- Revathi: changed the regex to text drop of the content occuring before the citation like content -->
            <xsl:analyze-string select="$text"
                                regex="([\w\W]*)([\(][0-9]{{4}}[\)])\s([0-9]+)\s([A-Z]+)\s([0-9]+)([,\s]*)">
               <xsl:matching-substring><!-- Revathi: Added the below call-template to handle the content present before citation like content -->
                  <xsl:call-template name="replace">
                     <xsl:with-param name="text" select="regex-group(1)"/>
                  </xsl:call-template>
                  <ci:cite searchtype="CASE-REF" xsl:exclude-result-prefixes="#all">
                     <ci:case xsl:exclude-result-prefixes="#all">
                        <ci:caseref xsl:exclude-result-prefixes="#all">
                           <ci:reporter value="{regex-group(4)}" xsl:exclude-result-prefixes="#all"/>
                           <ci:volume num="{regex-group(3)}" xsl:exclude-result-prefixes="#all"/>
                           <ci:edition xsl:exclude-result-prefixes="#all">
                              <ci:date year="{translate(regex-group(2),'()','')}"
                                       xsl:exclude-result-prefixes="#all"/>
                           </ci:edition>
                           <ci:page num="{regex-group(5)}" xsl:exclude-result-prefixes="#all"/>
                        </ci:caseref>
                     </ci:case>
                     <ci:content xsl:exclude-result-prefixes="#all">
                        <xsl:value-of select="concat(regex-group(2),' ',regex-group(3),' ',regex-group(4),' ',regex-group(5))"/>
                     </ci:content>
                  </ci:cite>
                  <xsl:value-of select="regex-group(6)"/>
               </xsl:matching-substring>
            </xsl:analyze-string>
         </xsl:when>
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
         <xsl:when test="matches($text,'\([0-9]{4}\)\s[0-9]+\s[A-Z]+\s[0-9]+[,\s]*$') and self::text()/not(ancestor::ci:cite) and self::text()/not(ancestor::docinfo)"><!-- Revathi: changed the regex to text drop of the content occuring before the citation like content -->
=======
         <xsl:otherwise>
            <xsl:value-of select="translate($text,' ','')"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template name="replace">
      <xsl:param name="text" select="."/>
      <xsl:param name="usequote" select="$openquote"/>
      <xsl:choose><!-- Revathi: Commented the below code as per the clarification received from Awntika regarding smart quote conversion --><!--<xsl:when test="contains($text,$quot)">
                <xsl:variable name="strlen" select="string-length(substring-before($text,$quot))"/>
                <xsl:choose>
                    <xsl:when test="matches(substring-after($text,$quot),'^\s')">
                        <xsl:value-of select="concat(substring-before($text, $quot), $closequote)"/>
                    </xsl:when>
                    
                    <xsl:when test="substring-before($text,$quot)!='' and substring-after($text,$quot)!='' and matches(substring(substring-before($text,$quot),number($strlen),1),'[a-zA-Z]') and matches(substring(substring-after($text,$quot),1,1),'[a-zA-Z]')">
                        <xsl:value-of select="concat(substring-before($text, $quot), $closequote)"/>
                    </xsl:when>
                    <xsl:otherwise>  
                        <xsl:value-of select="concat(substring-before($text, $quot), $usequote)"/>                      
                    </xsl:otherwise>
                </xsl:choose>
                
                <xsl:call-template name="replace">
                    <xsl:with-param name="text" select="substring-after($text,$quot)"/>
                    <xsl:with-param name="usequote"
                        select="substring(concat($openquote, $closequote), 2 - number($usequote=$closequote), 1)"/>
                </xsl:call-template>
            </xsl:when>-->
         <xsl:when test="matches($text,'\([0-9]{4}\)\s[0-9]+\s[A-Z]+\s[0-9]+[,\s]*$')"><!-- Revathi: changed the regex to text drop of the content occuring before the citation like content -->
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
            <xsl:analyze-string select="$text"
                                regex="([\w\W]*)([\(][0-9]{{4}}[\)])\s([0-9]+)\s([A-Z]+)\s([0-9]+)([,\s]*)">
               <xsl:matching-substring><!-- Revathi: Added the below call-template to handle the content present before citation like content -->
                  <xsl:call-template name="replace">
                     <xsl:with-param name="text" select="regex-group(1)"/>
                  </xsl:call-template>
                  <ci:cite searchtype="CASE-REF" xsl:exclude-result-prefixes="#all">
                     <ci:case xsl:exclude-result-prefixes="#all">
                        <ci:caseref xsl:exclude-result-prefixes="#all">
                           <ci:reporter value="{regex-group(4)}" xsl:exclude-result-prefixes="#all"/>
                           <ci:volume num="{regex-group(3)}" xsl:exclude-result-prefixes="#all"/>
                           <ci:edition xsl:exclude-result-prefixes="#all">
                              <ci:date year="{translate(regex-group(2),'()','')}"
                                       xsl:exclude-result-prefixes="#all"/>
                           </ci:edition>
                           <ci:page num="{regex-group(5)}" xsl:exclude-result-prefixes="#all"/>
                        </ci:caseref>
                     </ci:case>
                     <ci:content xsl:exclude-result-prefixes="#all">
                        <xsl:value-of select="concat(regex-group(2),' ',regex-group(3),' ',regex-group(4),' ',regex-group(5))"/>
                     </ci:content>
                  </ci:cite>
                  <xsl:value-of select="regex-group(6)"/>
               </xsl:matching-substring>
            </xsl:analyze-string>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="translate($text,' ','')"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template name="Normalize_id_string">
      <xsl:param name="string"/>
      <xsl:variable name="Remove_non_breaking_space">
         <xsl:value-of select="translate($string,' ','')"/>
      </xsl:variable>
      <xsl:variable name="apos">'</xsl:variable>
      <!-- The '(',')',',' should be ignored while creating refpt/@id. Rest of the special characters and space should be converted to '_' -->
      <xsl:variable name="Remove_apos">
         <xsl:value-of select="translate(replace($Remove_non_breaking_space,$apos,'_'),'(),','')"/>
      </xsl:variable>
      <xsl:value-of select="translate(normalize-space($Remove_apos) , ' &#34;£&amp;.!#$%*+/:;=?@![]\^`|{}~’‘—“Â€ÂÃ¢–«»…', '________________________________________')"/>
   </xsl:template>
   <xsl:variable name="document-uri" select="document-uri(.)"/>
   <xsl:variable name="filename"
                 select="substring-before(tokenize($document-uri, '/')[last()], '.')"/>
   <xsl:template name="outputErrorMessage">
      <xsl:param name="messageText" as="xs:string*" select="'Error!'"/>
      <xsl:message>
         <xsl:value-of select="concat($filename,':',$messageText)"/>
         <!--  just output the message text to the output  -->
      </xsl:message>
   </xsl:template>

   <xsl:template match="* | @*">
      <xsl:call-template name="outputErrorMessage">
         <xsl:with-param name="messageText"
                         as="xs:string"
                         select="                     concat(if (self::*) then                         'Unexpected Element:  name()='                     else                         'Unexpected Attribute:  name()=',                     name(),                     ' encountered in source document!:', concat($filename,'.xml'),                     if (self::* and text()) then                          concat('  Text value is=', string-join(text(), ''))                      else                         if (not(self::*) and . != '') then                             concat('  Attribute value is=', .)                         else                             '')"/>
      </xsl:call-template>
   </xsl:template>

   <xsl:template match="heading">
      <xsl:choose><!-- Revathi: 30May2018 - Changed as per the clarification got from Awntika as legfragment element is not handled in rocket xslt, need to drop this change for precedents. --><!--<xsl:when test="ancestor::level/child::heading/@searchtype='LEGISLATION'[$selectorID=('precedents','treatises','commentaryleghist')]">-->
         <xsl:when test="ancestor::level/child::heading/@searchtype='LEGISLATION'[$selectorID=('treatises','commentaryleghist')]">
            <leg:heading xsl:exclude-result-prefixes="#all">
               <xsl:apply-templates select="@* | node()"/>
            </leg:heading>
         </xsl:when>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- Arun- 18May2018 Updated the below code to handle heading attributes for commentary -->
   <xsl:template match="heading/@*[$selectorID=('journal','precedents','treatises','commentaryleghist')]"/>

   <xsl:template match="title[parent::heading/parent::dict:body][not(child::*[name()!='emph'])][$selectorID='dictionary']">
      <xsl:element name="desig" inherit-namespaces="no">
         <xsl:attribute name="value">
            <xsl:value-of select="self::title//text()"/>
         </xsl:attribute>
         <xsl:element name="designum">
            <xsl:apply-templates select="@* | node()"/>
         </xsl:element>
      </xsl:element>
   </xsl:template>

   <xsl:template match="title[parent::heading/parent::in:body][$selectorID='index']">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="//in:body/heading/title//text()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="title[parent::heading/parent::level][$selectorID='journal']">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="title | desig | designum | desiglabel">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>
   <!-- Arun 24May2018 Updated the below code for handling attributes of desig, designum, desiglabel -->
   <xsl:template match="desig/@* | designum/@* | desiglabel/@*">
      <xsl:copy/>
   </xsl:template>

   <xsl:template match="title[ancestor::comm:body][$selectorID=('precedents','treatises','commentaryleghist')]">
      <xsl:choose><!-- Revathi: 23May2018 - Modified the count check as more than two emph are also appearing in input file  -->
         <xsl:when test="self::title/node()[1]/name()='emph' and self::title/count(child::emph) &gt; 1">
            <desig xsl:exclude-result-prefixes="#all">
               <xsl:attribute name="value"><!-- Revathi: 29May2018 - (FOR 0PV8) Added the below variable to capture the desig content as the direct passing of parameter to the template "Normalize_id_string" was creating conflicts. -->
                  <xsl:variable name="v_desig" as="xs:string">
                     <xsl:value-of select="self::title/emph[1]//text()"/>
                  </xsl:variable>
                  <xsl:call-template name="Normalize_id_string"><!--<xsl:with-param name="string" select="self::title/emph[1]//text()"/>-->
                     <xsl:with-param name="string" select="$v_desig"/>
                  </xsl:call-template>
               </xsl:attribute>
               <designum xsl:exclude-result-prefixes="#all">
                  <xsl:value-of select="self::title/emph[1]//text()"/>
               </designum>
            </desig>
            <title xsl:exclude-result-prefixes="#all"><!--<!-\- Revathi: 23May2018 - Modified the code as more than two emph are also appearing in input file  -\->
                    <xsl:apply-templates select="self::title/emph[position() > 1]"/>--><!-- Revathi: Commented the above code and added the below code to ensure that all the nodes inside title are captured. -->
               <xsl:apply-templates select="self::title/node() except node()[1][name()='emph']"/>
               <!--<xsl:call-template name="replace">
                        <xsl:with-param name="text" select="self::title/emph[2]//text()"/>
                    </xsl:call-template>-->
            </title>
         </xsl:when>
         <!-- Revathi: 23May2018 - Modified the count check as more than two emph are also appearing in input file  -->
         <xsl:when test="self::title/node()[1]/name()='emph' and  self::title/child::emph/count(child::emph) &gt; 1">
            <xsl:choose>
               <xsl:when test="self::title/emph/node()[1]/name()!='emph'">
                  <xsl:element name="{name()}">
                     <xsl:apply-templates select="self::title//text()"/>
                  </xsl:element>
               </xsl:when>
               <xsl:otherwise>
                  <desig xsl:exclude-result-prefixes="#all"><!-- DATE: 22 May, 2018 - Modified by Himanshu to resolve text of element <emph>/text() = "2 &amp; 3 Edw 6 c 13" for element <desig>/@value.
                        Attribute @value value of type NMTOKEN must be a name token.
                        Old Code: 
                        <xsl:attribute name="value" select="self::title/emph/emph[1]//text()"/>
                    -->
                     <xsl:attribute name="value"><!--<xsl:choose>
                            <xsl:when test="contains(self::title/emph/emph[1]//text(),' ') and contains(self::title/emph/emph[1]//text(),'&amp;')">
                                <xsl:variable name="DESIGVALUE" select="tokenize(self::title/emph/emph[1]//text(),' ')"/>
                                <xsl:value-of select="$DESIGVALUE[1]"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="self::title/emph/emph[1]//text()"/>
                            </xsl:otherwise>
                        </xsl:choose>--><!-- Revathi: Commented the above code and added the below to normalise the value --><!-- Revathi: 29May2018 - (FOR 0PV8) Added the below variable to capture the desig content as the direct passing of parameter to the template "Normalize_id_string" was creating conflicts. -->
                        <xsl:variable name="v_desig" as="xs:string">
                           <xsl:value-of select="self::title/emph/emph[1]//text()"/>
                        </xsl:variable>
                        <xsl:call-template name="Normalize_id_string"><!--<xsl:with-param name="string" select="self::title/emph[1]//text()"/>-->
                           <xsl:with-param name="string" select="$v_desig"/>
                        </xsl:call-template>
                     </xsl:attribute>
                     <designum xsl:exclude-result-prefixes="#all">
                        <xsl:value-of select="self::title/emph/emph[1]//text()"/>
                     </designum>
                  </desig>
                  <title xsl:exclude-result-prefixes="#all"><!--<!-\- Revathi: 23May2018 - Modified the code as more than two emph are also appearing in input file  -\->
                            <xsl:apply-templates select="self::title/emph/emph[position() > 1]"/>--><!-- Revathi: Commented the above code and added the below code to ensure that all the nodes inside title are captured. -->
                     <xsl:apply-templates select="self::title/emph/child::node() except self::title/emph/child::node()[1][name()='emph']"/>
                     <!--<xsl:call-template name="replace">
                        <xsl:with-param name="text" select="self::title/emph/emph[2]//text()"/>
                    </xsl:call-template>-->
                  </title>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates select="self::title/node()"/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

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
   <!--<xsl:template match="refpt[$selectorID=('precedents','treatises','commentaryleghist')]">-->
   <xsl:template match="refpt[$selectorID=('precedents','treatises','commentaryleghist')]">
      <xsl:element name="{name()}">
         <xsl:attribute name="id">
            <xsl:call-template name="fn_refpt">
               <xsl:with-param name="id" select="./@id"/>
            </xsl:call-template>
         </xsl:attribute>
         <xsl:attribute name="type" select="./@type"/>
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
         <xsl:when test="self::refpt[$selectorID='index']"><!-- <xsl:choose>
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
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
         </xsl:when>
         <xsl:when test="self::remotelink[$selectorID='index']">
            <xsl:attribute name="refpt">
               <xsl:variable name="prepend" select="'acronym:HALS::'"/>
               <xsl:variable name="volume">
                  <xsl:variable name="v_getvalue">
                     <xsl:analyze-string select="$id"
                                         regex="(([0-9][0-9a-z]{{3}}_[0-9]+_([0-9a-zA-Z_]+)):[\w]+-VOL)(_([\w]+):[\w]+-PARA)">
                        <xsl:matching-substring>
                           <xsl:value-of select="regex-group(3)"/>
                        </xsl:matching-substring>
                     </xsl:analyze-string>
                  </xsl:variable>
                  <xsl:value-of select="concat('volume:', normalize-space($v_getvalue))"/>
               </xsl:variable>
               <xsl:variable name="paragraph">
                  <xsl:variable name="v_getvalue">
                     <xsl:analyze-string select="$id"
                                         regex="(([0-9][0-9a-z]{{3}}_[0-9]+_([0-9a-zA-Z_]+)):[\w]+-VOL)(_([\w]+):[\w]+-PARA)">
                        <xsl:matching-substring>
                           <xsl:value-of select="regex-group(5)"/>
                        </xsl:matching-substring>
                     </xsl:analyze-string>
                  </xsl:variable>
                  <xsl:value-of select="concat('paragraph:', normalize-space($v_getvalue))"/>
               </xsl:variable>
               <!-- attribute @refpt value -->
               <xsl:value-of select="concat($prepend,$volume,'::',$paragraph)"/>
            </xsl:attribute>
         </xsl:when>
=======
         </xsl:when>
         <xsl:when test="self::remotelink[$selectorID='index']">
            <xsl:attribute name="refpt">
               <xsl:variable name="prepend" select="'acronym:HALS::'"/>
               <xsl:variable name="volume">
                  <xsl:variable name="v_getvalue">
                     <xsl:analyze-string select="$id"
                                         regex="(([0-9][0-9a-z]{{3}}_[0-9]+_([0-9a-zA-Z_]+)):[\w]+-VOL)(_([\w]+):[\w]+-PARA)">
                        <xsl:matching-substring>
                           <xsl:value-of select="regex-group(3)"/>
                        </xsl:matching-substring>
                     </xsl:analyze-string>
                  </xsl:variable>
                  <xsl:value-of select="concat('volume:', normalize-space($v_getvalue))"/>
               </xsl:variable>
               <xsl:variable name="paragraph">
                  <xsl:variable name="v_getvalue">
                     <xsl:analyze-string select="$id"
                                         regex="(([0-9][0-9a-z]{{3}}_[0-9]+_([0-9a-zA-Z_]+)):[\w]+-VOL)(_([\w]+):[\w]+-PARA)">
                        <xsl:matching-substring>
                           <xsl:value-of select="regex-group(5)"/>
                        </xsl:matching-substring>
                     </xsl:analyze-string>
                  </xsl:variable>
                  <xsl:value-of select="concat('paragraph:', normalize-space($v_getvalue))"/>
               </xsl:variable>
               <!-- attribute @refpt value -->
               <xsl:value-of select="concat($prepend,$volume,'::',$paragraph)"/>
            </xsl:attribute>
         </xsl:when>
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
         <xsl:otherwise>
            <xsl:value-of select="$id"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- Arun- 04Jun2018 Updated the below code to handle pgrp for Citator -->
   <xsl:template match="pgrp[$selectorID=('cases','citator')]">
      <xsl:apply-templates select="@* | node()"/>
   </xsl:template>
   <!-- Arun- 18May2018 Updated the below code to handle pgrp for commentary -->
   <xsl:template match="pgrp[$selectorID=('journal','precedents','treatises','commentaryleghist','digest')]">
      <xsl:apply-templates/>
   </xsl:template>

   <xsl:template match="p">
      <xsl:choose><!-- Revathi: 29May2018 - code change for CR by Awntika --><!-- Revathi: 05June2018 - Commenting the below code as the new requirement is,
            When glp:note is the only child of case:constituent/person/name.text, then move glp:note outside of case:constituent (as the child of case:constituents) and suppress person/name.text (as we have moved the only child glp:note outside, it will be just empty elements).--><!--<xsl:when test="ancestor::name.text">
                <xsl:apply-templates/>
            </xsl:when>-->
         <xsl:when test="self::p/child::text/not(child::node())[$selectorID = 'cases' and $docinfo.selector = 'PracticeDirection']"/>
         <xsl:when test="self::p/not(child::node())[$selectorID = 'journal']"/>
         <xsl:when test="self::p[child::text[@align = 'center']] and $selectorID = 'journal'">
            <xsl:variable name="starcheck" select="."/>
            <xsl:choose>
               <xsl:when test="matches($starcheck, '\*\s*\*\s*\*')">
                  <xsl:apply-templates select="self::p" mode="p_suppress"/>
               </xsl:when>
            </xsl:choose>
         </xsl:when>
         <!-- Revathi: 04May2018 - Added selectorID as it is appropriate for journals content type only -->
         <xsl:when test="child::text/node()[1][name() = ('emph', '')] and matches(child::text/node()[1], '^(\([a-zA-Z0-9]+\)|●|•)([\t ]*)') and $selectorID = 'journal'">
            <xsl:element name="{name()}"><!-- <pnum>
                        <xsl:apply-templates select="child::text/node()[1]/node()"/>
                    </pnum>
                    <xsl:apply-templates select="@* | node()"/>--><!-- Revathi - 04MAy2018 - Commented the above code and added the below code to correctly capture pnum -->
               <xsl:analyze-string select="child::text/node()[1]" regex="^(\([a-zA-Z0-9]+\)|●|•)([\t ]*)">
                  <xsl:matching-substring>
                     <pnum xsl:exclude-result-prefixes="#all">
                        <xsl:call-template name="replace">
                           <xsl:with-param name="text" select="."/>
                        </xsl:call-template>
                     </pnum>
                  </xsl:matching-substring>
               </xsl:analyze-string>
               <xsl:apply-templates/>
            </xsl:element>
         </xsl:when>
         <!-- Revathi: When p is having edpnum as child element, then the following sibling pgrp's first p's text element should be moved as the child element of this p -->
         <xsl:when test="self::p/node()[1]/name() = 'edpnum'">
            <xsl:element name="{name()}">
               <xsl:apply-templates/>
               <xsl:apply-templates select="following-sibling::node()[1][name()='pgrp']/node()[1][name()='p']/text"/>
            </xsl:element>
         </xsl:when>
         <!-- Revathi: 29May2018 - Added the condition self::p/not(preceding-sibling::node()) as in some cases the first p of pgrp and following siblings p has same PCDATA. 
                In that case text drop is happening. So this condition is added to ensure that the current p is the first node of pgrp-->
         <xsl:when test="self::p[parent::pgrp/node()[1]=self::p and self::p/not(preceding-sibling::node()) and parent::pgrp/preceding-sibling::node()[1][name()='p']/child::edpnum]"/>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="//p" mode="p_suppress"/>

   <xsl:template match="text" name="text"><!-- <xsl:choose>--><!-- Revathi: 29May2018 - code change for CR by Awntika --><!-- Revathi: 05June2018 - Commenting the below code as the new requirement is,
            When glp:note is the only child of case:constituent/person/name.text, then move glp:note outside of case:constituent (as the child of case:constituents) and suppress person/name.text (as we have moved the only child glp:note outside, it will be just empty elements).--><!--<xsl:when test="ancestor::name.text">
                <xsl:apply-templates/>
            </xsl:when>--><!--<xsl:otherwise>-->
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@*"/>
         <xsl:choose>
            <xsl:when test="ancestor::li/child::*[1][name() != 'blockquote']">
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
               <xsl:choose>
                  <xsl:when test="self::text/node()[1]/name() = '' and self::text/node()[1] != '('"><!--<xsl:analyze-string select="self::text/text()[1]"
                                regex="^(\(?[a-zA-Z0-9]+\)?\.?|●|&#x25cf;|&#x2022;)([\t ]*)">--><!--<xsl:analyze-string select="self::text/text()[1]"
                                regex="(^\(?([0-9]*[a-zA-Z]{{1,2}}|[0-9]+)\.?\)?\.?)(\s|&#160;){{1,}}">-->
                     <xsl:analyze-string select="self::text/text()[1]"
                                         regex="(^\(?([0-9]*[a-zA-Z]{{1,2}}|[0-9]+|XC|XL|L?X{{0,3}}|IX|IV|V?I{{0,3}}|xc|xl|l?x{{0,3}}|ix|iv|v?i{{0,3}})\.?\)?\.?)(\s| ){{1,}}">
=======
               <xsl:choose><!-- Revathi: Added the below condition - when lilabel already has PCDATA then p/text should be handled as it is. -->
                  <xsl:when test="ancestor::li/child::lilabel/child::node() and ancestor::li/child::lilabel[matches(.,'[^\s     ]')]">
                     <xsl:apply-templates/>
                  </xsl:when>
                  <xsl:when test="self::text/node()[1]/name() = '' and self::text/node()[1] != '('"><!--<xsl:analyze-string select="self::text/text()[1]"
                                regex="^(\(?[a-zA-Z0-9]+\)?\.?|●|&#x25cf;|&#x2022;)([\t ]*)">--><!--<xsl:analyze-string select="self::text/text()[1]"
                                regex="(^\(?([0-9]*[a-zA-Z]{{1,2}}|[0-9]+)\.?\)?\.?)(\s|&#160;){{1,}}">--><!-- Arun- 22May2018 Updated the below code to handle ● and special characters before lilabel content -->
                     <xsl:analyze-string select="self::text/text()[1]"
                                         regex="(^●|^●|^•|^\W*\(?([0-9\.]*[a-zA-Z]{{1,2}}[0-9\.]*|[0-9\.]+|XC|XL|L?X{{0,3}}|IX|IV|V?I{{0,3}}|xc|xl|l?x{{0,3}}|ix|iv|v?i{{0,3}})\.?\)?\.?)(\s| ){{1,}}">
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
                        <xsl:non-matching-substring>
                           <xsl:call-template name="replace">
                              <xsl:with-param name="text"
                                              select="replace(replace(., '^\s*(.+?)\s*$', '$1'), '^ .*$', '')"/>
                           </xsl:call-template>
                        </xsl:non-matching-substring>
                     </xsl:analyze-string>
                     <xsl:apply-templates select="node() except text()[1]"/>
                  </xsl:when>
                  <!-- Revathi: The below condition is to identify the lilabel content which is occuring in the pattern '(<emph typestyle="it">b</emph>)' inside li/p/text -->
                  <xsl:when test="self::text/node()[1]/name() = '' and self::text/node()[1] = '(' and self::text/node()[2]/name() = 'emph' and self::text/node()[3]/matches(., '[a-zA-Z0-9]{1,}') and self::text/node()[3]/starts-with(., ')')"><!-- <xsl:analyze-string select="self::text/node()[3]"
                                regex="(^\)[\s|&#160;]+)">
                                <xsl:non-matching-substring>
                                    <xsl:call-template name="replace">
                                        <xsl:with-param name="text" select="."/>
                                    </xsl:call-template>
                                </xsl:non-matching-substring>
                            </xsl:analyze-string>-->
                     <xsl:analyze-string select="self::text/node()[3]" regex="(^\)\.?[\s| ]*)([\w\W]*)">
                        <xsl:matching-substring>
                           <xsl:call-template name="replace">
                              <xsl:with-param name="text" select="regex-group(2)"/>
                           </xsl:call-template>
                        </xsl:matching-substring>
                     </xsl:analyze-string>
                     <!--Revathi: 08May2018 - To handle the remaining nodes except for the lilabel content -->
                     <xsl:apply-templates select="node()[position()&gt;3]"/>
                  </xsl:when>
                  <xsl:when test="self::text/node()[1]/name() = ''">
                     <xsl:analyze-string select="self::text/text()[1]" regex="^(\([a-zA-Z0-9]+\)|●)([\t ]*)">
                        <xsl:non-matching-substring>
                           <xsl:call-template name="replace">
                              <xsl:with-param name="text"
                                              select="replace(replace(., '^\s*(.+?)\s*$', '$1'), '^ .*$', '')"/>
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
            <xsl:when test="self::text/node()[1][name() = ''] and matches(self::text/node()[1], '^(\([a-zA-Z0-9]+\)|●|•)([\t ]*)')  and $selectorID = 'journal'">
               <xsl:element name="{name()}">
                  <xsl:analyze-string select="self::text/node()[1]" regex="^(\([a-zA-Z0-9]+\)|●|•)([\t ]*)">
                     <xsl:non-matching-substring>
                        <xsl:call-template name="replace">
                           <xsl:with-param name="text" select="."/>
                        </xsl:call-template>
                     </xsl:non-matching-substring>
                  </xsl:analyze-string>
                  <xsl:apply-templates select="node() except node()[1]"/>
               </xsl:element>
            </xsl:when>
            <xsl:otherwise><!--<xsl:apply-templates/>--><!-- 31-May-2018 Modified by Himanshu for <pgrp>/<p>/<text><glp:note> placed outside <pgrp>/<p> and inside <pgrp>.
                        Old Code: <xsl:apply-templates/> -->
               <xsl:choose>
                  <xsl:when test="child::glp:note and ancestor::p/parent::pgrp and $selectorID = 'cases'">
                     <xsl:for-each select="child::node()[not(self::glp:note)][following-sibling::glp:note]">
                        <xsl:apply-templates select="."/>
                     </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:element>
      <!--</xsl:otherwise>-->
      <!--</xsl:choose>-->
   </xsl:template>

   <xsl:template match="text/@align">
      <xsl:attribute name="{name()}">
         <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>

   <xsl:template match="emph[ancestor::defterm] | emph[parent::dict:topicname] | emph[parent::remotelink/parent::url][$selectorID = 'dictionary']"
                 priority="20">
      <xsl:apply-templates select="@* | node()"/>
   </xsl:template>

   <xsl:template match="emph[child::remotelink][$selectorID = 'dictionary']"
                 priority="20">
      <xsl:apply-templates select="node()"/>
   </xsl:template>

   <xsl:template match="emph[ancestor::defterm | child::remotelink | emph[parent::h] | emph[parent::dict:topicname]]/@*[$selectorID = 'dictionary']"
                 priority="20"/>

   <xsl:template match="emph[ancestor::heading/parent::dict:body][$selectorID = 'dictionary']">
      <xsl:apply-templates/>
   </xsl:template>

   <xsl:template match="emph[@typestyle = 'bf'][$selectorID = 'index']">
      <xsl:choose>
         <xsl:when test="self::emph/parent::remotelink">
            <xsl:apply-templates/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:attribute name="typestyle" select="./@typestyle"/>
               <xsl:apply-templates/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="emph[parent::jrnl:articletitle][$selectorID = 'journal'] | emph[parent::name.text][$selectorID = 'journal'] | emph[parent::title][$selectorID = 'journal'] | emph[ancestor::abstract][$selectorID = 'journal']">
      <xsl:apply-templates/>
   </xsl:template>

   <xsl:template match="emph[@typestyle = 'smcaps'][$selectorID = 'index']">
      <xsl:choose>
         <xsl:when test="self::emph[not(child::remotelink)]">
            <emph typestyle="smcaps" xsl:exclude-result-prefixes="#all">
               <remotelink service="DOC-ID"
                           remotekey1="REFPTID"
                           xsl:exclude-result-prefixes="#all">
                  <xsl:attribute name="refpt">
                     <xsl:variable name="prepend" select="'acronym:HALS-INDEX::term:'"/>
                     <xsl:variable name="remtext" select="self::emph"/>
                     <xsl:value-of select="concat($prepend, translate(upper-case($remtext), ' ', '_'))"/>
                  </xsl:attribute>
                  <xsl:attribute name="docidref" select="'95ed127a-e22e-4234-939e-bf12978c46da'"/>
                  <xsl:attribute name="dpsi" select="'003B'"/>
                  <xsl:attribute name="status" select="'valid'"/>
                  <xsl:apply-templates/>
               </remotelink>
            </emph>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="emph">
      <xsl:choose>
         <xsl:when test="self::emph[ancestor::h] or self::emph[ancestor::title]">
            <xsl:apply-templates select="node()"/>
         </xsl:when>
         <!-- Revathi: 04May2018 - Added the below condition check -->
         <xsl:when test="self::emph[parent::text/node()[1] = self::emph][matches(., '^(\([a-zA-Z0-9]+\)|●|•)([\t ]*)')]  and $selectorID = 'journal'">
            <xsl:element name="{name()}">
               <xsl:analyze-string select="node()[1]" regex="^(\([a-zA-Z0-9]+\)|●|•)([\t ]*)">
                  <xsl:non-matching-substring>
                     <xsl:call-template name="replace">
                        <xsl:with-param name="text" select="."/>
                     </xsl:call-template>
                  </xsl:non-matching-substring>
               </xsl:analyze-string>
               <xsl:apply-templates select="node() except node()[1]"/>
            </xsl:element>
         </xsl:when>
         <!-- Revathi: 21May2018 : Added below condition to suppress emph tag whenever the child is only ci:cite -->
         <!-- Revathi: 29May2018 : The old code is for the emph having only child as ci:cite inside p/text. This is creating validation errors
            when the emph/ci:cite is occuring with elements other than p/text. So added the condition 'self::emph/not(child::node()[not(name()='remotelink')])' to
            make it work only for p/text-->
         <xsl:when test="self::emph/not(child::node()[not(name()='ci:cite')]) and self::emph/not(child::node()[not(name()='remotelink')]) and self::emph/parent::text">
            <xsl:apply-templates/>
         </xsl:when>
         <xsl:otherwise><!--   Dayanand singh 22 May 2018,  Added attribute for emph  -->
            <xsl:element name="{name()}">
               <xsl:attribute name="typestyle" select="@typestyle"/>
               <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- Revathi: 04May2018 - Commented out the below code and added this as a condition in generic emph template -->   <!-- <xsl:template match="emph[parent::text/node()[1]=self::emph] [matches(self::emph,'^(\([a-zA-Z0-9]+\)|&#x25cf;|&#x2022;)([\t&#160;]*)')]"/>-->   <!-- DAYANAND SINGH: 26 May 2018 changed for dictionary selector-->
   <xsl:template match="emph/@*[not($selectorID = 'dictionary')]">
      <xsl:copy/>
   </xsl:template>
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
   <!-- DAYANAND SINGH: 10May2018-->   <!--<xsl:template match="emph[parent::h]">
=======
   <!-- DAYANAND SINGH: 23 May 2018 comment for dictionary selector-->   <!--<xsl:template match="emph/@*">
        <xsl:copy/>
    </xsl:template>-->   <!-- DAYANAND SINGH: 10May2018-->   <!--<xsl:template match="emph[parent::h]">
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
        <xsl:element name="emph">
            <xsl:apply-templates select="node()|@*"/>
        </xsl:element>
    </xsl:template>-->   <!-- Revathi: 11May2018 - Commented out the above code as whenever emph is occuring inside h element, we need to suppress the emph tag and retain its PCDATA inside h-->
   <xsl:template match="remotelink">
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@*"/>
         <xsl:if test="$selectorID='index'">
            <xsl:attribute name="refpt">
               <xsl:call-template name="fn_refpt">
                  <xsl:with-param name="id" select="self::remotelink/@refpt"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:attribute name="status" select="'valid'"/>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="remotelink/@href|remotelink/@hrefclass">
      <xsl:attribute name="{name()}">
         <xsl:value-of select="."/>
      </xsl:attribute>
=======
      <xsl:choose><!-- Revathi: Added the below condition check to accomodate following changes. The generic code to handle remotelink, that is already present here is moved inside xsl:otherwise --><!-- Whenever, emph has only remotelink as child in commentary data, then the emph should be suppressed and the child remotelink is converted as ci:cite/@type='paragraph-ref'
            and the PCDATA of remotelink is mapped to ci:content.-->
         <xsl:when test="(self::remotelink/parent::emph and parent::emph/not(child::node()[name()!='remotelink'])) and $selectorID=('precedents','treatises','commentaryleghist')">
            <ci:cite type="paragraph-ref" xsl:exclude-result-prefixes="#all">
               <ci:content xsl:exclude-result-prefixes="#all">
                  <xsl:apply-templates/>
               </ci:content>
            </ci:cite>
         </xsl:when>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@*"/>
               <xsl:if test="$selectorID='index'">
                  <xsl:attribute name="refpt">
                     <xsl:call-template name="fn_refpt">
                        <xsl:with-param name="id" select="self::remotelink/@refpt"/>
                     </xsl:call-template>
                  </xsl:attribute>
               </xsl:if>
               <xsl:attribute name="status" select="'valid'"/>
               <xsl:apply-templates select="node()"/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
   </xsl:template>
   <!-- DATE: 22 May, 2018 - Modified by Himanshu to handle attribute "remotelink/@service|remotelink/@remotekey1|remotelink/@refpt|remotelink/@dpsi".
        Old Code: <xsl:template match="remotelink/@href|remotelink/@hrefclass">
    -->   <!-- Revathi: commented the below code as it will be handled by generic template matching remotelink/@* -->   <!--<xsl:template match="remotelink/@href|remotelink/@hrefclass|remotelink/@service|remotelink/@remotekey1|remotelink/@refpt|remotelink/@dpsi">
        <xsl:attribute name="{name()}">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>-->
   <xsl:template match="remotelink/@refpt[$selectorID='index']"/>

   <xsl:template match="remotelink/@refpt[$selectorID='index']"/>

   <xsl:template match="remotelink[$selectorID='journal']">
      <xsl:element name="{name()}">
         <xsl:attribute name="href">
            <xsl:value-of select="self::remotelink//text()"/>
         </xsl:attribute>
         <xsl:apply-templates select="@* except(@href)"/>
         <xsl:choose>
            <xsl:when test="self::remotelink/node()[1]/name()!='emph'">
               <emph typestyle="un" xsl:exclude-result-prefixes="#all">
                  <xsl:apply-templates select="node()"/>
               </emph>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates select="node()"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:element>
   </xsl:template>
   <!--<xsl:template match="remotelink/@*[$selectorID='journal']">
        <xsl:copy/>
    </xsl:template>-->   <!-- Revathi: modified as the below template is common for all content type -->
   <xsl:template match="remotelink/@*[name()!='refpt']">
      <xsl:copy/>
   </xsl:template>
   <!-- Revathi: modified as the below template is common for all content type -->
   <xsl:template match="remotelink/@refpt">
      <xsl:variable name="id">
         <xsl:value-of select="."/>
      </xsl:variable>
      <xsl:attribute name="refpt">
         <xsl:call-template name="fn_refpt">
            <xsl:with-param name="id" select="$id"/>
         </xsl:call-template>
      </xsl:attribute>
      <xsl:attribute name="docidref" select="'TBD'"/>
   </xsl:template>
   <!-- Dayanand sing: Updated 28 may 2018-->
   <xsl:template match="remotelink[parent::url][$selectorID='dictionary']">
      <xsl:element name="remotelink">
         <xsl:apply-templates select="node()|@*"/>
      </xsl:element>
   </xsl:template>
   <!-- Dayanand Singh: Updated 30 May 2018-->
   <xsl:template match="remotelink[$selectorID='digest']">
      <xsl:choose>
         <xsl:when test="remotelink[parent::url]">
            <xsl:element name="remotelink">
               <xsl:attribute name="hrefclass" select="@hrefclass"/>
               <xsl:apply-templates/>
            </xsl:element>
         </xsl:when>
         <xsl:otherwise>
            <xsl:element name="remotelink">
               <xsl:attribute name="href" select="@href"/>
               <xsl:apply-templates/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="ci:*">
      <xsl:choose>
         <xsl:when test="self::ci:cite[matches(child::ci:content, '^–[0-9]+')][$selectorID='dictionary'] or self::ci:cite/ancestor::glp:note/preceding-sibling::*[1][name()='case:disposition'][$selectorID='cases' and $docinfo.selector='Transcript']">
            <xsl:value-of select="self::ci:cite//child::ci:content/node()"/>
         </xsl:when>
         <xsl:when test="self::ci:case[ancestor::case:parallelcite][$selectorID='cases' and $docinfo.selector='Transcript']"/>
         <xsl:when test="self::ci:content and matches(self::ci:content, '(\[[0-9]{4}\])\s([0-9]+)\s([a-zA-Z\s]+)\s([0-9]+)') and $selectorID='index'">
            <xsl:analyze-string select="self::ci:content"
                                regex="(\[[0-9]{{4}}\])\s([0-9]+)\s([a-zA-Z\s]+)\s([0-9]+)">
               <xsl:matching-substring>
                  <ci:content xsl:exclude-result-prefixes="#all">
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
                     <xsl:value-of select="concat(regex-group(1),' ')"/>
                     <emph typestyle="bf" xsl:exclude-result-prefixes="#all">
                        <xsl:value-of select="regex-group(2),regex-group(3)" separator=" "/>
=======
                     <xsl:value-of select="concat(regex-group(1), ' ')"/>
                     <emph typestyle="bf" xsl:exclude-result-prefixes="#all">
                        <xsl:value-of select="regex-group(2), regex-group(3)" separator=" "/>
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
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
                  <xsl:otherwise><!-- <xsl:apply-templates select="@*|node()"/>--><!-- Arun: 02May2018 - Commented the above applu-templates as it is causing text repetition. Added the below code to handle it. -->
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
               <xsl:value-of select="concat(upper-case(substring(self::ci:sesslaw//ci:hierpinpoint[1]/ci:hierlev[1]/@label, 1, 4)), ' ', self::ci:sesslaw//ci:hierpinpoint[1]/ci:hierlev[1]/@num)"/>
            </xsl:when>
            <xsl:when test="ancestor::ci:cite/following-sibling::node()[1]/name()='' and matches(ancestor::ci:cite/following-sibling::text()[1], '^[\s]*s')">
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
               <xsl:value-of select="concat(upper-case(substring(ancestor::ci:sesslaw//ci:hierpinpoint[1]/ci:hierlev[1]/@label, 1, 4)), ' ', ancestor::ci:sesslaw//ci:hierpinpoint[1]/ci:hierlev[1]/@num)"/>
            </xsl:when>
            <xsl:when test="ancestor::ci:cite/following-sibling::node()[1]/name()='' and matches(ancestor::ci:cite/following-sibling::text()[1], '^[\s]*s')">
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
                     <xsl:value-of select="                                     (regex-group(1), regex-group(2),                                     (if (regex-group(4)) then                                         regex-group(4)                                     else                                         ()))"
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

   <xsl:template match="ci:sesslaw[parent::ci:cite/@searchtype='LEG-REF' or parent::ci:cite/@searchtype='EU-REF']"/>

   <xsl:template match="ci:*/@*">
      <xsl:choose>
         <xsl:when test="parent::ci:cite/@searchtype='EU-REF'">
            <xsl:attribute name="searchtype" select="'LEG-REF'"/>
         </xsl:when>
         <xsl:when test="parent::ci:cite/parent::case:parallelcite and $selectorID='dictionary'">
            <xsl:attribute name="searchtype" select="'CASE-REF'"/>
         </xsl:when>
         <xsl:when test="parent::ci:cite/parent::case:parallelcite and $selectorID='cases' and $docinfo.selector=('LawReport', 'PracticeDirection')">
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
         <xsl:when test="ancestor::case:parallelcite and $selectorID='cases' and $docinfo.selector=('LawReport', 'PracticeDirection')">
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

   <xsl:template match="h">
      <xsl:choose>
         <xsl:when test="self::h[preceding-sibling::*[1][name() = 'h']] and $selectorID = 'cases'">
            <p xsl:exclude-result-prefixes="#all">
               <text xsl:exclude-result-prefixes="#all">
                  <xsl:apply-templates select="self::h//text()"/>
               </text>
            </p>
         </xsl:when>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates select="node()"/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="l | li">
      <xsl:choose>
         <xsl:when test="self::l/child::li/child::blockquote/*[1][name()!='l'] and $selectorID='dictionary'">
            <p xsl:exclude-result-prefixes="#all">
               <xsl:apply-templates select="@* | node()"/>
            </p>
         </xsl:when>
         <xsl:when test="self::l/li/blockquote/*[1][name()='l'] and $selectorID='dictionary'">
            <xsl:apply-templates select="@* | node()"/>
         </xsl:when>
         <xsl:when test="self::li//child::blockquote and $selectorID='dictionary'">
            <xsl:apply-templates select="node()"/>
         </xsl:when>
         <!-- Revathi: 22May2018 - In commentary, whenever l is appearing as child of bodytext, it should be enclosed within blockquote -->
         <!--<xsl:when test="self::l[parent::bodytext/parent::level] and $selectorID=('precedents','treatises')">
                <blockquote xsl:exclude-result-prefixes="#all">
                    <xsl:element name="{name()}">
                        <xsl:apply-templates select="@* | node()"/>
                    </xsl:element>
                </blockquote>
            </xsl:when>-->
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
            <!-- <xsl:element name="{name()}">
                    <xsl:apply-templates select="@* | node()"/>
                    
                    <!-\- If the following sibling li has only lilabel and l as child elements and lilabel is empty, then move then suppress the following sibling li and 
                    move the content l here into this li.-\->
                    <!-\-<xsl:if test="self::li/following-sibling::li[1]/not(child::*[not(name()=('l')) and not(name()=('lilabel'))]) and self::li/following-sibling::li[1]/child::lilabel=' '">
                        <xsl:apply-templates select="self::li/following-sibling::li" mode="child-li"/>
                    </xsl:if>-\->
                </xsl:element>-->
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="l[$selectorID='journal']">
      <xsl:choose>
         <xsl:when test="self::l/preceding-sibling::l"/>
         <xsl:otherwise>
            <note xsl:exclude-result-prefixes="#all">
               <xsl:element name="{name()}">
                  <xsl:apply-templates/>
                  <xsl:for-each select="following-sibling::l">
                     <xsl:apply-templates select="." mode="grp_l"/>
                  </xsl:for-each>
               </xsl:element>
            </note>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="l" mode="grp_l">
      <xsl:apply-templates/>
   </xsl:template>

   <xsl:template match="lilabel">
      <xsl:element name="{name()}">
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
         <xsl:choose>
            <xsl:when test="following-sibling::p">
               <xsl:choose>
                  <xsl:when test="following-sibling::p/text/node()[1]/name()='' and following-sibling::p/text/node()[1]!='('"><!--<xsl:analyze-string select="following-sibling::p/text/text()[1]" regex="^(\(?[a-zA-Z0-9]+\)?\.?|&#x25cf;|&#x2022;)([\t&#160;]*)">--><!--<xsl:analyze-string select="following-sibling::p/text/text()[1]" regex="(^\(?([0-9]*[a-zA-Z]{{1,2}}|[0-9]+)\.?\)?\.?)(\s|&#160;){{1,}}">-->
                     <xsl:analyze-string select="following-sibling::p/text/text()[1]"
                                         regex="(^\(?([0-9]*[a-zA-Z]{{1,2}}|[0-9]+|XC|XL|L?X{{0,3}}|IX|IV|V?I{{0,3}}|xc|xl|l?x{{0,3}}|ix|iv|v?i{{0,3}})\.?\)?\.?)(\s| ){{1,}}">
=======
         <xsl:choose><!-- Revathi: 24May2018 - Added the below condition to handle when lilabel has PCDATA  -->
            <xsl:when test="self::lilabel/child::node() and matches(self::lilabel,'[^\s     ]')">
               <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="following-sibling::p[1]">
               <xsl:choose><!-- Revathi: 25May2018 - Added p[1] as there may be more than one following sibling of lilabel and in that case run time error is occuring -->
                  <xsl:when test="following-sibling::p[1]/text/node()[1]/name()='' and following-sibling::p[1]/text/node()[1]!='('"><!-- Arun- 22May2018 Updated the below code to handle ● and special characters before lilabel content and replaced multiple single quotes into single quote -->
                     <xsl:analyze-string select="following-sibling::p[1]/text/node()[1]"
                                         regex="(^●|^●|^•|^\W*\(?([0-9\.]*[a-zA-Z]{{1,2}}[0-9\.]*|[0-9\.]+|XC|XL|L?X{{0,3}}|IX|IV|V?I{{0,3}}|xc|xl|l?x{{0,3}}|ix|iv|v?i{{0,3}})\.?\)?\.?)(\s| ){{1,}}">
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
                        <xsl:matching-substring>
                           <xsl:choose>
                              <xsl:when test="$selectorID=('precedents','treatises','commentaryleghist')">
                                 <xsl:call-template name="replace">
                                    <xsl:with-param name="text" select="replace(regex-group(1),' | ','')"/>
                                 </xsl:call-template>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:value-of select="regex-group(1)"/>
                              </xsl:otherwise>
                           </xsl:choose>
                        </xsl:matching-substring>
                     </xsl:analyze-string>
                  </xsl:when>
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
                  <xsl:when test="following-sibling::p/text/node()[1]/name()='' and following-sibling::p/text/node()[1]='(' and following-sibling::p/text/node()[2]/name()='emph' and following-sibling::p/text/node()[3]/matches(.,'[a-zA-Z0-9]{1,}') and following-sibling::p/text/node()[3]/starts-with(.,')')"><!--<xsl:value-of select="concat(following-sibling::p/text/node()[1],following-sibling::p/text/node()[2]/node(),')')"/>-->
                     <xsl:variable name="v-label">
                        <xsl:analyze-string select="following-sibling::p/text/node()[3]"
=======
                  <!-- Revathi: 25May2018 - Added p[1] as there may be more than one following sibling of lilabel and in that case run time error is occuring -->
                  <xsl:when test="following-sibling::p[1]/text/node()[1]/name()='' and following-sibling::p[1]/text/node()[1]='(' and following-sibling::p[1]/text/node()[2]/name()='emph' and following-sibling::p[1]/text/node()[3]/matches(.,'[a-zA-Z0-9]{1,}') and following-sibling::p[1]/text/node()[3]/starts-with(.,')')"><!--<xsl:value-of select="concat(following-sibling::p/text/node()[1],following-sibling::p/text/node()[2]/node(),')')"/>-->
                     <xsl:variable name="v-label">
                        <xsl:analyze-string select="following-sibling::p[1]/text/node()[3]"
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
                                            regex="(^\)\.?[\s| ]*)([\w\W]*)">
                           <xsl:matching-substring>
                              <xsl:value-of select="translate(regex-group(1),'  ','')"/>
                           </xsl:matching-substring>
                        </xsl:analyze-string>
                     </xsl:variable>
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
                     <xsl:value-of select="concat(following-sibling::p/text/node()[1],following-sibling::p/text/node()[2]/node(),$v-label)"/>
=======
                     <xsl:value-of select="concat(following-sibling::p[1]/text/node()[1],following-sibling::p[1]/text/node()[2]/node(),$v-label)"/>
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
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

   <xsl:template match="blockquote">
      <xsl:choose>
         <xsl:when test="self::blockquote/child::*[1][name()='l'] and $selectorID = 'dictionary'">
            <xsl:apply-templates select="@* | node()"/>
         </xsl:when>
         <!-- Revathi: 26May2018 - As suggested by Amita - Commented the below code as it is creating issues in rocket conversion. -->
         <!--<!-\-Dayanand singh 2018-05-02 updated in below when condition of parent::case:factsummary -\->
            <xsl:when test="self::blockquote[ancestor::case:appendix|parent::case:factsummary]/p/text/matches(text()[1],'^\(([a-z]+|[ivx]+)\)')[$selectorID = 'cases']">
                <xsl:apply-templates/>
            </xsl:when>-->
         <xsl:when test="self::blockquote[child::table][$selectorID='cases'][$docinfo.selector = ('Transcript')]">
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@* | node() except(table)"/>
            </xsl:element>
            <xsl:apply-templates select="table"/>
         </xsl:when>
         <!-- Revathi: Added the below condition when the child of a blockquote is only blockquote, then we need to suppress the parent blockquote -->
         <xsl:when test="self::blockquote/not(child::node()[name()!='blockquote'])">
            <xsl:apply-templates/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="sup">
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
=======
      <xsl:choose><!-- Revathi: 22May2018 - Suppressed the element sup from occuring inside fnbody/p/text as this sup should be moved inside the element footnote/fnlabel. -->
         <xsl:when test="self::sup=parent::text/node()[1] and ancestor::footnote/@fntoken and ancestor::footnote/not(@fnrtokens) and (ancestor::footnote/not(fnlabel) or ancestor::footnote/matches(fnlabel,'[\s     ]+') or ancestor::footnote/fnlabel/not(child::node()))"/>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
   </xsl:template>
   <!--<xsl:template match="//case:content//text[ancestor::footnote]/sup" mode="fnrtoken">
        <xsl:value-of select="generate-id()"/>
    </xsl:template>-->   <!-- Revathi: 10May2018 - Commented the below code as per the clarification got for the footnote handling.
    Clarification got from Awntika: Need not generate @fntoken and @fnrtoken for the footnote handling and find the relevant fnr by identifying the element sup.
    So the element sup should be retained as sup itself in LA output.-->   <!--<xsl:template match="sup[not(ancestor::fnbody)][$selectorID=('cases')]">
        
        <!-\- Please include 'common/nonamespace/footnotegrp.xsl' in driver file as the named template fntoken and fnrtoken are fetched from there. -\->
        <xsl:variable name="fntoken">
            <xsl:call-template name="fntoken">
                <xsl:with-param name="fnlabel_footnote" select="self::sup"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="fnrtoken">
            <xsl:call-template name="fnrtoken">
                <xsl:with-param name="fnlabel_footnote" select="self::sup"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$fntoken!='' and $fnrtoken!=''">
                <fnr fntoken='{$fntoken}' fnrtoken='{$fnrtoken}' xsl:exclude-result-prefixes="#all">
                    <xsl:apply-templates/>
                </fnr>
            </xsl:when>
            <xsl:otherwise>
                <sup xsl:exclude-result-prefixes="#all">
                    <xsl:apply-templates/>
                </sup>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="sup[preceding-sibling::sup][parent::text/parent::p/parent::fnbody]">
        <xsl:apply-templates/>
    </xsl:template>-->   <!--<xsl:template match="sup[not(ancestor::fnbody)][$selectorID=('journal')]">
        
        <!-\- Please include 'common/nonamespace/footnotegrp.xsl' in driver file as the named template fntoken and fnrtoken are fetched from there. -\->
        <xsl:variable name="fntoken">
            <xsl:call-template name="fntoken">
                <xsl:with-param name="fnlabel_footnote" select="self::sup"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="fnrtoken">
            <xsl:call-template name="fnrtoken">
                <xsl:with-param name="fnlabel_footnote" select="self::sup"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$fntoken!='' and $fnrtoken!=''">
                <fnr fnrtoken='{$fnrtoken}' fntoken='{$fntoken}' xsl:exclude-result-prefixes="#all">
                    <xsl:apply-templates/>
                </fnr>
            </xsl:when>
            <xsl:otherwise>
                <sup xsl:exclude-result-prefixes="#all">
                    <xsl:apply-templates/>
                </sup>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->
   <xsl:template match="sub">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl

   <xsl:template match="table | tbody">
      <xsl:choose>
         <xsl:when test="self::table/parent::fnbody">
            <footnote fntoken="0" xsl:exclude-result-prefixes="#all">
               <fnbody xsl:exclude-result-prefixes="#all">
                  <p xsl:exclude-result-prefixes="#all">
                     <xsl:element name="{name()}">
                        <xsl:apply-templates select="@* | node()"/>
                     </xsl:element>
                  </p>
               </fnbody>
            </footnote>
         </xsl:when>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
=======
   <!-- Arun 24May2018 Updated the below code for handling thead -->
   <xsl:template match="table | tbody | thead">
      <xsl:choose>
         <xsl:when test="self::table/parent::fnbody"><!-- Revathi: 25May2018 - Commented creation of footnote element as it is handled in footnotegrp's template match - "node()[parent::fnbody]" --><!--<footnote fntoken="0" xsl:exclude-result-prefixes="#all">
                    <fnbody xsl:exclude-result-prefixes="#all">-->
            <p xsl:exclude-result-prefixes="#all">
               <xsl:element name="{name()}">
                  <xsl:apply-templates select="@* | node()"/>
               </xsl:element>
            </p>
            <!--</fnbody>
                </footnote>-->
         </xsl:when>
         <xsl:otherwise><!--<xsl:when test="self::tbody//entry/not(child::node())">
                    
                    <row xsl:exclude-result-prefixes="#all">
                        <entry xsl:exclude-result-prefixes="#all"/>
                    </row>
                </xsl:when>--><!-- Revathi: Added the below code to handle when tbody's all the row/entry are self closing elements  -->
            <xsl:choose>
               <xsl:when test="self::tbody">
                  <xsl:variable name="active_entries">
                     <xsl:for-each-group select="self::tbody//row" group-adjacent="self::row">
                        <xsl:for-each select="current-group()/entry">
                           <xsl:if test="self::entry != ''">
                              <xsl:value-of select="position()"/>
                              <xsl:text>,</xsl:text>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:for-each-group>
                  </xsl:variable>
                  <!-- To get the count of thead's active entries -->
                  <xsl:variable name="thead_entries">
                     <xsl:for-each-group select="ancestor::table//thead//row" group-adjacent="self::row">
                        <xsl:for-each select="current-group()/entry">
                           <xsl:if test="self::entry != ''">
                              <xsl:value-of select="position()"/>
                              <xsl:text>,</xsl:text>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:for-each-group>
                  </xsl:variable>
                  <xsl:variable name="count_thead_entries" as="xs:integer"><!-- A empty space is created as the last content of $distinct_entries because of this we are getting the actual count + 1. so we are reducing the count by 1  -->
                     <xsl:value-of select="count(tokenize($thead_entries, ',')) - 1"/>
                  </xsl:variable>
                  <xsl:choose><!-- When tbody doesnt have any active entry but thead has valid entry PCDATA -->
                     <xsl:when test="$active_entries = '' and $thead_entries != ''">
                        <xsl:element name="{name()}">
                           <xsl:for-each select="1 to $count_thead_entries">
                              <row xsl:exclude-result-prefixes="#all">
                                 <entry xsl:exclude-result-prefixes="#all"/>
                              </row>
                           </xsl:for-each>
                        </xsl:element>
                     </xsl:when>
                     <!-- When both thead and tbody doesnt have any active entry -->
                     <xsl:when test="$active_entries = '' and $thead_entries = ''">
                        <xsl:element name="{name()}">
                           <row xsl:exclude-result-prefixes="#all">
                              <entry xsl:exclude-result-prefixes="#all"/>
                           </row>
                        </xsl:element>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:element name="{name()}">
                           <xsl:apply-templates select="@* | node()"/>
                        </xsl:element>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:element name="{name()}">
                     <xsl:apply-templates select="@* | node()"/>
                  </xsl:element>
               </xsl:otherwise>
            </xsl:choose>
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
         </xsl:otherwise>
      </xsl:choose>
      <!-- Revathi: 10May2018 - Commented the below code as per the clarification got for the footnote handling.
    Clarification got from Awntika: Need not generate @fntoken and @fnrtoken for the footnote handling and find the relevant fnr by identifying the element sup.
    So need not move the table to the preceeding sibling p-->
      <!--<xsl:choose>
            <!-\- Revathi - 7May2018 - When table is a sibling of p, then this table should be included inside the footnote created corresponding to it preceeding sibling p -\->
            <xsl:when test="self::table/parent::fnbody and self::table/preceding-sibling::*[1][name()='p']"/>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>-->
      <!-- Revathi: 07May2018 - Moved the below code as xsl:otherwise block -->
      <!--<xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>-->
   </xsl:template>
   <!--<xsl:template match="table" mode="footnote-table">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>-->
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
=======
   <xsl:template match="thead/@*">
      <xsl:copy/>
   </xsl:template>

>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
   <xsl:template match="table/@*[not(name() = 'frame')] | row/@*"/>

   <xsl:template match="table/@frame">
      <xsl:choose>
         <xsl:when test="$selectorID = 'dictionary'"/>
         <xsl:when test="$selectorID = ('precedents', 'treatises')">
            <xsl:attribute name="frame" select="'none'"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:attribute name="frame" select="'all'"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="tgroup"><!-- To find which entries has content. Because colspec is created for the active entries only. And the empty entries are suppressed in LA output file.-->
      <xsl:variable name="active_entries">
         <xsl:for-each-group select="self::tgroup//row" group-adjacent="self::row">
            <xsl:for-each select="current-group()/entry">
               <xsl:if test="self::entry != ''">
                  <xsl:value-of select="position()"/>
                  <xsl:text>,</xsl:text>
               </xsl:if>
            </xsl:for-each>
         </xsl:for-each-group>
      </xsl:variable>
      <!-- The $active_entries has all the active entry count for all the rows. So to get the distinct values of the active entries the below $distinct_entries is created.-->
      <xsl:variable name="distinct_entries">
         <xsl:value-of select="distinct-values(tokenize($active_entries, ','))"/>
      </xsl:variable>
      <!-- To find the number of active entries-->
      <xsl:variable name="Maxcols" as="xs:integer"><!-- A empty space is created as the last content of $distinct_entries because of this we are getting the actual count + 1. so we are reducing the count by 1  -->
         <xsl:value-of select="count(tokenize($distinct_entries, ' ')) - 1"/>
      </xsl:variable>
      <xsl:element name="{name()}">
         <xsl:attribute name="cols">
            <xsl:choose><!-- Revathi - 04May2018- Added the below condition to chk whether all the entries are junk entries -->
               <xsl:when test="$Maxcols &lt; 0">
                  <xsl:value-of select="'0'"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="$Maxcols"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:attribute>
         <xsl:attribute name="colsep" select="1"/>
         <xsl:attribute name="rowsep" select="1"/>
         <!-- To create colspec element based on the cols count -->
         <xsl:variable name="colspec_type"><!-- Revathi: 04-May-2018 - Added the condition to check $Maxcols is not less than 0-->
            <xsl:if test="$Maxcols &gt; 0">
               <xsl:choose>
                  <xsl:when test="substring(child::colspec[1]/@colwidth, string-length(child::colspec[1]/@colwidth), 1) = '*'">
                     <xsl:value-of select="'*'"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="'in'"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:if>
         </xsl:variable>
         <!-- In input, the colspec/@colwidth is in inches, to convert this into pixel, multiply the value with 1440 and append * in the end  -->
         <xsl:variable name="colspec"><!-- Revathi: 04-May-2018 - Added the condition to check $Maxcols is not less than 0-->
            <xsl:if test="$Maxcols &gt; 0">
               <xsl:for-each select="self::tgroup/colspec">
                  <xsl:if test="position() &lt;= $Maxcols">
                     <xsl:variable name="count" select="position()" as="xs:integer"/>
                     <!-- Revathi: 22May2018 - Incorporated the pixel to pixel conversion shared by Awntika -->
                     <xsl:choose>
                        <xsl:when test="$colspec_type = '*'">
                           <xsl:variable name="colwidths" select="../colspec/@colwidth"/>
                           <xsl:variable name="totalwidth"
                                         select="                                             sum(for $x in $colwidths                                             return                                                 if (contains($x, '*')) then                                                     xs:decimal(substring-before($x, '*'))                                                 else                                                     xs:decimal($x))"/>
                           <xsl:value-of select="                                             if (contains(parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth, '*')) then                                                 concat(format-number(xs:decimal(substring-before(parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth, '*')) * 100 div $totalwidth, '#'), '*')                                             else                                                 concat(format-number(xs:decimal(parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth) * 100 div $totalwidth, '#'), '*')"/>
                        </xsl:when>
                        <!-- To calculate pixel value - Strip the 'in' in the end of colspec/@colwidth value and multiply it by 1440 and append * in the end -->
                        <xsl:otherwise>
                           <xsl:value-of select="concat(ceiling(number(replace(parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth, 'in', ''))) * 1440, '*')"/>
                        </xsl:otherwise>
                     </xsl:choose>
                     <!--<xsl:value-of
                                select="concat(number(replace(parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth, 'in', '')) * 1440, '*')"/>-->
                     <xsl:text>,</xsl:text>
                  </xsl:if>
               </xsl:for-each>
               <!--<xsl:choose>
                        <xsl:when test="$selectorID = 'dictionary'">
                            <xsl:for-each select="self::tgroup/colspec">
                                <xsl:if test="position() &lt;= $Maxcols">
                                    <xsl:variable name="count" select="position()" as="xs:integer"/>
                                    <!-\- To calculate pixel value - Strip the 'in' in the end of colspec/@colwidth value and multiply it by 1440 and append * in the end -\->
                                    <xsl:value-of
                                        select="concat(number(replace(parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth, 'in', '')) * 1440, '*')"/>
                                    <xsl:text>,</xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:for-each select="self::tgroup/colspec">
                                <xsl:if test="position() &lt;= $Maxcols">
                                    <xsl:variable name="count" select="position()" as="xs:integer"/>
                                    <!-\- To calculate pixel value - Strip the 'in' in the end of colspec/@colwidth value and multiply it by 1440 and append * in the end -\->
                                    <xsl:choose>
                                        <xsl:when test="$colspec_type = '*'">
                                            <xsl:value-of
                                                select="parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth"
                                            />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of
                                                select="concat(number(replace(parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth, 'in', '')) * 1440, '*')"
                                            />
                                        </xsl:otherwise>
                                    </xsl:choose>


                                    <xsl:text>,</xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:otherwise>
                    </xsl:choose>-->
            </xsl:if>
         </xsl:variable>
         <!-- To create colspec element based on the cols count -->
         <!-- Revathi: 04May2018 - colspec element should be created only when there are any valid entries inside the table. So added condition to check $Maxcols is > 0 -->
         <xsl:if test="$Maxcols &gt; 0">
            <xsl:for-each select="1 to $Maxcols">
               <colspec colname="{current()}"
                        colwidth="{tokenize($colspec,',')[current()]}"
                        xsl:exclude-result-prefixes="#all"/>
            </xsl:for-each>
         </xsl:if>
         <!-- To create thead -->
         <xsl:for-each-group select="self::tgroup//row" group-adjacent="self::row">
            <xsl:for-each select="current-group()">
               <xsl:if test="current-group()/entry/text() = 'TABLE'">
                  <thead xsl:exclude-result-prefixes="#all">
                     <xsl:apply-templates select="." mode="thead"/>
                  </thead>
               </xsl:if>
            </xsl:for-each>
         </xsl:for-each-group>
         <xsl:choose><!-- Revathi: 04May2018 - The rows should be processed only if there are any valid entries in the table. If there is no valid entries then we need not process all the rows.-->
            <xsl:when test="$Maxcols &gt; 0">
               <xsl:apply-templates select="node()"/>
            </xsl:when>
            <xsl:otherwise>
               <tbody xsl:exclude-result-prefixes="#all">
                  <row xsl:exclude-result-prefixes="#all">
                     <entry xsl:exclude-result-prefixes="#all"/>
                  </row>
               </tbody>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:element>
   </xsl:template>

   <xsl:template match="colspec"/>

   <xsl:template match="row" mode="thead">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="node()" mode="thead"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="entry" mode="thead">
      <xsl:variable name="active_entries">
         <xsl:for-each-group select="ancestor::table//row" group-adjacent="self::row">
            <xsl:for-each select="current-group()/entry">
               <xsl:if test="self::entry != ''">
                  <xsl:value-of select="position()"/>
                  <xsl:text>,</xsl:text>
               </xsl:if>
            </xsl:for-each>
         </xsl:for-each-group>
      </xsl:variable>
      <!-- The $active_entries has all the active entry count for all the rows. So to get the distinct values of the active entries the below $distinct_entries is created.-->
      <xsl:variable name="distinct_entries">
         <xsl:value-of select="distinct-values(tokenize($active_entries, ','))"/>
      </xsl:variable>
      <!-- To find the number of active entries-->
      <xsl:variable name="Maxcols"><!-- A empty space is created as the last content of $distinct_entries because of this we are getting the actual count + 1. so we are reducing the count by 1  -->
         <xsl:value-of select="count(tokenize($distinct_entries, ' ')) - 1"/>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="self::entry/node()">
            <xsl:element name="{name()}">
               <xsl:attribute name="namest" select="1"/>
               <xsl:attribute name="nameend" select="$Maxcols"/>
               <xsl:attribute name="colsep" select="'0'"/>
               <xsl:attribute name="rowsep" select="'0'"/>
               <xsl:apply-templates select="node()"/>
            </xsl:element>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="row">
      <xsl:choose>
         <xsl:when test="self::row//entry/text() = 'TABLE'"/>
         <xsl:when test="self::row//entry/node()">
            <xsl:element name="{name()}">
               <xsl:variable name="count_of_valid_entry" as="xs:integer">
                  <xsl:value-of select="count(self::row//entry/node())"/>
               </xsl:variable>
               <xsl:variable name="active_entries">
                  <xsl:for-each-group select="ancestor::table//row" group-adjacent="self::row">
                     <xsl:for-each select="current-group()/entry">
                        <xsl:if test="self::entry != ''">
                           <xsl:value-of select="position()"/>
                           <xsl:text>,</xsl:text>
                        </xsl:if>
                     </xsl:for-each>
                  </xsl:for-each-group>
               </xsl:variable>
               <!-- The $active_entries has all the active entry count for all the rows. So to get the distinct values of the active entries the below $distinct_entries is created.-->
               <xsl:variable name="distinct_entries">
                  <xsl:value-of select="distinct-values(tokenize($active_entries, ','))"/>
               </xsl:variable>
               <!-- To find the number of active entries-->
               <xsl:variable name="count_of_max_entry" as="xs:integer"><!-- A empty space is created as the last content of $distinct_entries because of this we are getting the actual count + 1. so we are reducing the count by 1  -->
                  <xsl:value-of select="count(tokenize($distinct_entries, ' ')) - 1"/>
               </xsl:variable>
               <!-- Calculate count of empty entries to be created to tally the cols count (This is to ensure proper alignment of all the rows inside table) -->
               <xsl:variable name="diff_count"
                             as="xs:integer"
                             select="$count_of_max_entry - $count_of_valid_entry"/>
               <xsl:choose>
                  <xsl:when test="$diff_count &gt; 0">
                     <xsl:for-each select="1 to $diff_count">
                        <entry xsl:exclude-result-prefixes="#all">
                           <xsl:if test="$selectorID = 'dictionary' or $docinfo.selector = 'Transcripts'">
                              <xsl:attribute name="colsep" select="'0'"/>
                              <xsl:attribute name="rowsep" select="'0'"/>
                           </xsl:if>
                        </entry>
                     </xsl:for-each>
                  </xsl:when>
               </xsl:choose>
               <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="entry">
      <xsl:choose>
         <xsl:when test="self::entry/node()">
            <xsl:element name="{name()}">
               <xsl:if test="$selectorID = 'dictionary' or $docinfo.selector = 'Transcripts'">
                  <xsl:attribute name="colsep" select="'0'"/>
                  <xsl:attribute name="rowsep" select="'0'"/>
               </xsl:if>
               <!-- Revathi: 22May2016 - Added the below condition check. As the entry PCDATA in commentary should be wrapped by the element p-limited-->
               <xsl:choose>
                  <xsl:when test="$selectorID = ('precedents', 'treatises')">
                     <p-limited xsl:exclude-result-prefixes="#all">
                        <xsl:apply-templates select="node()"/>
                     </p-limited>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="node()"/>
                  </xsl:otherwise>
               </xsl:choose>
               <!--<xsl:apply-templates select="node()"/>-->
            </xsl:element>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="url">
      <xsl:choose>
         <xsl:when test="$selectorID=('journal','cases','precedents','treatises','commentaryleghist','dictionary','digest')">
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
         </xsl:when>
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
         <!-- added url element so choosed cases as selectorID by himanshu -->
         <!--   Dayanand singh 14 MAY 2018 Added for casse selector id -->
         <xsl:when test="$selectorID='cases'">
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
         </xsl:when>
=======
         <!--   Dayanand singh 30 MAY 2018 Added digest selector id -->
         <!-- Revathi: 22May2018 - Commented the above code and added the $selectorID 'cases' to the above xsl:when to avoid code redundancy -->
         <!-- added url element so choosed cases as selectorID by himanshu -->
         <!--   Dayanand singh 14 MAY 2018 Added for casse selector id -->
         <!-- <xsl:when test="$selectorID='cases'">
                <xsl:element name="{name()}">
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:element>
            </xsl:when>-->
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
         <!-- end -->
         <xsl:otherwise>
            <xsl:apply-templates select="@* | node()"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="inlineobject">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="inlineobject/@*">
      <xsl:copy/>
   </xsl:template>
   <!-- Changed by Dayanand as per DTD 10 May 2018-->   <!--<xsl:template match="nl[ancestor::searchhit|ancestor::emph|ancestor::alias|ancestor::glp:note|ancestor::note|ancestor::page|ancestor::fnr]">-->   <!-- Revathi: 11May2018 - Commented out the above nl template and added the below generic nl template-->
   <xsl:template match="nl">
      <xsl:apply-templates/>
      <!-- Added by Dayanand -->
      <!-- Revathi: 10May2018 - Commented the below code as whenever nl element occurs we need to suppress the element and retain the child contents-->
      <!--<xsl:if test="contains(.,'')">
                    <xsl:element name="nl"/>
                   
                    
            </xsl:if>-->
   </xsl:template>

   <xsl:template match="page[$selectorID = 'cases']">
      <xsl:choose>
         <xsl:when test="self::page[parent::catchphrase]">
            <xsl:element name="page" inherit-namespaces="no">
               <xsl:apply-templates select="@*"/>
            </xsl:element>
         </xsl:when>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:attribute name="text" select="normalize-space(./@text)"/>
               <xsl:attribute name="reporter" select="./@reporter"/>
               <xsl:attribute name="count" select="./@count"/>
               <xsl:apply-templates/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="page[not($selectorID = 'cases')]">
      <xsl:element name="{name()}">
         <xsl:attribute name="text" select="./@count"/>
         <xsl:attribute name="count" select="./@count"/>
         <xsl:attribute name="reporter" select="./@reporter"/>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>
   <!--<xsl:template match="page[parent::catchphrase]">
        <xsl:element name="page" inherit-namespaces="no">
            <xsl:apply-templates select="@*"/>
        </xsl:element>
    </xsl:template>-->
   <xsl:template match="page/@*[not(ancestor::footnote)][$selectorID = 'cases']"/>

<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
   <xsl:template match="page[parent::catchphrase]">
      <xsl:element name="page" inherit-namespaces="no">
         <xsl:apply-templates select="@*"/>
      </xsl:element>
=======
   <xsl:template match="page/@*">
      <xsl:copy/>
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
   </xsl:template>

   <xsl:template match="footnotegrp">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
      <xsl:apply-templates select="self::footnotegrp//fnbody/page"/>
   </xsl:template>
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl

   <xsl:template match="footnote | fnbody">
      <xsl:apply-templates/>
=======
   <!--<xsl:template match="footnote | fnbody">-->
   <xsl:template match="footnote | fnbody | fnlabel">
      <xsl:choose><!-- Revathi: 28May2018 - Based on the clarification received on footnote, when @fntoken and @fnrtokens is present in the input, the footnote should be retained as such in the input -->
         <xsl:when test="(self::footnote/@fntoken!='0' and self::footnote/@fnrtokens) or self::fnbody[parent::footnote/@fntoken!='0' and parent::footnote/@fnrtokens] or self::fnlabel[parent::footnote/@fntoken!='0' and parent::footnote/@fnrtokens]">
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
         </xsl:when>
         <xsl:otherwise><!-- Dayanand Singh 16 May 2018 for handling of footnote where fnbody is dummy--><!--<xsl:if test="fnbody=''">--><!-- Revathi: 25May 2018 - Modified the fnbody check as it is causing validation errors when fnbody/p/text has sequence of spaces.-->
            <xsl:if test="fnbody/not(child::node())">
               <xsl:element name="footnote">
                  <xsl:attribute name="fntoken" select="@fntoken"/>
                  <xsl:element name="fnbody">
                     <xsl:apply-templates/>
                  </xsl:element>
               </xsl:element>
            </xsl:if>
            <xsl:apply-templates/>
         </xsl:otherwise>
      </xsl:choose>
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
   </xsl:template>
   <!-- Revathi: 10May2018 - Commented the below code as per the clarification got for the footnote handling.
    Clarification got from Awntika: Need not generate @fntoken and @fnrtoken for the footnote handling and find the relevant fnr by identifying the element sup.
    So the element sup should be retained as sup itself in LA output.-->   <!--<xsl:template name="fntoken">
        <xsl:param name="fnlabel_footnote"/>
        <xsl:choose>
            <xsl:when test="//sup[self::sup/text()=$fnlabel_footnote][ancestor::fnbody]">
                <xsl:apply-templates select="//sup[self::sup/text()=$fnlabel_footnote][ancestor::fnbody]" mode="footnote"/> 
            </xsl:when>
            <!-\- Revathi: 04May2018 - Ususally fnlabel is identified by the element sup being first child of footnote//p/text.
                But in some files fnlabel content is present as starting content of the p/text PCDATA. So added below condition to capture it correctly -\->
            <!-\-<xsl:when test="//fnbody/p/text[substring-before(self::text/node()[1],' ')=$fnlabel_footnote]">
                <xsl:apply-templates select="//fnbody/p/text[substring-before(self::text/node()[1],' ')=$fnlabel_footnote]" mode="footnote"/> 
            </xsl:when>-\->
            <xsl:when test="//fnbody/p/text[substring-before(self::text/node()[1],'&#160;')=$fnlabel_footnote]">
                <xsl:apply-templates select="//fnbody/p/text[substring-before(self::text/node()[1],'&#160;')=$fnlabel_footnote]" mode="footnote"/> 
            </xsl:when>
            <xsl:when test="//fnbody/p/text[substring-before(self::text/node()[1],' ')=$fnlabel_footnote]">
                <xsl:apply-templates select="//fnbody/p/text[substring-before(self::text/node()[1],' ')=$fnlabel_footnote]" mode="footnote"/> 
            </xsl:when>
        </xsl:choose>
        <!-\- Revathi: 04May2018 - Commented the below code and added the above code -\->
        <!-\-<xsl:apply-templates select="//sup[self::sup/text()=$fnlabel_footnote][ancestor::fnbody]" mode="footnote"/> -\->
       
    </xsl:template>-->   <!--<xsl:template name="fnrtoken">
        <xsl:param name="fnlabel_footnote"/>          
        <xsl:apply-templates select="//sup[self::sup/text()=$fnlabel_footnote][not(ancestor::fnbody)]" mode="footnote"/>        
    </xsl:template>-->   <!-- Revathi: 04May2018 - Added a condition check -->   <!--<xsl:template match="//sup | //fnbody/p/text" mode="footnote">
        <xsl:value-of select="generate-id()"/>
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
    </xsl:template>-->
   <xsl:template match="p[parent::fnbody]">
      <footnote type="editorial" xsl:exclude-result-prefixes="#all">
         <xsl:attribute name="fntoken" select="0"/>
=======
    </xsl:template>-->   <!--<xsl:template match="node()[parent::fnbody]">-->
   <xsl:template match="node()[not(name()='page')][parent::fnbody][parent::fnbody/parent::footnote/@fntoken and parent::fnbody/parent::footnote/not(@fnrtokens)]"
                 priority="1">
      <footnote type="editorial" xsl:exclude-result-prefixes="#all"><!-- Revathi: 25May2018 - Updated the list of attributes appearing in footnote element. -->
         <xsl:if test="exists(parent::fnbody/parent::footnote/@fntoken)">
            <xsl:attribute name="fntoken" select="parent::fnbody/parent::footnote/@fntoken"/>
         </xsl:if>
         <xsl:if test="exists(parent::fnbody/parent::footnote/@fnrtokens)">
            <xsl:attribute name="fnrtokens" select="parent::fnbody/parent::footnote/@fnrtokens"/>
         </xsl:if>
         <xsl:if test="exists(parent::fnbody/parent::footnote/@type)">
            <xsl:attribute name="type" select="parent::fnbody/parent::footnote/@type"/>
         </xsl:if>
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
         <!--<xsl:attribute name="fntoken">
                <xsl:variable name="v_fnlabel">
                    <xsl:choose>
                        <xsl:when test="self::p/text/sup/text()">
                            <xsl:value-of select="self::p/text/sup/text()"/>
                        </xsl:when>
                        <!-\- Revathi: 04May2018 - Added the below code to handle variations of fnlabel content -\->
                        <xsl:when test="name(self::p/text/node()[1])='' and matches(self::p/text/node()[1],'(^\(?[0-9a-zA-Z]+\.?\)?)[\s|&#160;]+')">
                            <xsl:analyze-string select="self::p/text/node()[1]"
                                regex="(^\(?[0-9a-zA-Z]+\.?\)?)[\s|&#160;]+([\w\W]+)">
                                
                                <xsl:matching-substring>
                                    <xsl:value-of select="regex-group(1)"/>
                                </xsl:matching-substring>
                            </xsl:analyze-string>
                        </xsl:when>
                    </xsl:choose>
                </xsl:variable>
                
                <xsl:choose>
                    <xsl:when test="$v_fnlabel!=''">
                        <xsl:call-template name="fntoken">
                            <xsl:with-param name="fnlabel_footnote" select="$v_fnlabel"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="generate-id(ancestor::footnote)"/>
                    </xsl:otherwise>
                </xsl:choose>             
            </xsl:attribute>
            
            <xsl:variable name="fnrval">
                <xsl:call-template name="fnrtoken">
                    <xsl:with-param name="fnlabel_footnote">
                        <xsl:choose>
                            <xsl:when test="self::p/text/sup/text()">
                                <xsl:value-of select="self::p/text/sup/text()"/>
                            </xsl:when>
                            <xsl:when test="name(self::p/text/node()[1])='' and matches(self::p/text/node()[1],'(^\(?[0-9a-zA-Z]+\.?\)?)')">
                                <xsl:analyze-string select="self::p/text/node()[1]"
                                    regex="(^\(?[0-9a-zA-Z]+\.?\)?)[\s|&#160;]+([\w\W]+)">
                                    
                                    <xsl:matching-substring>
                                        <xsl:value-of select="regex-group(1)"/>
                                    </xsl:matching-substring>
                                </xsl:analyze-string>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
            
            <xsl:if test="$fnrval!=''">
                <xsl:attribute name="fnrtokens" select="$fnrval"/>
            </xsl:if>-->
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
         <!-- Revathi: 04May2018 - Ususally fnlabel is identified by the element sup being first child of footnote//p/text.
                But in some files fnlabel content is present as starting content of the p/text PCDATA. So added below condition to capture it correctly -->
         <xsl:choose>
            <xsl:when test="self::p/text/*[1][name() = 'sup']">
               <fnlabel xsl:exclude-result-prefixes="#all">
                  <xsl:apply-templates select="self::p/text/sup[1]/node()"/>
               </fnlabel>
            </xsl:when>
=======
         <xsl:choose><!-- Revathi: 25May2018 - Added the below condition when fnlabel is appearing in the input file itself, need to capture that -->
            <xsl:when test="parent::fnbody/parent::footnote/child::fnlabel[matches(self::fnlabel, '[^\s     ]')]">
               <fnlabel xsl:exclude-result-prefixes="#all">
                  <xsl:apply-templates select="parent::fnbody/parent::footnote/child::fnlabel/node()"/>
               </fnlabel>
            </xsl:when>
            <xsl:when test="self::p/text/node()[1][name() = 'sup']">
               <fnlabel xsl:exclude-result-prefixes="#all">
                  <xsl:apply-templates select="self::p/text/sup[1]/node()"/>
               </fnlabel>
            </xsl:when>
            <xsl:otherwise>
               <fnlabel xsl:exclude-result-prefixes="#all">
                  <xsl:apply-templates select="parent::fnbody/parent::footnote/child::fnlabel/node()"/>
               </fnlabel>
            </xsl:otherwise>
            <!-- Revathi: 04May2018 - Ususally fnlabel is identified by the element sup being first child of footnote//p/text.
                But in some files fnlabel content is present as starting content of the p/text PCDATA. So added below condition to capture it correctly -->
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
            <!--<xsl:when test="matches(substring-before(self::p/text/node()[1],' '),'^[0-9]+')">
                    <fnlabel xsl:exclude-result-prefixes="#all">
                        <!-\- Revathi: 08May2018 - Replace &#160;(non-breaking-space) while capturing the fnlabel -\->
                        <!-\-<xsl:value-of select="replace(substring-before(self::p/text/node()[1],' '),'&#160;','')"/>-\->
                        
                        <xsl:choose>
                            <xsl:when
                                test="name(self::p/text/node()[1]) = '' and matches(self::p/text/node()[1], '(^\(?[0-9a-zA-Z]+\.?\)?)')">
                                <xsl:analyze-string select="self::p/text/node()[1]"
                                    regex="(^\(?[0-9a-zA-Z]+\.?\)?)[\s|&#160;]+([\w\W]+)">
                                    
                                    <xsl:matching-substring>
                                        <xsl:value-of select="regex-group(1)"/>
                                    </xsl:matching-substring>
                                </xsl:analyze-string>
                            </xsl:when>
                        </xsl:choose>
                        
                    </fnlabel>
                </xsl:when>-->
         </xsl:choose>
         <!-- Revathi: 04May2018 - Commented the below code and added the above code -->
         <!-- <xsl:if test="self::p/text/*[1][name() = 'sup']">                
                <fnlabel>
                    <xsl:apply-templates select="self::p/text/sup[1]/node()"/>
                </fnlabel>
            </xsl:if>-->
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
         <fnbody xsl:exclude-result-prefixes="#all">
            <p xsl:exclude-result-prefixes="#all">
               <xsl:apply-templates/>
               <!-- Revathi - 7May2018 - When table is a sibling of p, then this table should be included inside the footnote created corresponding to it preceeding sibling p -->
               <!--<xsl:apply-templates select="self::p/following-sibling::*[1][name()='table']" mode="footnote-table"/>-->
            </p>
=======
         <fnbody xsl:exclude-result-prefixes="#all"><!-- Revathi: 23May2018 - Modified to accomodate generic element as the child of fnbody -->
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
            <!--<p xsl:exclude-result-prefixes="#all">
                    <xsl:apply-templates/>      
                    <!-\- Revathi - 7May2018 - When table is a sibling of p, then this table should be included inside the footnote created corresponding to it preceeding sibling p -\->
                    <!-\-<xsl:apply-templates select="self::p/following-sibling::*[1][name()='table']" mode="footnote-table"/>-\->
                </p>-->
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
         </fnbody>
      </footnote>
   </xsl:template>
   <!-- Arun: 25May2018 - Added element fnr -->
   <xsl:template match="fnr">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>
   <!-- Arun: 25May2018 - Added element fnr's attributes -->
   <xsl:template match="fnr/@* | footnote/@*">
      <xsl:copy/>
   </xsl:template>
   <!-- Revathi: suppressed the element fnlabel as this is handled while creating the footnote element in the template match of "node()[parent::fnbody]" -->
   <xsl:template match="fnlabel[parent::footnote/@fntoken and parent::footnote/not(@fnrtokens)]"/>
   <!-- Revathi: Commented the below code and added the text as a condition in sup.xsl -->   <!--<xsl:template match="sup[preceding-sibling::sup][parent::text/parent::p/parent::fnbody]">
        <xsl:apply-templates/>
    </xsl:template>-->   <!-- Revathi: Commented the below code and added the text as a condition in text.xsl -->   <!-- <xsl:template match="text[parent::p/parent::fnbody]">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="node() except (sup[1], page)"/>
        </xsl:element>
    </xsl:template>-->   <!-- Revathi: 23May2018 - Commented the below code as i have added the generic code to handle the child elements of fnbody irrespective of the element name in <xsl:template match="node()[parent::fnbody]"> -->   <!--    Dayanand singh 16 May 2018 added list under footnote-->   <!-- <xsl:template match="footnote/fnbody[child::l]">
        <xsl:element name="footnote">
            <xsl:attribute name="fntoken" select="0"/>
            <xsl:element name="fnbody">
                <xsl:apply-templates select="@* | node() except table"/>
            </xsl:element>
        </xsl:element>
        <xsl:apply-templates select="child::table"/>
    </xsl:template>-->   <!-- Uncomment the below xsl:param while unit testing -->   <!-- Start: For unit-testing -->   <!--<xsl:include href="../nonamespace/emph.xsl"/>-->   <!-- End: For unit-testing -->
   <xsl:template match="person[$selectorID = ('cases','journal')]">
      <xsl:choose>
         <xsl:when test="self::person[parent::case:constituent]/child::name.text/not(child::node()[name()!='glp:note'])">
            <xsl:apply-templates/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="name.text[parent::person][$selectorID = ('cases','journal')]">
      <xsl:choose>
         <xsl:when test="self::name.text[parent::person/parent::case:constituent]/not(child::node()[name()!='glp:note'])">
            <xsl:apply-templates/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="person/@searchtype">
      <xsl:attribute name="{name()}">
         <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>
<<<<<<< HEAD:LL-Index-to-LA-Index.xsl
=======
   <!-- Uncomment the below xsl:param while unit testing -->   <!-- Start: For unit-testing -->   <!--<xsl:include href="../nonamespace/emph.xsl"/>-->   <!-- End: For unit-testing -->   <!-- Arun: 03May2018 - Added below template to handle glp:note element -->
   <xsl:template match="glp:note">
      <xsl:choose><!-- Revathi: 29May2018 - code change for CR by Awntika --><!-- Revathi: 05June2018 - Included the parent condition check. -->
         <xsl:when test="parent::name.text[parent::person/parent::case:constituent]">
            <xsl:apply-templates/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- Uncomment the below xsl:param while unit testing -->   <!-- Start: For unit-testing -->   <!--<xsl:include href="../nonamespace/emph.xsl"/>-->   <!-- End: For unit-testing -->   <!-- Arun: 03May2018 - Added below template to handle date element -->   <!-- Dayanand: 31May2018 - changed below template to handle date element for digestdoc-->
   <xsl:template match="date">
      <xsl:element name="{name()}"><!--
                Old code: <xsl:apply-templates select="@* | node()"/>
            -->
         <xsl:choose>
            <xsl:when test="parent::pubdate">
               <xsl:apply-templates select="@* | node()"/>
            </xsl:when>
            <xsl:when test="parent::leg:assentdate|parent::leg:enactdate">
               <xsl:variable name="month"
                             select="'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'"/>
               <xsl:variable name="DATE" select="tokenize(.,' ')"/>
               <xsl:choose>
                  <xsl:when test="not(@*)">
                     <xsl:analyze-string select="." regex="([0-9]+)\s+([a-zA-Z]+)\s+([0-9]+)">
                        <xsl:matching-substring>
                           <xsl:variable name="DAY" select="number($DATE[1])"/>
                           <xsl:attribute name="day" select="format-number($DAY, '00')"/>
                           <xsl:attribute name="month" select="format-number(index-of($month,$DATE[2]),'00')"/>
                           <xsl:attribute name="year" select="$DATE[3]"/>
                        </xsl:matching-substring>
                        <xsl:non-matching-substring/>
                     </xsl:analyze-string>
                     <xsl:apply-templates select="node()"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="@* | node()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates select="@* | node()"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:element>
   </xsl:template>

   <xsl:template match="date/@*">
      <xsl:copy/>
   </xsl:template>
   <!-- Uncomment the below xsl:param while unit testing -->   <!-- Start: For unit-testing -->   <!--<xsl:include href="../nonamespace/emph.xsl"/>-->   <!-- End: For unit-testing -->   <!-- Arun: 03May2018 - Added below template to handle link element -->
   <xsl:template match="link[not(parent::docinfo:alt-rendition)]">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="link[not(parent::docinfo:alt-rendition)]/@*">
      <xsl:copy/>
   </xsl:template>
   <!-- Uncomment the below xsl:param while unit testing -->   <!-- Start: For unit-testing -->   <!--<xsl:include href="../nonamespace/emph.xsl"/>-->   <!-- End: For unit-testing -->   <!-- Arun: 03May2018 - Added below template to handle strike element -->
   <xsl:template match="strike">
      <xsl:element name="{name()}">
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>
>>>>>>> origin/development:DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl
   <!-- END OF GENERIC XSLS --></xsl:stylesheet>

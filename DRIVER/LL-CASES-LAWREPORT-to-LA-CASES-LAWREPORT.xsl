<?xml version="1.0" encoding="UTF-8"?>
<!--  ***This XSLT conversion file is a stand-alone, generated release created from a module based source code.  Any changes to this conversion must be propagated to its original source. ***
This file is not intended to be edited directly, except in a time critical situation such as a  "sev1" webstar.
Please contact Content Architecture for support and for ensuring the source code is updated as needed and a new stand-alone delivery is released.
Compiled:  2018-04-11T18:15:08.775+05:30-->
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
   <xsl:param name="selectorID" select="'cases'"/>
   <xsl:variable name="docinfo.selector" select="//docinfo:selector//text()"/>
   <xsl:output encoding="utf-8" indent="no"/>
   <xsl:strip-space elements="*"/>
   <!-- START OF CONTENT SPECIFIC XSLS -->
   <!-- Please uncomment the below xsl:include while unit-testing -->
   <!-- START: For unit-testing -->
   <!--<xsl:include href="../COMMON/nonamespace/default.xsl"/>-->
   <!-- END: For unit-testing -->
   <xsl:template match="CASEDOC">
      <xsl:element name="{name()}">
         <xsl:for-each select="$RosettaNamespaces/*">
            <xsl:sort/>
            <xsl:namespace name="{substring-after(substring-before(., '='), ':')}"
                           select="substring-after(translate(., '&#34;', ''), '=')"/>
         </xsl:for-each>
         <xsl:attribute name="type" select="'fulltext'"/>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="case:body[parent::CASEDOC]">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="case:headnote[parent::case:body]">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node() except (glp:note,case:priorhist)"/>
         <xsl:apply-templates select="case:decisionsummary/glp:note" mode="glp.note"/>
         <xsl:apply-templates select="case:decisionsummary/case:consideredcases" mode="references"/>
         <xsl:apply-templates select="case:priorhist"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="case:info[parent::case:headnote] | case:parallelcite[parent::case:info/ancestor::case:headnote] | case:casename[ancestor::case:headnote] | case:reportercite[ancestor::case:headnote]">
      <xsl:element name="{name()}">
         <xsl:choose>
            <xsl:when test="self::case:casename[ancestor::case:headnote] and $docinfo.selector='PracticeDirection'">
               <xsl:variable name="casename" select="."/>
               <xsl:value-of select="translate($casename, ';', '')"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates select="@* | node()"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:element>
   </xsl:template>

   <xsl:template match="case:courtinfo[parent::case:info or parent::case:judgment]">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="case:courtname[parent::case:courtinfo] | case:courtcode[parent::case:courtinfo] | case:judges[parent::case:courtinfo] | case:judge[parent::case:judges/parent::case:courtinfo] | case:dates[parent::case:courtinfo] | case:hearingdates[parent::case:dates/parent::case:courtinfo] | case:decisiondate[parent::case:dates/parent::case:courtinfo]">
      <xsl:element name="{name()}">
         <xsl:choose>
            <xsl:when test="self::case:courtcode and $docinfo.selector='PracticeDirection'">
               <xsl:variable name="courtcode" select="."/>
               <xsl:value-of select="translate($courtcode, 'temp', '')"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates select="@* | node()"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:element>
   </xsl:template>

   <xsl:template match="case:juris[parent::case:courtinfo[parent::case:info | parent::judgment]]"/>

   <xsl:template match="catchwordgrp[parent::case:headnote]">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="catchwords[parent::catchwordgrp/parent::case:headnote]">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
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
      <xsl:call-template name="catchphrase_split">
         <xsl:with-param name="text" select="$text_to_process"/>
      </xsl:call-template>
      <xsl:apply-templates select="self::catchphrase/ci:cite" mode="catchphrase"/>
   </xsl:template>

   <xsl:template name="catchphrase_split">
      <xsl:param name="text" select="."/>
      <xsl:param name="delimiter">–</xsl:param>
      <!-- To check whether the end of catchphrase has been reached. As the end content is not ended with &#x2013;, we need to handle it. -->
      <xsl:variable name="test_for_last_value">
         <xsl:choose>
            <xsl:when test="contains(substring-after($text, $delimiter), $delimiter)">
               <xsl:value-of select="'no'"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="'yes'"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="normalize-space(substring-before($text, $delimiter)) != ''">
         <xsl:choose><!-- When more delimiter is present, process the text before the delimiter -->
            <xsl:when test="$test_for_last_value = 'no'">
               <catchphrase>
                  <xsl:call-template name="replace">
                     <xsl:with-param name="text"
                                     select="normalize-space(substring-before($text, $delimiter))"/>
                  </xsl:call-template>
               </catchphrase>
            </xsl:when>
            <!-- When it is the last delimiter and no more delimiter is present, then process both before and after contents of delimiter -->
            <xsl:when test="$test_for_last_value = 'yes'">
               <catchphrase>
                  <xsl:call-template name="replace">
                     <xsl:with-param name="text"
                                     select="normalize-space(substring-before($text, $delimiter))"/>
                  </xsl:call-template>
               </catchphrase>
               <catchphrase>
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
         </xsl:call-template>
      </xsl:if>
   </xsl:template>

   <xsl:template match="ci:cite[parent::catchphrase/ancestor::catchwordgrp/parent::case:headnote]"/>

   <xsl:template match="ci:cite[parent::catchphrase]" mode="catchphrase">
      <catchphrase>
         <xsl:value-of select="normalize-space(concat(self::ci:cite//ci:content//text(), translate(following-sibling::node()[1][./name() = ''], '–', '')))"/>
      </catchphrase>
   </xsl:template>

   <xsl:template match="case:factsummary">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="case:decisionsummary[parent::case:headnote]">
      <xsl:element name="{name()}">
         <xsl:attribute name="summarytype" select="'held'"/>
         <!-- If there is glp:note within case:headnote and as preceeding sibling of decisionsummary, then we have to move this into decisionsummary and suppress the tag glp:note and retain its child elements -->
         <xsl:apply-templates select="self::case:decisionsummary/preceding-sibling::glp:note"/>
         <xsl:for-each select="*">
            <xsl:if test="self::node()[not(preceding-sibling::glp:note) and not(preceding-sibling::case:consideredcases)]">
               <xsl:apply-templates select="."/>
            </xsl:if>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>

   <xsl:template match="glp:note[parent::case:decisionsummary] | case:consideredcases[parent::case:decisionsummary]"/>

   <xsl:template match="glp:note[parent::case:headnote and following-sibling::case:decisionsummary]">
      <xsl:apply-templates/>
   </xsl:template>

   <xsl:template match="glp:note[parent::case:decisionsummary/parent::case:headnote]"
                 mode="glp.note">
      <xsl:choose>
         <xsl:when test="self::glp:note/not(preceding-sibling::glp:note)">
            <xsl:element name="note">
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

   <xsl:template match="case:consideredcases[parent::case:decisionsummary/parent::case:headnote]"
                 mode="references">
      <xsl:choose>
         <xsl:when test="self::case:consideredcases/not(preceding-sibling::case:consideredcases)">
            <case:references referencetype="cases">
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

   <xsl:template match="case:priorhist[ancestor::case:headnote]">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="case:content">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="glp:note[parent::case:content]">
      <xsl:choose>
         <xsl:when test="self::glp:note/following-sibling::*[1][name()='case:appendix']">
            <case:appendix>
               <xsl:apply-templates/>
            </case:appendix>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="case:judgments[parent::case:content]">
      <xsl:choose>
         <xsl:when test="self::case:judgments/not(preceding-sibling::case:judgments)">
            <xsl:element name="{name()}">
               <xsl:if test="parent::case:content/preceding-sibling::case:headnote//case:decisionsummary/p">
                  <prelim>
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
      <prelim><!-- This mode is defined in the file "case.judgements_ChOf_case.content.xsl" -->
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
               <xsl:choose>
                  <xsl:when test="self::text">
                     <xsl:attribute name="align" select="'right'"/>
                     <xsl:apply-templates/>
                  </xsl:when>
                  <xsl:when test="self::p">
                     <xsl:apply-templates mode="prelim"/>
                  </xsl:when>
                  <xsl:when test="self::emph"/>
                  <xsl:otherwise>
                     <xsl:apply-templates/>
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
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="date[parent::case:decisiondate/parent::case:dates/parent::case:judgments]">
      <xsl:apply-templates/>
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

   <xsl:template match="case:constituent[parent::case:constituents]">
      <xsl:element name="{name()}">
         <xsl:apply-templates/>
      </xsl:element>
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

   <xsl:template match="case:author[parent::case:content]">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>
   <!-- END OF CONTENT SPECIFIC XSLS -->   <!-- START OF GENERIC XSLS -->
   <xsl:template match="docinfo">
      <xsl:element name="{name()}">
         <xsl:choose>
            <xsl:when test="$selectorID='dictionary'">
               <docinfo:dpsi id-string="0KMN"/>
            </xsl:when>
            <xsl:when test="$selectorID='cases' and $docinfo.selector=('LawReport','PracticeDirection')">
               <docinfo:dpsi id-string="000D"/>
            </xsl:when>
            <xsl:when test="$selectorID='cases' and $docinfo.selector='Transcript'">
               <docinfo:dpsi id-string="02ED"/>
            </xsl:when>
         </xsl:choose>
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
            <xsl:when test="self::docinfo:selector and $docinfo.selector = 'PracticeDirection'">
               <xsl:variable name="docinfo_selector" select="//docinfo:selector"/>
               <xsl:value-of select="concat('Case', $docinfo_selector)"/>
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

   <xsl:template match="docinfo:custom-metafields[$selectorID = 'dictionary'] | docinfo:custom-metafields/child::*[$selectorID = 'dictionary'] | docinfo:assoc-links | docinfo:normcite"/>

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
                     <xsl:value-of select="translate(replace(parent::docinfo:custom-metafields/docinfo:custom-metafield[@searchtype = 'JURIS-CLASSIFY'], ' and ','&amp;'),' ','')"/>
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
                     <!--<xsl:apply-templates select="node()"/>-->
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:element>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="docinfo:custom-metafield[$selectorID = 'cases'][./@name = ('court', 'juris', 'date', 'sh-version', 'rx-version', 'sg-version', 'ng-version', 'filterType', 'resultType')]"
                 priority="20"/>

   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:variable name="RosettaNamespaces" as="element()">
      <RosettaNamepaces>
         <RosettaNamespace>xmlns:docinfo="http://www.lexis-nexis.com/glp/docinfo"</RosettaNamespace>
         <RosettaNamespace>xmlns:comm="http://www.lexis-nexis.com/glp/comm"</RosettaNamespace>
         <RosettaNamespace>xmlns:dict="http://www.lexis-nexis.com/glp/dict"</RosettaNamespace>
         <RosettaNamespace>xmlns:leg="http://www.lexis-nexis.com/glp/leg"</RosettaNamespace>
         <RosettaNamespace>xmlns:ci="http://www.lexis-nexis.com/ci"</RosettaNamespace>
         <RosettaNamespace>xmlns:case="http://www.lexis-nexis.com/glp/case"</RosettaNamespace>
         <RosettaNamesoace>xmlns:glp="http://www.lexis-nexis.com/glp"</RosettaNamesoace>
      </RosettaNamepaces>
   </xsl:variable>
   <xsl:template match="comment() | processing-instruction()">
      <xsl:copy-of select="."/>
   </xsl:template>
   <xsl:variable name="quot">'</xsl:variable>
   <xsl:variable name="openquote">‘</xsl:variable>
   <xsl:variable name="closequote">’</xsl:variable>
   <xsl:template match="text()" name="replace" priority="20">
      <xsl:param name="text" select="."/>
      <xsl:param name="usequote" select="$openquote"/>
      <xsl:choose>
         <xsl:when test="contains($text,$quot)">
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
         </xsl:when>
         <xsl:when test="matches($text,'\([0-9]{4}\)\s[0-9]+\s[A-Z]+\s[0-9]+[,\s]*$') and self::text()/not(ancestor::ci:cite)">
            <xsl:analyze-string select="$text"
                                regex="([\(][0-9]{{4}}[\)])\s([0-9]+)\s([A-Z]+)\s([0-9]+)([,\s]*)">
               <xsl:matching-substring>
                  <ci:cite searchtype="CASE-REF">
                     <ci:case>
                        <ci:caseref>
                           <ci:reporter value="{regex-group(3)}"/>
                           <ci:volume num="{regex-group(2)}"/>
                           <ci:edition>
                              <ci:date year="{translate(regex-group(1),'()','')}"/>
                           </ci:edition>
                           <ci:page num="{regex-group(4)}"/>
                        </ci:caseref>
                     </ci:case>
                     <ci:content>
                        <xsl:value-of select="concat(regex-group(1),' ',regex-group(2),' ',regex-group(3),' ',regex-group(4))"/>
                     </ci:content>
                  </ci:cite>
                  <xsl:value-of select="regex-group(5)"/>
               </xsl:matching-substring>
            </xsl:analyze-string>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="translate($text,' ','')"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- The below templates should be uncommented while unit-testing -->   <!-- Start: For unit-testing -->   <!--<xsl:template match="node()">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="@*">
        <xsl:copy/>
    </xsl:template>-->   <!-- End: For unit-testing -->   <xsl:variable name="document-uri" select="document-uri(.)"/>
   <xsl:variable name="filename"
                 select="substring-before(tokenize($document-uri, '/')[last()], '.')"/>
   <xsl:template name="outputErrorMessage">
      <xsl:param name="messageText" as="xs:string*" select="'Error!'"/>
      <xsl:message>
         <xsl:value-of select="$messageText"/>
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
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>
   <!-- Uncomment the below xsl:param while unit testing -->   <!-- Start: For unit-testing -->   <!--<xsl:param name="selectorID" select="'dictionary'"/>-->   <!-- End: For unit-testing -->
   <xsl:template match="title[parent::heading/parent::dict:body][not(child::*[name()!='emph'])][$selectorID='dictionary']">
      <xsl:element name="desig">
         <xsl:attribute name="value">
            <xsl:value-of select="self::title//text()"/>
         </xsl:attribute>
         <xsl:element name="designum">
            <xsl:apply-templates select="@* | node()"/>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <!-- Uncomment the below xsl:param while unit testing -->   <!-- Start: For unit-testing -->   <!--<xsl:param name="selectorID" select="'dictionary'"/>-->   <!-- End: For unit-testing -->
   <xsl:template match="refpt">
      <xsl:element name="{name()}">
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

   <xsl:template name="fn_refpt">
      <xsl:param name="id"/>
      <xsl:analyze-string select="$id" regex="(0KMN_[0-9]+_[A-Z]+_)([\w_]+)(:HTDICT-TERM)">
         <xsl:matching-substring>
            <xsl:value-of select="concat('acronym:WPLD::term:', regex-group(2))"/>
         </xsl:matching-substring>
      </xsl:analyze-string>
   </xsl:template>
   <!-- Uncomment the below xsl:param while unit testing -->   <!-- Start: For unit-testing -->   <!--<xsl:include href="../nonamespace/emph.xsl"/>-->   <!-- End: For unit-testing -->
   <xsl:template match="pgrp[$selectorID='cases']">
      <xsl:apply-templates select="@* | node()"/>
   </xsl:template>

   <xsl:template match="p"><!--<xsl:message select="$docinfo.selector"></xsl:message>-->
      <xsl:choose>
         <xsl:when test="self::p/child::text/not(child::node())[$selectorID='cases' and $docinfo.selector='PracticeDirection' ]"/>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- Uncomment the below xsl:param while unit testing -->   <!-- Start: For unit-testing -->   <!--<xsl:include href="default.xsl"/>
    <xsl:param name="selectorID" select="'dictionary'"/>-->   <!-- End: For unit-testing -->
   <xsl:template match="text" name="text">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@*"/>
         <xsl:choose>
            <xsl:when test="ancestor::li/child::*[1][name()!='blockquote']">
               <xsl:choose>
                  <xsl:when test="self::text/node()[1]/name()='' and self::text/node()[1]!='('">
                     <xsl:analyze-string select="self::text/text()[1]" regex="^(\([a-zA-Z0-9]+\)|●|●|•)([\t ]*)">
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
                     <xsl:analyze-string select="self::text/node()[3]" regex="(\)[\s| ]+)">
                        <xsl:non-matching-substring>
                           <xsl:call-template name="replace">
                              <xsl:with-param name="text" select="."/>
                           </xsl:call-template>
                        </xsl:non-matching-substring>
                     </xsl:analyze-string>
                  </xsl:when>
                  <xsl:when test="self::text/node()[1]/name()=''">
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
            <xsl:otherwise>
               <xsl:apply-templates/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:element>
   </xsl:template>
   <!-- Uncomment the below xsl:param while unit testing -->   <!-- Start: For unit-testing -->   <!-- <xsl:param name="selectorID" select="'dictionary'"/>
    <xsl:include href="../nonamespace/default.xsl"/>-->   <!-- End: For unit-testing -->
   <xsl:template match="emph[ancestor::defterm] | emph[parent::h] | emph[parent::dict:topicname] | emph[parent::remotelink/parent::url] [$selectorID='dictionary']"
                 priority="20">
      <xsl:apply-templates select="node()"/>
   </xsl:template>

   <xsl:template match="emph[child::remotelink][$selectorID='dictionary']" priority="20">
      <xsl:apply-templates select="node()"/>
   </xsl:template>

   <xsl:template match="emph[ancestor::defterm | child::remotelink | emph[parent::h] | emph[parent::dict:topicname]]/@* [$selectorID='dictionary']"
                 priority="20"/>

   <xsl:template match="emph[ancestor::heading/parent::dict:body][$selectorID='dictionary']">
      <xsl:apply-templates/>
   </xsl:template>
   <!-- <xsl:template match="emph[self::emph/following-sibling::ci:cite][ancestor::case:priorhist | ancestor::case:consideredcases] [$selectorID='cases']">
        <xsl:apply-templates/>
    </xsl:template>
    -->
   <xsl:template match="emph">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="emph/@*">
      <xsl:copy/>
   </xsl:template>
   <!-- Uncomment the below xsl:param while unit testing -->   <!-- Start: For unit-testing -->   <!-- <xsl:include href="../nonamespace/refpt.xsl"/>
    <xsl:param name="selectorID" select="'dictionary'"/>-->   <!-- End: For unit-testing -->
   <xsl:template match="remotelink">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@*"/>
         <xsl:attribute name="status" select="'valid'"/>
         <xsl:apply-templates select="node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="remotelink/@*[name()!='refpt']">
      <xsl:copy/>
   </xsl:template>

   <xsl:template match="remotelink/@refpt [$selectorID='dictionary']">
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

   <xsl:template match="remotelink[parent::url][$selectorID='dictionary']">
      <xsl:apply-templates/>
   </xsl:template>
   <!-- Uncomment the below xsl:param while unit testing -->   <!-- Start: For unit-testing -->   <!-- <xsl:include href="../nonamespace/refpt.xsl"/>
    <xsl:param name="selectorID" select="'dictionary'"/>-->   <!-- End: For unit-testing -->
   <xsl:template match="ci:*">
      <xsl:choose>
         <xsl:when test="self::ci:cite[matches(child::ci:content,'^–[0-9]+')][$selectorID='dictionary'] or self::ci:cite/ancestor::glp:note/preceding-sibling::*[1][name()='case:disposition'][$selectorID='cases' and $docinfo.selector='Transcript']">
            <xsl:value-of select="self::ci:cite//child::ci:content/node()"/>
         </xsl:when>
         <xsl:when test="self::ci:case[ancestor::case:parallelcite][$selectorID='cases' and $docinfo.selector='Transcript']"/>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@*"/>
               <xsl:if test="self::ci:cite[@searchtype = 'LEG-REF' or @searchtype = 'EU-REF']">
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
               <xsl:value-of select="concat(upper-case(substring(self::ci:sesslaw//ci:hierpinpoint[1]/ci:hierlev[1]/@label,1,4)),' ',self::ci:sesslaw//ci:hierpinpoint[1]/ci:hierlev[1]/@num)"/>
            </xsl:when>
            <xsl:when test="ancestor::ci:cite/following-sibling::node()[1]/name()='' and matches(ancestor::ci:cite/following-sibling::text()[1],'^[\s]*s')">
               <xsl:analyze-string select="ancestor::ci:cite/following-sibling::text()[1]"
                                   regex="^[\s]*s[\W]{{1}}([0-9]+)">
                  <xsl:matching-substring>
                     <xsl:value-of select="concat('SECT ',regex-group(1))"/>
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
               <xsl:value-of select="concat(upper-case(substring(ancestor::ci:sesslaw//ci:hierpinpoint[1]/ci:hierlev[1]/@label,1,4)),' ',ancestor::ci:sesslaw//ci:hierpinpoint[1]/ci:hierlev[1]/@num)"/>
            </xsl:when>
            <xsl:when test="ancestor::ci:cite/following-sibling::node()[1]/name()='' and matches(ancestor::ci:cite/following-sibling::text()[1],'^[\s]*s')">
               <xsl:analyze-string select="ancestor::ci:cite/following-sibling::text()[1]"
                                   regex="^[\s]*s[\W]{{1}}([0-9]+)">
                  <xsl:matching-substring>
                     <xsl:value-of select="concat('SECT ',regex-group(1))"/>
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
                  <xsl:when test="$ci_section_content!=''">
                     <xsl:value-of select="(regex-group(1),regex-group(2))" separator=" "/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="(regex-group(1),regex-group(2), (if (regex-group(4)) then regex-group(4) else ()))"
                                   separator=" "/>
                  </xsl:otherwise>
               </xsl:choose>
               <!--<xsl:value-of select="(regex-group(1),regex-group(2), (if (regex-group(4)) then regex-group(4) else ()))" separator=" "/>-->
               <!--<xsl:value-of select="(regex-group(1),regex-group(2))" separator=" "/>-->
            </xsl:matching-substring>
         </xsl:analyze-string>
      </xsl:variable>
      <xsl:value-of select="$test"/>
   </xsl:template>

   <xsl:template match="ci:sesslaw[parent::ci:cite/@searchtype = 'LEG-REF' or parent::ci:cite/@searchtype = 'EU-REF']"/>

   <xsl:template match="ci:*/@*">
      <xsl:choose>
         <xsl:when test="parent::ci:cite/@searchtype = 'EU-REF'">
            <xsl:attribute name="searchtype" select="'LEG-REF'"/>
         </xsl:when>
         <xsl:when test="parent::ci:cite/parent::case:parallelcite and $selectorID='dictionary'">
            <xsl:attribute name="searchtype" select="'CASE-REF'"/>
         </xsl:when>
         <xsl:when test="parent::ci:cite/parent::case:parallelcite and $selectorID='cases' and $docinfo.selector=('LawReport','PracticeDirection')">
            <xsl:attribute name="searchtype" select="'CASE-REF'"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:copy/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="ci:cite[@searchtype = 'CASE-REF']/@status" priority="20"/>

   <xsl:template match="citefragment">
      <xsl:choose>
         <xsl:when test="ancestor::case:parallelcite and $selectorID='dictionary'">
            <xsl:apply-templates/>
         </xsl:when>
         <xsl:when test="ancestor::case:parallelcite and $selectorID='cases' and $docinfo.selector=('LawReport','PracticeDirection')">
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
   <!-- Uncomment the below xsl:param while unit testing -->   <!-- Start: For unit-testing -->   <!--<xsl:include href="../nonamespace/emph.xsl"/>-->   <!-- End: For unit-testing -->
   <xsl:template match="h">
      <xsl:choose>
         <xsl:when test="self::h[preceding-sibling::*[1][name() = 'h']] and $selectorID = 'cases'">
            <p>
               <text>
                  <xsl:apply-templates select="self::h//text()"/>
               </text>
            </p>
         </xsl:when>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- Uncomment the below xsl:param while unit testing -->   <!-- Start: For unit-testing -->   <!--<xsl:param name="selectorID" select="'dictionary'"/>
    <xsl:include href="../nonamespace/blockquote.xsl"/>
    <xsl:include href="../nonamespace/p.xsl"/>
    <xsl:include href="../nonamespace/text.xsl"/>
    <xsl:include href="../nonamespace/emph.xsl"/>
    <xsl:include href="../nonamespace/default.xsl"/>-->   <!-- End: For unit-testing -->
   <xsl:template match="l | li">
      <xsl:choose>
         <xsl:when test="self::l/child::li/child::blockquote/*[1][name()!='l'] and $selectorID='dictionary'">
            <p>
               <xsl:apply-templates select="@* | node()"/>
            </p>
         </xsl:when>
         <xsl:when test="self::l/li/blockquote/*[1][name()='l'] and $selectorID='dictionary'">
            <xsl:apply-templates select="@* | node()"/>
         </xsl:when>
         <xsl:when test="self::li//child::blockquote and $selectorID='dictionary'">
            <xsl:apply-templates select="node()"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@* | node()"/>
               <!-- If the following sibling li has only lilabel and l as child elements and lilabel is empty, then move then suppress the following sibling li and 
                    move the content l here into this li.-->
               <!--<xsl:if test="self::li/following-sibling::li[1]/not(child::*[not(name()=('l')) and not(name()=('lilabel'))]) and self::li/following-sibling::li[1]/child::lilabel=' '">
                        <xsl:apply-templates select="self::li/following-sibling::li" mode="child-li"/>
                    </xsl:if>-->
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!--<xsl:template match="li[not(child::*[not(name()=('l')) and not(name()=('lilabel'))])]"/>
    
    <xsl:template match="li" mode="child-li">          
            <xsl:apply-templates select="@* | node()"/>
    </xsl:template>
    -->
   <xsl:template match="lilabel">
      <xsl:element name="{name()}">
         <xsl:choose>
            <xsl:when test="following-sibling::p">
               <xsl:choose>
                  <xsl:when test="following-sibling::p/text/node()[1]/name()='' and following-sibling::p/text/node()[1]!='('">
                     <xsl:analyze-string select="following-sibling::p/text/text()[1]"
                                         regex="^(\([a-zA-Z0-9]+\)|●|•)([\t ]*)">
                        <xsl:matching-substring>
                           <xsl:value-of select="regex-group(1)"/>
                        </xsl:matching-substring>
                     </xsl:analyze-string>
                  </xsl:when>
                  <xsl:when test="following-sibling::p/text/node()[1]/name()='' and following-sibling::p/text/node()[1]='(' and following-sibling::p/text/node()[2]/name()='emph' and following-sibling::p/text/node()[3]/matches(.,'[a-zA-Z0-9]{1,}') and following-sibling::p/text/node()[3]/starts-with(.,')')">
                     <xsl:value-of select="concat(following-sibling::p/text/node()[1],following-sibling::p/text/node()[2]/node(),')')"/>
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
   <!-- Uncomment the below xsl:param while unit testing -->   <!-- Start: For unit-testing -->   <!--<xsl:param name="selectorID" select="'dictionary'"/>
    <xsl:include href="../nonamespace/l-li.xsl"/>
    <xsl:include href="../nonamespace/p.xsl"/>
    <xsl:include href="../nonamespace/text.xsl"/>
    <xsl:include href="../nonamespace/default.xsl"/>-->
   <xsl:template match="blockquote">
      <xsl:choose>
         <xsl:when test="self::blockquote/child::*[1][name()='l'] and $selectorID = 'dictionary'">
            <xsl:apply-templates select="@* | node()"/>
         </xsl:when>
         <xsl:when test="self::blockquote[ancestor::case:appendix]/p/text/matches(text()[1],'^\(([a-z]+|[ivx]+)\)')[$selectorID = 'cases']">
            <xsl:apply-templates/>
         </xsl:when>
         <xsl:when test="self::blockquote[child::table][$selectorID='cases'][$docinfo.selector = ('Transcript')]">
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@* | node() except(table)"/>
            </xsl:element>
            <xsl:apply-templates select="table"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="sup">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="//case:content//text[ancestor::footnote]/sup" mode="fnrtoken">
      <xsl:value-of select="generate-id()"/>
   </xsl:template>

   <xsl:template match="sup[not(ancestor::fnbody)][$selectorID='cases']"><!-- Please include 'common/nonamespace/footnotegrp.xsl' in driver file as the named template fntoken and fnrtoken are fetched from there. -->
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
            <fnr fntoken="{$fntoken}" fnrtoken="{$fnrtoken}">
               <xsl:apply-templates/>
            </fnr>
         </xsl:when>
         <xsl:otherwise>
            <sup>
               <xsl:apply-templates/>
            </sup>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="sub">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="table | tbody">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="table/@*[not(name()='frame')] | row/@*"/>

   <xsl:template match="table/@frame">
      <xsl:choose>
         <xsl:when test="$selectorID='dictionary'"/>
         <xsl:otherwise>
            <xsl:attribute name="frame" select="'all'"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="tgroup"><!--<xsl:variable name="cols">
            <xsl:for-each-group select="self::tgroup//row" group-by="entry">
                <xsl:value-of select="count(current-group()/entry/node())"/>
                <xsl:text>,</xsl:text>
            </xsl:for-each-group>
        </xsl:variable>--><!-- To find which entries has content. Because colspec is created for the active entries only. And the empty entries are suppressed in LA output file.-->
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
      <xsl:variable name="Maxcols"><!--<xsl:value-of select="max(tokenize(substring-after($cols, ','), ','))"/>--><!-- A empty space is created as the last content of $distinct_entries because of this we are getting the actual count + 1. so we are reducing the count by 1  -->
         <xsl:value-of select="count(tokenize($distinct_entries, ' ')) - 1"/>
      </xsl:variable>
      <xsl:element name="{name()}">
         <xsl:attribute name="cols">
            <xsl:value-of select="$Maxcols"/>
         </xsl:attribute>
         <xsl:attribute name="colsep" select="1"/>
         <xsl:attribute name="rowsep" select="1"/>
         <!-- To create colspec element based on the cols count -->
         <xsl:variable name="colspec_type">
            <xsl:choose>
               <xsl:when test="substring(child::colspec[1]/@colwidth,string-length(child::colspec[1]/@colwidth),1)='*'">
                  <xsl:value-of select="'*'"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="'in'"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <!-- In input, the colspec/@colwidth is in inches, to convert this into pixel, multiply the value with 1440 and append * in the end  -->
         <xsl:variable name="colspec">
            <xsl:choose>
               <xsl:when test="$selectorID='dictionary'">
                  <xsl:for-each select="self::tgroup/colspec">
                     <xsl:if test="position() &lt;= $Maxcols">
                        <xsl:variable name="count" select="position()" as="xs:integer"/>
                        <!-- To calculate pixel value - Strip the 'in' in the end of colspec/@colwidth value and multiply it by 1440 and append * in the end -->
                        <xsl:value-of select="concat(number(replace(parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth, 'in', '')) * 1440, '*')"/>
                        <xsl:text>,</xsl:text>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="self::tgroup/colspec">
                     <xsl:if test="position() &lt;= $Maxcols">
                        <xsl:variable name="count" select="position()" as="xs:integer"/>
                        <!-- To calculate pixel value - Strip the 'in' in the end of colspec/@colwidth value and multiply it by 1440 and append * in the end -->
                        <xsl:choose>
                           <xsl:when test="$colspec_type='*'">
                              <xsl:value-of select="parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth"/>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:value-of select="concat(number(replace(parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth, 'in', '')) * 1440, '*')"/>
                           </xsl:otherwise>
                        </xsl:choose>
                        <xsl:text>,</xsl:text>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <!-- To create colspec element based on the cols count -->
         <xsl:for-each select="1 to $Maxcols">
            <colspec colname="{current()}" colwidth="{tokenize($colspec,',')[current()]}"/>
         </xsl:for-each>
         <!-- To create thead -->
         <xsl:for-each-group select="self::tgroup//row" group-adjacent="self::row">
            <xsl:for-each select="current-group()">
               <xsl:if test="current-group()/entry/text() = 'TABLE'">
                  <thead>
                     <xsl:apply-templates select="." mode="thead"/>
                  </thead>
               </xsl:if>
            </xsl:for-each>
         </xsl:for-each-group>
         <xsl:apply-templates select="node()"/>
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
      <xsl:variable name="Maxcols"><!--<xsl:value-of select="max(tokenize(substring-after($cols, ','), ','))"/>--><!-- A empty space is created as the last content of $distinct_entries because of this we are getting the actual count + 1. so we are reducing the count by 1  -->
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
                        <entry>
                           <xsl:if test="$selectorID='dictionary' or $docinfo.selector='Transcripts'">
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
               <xsl:if test="$selectorID = 'dictionary' or $docinfo.selector='Transcripts'">
                  <xsl:attribute name="colsep" select="'0'"/>
                  <xsl:attribute name="rowsep" select="'0'"/>
               </xsl:if>
               <xsl:apply-templates select="node()"/>
            </xsl:element>
         </xsl:when>
      </xsl:choose>
   </xsl:template>
   <!-- Uncomment the below xsl:param while unit testing -->   <!-- Start: For unit-testing -->   <!--<xsl:include href="../nonamespace/remotelink.xsl"/>
        <xsl:include href="../nonamespace/emph.xsl"/>-->
   <xsl:template match="url">
      <xsl:apply-templates select="@* | node()"/>
   </xsl:template>

   <xsl:template match="inlineobject">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="inlineobject/@*">
      <xsl:copy/>
   </xsl:template>
   <!--<xsl:template match="inlineobject/@filename">
        <xsl:attribute name="filename" select="'TBD'"/>
    </xsl:template>-->
   <xsl:template match="nl">
      <xsl:apply-templates select="@* | node()"/>
   </xsl:template>
   <!-- Uncomment the below xsl:param while unit testing -->   <!-- Start: For unit-testing -->   <!--<xsl:include href="../nonamespace/emph.xsl"/>-->   <!-- End: For unit-testing -->
   <xsl:template match="page[$selectorID = 'cases']">
      <xsl:element name="{name()}">
         <xsl:attribute name="text" select="normalize-space(./@text)"/>
         <xsl:attribute name="reporter" select="./@reporter"/>
         <xsl:attribute name="count" select="./@count"/>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="page/@*"/>

   <xsl:template match="footnotegrp">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
      <xsl:apply-templates select="self::footnotegrp//fnbody/page"/>
   </xsl:template>

   <xsl:template match="footnote | fnbody">
      <xsl:apply-templates/>
   </xsl:template>

   <xsl:template name="fntoken">
      <xsl:param name="fnlabel_footnote"/>
      <xsl:apply-templates select="//sup[self::sup/text()=$fnlabel_footnote][ancestor::fnbody]"
                           mode="footnote"/>
   </xsl:template>

   <xsl:template name="fnrtoken">
      <xsl:param name="fnlabel_footnote"/>
      <xsl:apply-templates select="//sup[self::sup/text()=$fnlabel_footnote][not(ancestor::fnbody)]"
                           mode="footnote"/>
   </xsl:template>

   <xsl:template match="//sup" mode="footnote">
      <xsl:value-of select="generate-id()"/>
   </xsl:template>

   <xsl:template match="p[parent::fnbody]">
      <footnote type="editorial">
         <xsl:attribute name="fntoken">
            <xsl:call-template name="fntoken">
               <xsl:with-param name="fnlabel_footnote" select="self::p/text/sup/text()"/>
            </xsl:call-template>
         </xsl:attribute>
         <xsl:attribute name="fnrtoken">
            <xsl:call-template name="fnrtoken">
               <xsl:with-param name="fnlabel_footnote" select="self::p/text/sup/text()"/>
            </xsl:call-template>
         </xsl:attribute>
         <xsl:if test="self::p/text/*[1][name() = 'sup']">
            <fnlabel>
               <xsl:apply-templates select="self::p/text/sup/node()"/>
            </fnlabel>
         </xsl:if>
         <fnbody>
            <p>
               <xsl:apply-templates/>
            </p>
         </fnbody>
      </footnote>
   </xsl:template>

   <xsl:template match="text[parent::p/parent::fnbody]">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="node() except (sup, page)"/>
      </xsl:element>
   </xsl:template>
   <!-- Uncomment the below xsl:param while unit testing -->   <!-- Start: For unit-testing -->   <!--<xsl:include href="../nonamespace/emph.xsl"/>-->   <!-- End: For unit-testing -->
   <xsl:template match="person[$selectorID = 'cases']">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="name.text[parent::person][$selectorID = 'cases']">
      <xsl:element name="{name()}">
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>
   <!--<xsl:template match="name.text[parent::person][$selectorID = 'cases']">
        <xsl:element name="{name()}">
            <xsl:choose>
                <xsl:when test="emph[parent::name.text][$selectorID = 'cases']">
                    <xsl:analyze-string select="." regex="\s*(([A-Z]\w*\-*\.*\s*'*)+)">
                        <xsl:matching-substring>
                            <emph typestyle="it">
                                <xsl:value-of select="regex-group(1)"/>
                            </emph>
                        </xsl:matching-substring>
                        <xsl:non-matching-substring>
                            <xsl:value-of select="."/>
                        </xsl:non-matching-substring>
                    </xsl:analyze-string>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:element name="{name()}">
                        <xsl:apply-templates select="@* | node()"/>
                    </xsl:element>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>-->   <!-- END OF GENERIC XSLS --></xsl:stylesheet>

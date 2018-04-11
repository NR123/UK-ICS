<?xml version="1.0" encoding="UTF-8"?>
<!--  ***This XSLT conversion file is a stand-alone, generated release created from a module based source code.  Any changes to this conversion must be propagated to its original source. ***
This file is not intended to be edited directly, except in a time critical situation such as a  "sev1" webstar.
Please contact Content Architecture for support and for ensuring the source code is updated as needed and a new stand-alone delivery is released.
Compiled:  2018-04-04T15:56:35.695+05:30-->
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
   <xsl:param name="selectorID" select="'dictionary'"/>
   <xsl:output encoding="UTF-8"
               doctype-public="-//LEXISNEXIS//DTD GLP Casedoc v005//EN"
               doctype-system="dictionarydoc-norm.dtd"
               indent="no"/>
   <!-- START OF CONTENT SPECIFIC XSLS -->
   <!-- Please uncomment the below xsl:include while unit-testing -->
   <!-- START: For unit-testing -->
   <!--<xsl:include href="../COMMON/nonamespace/default.xsl"/>-->
   <!-- END: For unit-testing -->
   <xsl:template match="DICTIONARYDOC">
      <xsl:element name="{name()}">
         <xsl:for-each select="$RosettaNamespaces/*">
            <xsl:sort/>
            <xsl:namespace name="{substring-after(substring-before(., '='), ':')}"
                           select="substring-after(translate(., '&#34;', ''), '=')"/>
         </xsl:for-each>
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="dict:body">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="dict:term-entry">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="defterm[parent::dict:term-entry]">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="dict:definition">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="dict:subtopic | dict:topicname">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>
   <!-- END OF CONTENT SPECIFIC XSLS -->   <!-- START OF GENERIC XSLS -->
   <xsl:template match="docinfo">
      <xsl:element name="{name()}">
         <docinfo:dpsi id-string="000D"/>
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="docinfo/@*"/>

   <xsl:template match="docinfo:doc-heading | docinfo:bookseqnum[$selectorID = 'cases'] | docinfo:doc-lang | docinfo:doc-country | docinfo:hier | docinfo:hierlev | heading[parent::docinfo:hierlev] | title[ancestor::docinfo:hierlev] | docinfo:lbu-meta | docinfo:metaitem | docinfo:selector | docinfo:alt-renditions | docinfo:alt-rendition | link[parent::docinfo:alt-rendition]">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
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

   <xsl:template match="docinfo:custom-metafields[$selectorID='dictionary'] | docinfo:custom-metafields/child::*[$selectorID='dictionary'] | docinfo:assoc-links | docinfo:normcite"/>

   <xsl:template match="docinfo:custom-metafields[$selectorID='cases']">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
         <xsl:copy-of select="child::docinfo:custom-metafield[@name='date']"
                      copy-namespaces="no"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="docinfo:custom-metafield[$selectorID='cases']">
      <xsl:choose>
         <xsl:when test="@name='courtcode'">
            <xsl:copy-of select="." copy-namespaces="no"/>
         </xsl:when>
         <xsl:when test="@name='jurisdiction'">
            <xsl:choose>
               <xsl:when test="self::docinfo:custom-metafield/not(child::node()) and parent::docinfo:custom-metafields/docinfo:custom-metafield[@searchtype='JURIS-CLASSIFY']/not(child::node())">
                  <xsl:element name="{name()}">
                     <xsl:copy-of select="@name" copy-namespaces="no"/>
                     <xsl:value-of select="'EnglandWalesScotlandandNorthernIreland'"/>
                  </xsl:element>
               </xsl:when>
               <xsl:when test="self::docinfo:custom-metafield/not(child::node()) and parent::docinfo:custom-metafields/docinfo:custom-metafield[@searchtype='JURIS-CLASSIFY']/child::node()">
                  <xsl:element name="{name()}">
                     <xsl:copy-of select="@name" copy-namespaces="no"/>
                     <xsl:value-of select="translate(parent::docinfo:custom-metafields/docinfo:custom-metafield[@searchtype='JURIS-CLASSIFY'],', ','')"/>
                  </xsl:element>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:copy-of select="." copy-namespaces="no"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="@searchtype='COURT-CLASSIFY'">
            <xsl:element name="{name()}">
               <xsl:attribute name="name" select="./@searchtype"/>
               <xsl:choose>
                  <xsl:when test="self::docinfo:custom-metafield/not(node())">
                     <xsl:value-of select="'Supreme Court'"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="node()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:element>
         </xsl:when>
         <xsl:when test="@searchtype='JURIS-CLASSIFY'">
            <xsl:element name="{name()}">
               <xsl:attribute name="name" select="./@searchtype"/>
               <xsl:choose>
                  <xsl:when test="self::docinfo:custom-metafield/not(node())">
                     <xsl:value-of select="'England, Wales, Scotland and Northern Ireland'"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="node()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:element>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="docinfo:custom-metafield[$selectorID='cases'][./@name=('court','juris','date','sh-version','rx-version','sg-version','ng-version','filterType','resultType')]"
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

   <xsl:template match="p">
      <xsl:element name="{name()}">
         <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
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
         <xsl:when test="self::ci:cite[matches(child::ci:content,'^–[0-9]+')][$selectorID='dictionary']">
            <xsl:value-of select="self::ci:cite//child::ci:content/node()"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:element name="{name()}">
               <xsl:apply-templates select="@*"/>
               <xsl:if test="self::ci:cite[@searchtype = 'LEG-REF' or @searchtype = 'EU-REF']">
                  <xsl:attribute name="normcite">
                     <xsl:variable name="sesslawnum">
                        <xsl:analyze-string select="self::ci:cite//ci:sesslawnum/@num" regex="([0-9]+_[0-9]+)">
                           <xsl:matching-substring>
                              <xsl:value-of select="regex-group(1)"/>
                           </xsl:matching-substring>
                        </xsl:analyze-string>
                     </xsl:variable>
                     <xsl:value-of select=" normalize-space(upper-case(concat(self::ci:cite//ci:standardname/@normpubcode, ' ', translate($sesslawnum, '_', ' '), ' ', concat(self::ci:cite//ci:hierpinpoint[1]/ci:hierlev[1]/@label, ' ', self::ci:cite//ci:hierpinpoint[1]/ci:hierlev[1]/@num))))"/>
                  </xsl:attribute>
               </xsl:if>
               <xsl:apply-templates select="node()"/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="ci:sesslaw[parent::ci:cite/@searchtype = 'LEG-REF' or parent::ci:cite/@searchtype = 'EU-REF']"/>

   <xsl:template name="fn_normcite">
      <xsl:param name="normcite"/>
      <xsl:variable name="sesslawnum">
         <xsl:analyze-string select="$normcite" regex="([0-9]+_[0-9]+)">
            <xsl:matching-substring>
               <xsl:value-of select="regex-group(1)"/>
            </xsl:matching-substring>
         </xsl:analyze-string>
      </xsl:variable>
      <xsl:value-of select="concat(child::ci:standardname/@normpubcode, ' ', translate($sesslawnum, '_', ' '), ' ', concat(child::ci:hierlev[1]/@label, ' ', child::ci:hierlev[1]/@num))"/>
   </xsl:template>

   <xsl:template match="ci:*/@*">
      <xsl:choose>
         <xsl:when test="parent::ci:cite/@searchtype = 'EU-REF'">
            <xsl:attribute name="searchtype" select="'LEG-REF'"/>
         </xsl:when>
         <xsl:when test="parent::ci:cite/parent::case:parallelcite">
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
         <xsl:when test="ancestor::case:parallelcite">
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

   <xsl:template match="sup[not(ancestor::fnbody)][$selectorID='cases']">
      <fnr fnrtoken="d121142e64" fntoken="d121142e90">
         <xsl:apply-templates/>
      </fnr>
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

   <xsl:template match="table/@* | row/@*"/>

   <xsl:template match="tgroup">
      <xsl:variable name="cols">
         <xsl:for-each-group select="self::tgroup//row" group-by="entry">
            <xsl:value-of select="count(current-group()/entry/node())"/>
            <xsl:text>,</xsl:text>
         </xsl:for-each-group>
      </xsl:variable>
      <!-- To find which entries has content. Because colspec is created for the active entries only. And the empty entries are suppressed in LA output file.-->
      <xsl:variable name="active_entries">
         <xsl:for-each-group select="//row" group-adjacent="self::row">
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
      <xsl:variable name="Maxcols">
         <xsl:value-of select="max(tokenize(substring-after($cols, ','), ','))"/>
      </xsl:variable>
      <xsl:element name="{name()}">
         <xsl:attribute name="cols">
            <xsl:value-of select="$Maxcols"/>
         </xsl:attribute>
         <xsl:attribute name="colsep" select="1"/>
         <xsl:attribute name="rowsep" select="1"/>
         <!-- To create colspec element based on the cols count -->
         <!-- In input, the colspec/@colwidth is in inches, to convert this into pixel, multiply the value with 1440 and append * in the end  -->
         <xsl:variable name="colspec">
            <xsl:for-each select="self::tgroup/colspec">
               <xsl:if test="position() &lt;= $Maxcols">
                  <xsl:variable name="count" select="position()" as="xs:integer"/>
                  <!-- To calculate pixel value - Strip the 'in' in the end of colspec/@colwidth value and multiply it by 1440 and append * in the end -->
                  <xsl:value-of select="concat(number(replace(parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth, 'in', '')) * 1440, '*')"/>
                  <xsl:text>,</xsl:text>
               </xsl:if>
            </xsl:for-each>
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
      <xsl:variable name="cols">
         <xsl:for-each-group select="ancestor::tgroup//row" group-by="entry">
            <xsl:value-of select="count(current-group()/entry/node())"/>
            <xsl:text>,</xsl:text>
         </xsl:for-each-group>
      </xsl:variable>
      <xsl:variable name="Maxcols">
         <xsl:value-of select="max(tokenize(substring-after($cols, ','), ','))"/>
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
               <xsl:variable name="get_cols">
                  <xsl:for-each-group select="ancestor::tgroup//row" group-by="entry">
                     <xsl:value-of select="count(current-group()/entry/node())"/>
                     <xsl:text>,</xsl:text>
                  </xsl:for-each-group>
               </xsl:variable>
               <!-- Strip the first value which is the total entry in entire table and find the max count of entry -->
               <xsl:variable name="count_of_max_entry" as="xs:integer">
                  <xsl:value-of select="max(tokenize(substring-after($get_cols, ','), ','))"/>
               </xsl:variable>
               <!-- Calculate count of empty entries to be created to tally the cols count (This is to ensure proper alignment of all the rows inside table) -->
               <xsl:variable name="diff_count"
                             as="xs:integer"
                             select="$count_of_max_entry - $count_of_valid_entry"/>
               <xsl:choose>
                  <xsl:when test="$diff_count &gt; 0">
                     <xsl:for-each select="1 to $diff_count">
                        <entry colsep="0" rowsep="0"/>
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
               <xsl:attribute name="colsep" select="'0'"/>
               <xsl:attribute name="rowsep" select="'0'"/>
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
   <!-- END OF GENERIC XSLS --></xsl:stylesheet>

<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:test="http://www.jenitennison.com/xslt/unit-test"
                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                xmlns:__x="http://www.w3.org/1999/XSL/TransformAliasAlias"
                xmlns:pkg="http://expath.org/ns/pkg"
                xmlns:impl="urn:x-xspec:compile:xslt:impl"
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
                version="2.0"
                exclude-result-prefixes="pkg impl">
   <xsl:import href="file:/C:/UK-ICS/DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl"/>
   <xsl:import href="file:/C:/Program%20Files%20(x86)/Jenkins/workspace/UK_ICS/src/compiler/generate-tests-utils.xsl"/>
   <xsl:namespace-alias stylesheet-prefix="__x" result-prefix="xsl"/>
   <xsl:variable name="x:stylesheet-uri"
                 as="xs:string"
                 select="'file:/C:/UK-ICS/DRIVER/LL-CASES-LAWREPORT-to-LA-CASES-LAWREPORT.xsl'"/>
   <xsl:output name="x:report" method="xml" indent="yes"/>
   <xsl:template name="x:main">
      <xsl:message>
         <xsl:text>Testing with </xsl:text>
         <xsl:value-of select="system-property('xsl:product-name')"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="system-property('xsl:product-version')"/>
      </xsl:message>
      <xsl:result-document format="x:report">
         <xsl:processing-instruction name="xml-stylesheet">type="text/xsl" href="file:/C:/Program%20Files%20(x86)/Jenkins/workspace/UK_ICS/src/compiler/format-xspec-report.xsl"</xsl:processing-instruction>
         <x:report stylesheet="{$x:stylesheet-uri}" date="{current-dateTime()}">
            <xsl:call-template name="x:d5e2"/>
            <xsl:call-template name="x:d5e7"/>
            <xsl:call-template name="x:d5e129"/>
            <xsl:call-template name="x:d5e211"/>
            <xsl:call-template name="x:d5e256"/>
            <xsl:call-template name="x:d5e296"/>
            <xsl:call-template name="x:d5e448"/>
            <xsl:call-template name="x:d5e486"/>
            <xsl:call-template name="x:d5e531"/>
            <xsl:call-template name="x:d5e562"/>
            <xsl:call-template name="x:d5e659"/>
            <xsl:call-template name="x:d5e962"/>
         </x:report>
      </xsl:result-document>
   </xsl:template>
   <xsl:template name="x:d5e2">
      <xsl:message>Creating root element DICTIONARYDOC</xsl:message>
      <x:scenario>
         <x:label>Creating root element DICTIONARYDOC</x:label>
         <x:context>
            <CASEDOC xmlns:jrnl="http://www.lexis-nexis.com/glp/jrnl" type="fulltext"/>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc" as="document-node()">
               <xsl:document>
                  <CASEDOC xmlns:jrnl="http://www.lexis-nexis.com/glp/jrnl" type="fulltext"/>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:context" select="$impl:context-doc/node()"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e5">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e5">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>Change namespaces and create DICTIONARYDOC in output</xsl:message>
      <xsl:variable name="impl:with-context"
                    select="                          exists($x:result) and empty($x:result[2])"/>
      <xsl:variable name="impl:context" as="item()?">
         <xsl:choose>
            <xsl:when test="$impl:with-context">
               <xsl:sequence select="$x:result"/>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <CASEDOC type="fulltext"/>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="                    test:deep-equal(                      $impl:expected,                      if ( $impl:with-context ) then $impl:context else $x:result,                      2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{ $impl:successful }">
         <x:label>Change namespaces and create DICTIONARYDOC in output</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e7">
      <xsl:message>Scenario for testing docinfo and its child elements</xsl:message>
      <x:scenario>
         <x:label>Scenario for testing docinfo and its child elements</x:label>
         <x:context>
            <docinfo partitionnum="CASE1" browseprev="true" browsenext="true">
               <docinfo:doc-heading>
                  <xsl:text>Financial Conduct Authority v Capital Alternatives Ltd and others - [2014] 3 All ER 780</xsl:text>
               </docinfo:doc-heading>
               <docinfo:doc-id>
                  <xsl:text>323031345F335F416C6C5F45525F30373830</xsl:text>
               </docinfo:doc-id>
               <docinfo:assoc-links>
                  <remotelink alttext="Related Cases"
                              cmd="f:exp"
                              remotekey1="CASE-REF([2014] 3 All ER 780)"
                              remotekey2="All Subscribed Cases Sources"
                              service="QUERY">
                     <xsl:text>Find Related Cases</xsl:text>
                  </remotelink>
                  <remotelink alttext="Related Journals"
                              cmd="f:exp"
                              remotekey1="CASE-REF([2014] 3 All ER 780)"
                              remotekey2="All Subscribed Journals Sources"
                              service="QUERY">
                     <xsl:text>Find Related Journals</xsl:text>
                  </remotelink>
                  <remotelink alttext="Related Commentary"
                              cmd="f:exp"
                              remotekey1="CASE-REF([2014] 3 All ER 780)"
                              remotekey2="All Subscribed Commentary Sources"
                              service="QUERY">
                     <xsl:text>Find Related Commentary</xsl:text>
                  </remotelink>
                  <remotelink alttext="Find Related All England Transcripts"
                              cmd="f:exp"
                              remotekey1="NORMCITE(TRAN_14D03Mar)"
                              remotekey2="All Subscribed Cases Sources"
                              service="QUERY">
                     <xsl:text>Find AllER Transcripts</xsl:text>
                  </remotelink>
                  <remotelink alttext="Find Related All England Digests"
                              cmd="f:exp"
                              remotekey1="NORMCITE(DIG_14D03Mar)"
                              remotekey2="All Subscribed Cases Sources"
                              service="QUERY">
                     <xsl:text>Find AllER Digests</xsl:text>
                  </remotelink>
               </docinfo:assoc-links>
               <docinfo:doc-lang lang="en"/>
               <docinfo:doc-country iso-cc="GB"/>
               <docinfo:hier>
                  <docinfo:hierlev role="ancestor">
                     <heading>
                        <title>
                           <xsl:text>2014</xsl:text>
                        </title>
                     </heading>
                     <docinfo:hierlev role="ancestor">
                        <heading>
                           <title>
                              <xsl:text>Volume 3 </xsl:text>
                           </title>
                        </heading>
                        <docinfo:hierlev role="me">
                           <heading>
                              <title>
                                 <xsl:text>Financial Conduct Authority v Capital Alternatives Ltd and others - [2014] 3 All ER 780</xsl:text>
                              </title>
                           </heading>
                        </docinfo:hierlev>
                     </docinfo:hierlev>
                  </docinfo:hierlev>
               </docinfo:hier>
               <docinfo:bookseqnum>
                  <xsl:text>2182873868</xsl:text>
               </docinfo:bookseqnum>
               <docinfo:lbu-meta>
                  <docinfo:metaitem name="lbu-sourcename" value="All England Law Reports"/>
               </docinfo:lbu-meta>
               <docinfo:selector>
                  <xsl:text>LawReport</xsl:text>
               </docinfo:selector>
               <docinfo:alt-renditions>
                  <docinfo:alt-rendition key="fulltext">
                     <link type="pdf"
                           filename="2014_3_All_ER_0780.pdf"
                           alttext="Click Here To View PDF">
                        <xsl:text>2014_3_All_ER_0780</xsl:text>
                     </link>
                  </docinfo:alt-rendition>
               </docinfo:alt-renditions>
               <docinfo:normcite>
                  <ci:cite>
                     <ci:content>
                        <xsl:text>[2014] 3 All ER 780</xsl:text>
                     </ci:content>
                  </ci:cite>
                  <ci:cite>
                     <ci:content>
                        <xsl:text>ALLER_14D03Mar</xsl:text>
                     </ci:content>
                  </ci:cite>
               </docinfo:normcite>
               <docinfo:custom-metafields>
                  <docinfo:custom-metafield name="court">
                     <xsl:text>120</xsl:text>
                  </docinfo:custom-metafield>
                  <docinfo:custom-metafield name="courtcode">
                     <xsl:text>ChD</xsl:text>
                  </docinfo:custom-metafield>
                  <docinfo:custom-metafield name="date">
                     <xsl:text>20140214</xsl:text>
                  </docinfo:custom-metafield>
                  <docinfo:custom-metafield name="juris">
                     <xsl:text>10</xsl:text>
                  </docinfo:custom-metafield>
                  <docinfo:custom-metafield name="jurisdiction">
                     <xsl:text>England&amp;Wales</xsl:text>
                  </docinfo:custom-metafield>
                  <docinfo:custom-metafield name="sh-version">
                     <xsl:text>1.0.2.5</xsl:text>
                  </docinfo:custom-metafield>
                  <docinfo:custom-metafield name="rx-version">
                     <xsl:text>5.0.0.2</xsl:text>
                  </docinfo:custom-metafield>
                  <docinfo:custom-metafield name="sg-version">
                     <xsl:text>3.1.0.0</xsl:text>
                  </docinfo:custom-metafield>
                  <docinfo:custom-metafield name="ng-version">
                     <xsl:text>4.1.0.0</xsl:text>
                  </docinfo:custom-metafield>
                  <docinfo:custom-metafield name="filterType">
                     <xsl:text>Cases &amp; decisions</xsl:text>
                  </docinfo:custom-metafield>
                  <docinfo:custom-metafield name="resultType">
                     <xsl:text>Cases</xsl:text>
                  </docinfo:custom-metafield>
                  <docinfo:custom-metafield searchtype="COURT-CLASSIFY">
                     <xsl:text>Chancery Division</xsl:text>
                  </docinfo:custom-metafield>
                  <docinfo:custom-metafield searchtype="JURIS-CLASSIFY">
                     <xsl:text>England &amp; Wales</xsl:text>
                  </docinfo:custom-metafield>
               </docinfo:custom-metafields>
            </docinfo>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc" as="document-node()">
               <xsl:document>
                  <docinfo partitionnum="CASE1" browseprev="true" browsenext="true">
                     <docinfo:doc-heading>
                        <xsl:text>Financial Conduct Authority v Capital Alternatives Ltd and others - [2014] 3 All ER 780</xsl:text>
                     </docinfo:doc-heading>
                     <docinfo:doc-id>
                        <xsl:text>323031345F335F416C6C5F45525F30373830</xsl:text>
                     </docinfo:doc-id>
                     <docinfo:assoc-links>
                        <remotelink alttext="Related Cases"
                                    cmd="f:exp"
                                    remotekey1="CASE-REF([2014] 3 All ER 780)"
                                    remotekey2="All Subscribed Cases Sources"
                                    service="QUERY">
                           <xsl:text>Find Related Cases</xsl:text>
                        </remotelink>
                        <remotelink alttext="Related Journals"
                                    cmd="f:exp"
                                    remotekey1="CASE-REF([2014] 3 All ER 780)"
                                    remotekey2="All Subscribed Journals Sources"
                                    service="QUERY">
                           <xsl:text>Find Related Journals</xsl:text>
                        </remotelink>
                        <remotelink alttext="Related Commentary"
                                    cmd="f:exp"
                                    remotekey1="CASE-REF([2014] 3 All ER 780)"
                                    remotekey2="All Subscribed Commentary Sources"
                                    service="QUERY">
                           <xsl:text>Find Related Commentary</xsl:text>
                        </remotelink>
                        <remotelink alttext="Find Related All England Transcripts"
                                    cmd="f:exp"
                                    remotekey1="NORMCITE(TRAN_14D03Mar)"
                                    remotekey2="All Subscribed Cases Sources"
                                    service="QUERY">
                           <xsl:text>Find AllER Transcripts</xsl:text>
                        </remotelink>
                        <remotelink alttext="Find Related All England Digests"
                                    cmd="f:exp"
                                    remotekey1="NORMCITE(DIG_14D03Mar)"
                                    remotekey2="All Subscribed Cases Sources"
                                    service="QUERY">
                           <xsl:text>Find AllER Digests</xsl:text>
                        </remotelink>
                     </docinfo:assoc-links>
                     <docinfo:doc-lang lang="en"/>
                     <docinfo:doc-country iso-cc="GB"/>
                     <docinfo:hier>
                        <docinfo:hierlev role="ancestor">
                           <heading>
                              <title>
                                 <xsl:text>2014</xsl:text>
                              </title>
                           </heading>
                           <docinfo:hierlev role="ancestor">
                              <heading>
                                 <title>
                                    <xsl:text>Volume 3 </xsl:text>
                                 </title>
                              </heading>
                              <docinfo:hierlev role="me">
                                 <heading>
                                    <title>
                                       <xsl:text>Financial Conduct Authority v Capital Alternatives Ltd and others - [2014] 3 All ER 780</xsl:text>
                                    </title>
                                 </heading>
                              </docinfo:hierlev>
                           </docinfo:hierlev>
                        </docinfo:hierlev>
                     </docinfo:hier>
                     <docinfo:bookseqnum>
                        <xsl:text>2182873868</xsl:text>
                     </docinfo:bookseqnum>
                     <docinfo:lbu-meta>
                        <docinfo:metaitem name="lbu-sourcename" value="All England Law Reports"/>
                     </docinfo:lbu-meta>
                     <docinfo:selector>
                        <xsl:text>LawReport</xsl:text>
                     </docinfo:selector>
                     <docinfo:alt-renditions>
                        <docinfo:alt-rendition key="fulltext">
                           <link type="pdf"
                                 filename="2014_3_All_ER_0780.pdf"
                                 alttext="Click Here To View PDF">
                              <xsl:text>2014_3_All_ER_0780</xsl:text>
                           </link>
                        </docinfo:alt-rendition>
                     </docinfo:alt-renditions>
                     <docinfo:normcite>
                        <ci:cite>
                           <ci:content>
                              <xsl:text>[2014] 3 All ER 780</xsl:text>
                           </ci:content>
                        </ci:cite>
                        <ci:cite>
                           <ci:content>
                              <xsl:text>ALLER_14D03Mar</xsl:text>
                           </ci:content>
                        </ci:cite>
                     </docinfo:normcite>
                     <docinfo:custom-metafields>
                        <docinfo:custom-metafield name="court">
                           <xsl:text>120</xsl:text>
                        </docinfo:custom-metafield>
                        <docinfo:custom-metafield name="courtcode">
                           <xsl:text>ChD</xsl:text>
                        </docinfo:custom-metafield>
                        <docinfo:custom-metafield name="date">
                           <xsl:text>20140214</xsl:text>
                        </docinfo:custom-metafield>
                        <docinfo:custom-metafield name="juris">
                           <xsl:text>10</xsl:text>
                        </docinfo:custom-metafield>
                        <docinfo:custom-metafield name="jurisdiction">
                           <xsl:text>England&amp;Wales</xsl:text>
                        </docinfo:custom-metafield>
                        <docinfo:custom-metafield name="sh-version">
                           <xsl:text>1.0.2.5</xsl:text>
                        </docinfo:custom-metafield>
                        <docinfo:custom-metafield name="rx-version">
                           <xsl:text>5.0.0.2</xsl:text>
                        </docinfo:custom-metafield>
                        <docinfo:custom-metafield name="sg-version">
                           <xsl:text>3.1.0.0</xsl:text>
                        </docinfo:custom-metafield>
                        <docinfo:custom-metafield name="ng-version">
                           <xsl:text>4.1.0.0</xsl:text>
                        </docinfo:custom-metafield>
                        <docinfo:custom-metafield name="filterType">
                           <xsl:text>Cases &amp; decisions</xsl:text>
                        </docinfo:custom-metafield>
                        <docinfo:custom-metafield name="resultType">
                           <xsl:text>Cases</xsl:text>
                        </docinfo:custom-metafield>
                        <docinfo:custom-metafield searchtype="COURT-CLASSIFY">
                           <xsl:text>Chancery Division</xsl:text>
                        </docinfo:custom-metafield>
                        <docinfo:custom-metafield searchtype="JURIS-CLASSIFY">
                           <xsl:text>England &amp; Wales</xsl:text>
                        </docinfo:custom-metafield>
                     </docinfo:custom-metafields>
                  </docinfo>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:context" select="$impl:context-doc/node()"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e86">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e86">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>docinfo and its child elements are transformed</xsl:message>
      <xsl:variable name="impl:with-context"
                    select="                          exists($x:result) and empty($x:result[2])"/>
      <xsl:variable name="impl:context" as="item()?">
         <xsl:choose>
            <xsl:when test="$impl:with-context">
               <xsl:sequence select="$x:result"/>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <docinfo>
               <docinfo:dpsi id-string="000D"/>
               <docinfo:doc-heading>
                  <xsl:text>Financial Conduct Authority v Capital Alternatives Ltd and others - [2014] 3 All ER 780</xsl:text>
               </docinfo:doc-heading>
               <docinfo:doc-id>
                  <xsl:text>323031345F335F416C6C5F45525F30373830</xsl:text>
               </docinfo:doc-id>
               <docinfo:doc-lang lang="en"/>
               <docinfo:doc-country iso-cc="GB"/>
               <docinfo:hier>
                  <docinfo:hierlev role="ancestor">
                     <heading>
                        <title>
                           <xsl:text>2014</xsl:text>
                        </title>
                     </heading>
                     <docinfo:hierlev role="ancestor">
                        <heading>
                           <title>
                              <xsl:text>Volume 3 </xsl:text>
                           </title>
                        </heading>
                        <docinfo:hierlev role="me">
                           <heading>
                              <title>
                                 <xsl:text>Financial Conduct Authority v Capital Alternatives Ltd and others - [2014] 3 All ER 780</xsl:text>
                              </title>
                           </heading>
                        </docinfo:hierlev>
                     </docinfo:hierlev>
                  </docinfo:hierlev>
               </docinfo:hier>
               <docinfo:bookseqnum>
                  <xsl:text>2182873868</xsl:text>
               </docinfo:bookseqnum>
               <docinfo:lbu-meta>
                  <docinfo:metaitem name="lbu-sourcename" value="All England Law Reports"/>
               </docinfo:lbu-meta>
               <docinfo:selector>
                  <xsl:text>LawReport</xsl:text>
               </docinfo:selector>
               <docinfo:alt-renditions>
                  <docinfo:alt-rendition key="fulltext">
                     <link type="pdf"
                           filename="2014_3_All_ER_0780.pdf"
                           alttext="Click Here To View PDF">
                        <xsl:text>2014_3_All_ER_0780</xsl:text>
                     </link>
                  </docinfo:alt-rendition>
               </docinfo:alt-renditions>
               <docinfo:custom-metafields>
                  <docinfo:custom-metafield name="courtcode">
                     <xsl:text>ChD</xsl:text>
                  </docinfo:custom-metafield>
                  <docinfo:custom-metafield name="jurisdiction">
                     <xsl:text>England&amp;Wales</xsl:text>
                  </docinfo:custom-metafield>
                  <docinfo:custom-metafield name="COURT-CLASSIFY">
                     <xsl:text>Chancery Division</xsl:text>
                  </docinfo:custom-metafield>
                  <docinfo:custom-metafield name="JURIS-CLASSIFY">
                     <xsl:text>England &amp; Wales</xsl:text>
                  </docinfo:custom-metafield>
                  <docinfo:custom-metafield name="date">
                     <xsl:text>20140214</xsl:text>
                  </docinfo:custom-metafield>
               </docinfo:custom-metafields>
            </docinfo>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="                    test:deep-equal(                      $impl:expected,                      if ( $impl:with-context ) then $impl:context else $x:result,                      2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{ $impl:successful }">
         <x:label>docinfo and its child elements are transformed</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e129">
      <xsl:message>Scenario for testing case:info child of case:headnote</xsl:message>
      <x:scenario>
         <x:label>Scenario for testing case:info child of case:headnote</x:label>
         <x:context>
            <CASEDOC>
               <case:body>
                  <case:headnote>
                     <case:info>
                        <case:reportercite>
                           <ci:cite type="cite4thisdoc">
                              <ci:case>
                                 <ci:caseref>
                                    <ci:reporter value="ALLER"/>
                                    <ci:volume num="3"/>
                                    <ci:edition>
                                       <ci:date year="2014"/>
                                    </ci:edition>
                                    <ci:page num="780"/>
                                 </ci:caseref>
                              </ci:case>
                              <ci:content>
                                 <citefragment searchtype="CASE-CITE-REF">
                                    <xsl:text>[2014] 3 All ER 780</xsl:text>
                                 </citefragment>
                              </ci:content>
                           </ci:cite>
                        </case:reportercite>
                        <case:casename>
                           <xsl:text>Financial Conduct Authority v Capital Alternatives Ltd and others</xsl:text>
                        </case:casename>
                        <case:parallelcite>
                           <ci:cite type="cite4thisdoc">
                              <ci:case>
                                 <ci:caseref>
                                    <ci:reporter value="EWHCCH"/>
                                    <ci:edition>
                                       <ci:date year="2014"/>
                                    </ci:edition>
                                    <ci:page num="144"/>
                                 </ci:caseref>
                              </ci:case>
                              <ci:content>
                                 <citefragment searchtype="CASE-CITE-REF">
                                    <xsl:text>[2014] EWHC 144 (Ch)</xsl:text>
                                 </citefragment>
                              </ci:content>
                           </ci:cite>
                        </case:parallelcite>
                        <case:courtinfo>
                           <case:courtname>
                              <xsl:text>CHANCERY DIVISION</xsl:text>
                           </case:courtname>
                           <case:courtcode>
                              <xsl:text>ChD</xsl:text>
                           </case:courtcode>
                           <case:juris>
                              <xsl:text>EnglandandWales</xsl:text>
                           </case:juris>
                           <case:judges>
                              <xsl:text>NICHOLAS STRAUSS QC SITTING AS A DEPUTY JUDGE OF THE HIGH COURT</xsl:text>
                           </case:judges>
                           <case:dates>
                              <case:hearingdates>
                                 <xsl:text>15&#x2013;18, 22&#x2013;25 OCTOBER 2013, 14 FEBRUARY 2014</xsl:text>
                              </case:hearingdates>
                           </case:dates>
                        </case:courtinfo>
                     </case:info>
                  </case:headnote>
               </case:body>
            </CASEDOC>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc" as="document-node()">
               <xsl:document>
                  <CASEDOC>
                     <case:body>
                        <case:headnote>
                           <case:info>
                              <case:reportercite>
                                 <ci:cite type="cite4thisdoc">
                                    <ci:case>
                                       <ci:caseref>
                                          <ci:reporter value="ALLER"/>
                                          <ci:volume num="3"/>
                                          <ci:edition>
                                             <ci:date year="2014"/>
                                          </ci:edition>
                                          <ci:page num="780"/>
                                       </ci:caseref>
                                    </ci:case>
                                    <ci:content>
                                       <citefragment searchtype="CASE-CITE-REF">
                                          <xsl:text>[2014] 3 All ER 780</xsl:text>
                                       </citefragment>
                                    </ci:content>
                                 </ci:cite>
                              </case:reportercite>
                              <case:casename>
                                 <xsl:text>Financial Conduct Authority v Capital Alternatives Ltd and others</xsl:text>
                              </case:casename>
                              <case:parallelcite>
                                 <ci:cite type="cite4thisdoc">
                                    <ci:case>
                                       <ci:caseref>
                                          <ci:reporter value="EWHCCH"/>
                                          <ci:edition>
                                             <ci:date year="2014"/>
                                          </ci:edition>
                                          <ci:page num="144"/>
                                       </ci:caseref>
                                    </ci:case>
                                    <ci:content>
                                       <citefragment searchtype="CASE-CITE-REF">
                                          <xsl:text>[2014] EWHC 144 (Ch)</xsl:text>
                                       </citefragment>
                                    </ci:content>
                                 </ci:cite>
                              </case:parallelcite>
                              <case:courtinfo>
                                 <case:courtname>
                                    <xsl:text>CHANCERY DIVISION</xsl:text>
                                 </case:courtname>
                                 <case:courtcode>
                                    <xsl:text>ChD</xsl:text>
                                 </case:courtcode>
                                 <case:juris>
                                    <xsl:text>EnglandandWales</xsl:text>
                                 </case:juris>
                                 <case:judges>
                                    <xsl:text>NICHOLAS STRAUSS QC SITTING AS A DEPUTY JUDGE OF THE HIGH COURT</xsl:text>
                                 </case:judges>
                                 <case:dates>
                                    <case:hearingdates>
                                       <xsl:text>15&#x2013;18, 22&#x2013;25 OCTOBER 2013, 14 FEBRUARY 2014</xsl:text>
                                    </case:hearingdates>
                                 </case:dates>
                              </case:courtinfo>
                           </case:info>
                        </case:headnote>
                     </case:body>
                  </CASEDOC>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:context" select="$impl:context-doc/node()"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e172">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e172">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>The element case:info in LA</xsl:message>
      <xsl:variable name="impl:with-context"
                    select="                          exists($x:result) and empty($x:result[2])"/>
      <xsl:variable name="impl:context" as="item()?">
         <xsl:choose>
            <xsl:when test="$impl:with-context">
               <xsl:sequence select="$x:result"/>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <CASEDOC type="fulltext">
               <case:body>
                  <case:headnote>
                     <case:info>
                        <case:reportercite>
                           <ci:cite type="cite4thisdoc">
                              <ci:case>
                                 <ci:caseref>
                                    <ci:reporter value="ALLER"/>
                                    <ci:volume num="3"/>
                                    <ci:edition>
                                       <ci:date year="2014"/>
                                    </ci:edition>
                                    <ci:page num="780"/>
                                 </ci:caseref>
                              </ci:case>
                              <ci:content>
                                 <citefragment searchtype="CASE-CITE-REF">
                                    <xsl:text>[2014] 3 All ER 780</xsl:text>
                                 </citefragment>
                              </ci:content>
                           </ci:cite>
                        </case:reportercite>
                        <case:casename>
                           <xsl:text>Financial Conduct Authority v Capital Alternatives Ltd and others</xsl:text>
                        </case:casename>
                        <case:parallelcite>
                           <ci:cite searchtype="CASE-REF">
                              <ci:case>
                                 <ci:caseref>
                                    <ci:reporter value="EWHCCH"/>
                                    <ci:edition>
                                       <ci:date year="2014"/>
                                    </ci:edition>
                                    <ci:page num="144"/>
                                 </ci:caseref>
                              </ci:case>
                              <ci:content>
                                 <xsl:text>[2014] EWHC 144 (Ch)</xsl:text>
                              </ci:content>
                           </ci:cite>
                        </case:parallelcite>
                        <case:courtinfo>
                           <case:courtname>
                              <xsl:text>CHANCERY DIVISION</xsl:text>
                           </case:courtname>
                           <case:courtcode>
                              <xsl:text>ChD</xsl:text>
                           </case:courtcode>
                           <case:judges>
                              <xsl:text>NICHOLAS STRAUSS QC SITTING AS A DEPUTY JUDGE OF THE HIGH COURT</xsl:text>
                           </case:judges>
                           <case:dates>
                              <case:hearingdates>
                                 <xsl:text>15&#x2013;18, 22&#x2013;25 OCTOBER 2013, 14 FEBRUARY 2014</xsl:text>
                              </case:hearingdates>
                           </case:dates>
                        </case:courtinfo>
                     </case:info>
                  </case:headnote>
               </case:body>
            </CASEDOC>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="                    test:deep-equal(                      $impl:expected,                      if ( $impl:with-context ) then $impl:context else $x:result,                      2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{ $impl:successful }">
         <x:label>The element case:info in LA</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e211">
      <xsl:message>Scenario for testing catchwordgrp child of case:headnote</xsl:message>
      <x:scenario>
         <x:label>Scenario for testing catchwordgrp child of case:headnote</x:label>
         <x:context>
            <CASEDOC type="fulltext">
               <case:body>
                  <case:headnote>
                     <catchwordgrp>
                        <catchwords>
                           <catchphrase>
                              <xsl:text>Financial services &#x2013; Financial Conduct Authority &#x2013; Regulation of financial services &#x2013; Regulated activities &#x2013; Collective investment schemes &#x2013; Arrangements with respect to property enabling persons taking part in arrangement to participate in or receive profits or income &#x2013; Contributions of participants and profits or income to be pooled &#x2013; Property to be managed as a whole by or on behalf of operator of scheme &#x2013; </xsl:text>
                              <ci:cite searchtype="LEG-REF" status="valid">
                                 <ci:sesslaw>
                                    <ci:sesslawinfo>
                                       <ci:sesslawnum num="2000_8a"/>
                                       <ci:hierpinpoint>
                                          <ci:hierlev label="section" num="235"/>
                                       </ci:hierpinpoint>
                                    </ci:sesslawinfo>
                                    <ci:sesslawref>
                                       <ci:standardname normpubcode="UK_ACTS"/>
                                    </ci:sesslawref>
                                 </ci:sesslaw>
                                 <ci:content>
                                    <xsl:text>Financial Services and Markets Act 2000, s 235</xsl:text>
                                 </ci:content>
                              </ci:cite>
                              <xsl:text>.</xsl:text>
                           </catchphrase>
                        </catchwords>
                     </catchwordgrp>
                  </case:headnote>
               </case:body>
            </CASEDOC>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc" as="document-node()">
               <xsl:document>
                  <CASEDOC type="fulltext">
                     <case:body>
                        <case:headnote>
                           <catchwordgrp>
                              <catchwords>
                                 <catchphrase>
                                    <xsl:text>Financial services &#x2013; Financial Conduct Authority &#x2013; Regulation of financial services &#x2013; Regulated activities &#x2013; Collective investment schemes &#x2013; Arrangements with respect to property enabling persons taking part in arrangement to participate in or receive profits or income &#x2013; Contributions of participants and profits or income to be pooled &#x2013; Property to be managed as a whole by or on behalf of operator of scheme &#x2013; </xsl:text>
                                    <ci:cite searchtype="LEG-REF" status="valid">
                                       <ci:sesslaw>
                                          <ci:sesslawinfo>
                                             <ci:sesslawnum num="2000_8a"/>
                                             <ci:hierpinpoint>
                                                <ci:hierlev label="section" num="235"/>
                                             </ci:hierpinpoint>
                                          </ci:sesslawinfo>
                                          <ci:sesslawref>
                                             <ci:standardname normpubcode="UK_ACTS"/>
                                          </ci:sesslawref>
                                       </ci:sesslaw>
                                       <ci:content>
                                          <xsl:text>Financial Services and Markets Act 2000, s 235</xsl:text>
                                       </ci:content>
                                    </ci:cite>
                                    <xsl:text>.</xsl:text>
                                 </catchphrase>
                              </catchwords>
                           </catchwordgrp>
                        </case:headnote>
                     </case:body>
                  </CASEDOC>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:context" select="$impl:context-doc/node()"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e231">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e231">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>The element catchwordgrp is retained and element catchword is created for each content of PCDATA delimited by &#x2013;</xsl:message>
      <xsl:variable name="impl:with-context"
                    select="                          exists($x:result) and empty($x:result[2])"/>
      <xsl:variable name="impl:context" as="item()?">
         <xsl:choose>
            <xsl:when test="$impl:with-context">
               <xsl:sequence select="$x:result"/>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <CASEDOC type="fulltext">
               <case:body>
                  <case:headnote>
                     <catchwordgrp>
                        <catchwords>
                           <catchphrase>
                              <xsl:text>Financial services</xsl:text>
                           </catchphrase>
                           <catchphrase>
                              <xsl:text>Financial Conduct Authority</xsl:text>
                           </catchphrase>
                           <catchphrase>
                              <xsl:text>Regulation of financial services</xsl:text>
                           </catchphrase>
                           <catchphrase>
                              <xsl:text>Regulated activities</xsl:text>
                           </catchphrase>
                           <catchphrase>
                              <xsl:text>Collective investment schemes</xsl:text>
                           </catchphrase>
                           <catchphrase>
                              <xsl:text>Arrangements with respect to property enabling persons taking part in arrangement to participate in or receive profits or income</xsl:text>
                           </catchphrase>
                           <catchphrase>
                              <xsl:text>Contributions of participants and profits or income to be pooled</xsl:text>
                           </catchphrase>
                           <catchphrase>
                              <xsl:text>Property to be managed as a whole by or on behalf of operator of scheme</xsl:text>
                           </catchphrase>
                           <catchphrase/>
                           <catchphrase>
                              <xsl:text>Financial Services and Markets Act 2000, s 235.</xsl:text>
                           </catchphrase>
                        </catchwords>
                     </catchwordgrp>
                  </case:headnote>
               </case:body>
            </CASEDOC>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="                    test:deep-equal(                      $impl:expected,                      if ( $impl:with-context ) then $impl:context else $x:result,                      2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{ $impl:successful }">
         <x:label>The element catchwordgrp is retained and element catchword is created for each content of PCDATA delimited by &#x2013;</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e256">
      <xsl:message>Scenario for testing case:factsummary child of case:headnote</xsl:message>
      <x:scenario>
         <x:label>Scenario for testing case:factsummary child of case:headnote</x:label>
         <x:context>
            <CASEDOC type="fulltext">
               <case:body>
                  <case:headnote>
                     <case:info>
                        <case:factsummary>
                           <pgrp>
                              <p>
                                 <text>
                                    <xsl:text>The Financial Conduct Authority (the FCA) was a regulatory body established under the </xsl:text>
                                    <ci:cite searchtype="LEG-REF" status="valid">
                                       <ci:sesslaw>
                                          <ci:sesslawinfo>
                                             <ci:sesslawnum num="2000_8a_Title"/>
                                          </ci:sesslawinfo>
                                          <ci:sesslawref>
                                             <ci:standardname normpubcode="UK_ACTS"/>
                                          </ci:sesslawref>
                                       </ci:sesslaw>
                                       <ci:content>
                                          <xsl:text>Financial Services and Markets Act 2000</xsl:text>
                                       </ci:content>
                                    </ci:cite>
                                    <xsl:text> (the FSMA). Certain investments of specified kinds, including 'collective investment schemes' carried on by way of business were 'regulated activities' under the FSMA and could not be carried on lawfully by unauthorised persons.</xsl:text>
                                 </text>
                              </p>
                           </pgrp>
                           <pgrp>
                              <p>
                                 <text>
                                    <xsl:text>relation to the carbon credits schemes in the forest areas, the FCA submitted that the award of the total number of carbon credit units by the relevant body to the scheme operator meant that the profits were pooled; the defendants' case was that there was no pooling if the carbon credit units were divided in accordance with the amount of carbon benefit generated by each plot individually. In relation to both kinds of scheme, the defendants contended that a scheme consisting of individual plots managed to give individual returns for each investor based on the individual yield had neither of the characteristics required by s 235(3), namely pooling of profits nor management of the property as a whole and was therefore not a collective investment scheme.</xsl:text>
                                 </text>
                              </p>
                           </pgrp>
                        </case:factsummary>
                     </case:info>
                  </case:headnote>
               </case:body>
            </CASEDOC>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc" as="document-node()">
               <xsl:document>
                  <CASEDOC type="fulltext">
                     <case:body>
                        <case:headnote>
                           <case:info>
                              <case:factsummary>
                                 <pgrp>
                                    <p>
                                       <text>
                                          <xsl:text>The Financial Conduct Authority (the FCA) was a regulatory body established under the </xsl:text>
                                          <ci:cite searchtype="LEG-REF" status="valid">
                                             <ci:sesslaw>
                                                <ci:sesslawinfo>
                                                   <ci:sesslawnum num="2000_8a_Title"/>
                                                </ci:sesslawinfo>
                                                <ci:sesslawref>
                                                   <ci:standardname normpubcode="UK_ACTS"/>
                                                </ci:sesslawref>
                                             </ci:sesslaw>
                                             <ci:content>
                                                <xsl:text>Financial Services and Markets Act 2000</xsl:text>
                                             </ci:content>
                                          </ci:cite>
                                          <xsl:text> (the FSMA). Certain investments of specified kinds, including 'collective investment schemes' carried on by way of business were 'regulated activities' under the FSMA and could not be carried on lawfully by unauthorised persons.</xsl:text>
                                       </text>
                                    </p>
                                 </pgrp>
                                 <pgrp>
                                    <p>
                                       <text>
                                          <xsl:text>relation to the carbon credits schemes in the forest areas, the FCA submitted that the award of the total number of carbon credit units by the relevant body to the scheme operator meant that the profits were pooled; the defendants' case was that there was no pooling if the carbon credit units were divided in accordance with the amount of carbon benefit generated by each plot individually. In relation to both kinds of scheme, the defendants contended that a scheme consisting of individual plots managed to give individual returns for each investor based on the individual yield had neither of the characteristics required by s 235(3), namely pooling of profits nor management of the property as a whole and was therefore not a collective investment scheme.</xsl:text>
                                       </text>
                                    </p>
                                 </pgrp>
                              </case:factsummary>
                           </case:info>
                        </case:headnote>
                     </case:body>
                  </CASEDOC>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:context" select="$impl:context-doc/node()"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e280">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e280">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>Within case:factsummary, the child element pgrp is suppressed and its child are retained and for the element footnote, @fntoken and @fnrtoken are created</xsl:message>
      <xsl:variable name="impl:with-context"
                    select="                          exists($x:result) and empty($x:result[2])"/>
      <xsl:variable name="impl:context" as="item()?">
         <xsl:choose>
            <xsl:when test="$impl:with-context">
               <xsl:sequence select="$x:result"/>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <CASEDOC type="fulltext">
               <case:body>
                  <case:headnote>
                     <case:info>
                        <case:factsummary>
                           <p>
                              <text>
                                 <xsl:text>The Financial Conduct Authority (the FCA) was a regulatory body established under the </xsl:text>
                                 <ci:cite searchtype="LEG-REF"
                                          status="valid"
                                          normcite="UK_ACTS 2000 8 Title ">
                                    <ci:content>
                                       <xsl:text>Financial Services and Markets Act 2000</xsl:text>
                                    </ci:content>
                                 </ci:cite>
                                 <xsl:text> (the FSMA). Certain investments of specified kinds, including &#x2018;collective investment schemes&#x2019; carried on by way of business were &#x2018;regulated activities&#x2019; under the FSMA and could not be carried on lawfully by unauthorised persons.</xsl:text>
                              </text>
                           </p>
                           <p>
                              <text>
                                 <xsl:text>relation to the carbon credits schemes in the forest areas, the FCA submitted that the award of the total number of carbon credit units by the relevant body to the scheme operator meant that the profits were pooled; the defendants&#x2019; case was that there was no pooling if the carbon credit units were divided in accordance with the amount of carbon benefit generated by each plot individually. In relation to both kinds of scheme, the defendants contended that a scheme consisting of individual plots managed to give individual returns for each investor based on the individual yield had neither of the characteristics required by s 235(3), namely pooling of profits nor management of the property as a whole and was therefore not a collective investment scheme.</xsl:text>
                              </text>
                           </p>
                        </case:factsummary>
                     </case:info>
                  </case:headnote>
               </case:body>
            </CASEDOC>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="                    test:deep-equal(                      $impl:expected,                      if ( $impl:with-context ) then $impl:context else $x:result,                      2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{ $impl:successful }">
         <x:label>Within case:factsummary, the child element pgrp is suppressed and its child are retained and for the element footnote, @fntoken and @fnrtoken are created</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e296">
      <xsl:message>Scenario for testing case:decisionsummary child of case:headnote</xsl:message>
      <x:scenario>
         <x:label>Scenario for testing case:decisionsummary child of case:headnote</x:label>
         <x:context>
            <CASEDOC type="fulltext">
               <case:body>
                  <case:headnote>
                     <case:decisionsummary>
                        <pgrp>
                           <p>
                              <text>
                                 <emph typestyle="bf">
                                    <xsl:text>Held</xsl:text>
                                 </emph>
                                 <xsl:text> &#x2013; An investment scheme whose terms provided that the property within the scheme was to consist of individual plots managed in such a way as to give individual returns for each investor based on the yield from his plot would not involve pooling of profit or income within s 235(3)(a) of the FSMA but the property might nonetheless be 'managed as a whole' within s 235(3)(b), and if so managed, the scheme would be a collective investment scheme. Where, as in the schemes in the instant case, all the investment property was managed by or on behalf of the operator as one entity for the collective benefit of all investors, without any substantial regard for the individual interests of any of the investors, and without the investors themselves having any involvement in management, and the object of the division of the property into separate plots so as to generate individual returns of income neither benefited investors nor involved any substantial individual as opposed to collective management, the property was 'managed as a whole'. The word 'property' in s 235(3)(b) referred back to s 235(1), and the property was whatever enabled participants to benefit from its acquisition, holding, management, or disposal. In the instant case, the property was not limited to the investors' individual plots, but included the whole of the rice farm and the whole of the forest areas, because the investors' income depended on their development and management. Pooling of profits or income within s 235(3)(a) required the creation of a fund for the combined or common benefit of investors and, if each investor obtained an individual return based on the yield from his plot, there was no pooling of profits or income even if the value of all investors' yield was subject to standard deductions for processing and expenses, or the value of all investors' yield was received first by the operator of the scheme and then distributed to the investors in accordance with their respective, individually calculated, entitlements. In the instant case, in the rice farm scheme and one of the carbon credits schemes, there had been no pooling of profits or income, but as all four schemes had been 'managed as a whole', they were all collective investment schemes within s 235 (see [8]&#x2013;[10], [56], [58]&#x2013;[60], [94], [111], [154]&#x2013;[162], [168], [169], [174]&#x2013;[182], [195]&#x2013;[198], [200]&#x2013;[203], [207], [208], [229], [252]&#x2013;[260], [265]&#x2013;[272], below).</xsl:text>
                              </text>
                           </p>
                        </pgrp>
                        <glp:note>
                           <h>
                              <emph typestyle="bf">
                                 <xsl:text>Notes</xsl:text>
                              </emph>
                           </h>
                        </glp:note>
                        <glp:note>
                           <p>
                              <text>
                                 <xsl:text>For collective investment schemes: definitions, and for arrangements not amounting to a collective investment scheme, see 49 </xsl:text>
                                 <emph typestyle="it">
                                    <xsl:text>Halsbury's Laws</xsl:text>
                                 </emph>
                                 <xsl:text> (5th edn) (2008) paras 603, 604.</xsl:text>
                              </text>
                           </p>
                        </glp:note>
                        <glp:note>
                           <p>
                              <text>
                                 <xsl:text>For the </xsl:text>
                                 <ci:cite searchtype="LEG-REF" status="valid">
                                    <ci:sesslaw>
                                       <ci:sesslawinfo>
                                          <ci:sesslawnum num="2000_8a"/>
                                          <ci:hierpinpoint>
                                             <ci:hierlev label="section" num="235"/>
                                          </ci:hierpinpoint>
                                       </ci:sesslawinfo>
                                       <ci:sesslawref>
                                          <ci:standardname normpubcode="UK_ACTS"/>
                                       </ci:sesslawref>
                                    </ci:sesslaw>
                                    <ci:content>
                                       <xsl:text>Financial Services and Markets Act 2000, s 235</xsl:text>
                                    </ci:content>
                                 </ci:cite>
                                 <xsl:text>, see 19(2) </xsl:text>
                                 <emph typestyle="it">
                                    <xsl:text>Halsbury's Statutes</xsl:text>
                                 </emph>
                                 <xsl:text> (4th edn) (2013 reissue) 484.</xsl:text>
                              </text>
                           </p>
                        </glp:note>
                        <page text="[2014] 3 All ER 780 at " count="782" reporter="ALLER"/>
                        <case:consideredcases>
                           <h>
                              <emph typestyle="bf">
                                 <xsl:text>Cases referred to</xsl:text>
                              </emph>
                           </h>
                        </case:consideredcases>
                        <case:consideredcases>
                           <p>
                              <text>
                                 <emph typestyle="it">
                                    <xsl:text>Bloomsbury International Ltd v Sea Fish Industry Authority </xsl:text>
                                 </emph>
                                 <ci:cite searchtype="CASE-REF">
                                    <ci:case>
                                       <ci:caseref>
                                          <ci:reporter value="UKSC"/>
                                          <ci:edition>
                                             <ci:date year="2011"/>
                                          </ci:edition>
                                          <ci:page num="25"/>
                                       </ci:caseref>
                                    </ci:case>
                                    <ci:content>
                                       <xsl:text>[2011] UKSC 25</xsl:text>
                                    </ci:content>
                                 </ci:cite>
                                 <xsl:text>, </xsl:text>
                                 <ci:cite searchtype="CASE-REF">
                                    <ci:case>
                                       <ci:caseref>
                                          <ci:reporter value="ALLER"/>
                                          <ci:volume num="4"/>
                                          <ci:edition>
                                             <ci:date year="2011"/>
                                          </ci:edition>
                                          <ci:page num="721"/>
                                       </ci:caseref>
                                    </ci:case>
                                    <ci:content>
                                       <xsl:text>[2011] 4 All ER 721</xsl:text>
                                    </ci:content>
                                 </ci:cite>
                                 <xsl:text>, </xsl:text>
                                 <ci:cite searchtype="CASE-REF">
                                    <ci:case>
                                       <ci:caseref>
                                          <ci:reporter value="WLR"/>
                                          <ci:volume num="1"/>
                                          <ci:edition>
                                             <ci:date year="2011"/>
                                          </ci:edition>
                                          <ci:page num="1546"/>
                                       </ci:caseref>
                                    </ci:case>
                                    <ci:content>
                                       <xsl:text>[2011] 1 WLR 1546</xsl:text>
                                    </ci:content>
                                 </ci:cite>
                                 <xsl:text>.</xsl:text>
                              </text>
                           </p>
                        </case:consideredcases>
                     </case:decisionsummary>
                  </case:headnote>
               </case:body>
            </CASEDOC>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc" as="document-node()">
               <xsl:document>
                  <CASEDOC type="fulltext">
                     <case:body>
                        <case:headnote>
                           <case:decisionsummary>
                              <pgrp>
                                 <p>
                                    <text>
                                       <emph typestyle="bf">
                                          <xsl:text>Held</xsl:text>
                                       </emph>
                                       <xsl:text> &#x2013; An investment scheme whose terms provided that the property within the scheme was to consist of individual plots managed in such a way as to give individual returns for each investor based on the yield from his plot would not involve pooling of profit or income within s 235(3)(a) of the FSMA but the property might nonetheless be 'managed as a whole' within s 235(3)(b), and if so managed, the scheme would be a collective investment scheme. Where, as in the schemes in the instant case, all the investment property was managed by or on behalf of the operator as one entity for the collective benefit of all investors, without any substantial regard for the individual interests of any of the investors, and without the investors themselves having any involvement in management, and the object of the division of the property into separate plots so as to generate individual returns of income neither benefited investors nor involved any substantial individual as opposed to collective management, the property was 'managed as a whole'. The word 'property' in s 235(3)(b) referred back to s 235(1), and the property was whatever enabled participants to benefit from its acquisition, holding, management, or disposal. In the instant case, the property was not limited to the investors' individual plots, but included the whole of the rice farm and the whole of the forest areas, because the investors' income depended on their development and management. Pooling of profits or income within s 235(3)(a) required the creation of a fund for the combined or common benefit of investors and, if each investor obtained an individual return based on the yield from his plot, there was no pooling of profits or income even if the value of all investors' yield was subject to standard deductions for processing and expenses, or the value of all investors' yield was received first by the operator of the scheme and then distributed to the investors in accordance with their respective, individually calculated, entitlements. In the instant case, in the rice farm scheme and one of the carbon credits schemes, there had been no pooling of profits or income, but as all four schemes had been 'managed as a whole', they were all collective investment schemes within s 235 (see [8]&#x2013;[10], [56], [58]&#x2013;[60], [94], [111], [154]&#x2013;[162], [168], [169], [174]&#x2013;[182], [195]&#x2013;[198], [200]&#x2013;[203], [207], [208], [229], [252]&#x2013;[260], [265]&#x2013;[272], below).</xsl:text>
                                    </text>
                                 </p>
                              </pgrp>
                              <glp:note>
                                 <h>
                                    <emph typestyle="bf">
                                       <xsl:text>Notes</xsl:text>
                                    </emph>
                                 </h>
                              </glp:note>
                              <glp:note>
                                 <p>
                                    <text>
                                       <xsl:text>For collective investment schemes: definitions, and for arrangements not amounting to a collective investment scheme, see 49 </xsl:text>
                                       <emph typestyle="it">
                                          <xsl:text>Halsbury's Laws</xsl:text>
                                       </emph>
                                       <xsl:text> (5th edn) (2008) paras 603, 604.</xsl:text>
                                    </text>
                                 </p>
                              </glp:note>
                              <glp:note>
                                 <p>
                                    <text>
                                       <xsl:text>For the </xsl:text>
                                       <ci:cite searchtype="LEG-REF" status="valid">
                                          <ci:sesslaw>
                                             <ci:sesslawinfo>
                                                <ci:sesslawnum num="2000_8a"/>
                                                <ci:hierpinpoint>
                                                   <ci:hierlev label="section" num="235"/>
                                                </ci:hierpinpoint>
                                             </ci:sesslawinfo>
                                             <ci:sesslawref>
                                                <ci:standardname normpubcode="UK_ACTS"/>
                                             </ci:sesslawref>
                                          </ci:sesslaw>
                                          <ci:content>
                                             <xsl:text>Financial Services and Markets Act 2000, s 235</xsl:text>
                                          </ci:content>
                                       </ci:cite>
                                       <xsl:text>, see 19(2) </xsl:text>
                                       <emph typestyle="it">
                                          <xsl:text>Halsbury's Statutes</xsl:text>
                                       </emph>
                                       <xsl:text> (4th edn) (2013 reissue) 484.</xsl:text>
                                    </text>
                                 </p>
                              </glp:note>
                              <page text="[2014] 3 All ER 780 at " count="782" reporter="ALLER"/>
                              <case:consideredcases>
                                 <h>
                                    <emph typestyle="bf">
                                       <xsl:text>Cases referred to</xsl:text>
                                    </emph>
                                 </h>
                              </case:consideredcases>
                              <case:consideredcases>
                                 <p>
                                    <text>
                                       <emph typestyle="it">
                                          <xsl:text>Bloomsbury International Ltd v Sea Fish Industry Authority </xsl:text>
                                       </emph>
                                       <ci:cite searchtype="CASE-REF">
                                          <ci:case>
                                             <ci:caseref>
                                                <ci:reporter value="UKSC"/>
                                                <ci:edition>
                                                   <ci:date year="2011"/>
                                                </ci:edition>
                                                <ci:page num="25"/>
                                             </ci:caseref>
                                          </ci:case>
                                          <ci:content>
                                             <xsl:text>[2011] UKSC 25</xsl:text>
                                          </ci:content>
                                       </ci:cite>
                                       <xsl:text>, </xsl:text>
                                       <ci:cite searchtype="CASE-REF">
                                          <ci:case>
                                             <ci:caseref>
                                                <ci:reporter value="ALLER"/>
                                                <ci:volume num="4"/>
                                                <ci:edition>
                                                   <ci:date year="2011"/>
                                                </ci:edition>
                                                <ci:page num="721"/>
                                             </ci:caseref>
                                          </ci:case>
                                          <ci:content>
                                             <xsl:text>[2011] 4 All ER 721</xsl:text>
                                          </ci:content>
                                       </ci:cite>
                                       <xsl:text>, </xsl:text>
                                       <ci:cite searchtype="CASE-REF">
                                          <ci:case>
                                             <ci:caseref>
                                                <ci:reporter value="WLR"/>
                                                <ci:volume num="1"/>
                                                <ci:edition>
                                                   <ci:date year="2011"/>
                                                </ci:edition>
                                                <ci:page num="1546"/>
                                             </ci:caseref>
                                          </ci:case>
                                          <ci:content>
                                             <xsl:text>[2011] 1 WLR 1546</xsl:text>
                                          </ci:content>
                                       </ci:cite>
                                       <xsl:text>.</xsl:text>
                                    </text>
                                 </p>
                              </case:consideredcases>
                           </case:decisionsummary>
                        </case:headnote>
                     </case:body>
                  </CASEDOC>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:context" select="$impl:context-doc/node()"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e379">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e379">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>The glp:note within case:decisionsummary is made as the following sibling of case:decisionsummary and converted as the element note. The element case:consideredcases is made as the following sibling of case:decisionsummary and converted as case:references</xsl:message>
      <xsl:variable name="impl:with-context"
                    select="                          exists($x:result) and empty($x:result[2])"/>
      <xsl:variable name="impl:context" as="item()?">
         <xsl:choose>
            <xsl:when test="$impl:with-context">
               <xsl:sequence select="$x:result"/>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <CASEDOC type="fulltext">
               <case:body>
                  <case:headnote>
                     <case:decisionsummary summarytype="held">
                        <p>
                           <text>
                              <emph typestyle="bf">
                                 <xsl:text>Held</xsl:text>
                              </emph>
                              <xsl:text> &#x2013; An investment scheme whose terms provided that the property within the scheme was to consist of individual plots managed in such a way as to give individual returns for each investor based on the yield from his plot would not involve pooling of profit or income within s 235(3)(a) of the FSMA but the property might nonetheless be &#x2018;managed as a whole&#x2019; within s 235(3)(b), and if so managed, the scheme would be a collective investment scheme. Where, as in the schemes in the instant case, all the investment property was managed by or on behalf of the operator as one entity for the collective benefit of all investors, without any substantial regard for the individual interests of any of the investors, and without the investors themselves having any involvement in management, and the object of the division of the property into separate plots so as to generate individual returns of income neither benefited investors nor involved any substantial individual as opposed to collective management, the property was &#x2018;managed as a whole&#x2019;. The word &#x2018;property&#x2019; in s 235(3)(b) referred back to s 235(1), and the property was whatever enabled participants to benefit from its acquisition, holding, management, or disposal. In the instant case, the property was not limited to the investors&#x2019; individual plots, but included the whole of the rice farm and the whole of the forest areas, because the investors&#x2019; income depended on their development and management. Pooling of profits or income within s 235(3)(a) required the creation of a fund for the combined or common benefit of investors and, if each investor obtained an individual return based on the yield from his plot, there was no pooling of profits or income even if the value of all investors&#x2019; yield was subject to standard deductions for processing and expenses, or the value of all investors&#x2019; yield was received first by the operator of the scheme and then distributed to the investors in accordance with their respective, individually calculated, entitlements. In the instant case, in the rice farm scheme and one of the carbon credits schemes, there had been no pooling of profits or income, but as all four schemes had been &#x2018;managed as a whole&#x2019;, they were all collective investment schemes within s 235 (see [8]&#x2013;[10], [56], [58]&#x2013;[60], [94], [111], [154]&#x2013;[162], [168], [169], [174]&#x2013;[182], [195]&#x2013;[198], [200]&#x2013;[203], [207], [208], [229], [252]&#x2013;[260], [265]&#x2013;[272], below).</xsl:text>
                           </text>
                        </p>
                     </case:decisionsummary>
                     <note notetype="commentary">
                        <h>
                           <xsl:text>Notes</xsl:text>
                        </h>
                        <p>
                           <text>
                              <xsl:text>For collective investment schemes: definitions, and for arrangements not amounting to a collective investment scheme, see 49 </xsl:text>
                              <emph typestyle="it">
                                 <xsl:text>Halsbury&#x2019;s Laws</xsl:text>
                              </emph>
                              <xsl:text> (5th edn) (2008) paras 603, 604.</xsl:text>
                           </text>
                        </p>
                        <p>
                           <text>
                              <xsl:text>For the </xsl:text>
                              <ci:cite searchtype="LEG-REF"
                                       status="valid"
                                       normcite="UK_ACTS 2000 8 SECT 235">
                                 <ci:content>
                                    <xsl:text>Financial Services and Markets Act 2000, s 235</xsl:text>
                                 </ci:content>
                              </ci:cite>
                              <xsl:text>, see 19(2) </xsl:text>
                              <emph typestyle="it">
                                 <xsl:text>Halsbury&#x2019;s Statutes</xsl:text>
                              </emph>
                              <xsl:text> (4th edn) (2013 reissue) 484.</xsl:text>
                           </text>
                        </p>
                        <page text="[2014] 3 All ER 780 at" reporter="ALLER" count="782"/>
                     </note>
                     <case:references referencetype="cases">
                        <h>
                           <xsl:text>Cases referred to</xsl:text>
                        </h>
                        <p>
                           <text>
                              <emph typestyle="it">
                                 <xsl:text>Bloomsbury International Ltd v Sea Fish Industry Authority </xsl:text>
                              </emph>
                              <ci:cite searchtype="CASE-REF">
                                 <ci:case>
                                    <ci:caseref>
                                       <ci:reporter value="UKSC"/>
                                       <ci:edition>
                                          <ci:date year="2011"/>
                                       </ci:edition>
                                       <ci:page num="25"/>
                                    </ci:caseref>
                                 </ci:case>
                                 <ci:content>
                                    <xsl:text>[2011] UKSC 25</xsl:text>
                                 </ci:content>
                              </ci:cite>
                              <xsl:text>, </xsl:text>
                              <ci:cite searchtype="CASE-REF">
                                 <ci:case>
                                    <ci:caseref>
                                       <ci:reporter value="ALLER"/>
                                       <ci:volume num="4"/>
                                       <ci:edition>
                                          <ci:date year="2011"/>
                                       </ci:edition>
                                       <ci:page num="721"/>
                                    </ci:caseref>
                                 </ci:case>
                                 <ci:content>
                                    <xsl:text>[2011] 4 All ER 721</xsl:text>
                                 </ci:content>
                              </ci:cite>
                              <xsl:text>, </xsl:text>
                              <ci:cite searchtype="CASE-REF">
                                 <ci:case>
                                    <ci:caseref>
                                       <ci:reporter value="WLR"/>
                                       <ci:volume num="1"/>
                                       <ci:edition>
                                          <ci:date year="2011"/>
                                       </ci:edition>
                                       <ci:page num="1546"/>
                                    </ci:caseref>
                                 </ci:case>
                                 <ci:content>
                                    <xsl:text>[2011] 1 WLR 1546</xsl:text>
                                 </ci:content>
                              </ci:cite>
                              <xsl:text>.</xsl:text>
                           </text>
                        </p>
                     </case:references>
                  </case:headnote>
               </case:body>
            </CASEDOC>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="                    test:deep-equal(                      $impl:expected,                      if ( $impl:with-context ) then $impl:context else $x:result,                      2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{ $impl:successful }">
         <x:label>The glp:note within case:decisionsummary is made as the following sibling of case:decisionsummary and converted as the element note. The element case:consideredcases  is made as the following sibling of case:decisionsummary and converted as case:references</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e448">
      <xsl:message>Scenario for testing case:priorhist child of case:headnote</xsl:message>
      <x:scenario>
         <x:label>Scenario for testing case:priorhist child of case:headnote</x:label>
         <x:context>
            <CASEDOC type="fulltext">
               <case:body>
                  <case:headnote>
                     <case:priorhist>
                        <h>
                           <emph typestyle="bf">
                              <xsl:text>Preliminary issue</xsl:text>
                           </emph>
                        </h>
                        <pgrp>
                           <p>
                              <text>
                                 <xsl:text>The Financial Conduct Authority (the FCA) brought proceedings against the promoters and operators, and individuals or companies associated or allegedly associated with the promoters and operators, of four investment schemes on the basis that the schemes were collective investment schemes within the meaning of </xsl:text>
                                 <ci:cite searchtype="LEG-REF" status="valid">
                                    <ci:sesslaw>
                                       <ci:sesslawinfo>
                                          <ci:sesslawnum num="2000_8a"/>
                                          <ci:hierpinpoint>
                                             <ci:hierlev label="section" num="235"/>
                                          </ci:hierpinpoint>
                                       </ci:sesslawinfo>
                                       <ci:sesslawref>
                                          <ci:standardname normpubcode="UK_ACTS"/>
                                       </ci:sesslawref>
                                    </ci:sesslaw>
                                    <ci:content>
                                       <xsl:text>s 235</xsl:text>
                                    </ci:content>
                                 </ci:cite>
                                 <xsl:text> of the Financial Services and Markets Act 2000 (the FSMA), and had been mis-sold by a series of misleading statements, contrary to s 397 of the FSMA. Roth J directed that the question whether the schemes were collective investment schemes within s 235 be tried as a preliminary issue. The defendants to the proceedings were (i) Capital Alternatives Ltd; (ii) Capital Secretarial Ltd; (iii) Capital Organisation Ltd; (iv) Capital Administration Ltd; (v) MH Trustees Ltd; (vi) Marcia Dominique Hargous; (vii) Renwick Robert Haddow; (viii) Richard John Lyon Henstock; (ix) African Land Ltd; (x) Robert John McKendrick; (xi) Alan Howard Meadowcroft; (xii) Regency Capital Ltd; (xiii) Reforestation Projects Ltd; (xiv) Mark Andrew Ayres; (xv) Mark David Gibbs; and (xv) the personal representatives of David William Waygood. The twelfth to sixteenth defendants did not appear. The facts are set out in the judgment.</xsl:text>
                              </text>
                           </p>
                        </pgrp>
                     </case:priorhist>
                  </case:headnote>
               </case:body>
            </CASEDOC>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc" as="document-node()">
               <xsl:document>
                  <CASEDOC type="fulltext">
                     <case:body>
                        <case:headnote>
                           <case:priorhist>
                              <h>
                                 <emph typestyle="bf">
                                    <xsl:text>Preliminary issue</xsl:text>
                                 </emph>
                              </h>
                              <pgrp>
                                 <p>
                                    <text>
                                       <xsl:text>The Financial Conduct Authority (the FCA) brought proceedings against the promoters and operators, and individuals or companies associated or allegedly associated with the promoters and operators, of four investment schemes on the basis that the schemes were collective investment schemes within the meaning of </xsl:text>
                                       <ci:cite searchtype="LEG-REF" status="valid">
                                          <ci:sesslaw>
                                             <ci:sesslawinfo>
                                                <ci:sesslawnum num="2000_8a"/>
                                                <ci:hierpinpoint>
                                                   <ci:hierlev label="section" num="235"/>
                                                </ci:hierpinpoint>
                                             </ci:sesslawinfo>
                                             <ci:sesslawref>
                                                <ci:standardname normpubcode="UK_ACTS"/>
                                             </ci:sesslawref>
                                          </ci:sesslaw>
                                          <ci:content>
                                             <xsl:text>s 235</xsl:text>
                                          </ci:content>
                                       </ci:cite>
                                       <xsl:text> of the Financial Services and Markets Act 2000 (the FSMA), and had been mis-sold by a series of misleading statements, contrary to s 397 of the FSMA. Roth J directed that the question whether the schemes were collective investment schemes within s 235 be tried as a preliminary issue. The defendants to the proceedings were (i) Capital Alternatives Ltd; (ii) Capital Secretarial Ltd; (iii) Capital Organisation Ltd; (iv) Capital Administration Ltd; (v) MH Trustees Ltd; (vi) Marcia Dominique Hargous; (vii) Renwick Robert Haddow; (viii) Richard John Lyon Henstock; (ix) African Land Ltd; (x) Robert John McKendrick; (xi) Alan Howard Meadowcroft; (xii) Regency Capital Ltd; (xiii) Reforestation Projects Ltd; (xiv) Mark Andrew Ayres; (xv) Mark David Gibbs; and (xv) the personal representatives of David William Waygood. The twelfth to sixteenth defendants did not appear. The facts are set out in the judgment.</xsl:text>
                                    </text>
                                 </p>
                              </pgrp>
                           </case:priorhist>
                        </case:headnote>
                     </case:body>
                  </CASEDOC>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:context" select="$impl:context-doc/node()"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e472">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e472">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>The glp:note within case:decisionsummary is made as the following sibling of case:decisionsummary and converted as the element note. The element case:consideredcases is made as the following sibling of case:decisionsummary and converted as case:references</xsl:message>
      <xsl:variable name="impl:with-context"
                    select="                          exists($x:result) and empty($x:result[2])"/>
      <xsl:variable name="impl:context" as="item()?">
         <xsl:choose>
            <xsl:when test="$impl:with-context">
               <xsl:sequence select="$x:result"/>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <CASEDOC type="fulltext">
               <case:body>
                  <case:headnote>
                     <case:priorhist>
                        <h>
                           <xsl:text>Preliminary issue</xsl:text>
                        </h>
                        <p>
                           <text>
                              <xsl:text>The Financial Conduct Authority (the FCA) brought proceedings against the promoters and operators, and individuals or companies associated or allegedly associated with the promoters and operators, of four investment schemes on the basis that the schemes were collective investment schemes within the meaning of </xsl:text>
                              <ci:cite searchtype="LEG-REF"
                                       status="valid"
                                       normcite="UK_ACTS 2000 8 SECT 235">
                                 <ci:content>
                                    <xsl:text>s 235</xsl:text>
                                 </ci:content>
                              </ci:cite>
                              <xsl:text> of the Financial Services and Markets Act 2000 (the FSMA), and had been mis-sold by a series of misleading statements, contrary to s 397 of the FSMA. Roth J directed that the question whether the schemes were collective investment schemes within s 235 be tried as a preliminary issue. The defendants to the proceedings were (i) Capital Alternatives Ltd; (ii) Capital Secretarial Ltd; (iii) Capital Organisation Ltd; (iv) Capital Administration Ltd; (v) MH Trustees Ltd; (vi) Marcia Dominique Hargous; (vii) Renwick Robert Haddow; (viii) Richard John Lyon Henstock; (ix) African Land Ltd; (x) Robert John McKendrick; (xi) Alan Howard Meadowcroft; (xii) Regency Capital Ltd; (xiii) Reforestation Projects Ltd; (xiv) Mark Andrew Ayres; (xv) Mark David Gibbs; and (xv) the personal representatives of David William Waygood. The twelfth to sixteenth defendants did not appear. The facts are set out in the judgment.</xsl:text>
                           </text>
                        </p>
                     </case:priorhist>
                  </case:headnote>
               </case:body>
            </CASEDOC>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="                    test:deep-equal(                      $impl:expected,                      if ( $impl:with-context ) then $impl:context else $x:result,                      2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{ $impl:successful }">
         <x:label>The glp:note within case:decisionsummary is made as the following sibling of case:decisionsummary and converted as the element note. The element case:consideredcases  is made as the following sibling of case:decisionsummary and converted as case:references</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e486">
      <xsl:message>Scenario for testing case:judgments/case:constituents child of case:content</xsl:message>
      <x:scenario>
         <x:label>Scenario for testing case:judgments/case:constituents child of case:content</x:label>
         <x:context>
            <CASEDOC type="fulltext">
               <case:body>
                  <case:content>
                     <case:judgments>
                        <case:constituents>
                           <case:constituent>
                              <person>
                                 <name.text>
                                    <emph typestyle="it">
                                       <xsl:text>Timothy Penny and Adam Temple (instructed by the Financial Conduct Authority) for the FCA.</xsl:text>
                                    </emph>
                                 </name.text>
                              </person>
                           </case:constituent>
                        </case:constituents>
                        <case:constituents>
                           <case:constituent>
                              <person>
                                 <name.text>
                                    <emph typestyle="it">
                                       <xsl:text>Derek Sweeting QC and Jason Mansell (instructed by Candey LLP) for the first to eighth defendants.</xsl:text>
                                    </emph>
                                 </name.text>
                              </person>
                           </case:constituent>
                        </case:constituents>
                        <case:constituents>
                           <case:constituent>
                              <person>
                                 <name.text>
                                    <emph typestyle="it">
                                       <xsl:text>Andrew Green QC and Paul Luckhurst (instructed by DAC Beachcroft LLP) for the ninth to eleventh defendants.</xsl:text>
                                    </emph>
                                 </name.text>
                              </person>
                           </case:constituent>
                        </case:constituents>
                     </case:judgments>
                  </case:content>
               </case:body>
            </CASEDOC>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc" as="document-node()">
               <xsl:document>
                  <CASEDOC type="fulltext">
                     <case:body>
                        <case:content>
                           <case:judgments>
                              <case:constituents>
                                 <case:constituent>
                                    <person>
                                       <name.text>
                                          <emph typestyle="it">
                                             <xsl:text>Timothy Penny and Adam Temple (instructed by the Financial Conduct Authority) for the FCA.</xsl:text>
                                          </emph>
                                       </name.text>
                                    </person>
                                 </case:constituent>
                              </case:constituents>
                              <case:constituents>
                                 <case:constituent>
                                    <person>
                                       <name.text>
                                          <emph typestyle="it">
                                             <xsl:text>Derek Sweeting QC and Jason Mansell (instructed by Candey LLP) for the first to eighth defendants.</xsl:text>
                                          </emph>
                                       </name.text>
                                    </person>
                                 </case:constituent>
                              </case:constituents>
                              <case:constituents>
                                 <case:constituent>
                                    <person>
                                       <name.text>
                                          <emph typestyle="it">
                                             <xsl:text>Andrew Green QC and Paul Luckhurst (instructed by DAC Beachcroft LLP) for the ninth to eleventh defendants.</xsl:text>
                                          </emph>
                                       </name.text>
                                    </person>
                                 </case:constituent>
                              </case:constituents>
                           </case:judgments>
                        </case:content>
                     </case:body>
                  </CASEDOC>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:context" select="$impl:context-doc/node()"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e510">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e510">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>All the case:constituents are grouped under a single case:constituents</xsl:message>
      <xsl:variable name="impl:with-context"
                    select="                          exists($x:result) and empty($x:result[2])"/>
      <xsl:variable name="impl:context" as="item()?">
         <xsl:choose>
            <xsl:when test="$impl:with-context">
               <xsl:sequence select="$x:result"/>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <CASEDOC type="fulltext">
               <case:body>
                  <case:content>
                     <case:judgments>
                        <case:constituents>
                           <case:constituent>
                              <person>
                                 <name.text>
                                    <emph typestyle="it">
                                       <xsl:text>Timothy Penny and Adam Temple (instructed by the Financial Conduct Authority) for the FCA.</xsl:text>
                                    </emph>
                                 </name.text>
                              </person>
                           </case:constituent>
                           <case:constituent>
                              <person>
                                 <name.text>
                                    <emph typestyle="it">
                                       <xsl:text>Derek Sweeting QC and Jason Mansell (instructed by Candey LLP) for the first to eighth defendants.</xsl:text>
                                    </emph>
                                 </name.text>
                              </person>
                           </case:constituent>
                           <case:constituent>
                              <person>
                                 <name.text>
                                    <emph typestyle="it">
                                       <xsl:text>Andrew Green QC and Paul Luckhurst (instructed by DAC Beachcroft LLP) for the ninth to eleventh defendants.</xsl:text>
                                    </emph>
                                 </name.text>
                              </person>
                           </case:constituent>
                        </case:constituents>
                     </case:judgments>
                  </case:content>
               </case:body>
            </CASEDOC>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="                    test:deep-equal(                      $impl:expected,                      if ( $impl:with-context ) then $impl:context else $x:result,                      2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{ $impl:successful }">
         <x:label>All the case:constituents are grouped under a single case:constituents</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e531">
      <xsl:message>Scenario for testing case:dates and glp:note child of case:content/case:judgments</xsl:message>
      <x:scenario>
         <x:label>Scenario for testing case:dates and glp:note child of case:content/case:judgments</x:label>
         <x:context>
            <CASEDOC type="fulltext">
               <case:body>
                  <case:content>
                     <case:judgments>
                        <glp:note>
                           <p>
                              <text align="right">
                                 <emph typestyle="it">
                                    <emph typestyle="it">
                                       <xsl:text>Judgment was reserved.</xsl:text>
                                    </emph>
                                 </emph>
                              </text>
                           </p>
                        </glp:note>
                        <case:dates>
                           <case:decisiondate>
                              <date day="14" month="02" year="2014">
                                 <xsl:text>14 February 2014</xsl:text>
                              </date>
                              <xsl:text>. The following judgment was delivered.</xsl:text>
                           </case:decisiondate>
                        </case:dates>
                     </case:judgments>
                  </case:content>
               </case:body>
            </CASEDOC>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc" as="document-node()">
               <xsl:document>
                  <CASEDOC type="fulltext">
                     <case:body>
                        <case:content>
                           <case:judgments>
                              <glp:note>
                                 <p>
                                    <text align="right">
                                       <emph typestyle="it">
                                          <emph typestyle="it">
                                             <xsl:text>Judgment was reserved.</xsl:text>
                                          </emph>
                                       </emph>
                                    </text>
                                 </p>
                              </glp:note>
                              <case:dates>
                                 <case:decisiondate>
                                    <date day="14" month="02" year="2014">
                                       <xsl:text>14 February 2014</xsl:text>
                                    </date>
                                    <xsl:text>. The following judgment was delivered.</xsl:text>
                                 </case:decisiondate>
                              </case:dates>
                           </case:judgments>
                        </case:content>
                     </case:body>
                  </CASEDOC>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:context" select="$impl:context-doc/node()"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e548">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e548">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>All the case:constituents are grouped under a single case:constituents</xsl:message>
      <xsl:variable name="impl:with-context"
                    select="                          exists($x:result) and empty($x:result[2])"/>
      <xsl:variable name="impl:context" as="item()?">
         <xsl:choose>
            <xsl:when test="$impl:with-context">
               <xsl:sequence select="$x:result"/>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <CASEDOC type="fulltext">
               <case:body>
                  <case:content>
                     <case:judgments>
                        <prelim>
                           <p>
                              <text align="right">
                                 <emph typestyle="it">
                                    <emph typestyle="it">
                                       <xsl:text>Judgment was reserved.</xsl:text>
                                    </emph>
                                 </emph>
                              </text>
                           </p>
                        </prelim>
                        <case:dates>
                           <case:decisiondate>
                              <xsl:text>14 February 2014. The following judgment was delivered.</xsl:text>
                           </case:decisiondate>
                        </case:dates>
                     </case:judgments>
                  </case:content>
               </case:body>
            </CASEDOC>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="                    test:deep-equal(                      $impl:expected,                      if ( $impl:with-context ) then $impl:context else $x:result,                      2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{ $impl:successful }">
         <x:label>All the case:constituents are grouped under a single case:constituents</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e562">
      <xsl:message>Scenario for testing case:judgment child of case:content/case:judgments</xsl:message>
      <x:scenario>
         <x:label>Scenario for testing case:judgment child of case:content/case:judgments</x:label>
         <x:context>
            <CASEDOC type="fulltext">
               <case:body>
                  <case:content>
                     <case:judgments>
                        <case:judgment>
                           <case:courtinfo>
                              <case:judges>
                                 <case:judge>
                                    <xsl:text>Talbot J</xsl:text>
                                 </case:judge>
                              </case:judges>
                           </case:courtinfo>
                           <case:judgmentbody>
                              <pgrp>
                                 <p>
                                    <text>
                                       <xsl:text>(delivering the judgment of the Court). In this case there were two men who, whether properly or not, I do not express an opinion, but at any rate probably within the law, were charged on one indictment. The appellant Roberts was charged with fraudulently converting certain property entrusted to him by a lady named Beatrice Anne Steel, in order that he might apply the same for the payment of a quarter's rent of a house which, I presume, was taken by her. That is an offence against the Larceny Act 1916, s 20(1)(iv)</xsl:text>
                                       <emph typestyle="it">
                                          <xsl:text>(a)</xsl:text>
                                       </emph>
                                       <xsl:text>. The other man, John Moore, was indicted under another section of the same Act, s 32 (1), for causing by false pretences money to be paid by Beatrice Anne Steel to Frederick Roberts; and also with another offence against the same subsection</xsl:text>
                                    </text>
                                 </p>
                              </pgrp>
                              <page text="[1936] 1 All ER 23 at" count="24" reporter="ALLER"/>
                              <pgrp>
                                 <p>
                                    <text>
                                       <xsl:text>and concerning the same parties, but in respect of a different sum of money. The false pretence was the same in both cases.</xsl:text>
                                    </text>
                                 </p>
                              </pgrp>
                              <pgrp>
                                 <p>
                                    <text>
                                       <xsl:text>This point arises because, during the course of the trial, Roberts was cross-examined by the counsel appearing for Moore as to a previous conviction of Roberts. Roberts had provoked that question (if I may use the expression) by stating, whether truly or not it is unnecessary to say, that Moore had signed certain documents in Roberts's presence, which Moore denied. In fact, Moore implied, if he did not actually state, that Roberts had forged the signature. That question was asked after due preparation of Roberts for something coming. It was in fact mentioned by the learned Deputy Chairman in his summing-up to the jury, and it never seems to have struck anybody at the time that there was any difficulty about it.</xsl:text>
                                    </text>
                                 </p>
                              </pgrp>
                              <blockquote>
                                 <p>
                                    <text>
                                       <xsl:text>&#x201c;</xsl:text>
                                       <emph typestyle="it">
                                          <xsl:text>(f)</xsl:text>
                                       </emph>
                                       <xsl:text> A person charged and called as a witness in pursuance of this Act shall not be asked, and if asked shall not be required to answer, any question tending to show that he has committed or been convicted of or been charged with any offence other than that wherewith he is then charged, or is of bad character, unless&#x2014;&#x201d;</xsl:text>
                                    </text>
                                 </p>
                              </blockquote>
                              <page text="[1936] 1 All ER 23 at" count="25" reporter="ALLER"/>
                              <pgrp>
                                 <p>
                                    <text>
                                       <xsl:text>Then there are three exceptions, and the third of them is the one on which this question arises:</xsl:text>
                                    </text>
                                 </p>
                              </pgrp>
                              <blockquote>
                                 <p>
                                    <text>
                                       <xsl:text>&#x201c;(iii) he has given evidence against any other person charged with the same offence.&#x201d;</xsl:text>
                                    </text>
                                 </p>
                              </blockquote>
                              <pgrp>
                                 <p>
                                    <text>
                                       <xsl:text>That must be strictly construed. One could easily conceive arguments for making that provision more extensive; that is to say, for allowing a further exception to the exemption of persons from this particular line of cross-examination. One must, however, obviously take the statute as it is, and that at once brings us face to face with the question whether it can be said that the offence or offences with which Moore was charged in this case are the same offence as that with which Roberts was charged.</xsl:text>
                                    </text>
                                 </p>
                              </pgrp>
                              <pgrp>
                                 <p>
                                    <text>
                                       <xsl:text>I have already read, so far as is necessary, the description of the offences with which these two men were respectively charged in the same indictment, and it is quite clear that it would be impossible to say that they are the same offence. Learned counsel for the Crown has very properly recognised that as a fatal bar to the correctness of this conviction. The conviction must therefore be quashed and the appellant discharged.</xsl:text>
                                    </text>
                                 </p>
                              </pgrp>
                           </case:judgmentbody>
                        </case:judgment>
                     </case:judgments>
                  </case:content>
               </case:body>
            </CASEDOC>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc" as="document-node()">
               <xsl:document>
                  <CASEDOC type="fulltext">
                     <case:body>
                        <case:content>
                           <case:judgments>
                              <case:judgment>
                                 <case:courtinfo>
                                    <case:judges>
                                       <case:judge>
                                          <xsl:text>Talbot J</xsl:text>
                                       </case:judge>
                                    </case:judges>
                                 </case:courtinfo>
                                 <case:judgmentbody>
                                    <pgrp>
                                       <p>
                                          <text>
                                             <xsl:text>(delivering the judgment of the Court). In this case there were two men who, whether properly or not, I do not express an opinion, but at any rate probably within the law, were charged on one indictment. The appellant Roberts was charged with fraudulently converting certain property entrusted to him by a lady named Beatrice Anne Steel, in order that he might apply the same for the payment of a quarter's rent of a house which, I presume, was taken by her. That is an offence against the Larceny Act 1916, s 20(1)(iv)</xsl:text>
                                             <emph typestyle="it">
                                                <xsl:text>(a)</xsl:text>
                                             </emph>
                                             <xsl:text>. The other man, John Moore, was indicted under another section of the same Act, s 32 (1), for causing by false pretences money to be paid by Beatrice Anne Steel to Frederick Roberts; and also with another offence against the same subsection</xsl:text>
                                          </text>
                                       </p>
                                    </pgrp>
                                    <page text="[1936] 1 All ER 23 at" count="24" reporter="ALLER"/>
                                    <pgrp>
                                       <p>
                                          <text>
                                             <xsl:text>and concerning the same parties, but in respect of a different sum of money. The false pretence was the same in both cases.</xsl:text>
                                          </text>
                                       </p>
                                    </pgrp>
                                    <pgrp>
                                       <p>
                                          <text>
                                             <xsl:text>This point arises because, during the course of the trial, Roberts was cross-examined by the counsel appearing for Moore as to a previous conviction of Roberts. Roberts had provoked that question (if I may use the expression) by stating, whether truly or not it is unnecessary to say, that Moore had signed certain documents in Roberts's presence, which Moore denied. In fact, Moore implied, if he did not actually state, that Roberts had forged the signature. That question was asked after due preparation of Roberts for something coming. It was in fact mentioned by the learned Deputy Chairman in his summing-up to the jury, and it never seems to have struck anybody at the time that there was any difficulty about it.</xsl:text>
                                          </text>
                                       </p>
                                    </pgrp>
                                    <blockquote>
                                       <p>
                                          <text>
                                             <xsl:text>&#x201c;</xsl:text>
                                             <emph typestyle="it">
                                                <xsl:text>(f)</xsl:text>
                                             </emph>
                                             <xsl:text> A person charged and called as a witness in pursuance of this Act shall not be asked, and if asked shall not be required to answer, any question tending to show that he has committed or been convicted of or been charged with any offence other than that wherewith he is then charged, or is of bad character, unless&#x2014;&#x201d;</xsl:text>
                                          </text>
                                       </p>
                                    </blockquote>
                                    <page text="[1936] 1 All ER 23 at" count="25" reporter="ALLER"/>
                                    <pgrp>
                                       <p>
                                          <text>
                                             <xsl:text>Then there are three exceptions, and the third of them is the one on which this question arises:</xsl:text>
                                          </text>
                                       </p>
                                    </pgrp>
                                    <blockquote>
                                       <p>
                                          <text>
                                             <xsl:text>&#x201c;(iii) he has given evidence against any other person charged with the same offence.&#x201d;</xsl:text>
                                          </text>
                                       </p>
                                    </blockquote>
                                    <pgrp>
                                       <p>
                                          <text>
                                             <xsl:text>That must be strictly construed. One could easily conceive arguments for making that provision more extensive; that is to say, for allowing a further exception to the exemption of persons from this particular line of cross-examination. One must, however, obviously take the statute as it is, and that at once brings us face to face with the question whether it can be said that the offence or offences with which Moore was charged in this case are the same offence as that with which Roberts was charged.</xsl:text>
                                          </text>
                                       </p>
                                    </pgrp>
                                    <pgrp>
                                       <p>
                                          <text>
                                             <xsl:text>I have already read, so far as is necessary, the description of the offences with which these two men were respectively charged in the same indictment, and it is quite clear that it would be impossible to say that they are the same offence. Learned counsel for the Crown has very properly recognised that as a fatal bar to the correctness of this conviction. The conviction must therefore be quashed and the appellant discharged.</xsl:text>
                                          </text>
                                       </p>
                                    </pgrp>
                                 </case:judgmentbody>
                              </case:judgment>
                           </case:judgments>
                        </case:content>
                     </case:body>
                  </CASEDOC>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:context" select="$impl:context-doc/node()"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e614">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e614">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>All the case:constituents are grouped under a single case:constituents</xsl:message>
      <xsl:variable name="impl:with-context"
                    select="                          exists($x:result) and empty($x:result[2])"/>
      <xsl:variable name="impl:context" as="item()?">
         <xsl:choose>
            <xsl:when test="$impl:with-context">
               <xsl:sequence select="$x:result"/>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <CASEDOC type="fulltext">
               <case:body>
                  <case:content>
                     <case:judgments>
                        <case:judgment>
                           <case:courtinfo>
                              <case:judges>
                                 <case:judge>
                                    <xsl:text>Talbot J</xsl:text>
                                 </case:judge>
                              </case:judges>
                           </case:courtinfo>
                           <case:judgmentbody>
                              <p>
                                 <text>
                                    <xsl:text>(delivering the judgment of the Court). In this case there were two men who, whether properly or not, I do not express an opinion, but at any rate probably within the law, were charged on one indictment. The appellant Roberts was charged with fraudulently converting certain property entrusted to him by a lady named Beatrice Anne Steel, in order that he might apply the same for the payment of a quarter&#x2019;s rent of a house which, I presume, was taken by her. That is an offence against the Larceny Act 1916, s 20(1)(iv)</xsl:text>
                                    <emph typestyle="it">
                                       <xsl:text>(a)</xsl:text>
                                    </emph>
                                    <xsl:text>. The other man, John Moore, was indicted under another section of the same Act, s 32 (1), for causing by false pretences money to be paid by Beatrice Anne Steel to Frederick Roberts; and also with another offence against the same subsection</xsl:text>
                                 </text>
                              </p>
                              <page text="[1936] 1 All ER 23 at" reporter="ALLER" count="24"/>
                              <p>
                                 <text>
                                    <xsl:text>and concerning the same parties, but in respect of a different sum of money. The false pretence was the same in both cases.</xsl:text>
                                 </text>
                              </p>
                              <p>
                                 <text>
                                    <xsl:text>This point arises because, during the course of the trial, Roberts was cross-examined by the counsel appearing for Moore as to a previous conviction of Roberts. Roberts had provoked that question (if I may use the expression) by stating, whether truly or not it is unnecessary to say, that Moore had signed certain documents in Roberts&#x2019;s presence, which Moore denied. In fact, Moore implied, if he did not actually state, that Roberts had forged the signature. That question was asked after due preparation of Roberts for something coming. It was in fact mentioned by the learned Deputy Chairman in his summing-up to the jury, and it never seems to have struck anybody at the time that there was any difficulty about it.</xsl:text>
                                 </text>
                              </p>
                              <blockquote>
                                 <p>
                                    <text>
                                       <xsl:text>&#x201c;</xsl:text>
                                       <emph typestyle="it">
                                          <xsl:text>(f)</xsl:text>
                                       </emph>
                                       <xsl:text> A person charged and called as a witness in pursuance of this Act shall not be asked, and if asked shall not be required to answer, any question tending to show that he has committed or been convicted of or been charged with any offence other than that wherewith he is then charged, or is of bad character, unless&#x2014;&#x201d;</xsl:text>
                                    </text>
                                 </p>
                              </blockquote>
                              <page text="[1936] 1 All ER 23 at" reporter="ALLER" count="25"/>
                              <p>
                                 <text>
                                    <xsl:text>Then there are three exceptions, and the third of them is the one on which this question arises:</xsl:text>
                                 </text>
                              </p>
                              <blockquote>
                                 <p>
                                    <text>
                                       <xsl:text>&#x201c;(iii) he has given evidence against any other person charged with the same offence.&#x201d;</xsl:text>
                                    </text>
                                 </p>
                              </blockquote>
                              <p>
                                 <text>
                                    <xsl:text>That must be strictly construed. One could easily conceive arguments for making that provision more extensive; that is to say, for allowing a further exception to the exemption of persons from this particular line of cross-examination. One must, however, obviously take the statute as it is, and that at once brings us face to face with the question whether it can be said that the offence or offences with which Moore was charged in this case are the same offence as that with which Roberts was charged.</xsl:text>
                                 </text>
                              </p>
                              <p>
                                 <text>
                                    <xsl:text>I have already read, so far as is necessary, the description of the offences with which these two men were respectively charged in the same indictment, and it is quite clear that it would be impossible to say that they are the same offence. Learned counsel for the Crown has very properly recognised that as a fatal bar to the correctness of this conviction. The conviction must therefore be quashed and the appellant discharged.</xsl:text>
                                 </text>
                              </p>
                           </case:judgmentbody>
                        </case:judgment>
                     </case:judgments>
                  </case:content>
               </case:body>
            </CASEDOC>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="                    test:deep-equal(                      $impl:expected,                      if ( $impl:with-context ) then $impl:context else $x:result,                      2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{ $impl:successful }">
         <x:label>All the case:constituents are grouped under a single case:constituents</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e659">
      <xsl:message>Scenario for testing table</xsl:message>
      <x:scenario>
         <x:label>Scenario for testing table</x:label>
         <x:context>
            <table colsep="0" rowsep="0" frame="none">
               <tgroup cols="4" colsep="0" rowsep="0">
                  <colspec colname="C1"
                           colnum="1"
                           colwidth="0.0104167in"
                           colsep="0"
                           rowsep="0"/>
                  <colspec colname="C2"
                           colnum="2"
                           colwidth="2.98958in"
                           colsep="0"
                           rowsep="0"/>
                  <colspec colname="C3"
                           colnum="3"
                           colwidth="0.576389in"
                           colsep="0"
                           rowsep="0"/>
                  <colspec colname="C4"
                           colnum="4"
                           colwidth="0.0104167in"
                           colsep="0"
                           rowsep="0"/>
                  <tbody>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="0" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="0" rowsep="1"/>
                        <entry namest="C3" nameend="C3" morerows="0" colsep="0" rowsep="1"/>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <emph typestyle="bf">
                              <xsl:text>Costs</xsl:text>
                           </emph>
                        </entry>
                        <entry namest="C3" nameend="C3" morerows="0" colsep="1" rowsep="1">
                           <emph typestyle="bf">
                              <xsl:text>1 Acre</xsl:text>
                           </emph>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Tonnes per year </xsl:text>
                           <emph typestyle="bf">
                              <xsl:text>paddy rice</xsl:text>
                           </emph>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>3.105</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Milled rice </xsl:text>
                           <emph typestyle="bf">
                              <xsl:text>69% of paddy rice</xsl:text>
                           </emph>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>2.1</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2"
                               nameend="C2"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1"/>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>£</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Retail price per MT in Sierra Leone*</xsl:text>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>415</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Gross profit</xsl:text>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>871</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Farm management</xsl:text>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>20</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Drying charge</xsl:text>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>36</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Pounds of Nitrates per Acre 130 lbs/Acre</xsl:text>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>42</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Pounds of Pasthates per Acre 40 lbs/Acre</xsl:text>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>21</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Pounds of Potassium per Acre 60 lbs/Acre</xsl:text>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>27</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Fungicide</xsl:text>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>13</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Herbicides</xsl:text>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>26</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Insecticides</xsl:text>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>7</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Irrigation Supplies/Gates</xsl:text>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>2</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Seed</xsl:text>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>23</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Fertilizer Application Cost</xsl:text>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>12</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Planting Cost</xsl:text>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>4</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Hauling Cost</xsl:text>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>11</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Labour Costs</xsl:text>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>10</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Tillage/Harvest Fuel Cost 16 gal/Acre</xsl:text>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>21</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                           <xsl:text>Irrigation Fuel Cost 54 gal/Acre</xsl:text>
                        </entry>
                        <entry namest="C3"
                               nameend="C3"
                               align="center"
                               morerows="0"
                               colsep="1"
                               rowsep="1">
                           <xsl:text>72</xsl:text>
                        </entry>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                     <row rowsep="0">
                        <entry namest="C1" nameend="C1" morerows="0" colsep="0" rowsep="0"/>
                        <entry namest="C2" nameend="C2" morerows="0" colsep="0" rowsep="0"/>
                        <entry namest="C3" nameend="C3" morerows="0" colsep="0" rowsep="0"/>
                        <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                     </row>
                  </tbody>
               </tgroup>
            </table>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc" as="document-node()">
               <xsl:document>
                  <table colsep="0" rowsep="0" frame="none">
                     <tgroup cols="4" colsep="0" rowsep="0">
                        <colspec colname="C1"
                                 colnum="1"
                                 colwidth="0.0104167in"
                                 colsep="0"
                                 rowsep="0"/>
                        <colspec colname="C2"
                                 colnum="2"
                                 colwidth="2.98958in"
                                 colsep="0"
                                 rowsep="0"/>
                        <colspec colname="C3"
                                 colnum="3"
                                 colwidth="0.576389in"
                                 colsep="0"
                                 rowsep="0"/>
                        <colspec colname="C4"
                                 colnum="4"
                                 colwidth="0.0104167in"
                                 colsep="0"
                                 rowsep="0"/>
                        <tbody>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="0" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="0" rowsep="1"/>
                              <entry namest="C3" nameend="C3" morerows="0" colsep="0" rowsep="1"/>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <emph typestyle="bf">
                                    <xsl:text>Costs</xsl:text>
                                 </emph>
                              </entry>
                              <entry namest="C3" nameend="C3" morerows="0" colsep="1" rowsep="1">
                                 <emph typestyle="bf">
                                    <xsl:text>1 Acre</xsl:text>
                                 </emph>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Tonnes per year </xsl:text>
                                 <emph typestyle="bf">
                                    <xsl:text>paddy rice</xsl:text>
                                 </emph>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>3.105</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Milled rice </xsl:text>
                                 <emph typestyle="bf">
                                    <xsl:text>69% of paddy rice</xsl:text>
                                 </emph>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>2.1</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2"
                                     nameend="C2"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1"/>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>£</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Retail price per MT in Sierra Leone*</xsl:text>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>415</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Gross profit</xsl:text>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>871</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Farm management</xsl:text>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>20</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Drying charge</xsl:text>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>36</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Pounds of Nitrates per Acre 130 lbs/Acre</xsl:text>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>42</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Pounds of Pasthates per Acre 40 lbs/Acre</xsl:text>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>21</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Pounds of Potassium per Acre 60 lbs/Acre</xsl:text>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>27</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Fungicide</xsl:text>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>13</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Herbicides</xsl:text>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>26</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Insecticides</xsl:text>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>7</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Irrigation Supplies/Gates</xsl:text>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>2</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Seed</xsl:text>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>23</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Fertilizer Application Cost</xsl:text>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>12</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Planting Cost</xsl:text>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>4</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Hauling Cost</xsl:text>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>11</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Labour Costs</xsl:text>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>10</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Tillage/Harvest Fuel Cost 16 gal/Acre</xsl:text>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>21</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="1" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="1" rowsep="1">
                                 <xsl:text>Irrigation Fuel Cost 54 gal/Acre</xsl:text>
                              </entry>
                              <entry namest="C3"
                                     nameend="C3"
                                     align="center"
                                     morerows="0"
                                     colsep="1"
                                     rowsep="1">
                                 <xsl:text>72</xsl:text>
                              </entry>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                           <row rowsep="0">
                              <entry namest="C1" nameend="C1" morerows="0" colsep="0" rowsep="0"/>
                              <entry namest="C2" nameend="C2" morerows="0" colsep="0" rowsep="0"/>
                              <entry namest="C3" nameend="C3" morerows="0" colsep="0" rowsep="0"/>
                              <entry namest="C4" nameend="C4" morerows="0" colsep="0" rowsep="0"/>
                           </row>
                        </tbody>
                     </tgroup>
                  </table>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:context" select="$impl:context-doc/node()"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e839">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e839">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>The empty entries are removed and the active entry count is calculated based on the entry having PCDATA and table is created accordingly</xsl:message>
      <xsl:variable name="impl:with-context"
                    select="                          exists($x:result) and empty($x:result[2])"/>
      <xsl:variable name="impl:context" as="item()?">
         <xsl:choose>
            <xsl:when test="$impl:with-context">
               <xsl:sequence select="$x:result"/>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <table frame="all">
               <tgroup cols="2" colsep="1" rowsep="1">
                  <colspec colname="1" colwidth="4305*"/>
                  <colspec colname="2" colwidth="830*"/>
                  <tbody>
                     <row>
                        <entry>
                           <emph typestyle="bf">
                              <xsl:text>Costs</xsl:text>
                           </emph>
                        </entry>
                        <entry>
                           <emph typestyle="bf">
                              <xsl:text>1 Acre</xsl:text>
                           </emph>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Tonnes per year </xsl:text>
                           <emph typestyle="bf">
                              <xsl:text>paddy rice</xsl:text>
                           </emph>
                        </entry>
                        <entry>
                           <xsl:text>3.105</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Milled rice </xsl:text>
                           <emph typestyle="bf">
                              <xsl:text>69% of paddy rice</xsl:text>
                           </emph>
                        </entry>
                        <entry>
                           <xsl:text>2.1</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry/>
                        <entry>
                           <xsl:text>£</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Retail price per MT in Sierra Leone*</xsl:text>
                        </entry>
                        <entry>
                           <xsl:text>415</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Gross profit</xsl:text>
                        </entry>
                        <entry>
                           <xsl:text>871</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Farm management</xsl:text>
                        </entry>
                        <entry>
                           <xsl:text>20</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Drying charge</xsl:text>
                        </entry>
                        <entry>
                           <xsl:text>36</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Pounds of Nitrates per Acre 130 lbs/Acre</xsl:text>
                        </entry>
                        <entry>
                           <xsl:text>42</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Pounds of Pasthates per Acre 40 lbs/Acre</xsl:text>
                        </entry>
                        <entry>
                           <xsl:text>21</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Pounds of Potassium per Acre 60 lbs/Acre</xsl:text>
                        </entry>
                        <entry>
                           <xsl:text>27</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Fungicide</xsl:text>
                        </entry>
                        <entry>
                           <xsl:text>13</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Herbicides</xsl:text>
                        </entry>
                        <entry>
                           <xsl:text>26</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Insecticides</xsl:text>
                        </entry>
                        <entry>
                           <xsl:text>7</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Irrigation Supplies/Gates</xsl:text>
                        </entry>
                        <entry>
                           <xsl:text>2</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Seed</xsl:text>
                        </entry>
                        <entry>
                           <xsl:text>23</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Fertilizer Application Cost</xsl:text>
                        </entry>
                        <entry>
                           <xsl:text>12</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Planting Cost</xsl:text>
                        </entry>
                        <entry>
                           <xsl:text>4</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Hauling Cost</xsl:text>
                        </entry>
                        <entry>
                           <xsl:text>11</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Labour Costs</xsl:text>
                        </entry>
                        <entry>
                           <xsl:text>10</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Tillage/Harvest Fuel Cost 16 gal/Acre</xsl:text>
                        </entry>
                        <entry>
                           <xsl:text>21</xsl:text>
                        </entry>
                     </row>
                     <row>
                        <entry>
                           <xsl:text>Irrigation Fuel Cost 54 gal/Acre</xsl:text>
                        </entry>
                        <entry>
                           <xsl:text>72</xsl:text>
                        </entry>
                     </row>
                  </tbody>
               </tgroup>
            </table>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="                    test:deep-equal(                      $impl:expected,                      if ( $impl:with-context ) then $impl:context else $x:result,                      2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{ $impl:successful }">
         <x:label>The empty entries are removed and the active entry count is calculated based on the entry having PCDATA and table is created accordingly</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e962">
      <xsl:message>Scenario for testing case:author child of case:content</xsl:message>
      <x:scenario>
         <x:label>Scenario for testing case:author child of case:content</x:label>
         <x:context>
            <CASEDOC type="fulltext">
               <case:body>
                  <case:content>
                     <case:author>
                        <person>
                           <name.text>
                              <xsl:text>Carla Dougan-Bacchus Barrister.</xsl:text>
                           </name.text>
                        </person>
                     </case:author>
                     <glp:note>
                        <pgrp>
                           <p>
                              <text/>
                           </p>
                        </pgrp>
                     </glp:note>
                  </case:content>
               </case:body>
            </CASEDOC>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc" as="document-node()">
               <xsl:document>
                  <CASEDOC type="fulltext">
                     <case:body>
                        <case:content>
                           <case:author>
                              <person>
                                 <name.text>
                                    <xsl:text>Carla Dougan-Bacchus Barrister.</xsl:text>
                                 </name.text>
                              </person>
                           </case:author>
                           <glp:note>
                              <pgrp>
                                 <p>
                                    <text/>
                                 </p>
                              </pgrp>
                           </glp:note>
                        </case:content>
                     </case:body>
                  </CASEDOC>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:context" select="$impl:context-doc/node()"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e975">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e975">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>case:author is retained as it is in LA</xsl:message>
      <xsl:variable name="impl:with-context"
                    select="                          exists($x:result) and empty($x:result[2])"/>
      <xsl:variable name="impl:context" as="item()?">
         <xsl:choose>
            <xsl:when test="$impl:with-context">
               <xsl:sequence select="$x:result"/>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <CASEDOC type="fulltext">
               <case:body>
                  <case:content>
                     <case:author>
                        <person>
                           <name.text>
                              <xsl:text>Carla Dougan-Bacchus Barrister.</xsl:text>
                           </name.text>
                        </person>
                     </case:author>
                  </case:content>
               </case:body>
            </CASEDOC>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="                    test:deep-equal(                      $impl:expected,                      if ( $impl:with-context ) then $impl:context else $x:result,                      2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{ $impl:successful }">
         <x:label>case:author is retained as it is in LA</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
</xsl:stylesheet>

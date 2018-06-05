<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:lnvxe="http://www.lexis-nexis.com/lnvxe"
    xmlns:lnv="http://www.lexis-nexis.com/lnv" xmlns:lnvni="http://www.lexis-nexis.com/lnvni"
    xmlns:lnclx="http://www.lexis-nexis.com/lnclx" xmlns:lncle="http://www.lexis-nexis.com/lncle"
    xmlns:lndel="http://www.lexis-nexis.com/lndel"
    xmlns:lngntxt="http://www.lexis-nexis.com/lngntxt"
    xmlns:lndocmeta="http://www.lexis-nexis.com/lndocmeta"
    xmlns:lnlit="http://www.lexis-nexis.com/lnlit" xmlns:lnci="http://www.lexis-nexis.com/lnci"
    xmlns:nitf="urn:nitf:iptc.org.20010418.NITF" xmlns:lnvx="http://www.lexis-nexis.com/lnvx"
    xmlns:ci="http://www.lexis-nexis.com/ci" xmlns:glp="http://www.lexis-nexis.com/glp"
    xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:comm="http://www.lexis-nexis.com/glp/comm"
    xmlns:cttr="http://www.lexis-nexis.com/glp/cttr"    
    xmlns:dict="http://www.lexis-nexis.com/glp/dict" 
    xmlns:docinfo="http://www.lexis-nexis.com/glp/docinfo"
    xmlns:dig="http://www.lexis-nexis.com/glp/dig"
    xmlns:frm="http://www.lexis-nexis.com/glp/frm" xmlns:in="http://www.lexis-nexis.com/glp/in"
    xmlns:leg="http://www.lexis-nexis.com/glp/leg" xmlns:xhtml="http://www.w3c.org/1999/xhtml"
    exclude-result-prefixes="#all" version="2.0">
    <!--   Dayanand singh 30 MAY 2018 -->

    <xsl:param name="selectorID" select="'digest'"/>
	
	<xsl:variable name="docinfo.selector" select="//docinfo:selector//text()"/>

    
    
    <xsl:output encoding="utf-8" indent="yes"/>
    
       
    <xsl:include href="../STREAM_SPECIFIC/digest/Digest_introduction.xsl"/>
    
    <xsl:include href="../STREAM_SPECIFIC/digest/dig.body-ChOf-digestdoc.xsl"/>
    
    <xsl:include href="../STREAM_SPECIFIC/digest/dig.info_ChOf_dig.body.xsl"/>
    
    <xsl:include href="../STREAM_SPECIFIC/digest/dig.cite-ChOf-dig.info.xsl"/>
    
    <xsl:include href="../STREAM_SPECIFIC/digest/dig.subject-ChOf-dig.info.xsl"/>
    


    <!-- START OF GENERIC XSLS -->
    
    <xsl:include href="../COMMON/withnamespace/docinfo-child-elements.xsl"/>
       
    <xsl:include href="../COMMON/nonamespace/default.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/ErrorMessage.xsl"/>

    <xsl:include href="../COMMON/nonamespace/heading.xsl"/>

    <xsl:include href="../COMMON/nonamespace/title.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/index.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/abstract.xsl"/>

    <xsl:include href="../COMMON/nonamespace/refpt.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/pgrp.xsl"/>

    <xsl:include href="../COMMON/nonamespace/p.xsl"/>

    <xsl:include href="../COMMON/nonamespace/text.xsl"/>

    <xsl:include href="../COMMON/nonamespace/emph.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/link.xsl"/>

    <xsl:include href="../COMMON/nonamespace/remotelink.xsl"/>

    <xsl:include href="../COMMON/withnamespace/ci.cite-child-elements.xsl"/>
    
    <xsl:include href="../COMMON/withnamespace/leg.info-child-element.xsl"/>
    
    <xsl:include href="../COMMON/withnamespace/digest_case.info.ChOf-dig.info.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/h.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/catchwordgrp.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/level.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/pubdate.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/date.xsl"/>

    <xsl:include href="../COMMON/nonamespace/l-li.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/bodytext.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/references.xsl"/>

    <xsl:include href="../COMMON/nonamespace/sup.xsl"/>

    <xsl:include href="../COMMON/nonamespace/sub.xsl"/>

    <xsl:include href="../COMMON/nonamespace/table.xsl"/>

    <xsl:include href="../COMMON/nonamespace/url.xsl"/>

    <xsl:include href="../COMMON/nonamespace/inlineobject.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/footnotegrp.xsl"/>

    <xsl:include href="../COMMON/nonamespace/nl.xsl"/>

    <!-- END OF GENERIC XSLS -->
</xsl:stylesheet>

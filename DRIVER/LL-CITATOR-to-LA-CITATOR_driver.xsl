<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:lnci="http://www.lexis-nexis.com/lnci"
    xmlns:lnlit="http://www.lexis-nexis.com/lnlit" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:lnvx="http://www.lexis-nexis.com/lnvx" xmlns:in="http://www.lexis-nexis.com/glp/in"
    xmlns:dict="http://www.lexis-nexis.com/glp/dict" xmlns:lnvxe="http://www.lexis-nexis.com/lnvxe"
    xmlns:ci="http://www.lexis-nexis.com/ci" xmlns:xhtml="http://www.w3c.org/1999/xhtml"
    xmlns:lncle="http://www.lexis-nexis.com/lncle"
    xmlns:lngntxt="http://www.lexis-nexis.com/lngntxt"
    xmlns:comm="http://www.lexis-nexis.com/glp/comm"
    xmlns:jrnl="http://www.lexis-nexis.com/glp/jrnl" xmlns:leg="http://www.lexis-nexis.com/glp/leg"
    xmlns:docinfo="http://www.lexis-nexis.com/glp/docinfo"
    xmlns:lndocmeta="http://www.lexis-nexis.com/lndocmeta"
    xmlns:lnv="http://www.lexis-nexis.com/lnv" xmlns:lnclx="http://www.lexis-nexis.com/lnclx"
    xmlns:lndel="http://www.lexis-nexis.com/lndel" xmlns:lnvni="http://www.lexis-nexis.com/lnvni"
    xmlns:dig="http://www.lexis-nexis.com/glp/dig" xmlns:cttr="http://www.lexis-nexis.com/glp/cttr"
    xmlns:glp="http://www.lexis-nexis.com/glp" xmlns:nitf="urn:nitf:iptc.org.20010418.NITF"
    xmlns:frm="http://www.lexis-nexis.com/glp/frm" exclude-result-prefixes="xs" version="2.0">


    <xsl:param name="selectorID" select="'citator'"/>

    <xsl:output encoding="utf-8" indent="yes"/>

    <xsl:variable name="docinfo.selector" select="//docinfo:selector//text()"/>

    <xsl:strip-space elements="*"/>

    <!-- START OF CONTENT SPECIFIC XSLS -->

    <xsl:include href="../STREAM_SPECIFIC/citator/citator_introduction.xsl"/>
    <xsl:include href="../STREAM_SPECIFIC/citator/citator_cttr.body_child-elements.xsl"/>
    <xsl:include href="../STREAM_SPECIFIC/citator/citator_diginfo_child-elements.xsl"/>    
    <xsl:include href="../STREAM_SPECIFIC/citator/citator_leginfo_child-elements.xsl"/>
    
    

    <!-- END OF CONTENT SPECIFIC XSLS -->



    <!-- START OF GENERIC XSLS -->

    <xsl:include href="../COMMON/withnamespace/docinfo-child-elements.xsl"/>

    <xsl:include href="../COMMON/nonamespace/default.xsl"/>

    <xsl:include href="../COMMON/nonamespace/ErrorMessage.xsl"/>

    <xsl:include href="../COMMON/nonamespace/heading.xsl"/>

    <xsl:include href="../COMMON/nonamespace/title.xsl"/>

    <xsl:include href="../COMMON/nonamespace/refpt.xsl"/>

    <xsl:include href="../COMMON/nonamespace/pgrp.xsl"/>

    <xsl:include href="../COMMON/nonamespace/p.xsl"/>

    <xsl:include href="../COMMON/nonamespace/text.xsl"/>

    <xsl:include href="../COMMON/nonamespace/emph.xsl"/>

    <xsl:include href="../COMMON/nonamespace/remotelink.xsl"/>

    <xsl:include href="../COMMON/withnamespace/ci.cite-child-elements.xsl"/>

    <xsl:include href="../COMMON/nonamespace/h.xsl"/>

    <xsl:include href="../COMMON/nonamespace/l-li.xsl"/>

    <xsl:include href="../COMMON/nonamespace/blockquote.xsl"/>

    <xsl:include href="../COMMON/nonamespace/sup.xsl"/>

    <xsl:include href="../COMMON/nonamespace/sub.xsl"/>

    <xsl:include href="../COMMON/nonamespace/table.xsl"/>

    <xsl:include href="../COMMON/nonamespace/url.xsl"/>

    <xsl:include href="../COMMON/nonamespace/inlineobject.xsl"/>

    <xsl:include href="../COMMON/nonamespace/nl.xsl"/>

    <xsl:include href="../COMMON/nonamespace/page.xsl"/>

    <xsl:include href="../COMMON/nonamespace/footnotegrp.xsl"/>

    <xsl:include href="../COMMON/nonamespace/person.xsl"/>

    <xsl:include href="../COMMON/nonamespace/glpnote.xsl"/>

    <xsl:include href="../COMMON/nonamespace/date.xsl"/>

    <xsl:include href="../COMMON/nonamespace/link.xsl"/>

    <xsl:include href="../COMMON/nonamespace/strike.xsl"/>

    <xsl:include href="../COMMON/nonamespace/edpnum.xsl"/>

    <xsl:include href="../COMMON/nonamespace/lnlink.xsl"/>

    <xsl:include href="../COMMON/nonamespace/form.xsl"/>

    <xsl:include href="../COMMON/nonamespace/email.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/abstract.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/pubdate.xsl"/>
    
    

    <!-- END OF GENERIC XSLS -->

</xsl:stylesheet>

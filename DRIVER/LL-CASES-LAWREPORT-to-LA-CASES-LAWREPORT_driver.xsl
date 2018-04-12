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
    xmlns:dict="http://www.lexis-nexis.com/glp/dict" xmlns:dig="http://www.lexis-nexis.com/glp/dig"
    xmlns:docinfo="http://www.lexis-nexis.com/glp/docinfo"
    xmlns:frm="http://www.lexis-nexis.com/glp/frm" xmlns:in="http://www.lexis-nexis.com/glp/in"
    xmlns:leg="http://www.lexis-nexis.com/glp/leg" xmlns:xhtml="http://www.w3c.org/1999/xhtml"
    exclude-result-prefixes="xs" version="2.0">


    <xsl:param name="selectorID" select="'cases'"/>
	
	<xsl:variable name="docinfo.selector" select="//docinfo:selector//text()"/>

    <xsl:output encoding="utf-8" indent="no"/>

    <xsl:strip-space elements="*"/>

    <!-- START OF CONTENT SPECIFIC XSLS -->

    <xsl:include href="../STREAM_SPECIFIC/cases/lawreport_cases_introduction.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/cases/lawreport_case.body_ChOf_casedoc.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/cases/lawreport_case.headnote_ChOf_case.body.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/cases/lawreport_case.info_ChOf_case.headnote.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/cases/lawreport_case.courtinfo_ChOf_case.info-and-case.judgement.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/cases/lawreport_catchwordgrp_ChOf_case.headnote.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/cases/lawreport_case.factsummary_ChOf_case.headnote.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/cases/lawreport_case.decisionsummary_ChOf_case.headnote.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/cases/lawreport_case.decisionsummary_glp.note_to_note.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/cases/lawreport_case.decisionsummary_case.consideredcases-to-case.references.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/cases/lawreport_case.priorhist_ChOf_case.headnote.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/cases/lawreport_case.content_ChOf_case.body.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/cases/lawreport_case.judgements_ChOf_case.content.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/cases/lawreport_case.constituents_case.constituent-to-case.constituent.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/cases/lawreport_case.judgement_ChOf_case.judgements.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/cases/lawreport_case.appendix_ChOf_case.content.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/cases/lawreport_case.author_ChOf_case.content.xsl"/>
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

    <!-- END OF GENERIC XSLS -->
</xsl:stylesheet>

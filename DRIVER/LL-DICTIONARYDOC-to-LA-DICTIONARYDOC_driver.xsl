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


    <xsl:param name="selectorID" select="'dictionary'"/>
	
	<xsl:variable name="docinfo.selector" select="//docinfo:selector//text()"/>

    <!--<xsl:output encoding="UTF-8" doctype-public="-//LEXISNEXIS//DTD GLP Casedoc v005//EN"
        doctype-system="dictionarydoc-norm.dtd" indent="no"/>-->
    
    <xsl:output encoding="UTF-8" indent="no"/>

    <!-- START OF CONTENT SPECIFIC XSLS -->

    <xsl:include href="../STREAM_SPECIFIC/dictionary/Dictionary_introduction.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/dictionary/dict.body-ChOf-dictionarydoc.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/dictionary/dict.term-entry_ChOf_dict.body.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/dictionary/defterm-ChOf-dict.term-entry.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/dictionary/dict.definition-ChOf-dict.term-entry.xsl"/>

    <xsl:include href="../STREAM_SPECIFIC/dictionary/dict.subtopic-dict.topicname-ChOf-dict.definition.xsl"/>

    <!-- END OF CONTENT SPECIFIC XSLS -->

    <!-- START OF GENERIC XSLS -->
    
    <xsl:include href="../COMMON/withnamespace/docinfo-child-elements.xsl"/>

    <xsl:include href="../COMMON/nonamespace/default.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/ErrorMessage.xsl"/>

    <xsl:include href="../COMMON/nonamespace/heading.xsl"/>

    <xsl:include href="../COMMON/nonamespace/title.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/index.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/see-also.xsl"/>

    <xsl:include href="../COMMON/nonamespace/refpt.xsl"/>

    <xsl:include href="../COMMON/nonamespace/p.xsl"/>

    <xsl:include href="../COMMON/nonamespace/text.xsl"/>

    <xsl:include href="../COMMON/nonamespace/emph.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/link.xsl"/>

    <xsl:include href="../COMMON/nonamespace/remotelink.xsl"/>

    <xsl:include href="../COMMON/withnamespace/ci.cite-child-elements.xsl"/>
    
    <xsl:include href="../COMMON/withnamespace/in.lev-child-elements.xsl"/>

    <xsl:include href="../COMMON/nonamespace/h.xsl"/>

    <xsl:include href="../COMMON/nonamespace/l-li.xsl"/>

    <xsl:include href="../COMMON/nonamespace/blockquote.xsl"/>

    <xsl:include href="../COMMON/nonamespace/sup.xsl"/>

    <xsl:include href="../COMMON/nonamespace/sub.xsl"/>

    <xsl:include href="../COMMON/nonamespace/table.xsl"/>

    <xsl:include href="../COMMON/nonamespace/url.xsl"/>

    <xsl:include href="../COMMON/nonamespace/inlineobject.xsl"/>
    
    <xsl:include href="../COMMON/nonamespace/footnotegrp.xsl"/>

    <xsl:include href="../COMMON/nonamespace/nl.xsl"/>

    <!-- END OF GENERIC XSLS -->
</xsl:stylesheet>

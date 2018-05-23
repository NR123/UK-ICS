<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:jrnl="http://www.lexis-nexis.com/glp/jrnl" exclude-result-prefixes="xs" version="2.0">

    <!-- Please uncomment the below xsl:include while unit-testing -->
    <!-- START: For unit-testing -->
    <!--<xsl:include href="../COMMON/nonamespace/default.xsl"/>-->
    <!-- END: For unit-testing -->

    <xsl:template match="COMMENTARYDOC[$selectorID=('commentary','commentaryleghist')]">
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

</xsl:stylesheet>

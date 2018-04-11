<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <!-- Uncomment the below xsl:param while unit testing -->
    <!-- Start: For unit-testing -->
    <!--<xsl:include href="../nonamespace/emph.xsl"/>-->
    <!-- End: For unit-testing -->

    <xsl:template match="page[$selectorID = 'cases']">
        <xsl:element name="{name()}">
            <xsl:attribute name="text" select="./@text"/>
            <xsl:attribute name="reporter" select="./@reporter"/>
            <xsl:attribute name="count" select="./@count"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="page/@*"/>

</xsl:stylesheet>

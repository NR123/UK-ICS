<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:glp="http://www.lexis-nexis.com/glp"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <!-- Uncomment the below xsl:param while unit testing -->
    <!-- Start: For unit-testing -->
    <!--<xsl:include href="../nonamespace/emph.xsl"/>-->
    <!-- End: For unit-testing -->

       
    <!-- Arun: 03May2018 - Added below template to handle glp:note element -->
    
    <!-- himanshu: 15thMay2018 - Added not condition for remove ambiguity in glp:note -->
    <xsl:template match="glp:note[not(parent::case:headnote) and not(following-sibling::case:decisionsummary) and not(parent::case:content)]">
        <xsl:element name="{name()}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
  
</xsl:stylesheet>

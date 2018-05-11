<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:glp="http://www.lexis-nexis.com/glp"
    exclude-result-prefixes="xs"
    version="2.0">
        <!-- Changed by Dayanand as per DTD 10 May 2018-->
        <!--<xsl:template match="nl[ancestor::searchhit|ancestor::emph|ancestor::alias|ancestor::glp:note|ancestor::note|ancestor::page|ancestor::fnr]">-->
           <xsl:template match="nl">
            <xsl:apply-templates/>          
            <!-- Added by Dayanand -->
            <!-- Revathi: 10May2018 - Commented the below code as whenever nl element occurs we need to suppress the element and retain the child contents-->
            <!--<xsl:if test="contains(.,'')">
                    <xsl:element name="nl"/>
                   
                    
            </xsl:if>-->
            
    </xsl:template>
</xsl:stylesheet>

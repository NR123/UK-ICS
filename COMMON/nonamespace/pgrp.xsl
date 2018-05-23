<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

    
    <xsl:template match="pgrp[$selectorID='cases']">
            <xsl:apply-templates select="@* | node()"/>        
    </xsl:template>
        
        <!-- Arun- 18May2018 Updated the below code to handle pgrp for commentary -->
        
        <xsl:template match="pgrp[$selectorID=('journal','commentary','commentaryleghist')]">
                <xsl:apply-templates/>        
        </xsl:template>
</xsl:stylesheet>
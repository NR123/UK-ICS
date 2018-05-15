<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

    
    <xsl:template match="remotelink">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@*"/>
            <xsl:if test="$selectorID='index'">
                <xsl:attribute name="refpt">
                    <xsl:call-template name="fn_refpt">
                        <xsl:with-param name="id" select="self::remotelink/@refpt"/>
                    </xsl:call-template>
                </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="status" select="'valid'"/>
            <xsl:apply-templates select="node()"/>            
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="remotelink/@href|remotelink/@hrefclass">
        <xsl:attribute name="{name()}">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="remotelink/@refpt[$selectorID='index']"/>
    

    <xsl:template match="remotelink[$selectorID='journal']">
             <xsl:element name="{name()}">
                 <xsl:attribute name="href">
                     <xsl:value-of select="self::remotelink//text()"/>
                 </xsl:attribute>
                 <xsl:apply-templates select="@* except(@href)"/>
                 <xsl:choose>
                     <xsl:when test="self::remotelink/node()[1]/name()!='emph'">
                         <emph typestyle="un" xsl:exclude-result-prefixes="#all">
                             <xsl:apply-templates select="node()"/>
                         </emph>   
                     </xsl:when>
                     <xsl:otherwise>
                         <xsl:apply-templates select="node()"/>
                     </xsl:otherwise>
                 </xsl:choose>        
             </xsl:element>         
       
    </xsl:template>
    
    <xsl:template match="remotelink/@*[$selectorID='journal']">
        <xsl:copy/>
    </xsl:template>
    
    <xsl:template match="remotelink/@*[name()!='refpt'][$selectorID='index']">
        <xsl:copy/>
    </xsl:template>
    
    <xsl:template match="remotelink/@refpt [$selectorID='dictionary']">
        <xsl:variable name="id">
            <xsl:value-of select="."/>
        </xsl:variable>

        <xsl:attribute name="refpt">
            <xsl:call-template name="fn_refpt">
                <xsl:with-param name="id" select="$id"/>
            </xsl:call-template>
        </xsl:attribute>
        <xsl:attribute name="docidref" select="'TBD'"/>
    </xsl:template>
    
        
    <xsl:template match="remotelink[parent::url][$selectorID='dictionary']">
        <xsl:apply-templates/>
    </xsl:template>
    
</xsl:stylesheet>
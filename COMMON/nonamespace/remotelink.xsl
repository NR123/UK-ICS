<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ci="http://www.lexis-nexis.com/ci"
    exclude-result-prefixes="xs"
    version="2.0">

    
    <xsl:template match="remotelink">
        <xsl:choose>
            <!-- Revathi: Added the below condition check to accomodate following changes. The generic code to handle remotelink, that is already present here is moved inside xsl:otherwise -->
            <!-- Whenever, emph has only remotelink as child in commentary data, then the emph should be suppressed and the child remotelink is converted as ci:cite/@type='paragraph-ref'
            and the PCDATA of remotelink is mapped to ci:content.-->
            <xsl:when test="(self::remotelink/parent::emph and parent::emph/not(child::node()[name()!='remotelink'])) and $selectorID=('commentary','commentaryleghist')">
                <ci:cite type='paragraph-ref' xsl:exclude-result-prefixes="#all">
                    <ci:content xsl:exclude-result-prefixes="#all">
                        <xsl:apply-templates/>
                    </ci:content>
                </ci:cite>
            </xsl:when>
            <xsl:otherwise>
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
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
	<!-- DATE: 22 May, 2018 - Modified by Himanshu to handle attribute "remotelink/@service|remotelink/@remotekey1|remotelink/@refpt|remotelink/@dpsi".
        Old Code: <xsl:template match="remotelink/@href|remotelink/@hrefclass">
    -->
    <!--     Dayanand singh 23 May 2018 added here [$selectorID='commentryleghist'] for removing ambigutiy-->
    
    <xsl:template match="remotelink/@href|remotelink/@hrefclass|remotelink/@service|remotelink/@remotekey1|remotelink/@dpsi|remotelink/@refpt[$selectorID='commentryleghist']">
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
    
     
    <xsl:template match="remotelink/@refpt[$selectorID='dictionary']">
        
        
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
    
<!--     Dayanand singh 23 May 2018 changed for retain in output xml-->
    <xsl:template match="remotelink[parent::url][$selectorID='dictionary']">
        <xsl:element name="remotelink">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>
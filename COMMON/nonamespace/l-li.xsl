<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

    
    <xsl:template match="l | li">
        
        <xsl:choose>            
            <xsl:when test="self::l/child::li/child::blockquote/*[1][name()!='l'] and $selectorID='dictionary'">
                <p>
                    <xsl:apply-templates select="@* | node()"/>
                </p>
            </xsl:when>
            <xsl:when test="self::l/li/blockquote/*[1][name()='l'] and $selectorID='dictionary'">
                <xsl:apply-templates select="@* | node()"/>
            </xsl:when>
            <xsl:when test="self::li//child::blockquote and $selectorID='dictionary'">
                <xsl:apply-templates select="node()"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:apply-templates select="@* | node()"/>
                    
                    <!-- If the following sibling li has only lilabel and l as child elements and lilabel is empty, then move then suppress the following sibling li and 
                    move the content l here into this li.-->
                    <!--<xsl:if test="self::li/following-sibling::li[1]/not(child::*[not(name()=('l')) and not(name()=('lilabel'))]) and self::li/following-sibling::li[1]/child::lilabel=' '">
                        <xsl:apply-templates select="self::li/following-sibling::li" mode="child-li"/>
                    </xsl:if>-->
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="l[$selectorID='journal']">
        <xsl:choose>
            <xsl:when test="self::l/preceding-sibling::l"/>
            <xsl:otherwise>
                <note>
                <xsl:element name="{name()}">
                <xsl:apply-templates/>
                <xsl:for-each select="following-sibling::l">
                    <xsl:apply-templates select="." mode="grp_l"/>
                </xsl:for-each>
                </xsl:element>
                </note>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="l" mode="grp_l">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="lilabel">
        <xsl:element name="{name()}">
            <xsl:choose>
                <xsl:when test="following-sibling::p">                    
                    <xsl:choose>
                        <xsl:when test="following-sibling::p/text/node()[1]/name()='' and following-sibling::p/text/node()[1]!='('">                            
                            <xsl:analyze-string select="following-sibling::p/text/text()[1]" regex="^(\([a-zA-Z0-9]+\)|&#x25cf;|&#x2022;)([\t&#160;]*)">                       
                                <xsl:matching-substring>
                                    <xsl:value-of select="regex-group(1)"/>                             
                                </xsl:matching-substring>
                            </xsl:analyze-string> 
                        </xsl:when>
                        <xsl:when test="following-sibling::p/text/node()[1]/name()='' and following-sibling::p/text/node()[1]='(' and following-sibling::p/text/node()[2]/name()='emph' and following-sibling::p/text/node()[3]/matches(.,'[a-zA-Z0-9]{1,}') and following-sibling::p/text/node()[3]/starts-with(.,')')">
                            <xsl:value-of select="concat(following-sibling::p/text/node()[1],following-sibling::p/text/node()[2]/node(),')')"/>
                        </xsl:when>
                        <xsl:otherwise>                           
                            <xsl:apply-templates/>
                        </xsl:otherwise>
                    </xsl:choose>
                   
                </xsl:when>
                <xsl:otherwise>
                     <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
           
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>
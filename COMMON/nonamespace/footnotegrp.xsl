<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:case="http://www.lexis-nexis.com/glp/case"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="footnotegrp">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
        <xsl:apply-templates select="self::footnotegrp//fnbody/page"/>
    </xsl:template>

    <xsl:template match="footnote | fnbody">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template name="fntoken">
        <xsl:param name="fnlabel_footnote"/>
        <xsl:apply-templates select="//sup[self::sup/text()=$fnlabel_footnote][ancestor::fnbody]" mode="footnote"/>        
    </xsl:template>
    <xsl:template name="fnrtoken">
        <xsl:param name="fnlabel_footnote"/>          
        <xsl:apply-templates select="//sup[self::sup/text()=$fnlabel_footnote][not(ancestor::fnbody)]" mode="footnote"/>        
    </xsl:template>
    
    <xsl:template match="//sup" mode="footnote">
        <xsl:value-of select="generate-id()"/>
    </xsl:template>

    <xsl:template match="p[parent::fnbody]">
        <footnote type="editorial">
            <xsl:attribute name="fntoken">
                <xsl:call-template name="fntoken">
                    <xsl:with-param name="fnlabel_footnote" select="self::p/text/sup/text()"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="fnrtoken">
                <xsl:call-template name="fnrtoken">
                    <xsl:with-param name="fnlabel_footnote" select="self::p/text/sup/text()"/>
                </xsl:call-template>
            </xsl:attribute>

            <xsl:if test="self::p/text/*[1][name() = 'sup']">
                <fnlabel>
                    <xsl:apply-templates select="self::p/text/sup/node()"/>
                </fnlabel>
            </xsl:if>
            <fnbody>
                <p>
                    <xsl:apply-templates/>
                </p>
            </fnbody>
        </footnote>
    </xsl:template>

    <xsl:template match="text[parent::p/parent::fnbody]">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="node() except (sup, page)"/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>

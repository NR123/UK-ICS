<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    
    <xsl:variable name="document-uri" select="document-uri(.)"/>
    <xsl:variable name="filename"
        select="substring-before(tokenize($document-uri, '/')[last()], '.')"/>

    <xsl:template name="outputErrorMessage">
        <xsl:param name="messageText" as="xs:string*" select="'Error!'"/>
        <xsl:message>
            <xsl:value-of select="concat($filename,':',$messageText)"/>
            <!--  just output the message text to the output  -->
        </xsl:message>
    </xsl:template>


    <xsl:template match="* | @*">
        <xsl:call-template name="outputErrorMessage">
            <xsl:with-param name="messageText" as="xs:string"
                select="
                    concat(if (self::*) then
                        'Unexpected Element:  name()='
                    else
                        'Unexpected Attribute:  name()=',
                    name(),
                    ' encountered in source document!:', concat($filename,'.xml'),
                    if (self::* and text()) then 
                        concat('  Text value is=', string-join(text(), '')) 
                    else
                        if (not(self::*) and . != '') then
                            concat('  Attribute value is=', .)
                        else
                            '')"
            />
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>

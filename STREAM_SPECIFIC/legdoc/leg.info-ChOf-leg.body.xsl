<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:leg="http://www.lexis-nexis.com/glp/leg"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    
    <xsl:template match="leg:info|leg:categories|leg:heading|leg:dates|leg:effdate|leg:govoffice|leg:hier|leg:hierlev|leg:laidline|leg:longtitle|leg:officialname|leg:officialnum|leg:year|leg:seriesnum">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="leg:enactdate">
        <xsl:element name="leg:assentdate">
        <xsl:variable name="month" select="'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'"/>
        <xsl:variable name="enactdate" select="."/>
          <xsl:choose>
              <xsl:when test="contains($enactdate, '/')">
                  <xsl:element name="date">
                      <xsl:variable name="DATE" select="tokenize($enactdate,'/')"/>
                      <xsl:variable name="DAY" select="number($DATE[1])"/>
                      <xsl:attribute name="day" select="format-number($DAY, '00')"/>
                      <xsl:variable name="MONTH" select="number($DATE[2])"/>
                      <xsl:attribute name="month" select="format-number($MONTH,'00')"/>
                      <xsl:attribute name="year" select="$DATE[3]"/>
                      <xsl:value-of select="."/>
                  </xsl:element>
              </xsl:when>
              <xsl:when test="contains($enactdate, (th |st |nd |rd )) and contains($enactdate,'[') and contains($enactdate,']')">
                  <xsl:variable name="enactdateExt" select="substring-before(substring-after(replace(replace(replace(replace($enactdate,'th',''),'rd',''),'nd',''),'st',''),'['),']')"/>
                      <xsl:analyze-string select="$enactdate" regex="([0-9]+)([a-z]+)?\s+([a-zA-Z]+)\s+([0-9]+)">
                          <xsl:matching-substring>
                              <xsl:element name="date">
                                  <xsl:variable name="DATE" select="tokenize($enactdateExt,' ')"/>
                                  <xsl:variable name="DAY" select="number($DATE[1])"/>
                                  <xsl:attribute name="day" select="format-number($DAY, '00')"/>
                                  <xsl:choose>
                                      <xsl:when test="lower-case($DATE[2]) = 'augu'">
                                          <xsl:attribute name="month" select="'08'"/>
                                      </xsl:when>
                                      <xsl:otherwise>
                                          <xsl:attribute name="month" select="format-number(index-of($month,$DATE[2]),'00')"/>
                                      </xsl:otherwise>
                                  </xsl:choose>
                                  <!--<xsl:attribute name="month" select="format-number(index-of($month,$DATE[2]),'00')"/>-->
                                  <xsl:attribute name="year" select="$DATE[3]"/>
                                  <xsl:value-of select="."/>
                              </xsl:element>
                          </xsl:matching-substring>
                          <xsl:non-matching-substring>
                              <xsl:value-of select="."/>
                          </xsl:non-matching-substring>
                      </xsl:analyze-string>
              </xsl:when>
              
              <xsl:when test="contains($enactdate, (th |st |nd |rd ))">
                  <xsl:variable name="enactdateExt" select="replace(replace(replace(replace($enactdate,'th',''),'rd',''),'nd',''),'st','')"/>
                  <xsl:analyze-string select="$enactdate" regex="([0-9]+)([a-z]+)?\s+([a-zA-Z]+)\s+([0-9]+)">
                      <xsl:matching-substring>
                          <xsl:element name="date">
                              <xsl:variable name="DATE" select="tokenize($enactdateExt,' ')"/>
                              <xsl:variable name="DAY" select="number($DATE[1])"/>
                              <xsl:attribute name="day" select="format-number($DAY, '00')"/>
                              <xsl:choose>
                                  <xsl:when test="lower-case($DATE[2]) = 'augu'">
                                      <xsl:attribute name="month" select="'08'"/>
                                  </xsl:when>
                                  <xsl:otherwise>
                                      <xsl:attribute name="month" select="format-number(index-of($month,$DATE[2]),'00')"/>
                                  </xsl:otherwise>
                              </xsl:choose>
                              <!--<xsl:attribute name="month" select="format-number(index-of($month,$DATE[2]),'00')"/>-->
                              <xsl:attribute name="year" select="$DATE[3]"/>
                              <xsl:value-of select="."/>
                          </xsl:element>
                      </xsl:matching-substring>
                      <xsl:non-matching-substring>
                          <xsl:value-of select="."/>
                      </xsl:non-matching-substring>
                  </xsl:analyze-string>
              </xsl:when>
              
          </xsl:choose>
        </xsl:element>
        
    </xsl:template>
    
    
    
        
   </xsl:stylesheet>

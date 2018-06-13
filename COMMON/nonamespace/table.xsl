<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <!-- Arun 24May2018 Updated the below code for handling thead -->
    <xsl:template match="table | tbody | thead">
        <xsl:choose>
            <xsl:when test="self::table/parent::fnbody">
                <!-- Revathi: 25May2018 - Commented creation of footnote element as it is handled in footnotegrp's template match - "node()[parent::fnbody]" -->
                <!--<footnote fntoken="0" xsl:exclude-result-prefixes="#all">
                    <fnbody xsl:exclude-result-prefixes="#all">-->
                <p xsl:exclude-result-prefixes="#all">
                    <xsl:element name="{name()}">
                        <xsl:apply-templates select="@* | node()"/>
                    </xsl:element>
                </p>
                <!--</fnbody>
                </footnote>-->
            </xsl:when>
            <xsl:otherwise>
                <!--<xsl:when test="self::tbody//entry/not(child::node())">
                    
                    <row xsl:exclude-result-prefixes="#all">
                        <entry xsl:exclude-result-prefixes="#all"/>
                    </row>
                </xsl:when>-->
                <!-- Revathi: Added the below code to handle when tbody's all the row/entry are self closing elements  -->
                <xsl:choose>
                    <xsl:when test="self::tbody">
                        <xsl:variable name="active_entries">
                            <xsl:for-each-group select="self::tbody//row" group-adjacent="self::row">
                                <xsl:for-each select="current-group()/entry">
                                    <xsl:if test="self::entry != ''">
                                        <xsl:value-of select="position()"/>
                                        <xsl:text>,</xsl:text>
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:for-each-group>
                        </xsl:variable>
                        
                        <!-- To get the count of thead's active entries -->
                        <xsl:variable name="thead_entries">
                            <xsl:for-each-group select="ancestor::table//thead//row"
                                group-adjacent="self::row">
                                <xsl:for-each select="current-group()/entry">
                                    <xsl:if test="self::entry != ''">
                                        <xsl:value-of select="position()"/>
                                        <xsl:text>,</xsl:text>
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:for-each-group>
                        </xsl:variable>

                        <xsl:variable name="count_thead_entries" as="xs:integer">
                            <!-- A empty space is created as the last content of $distinct_entries because of this we are getting the actual count + 1. so we are reducing the count by 1  -->
                            <xsl:value-of select="count(tokenize($thead_entries, ',')) - 1"/>
                        </xsl:variable>

                        <xsl:choose>
                            <!-- When tbody doesnt have any active entry but thead has valid entry PCDATA -->
                            <xsl:when test="$active_entries = '' and $thead_entries != ''">
                                <xsl:element name="{name()}">
                                    <xsl:for-each select="1 to $count_thead_entries">
                                        <row xsl:exclude-result-prefixes="#all">
                                            <entry xsl:exclude-result-prefixes="#all"/>
                                        </row>
                                    </xsl:for-each>
                                </xsl:element>
                            </xsl:when>
                            <!-- When both thead and tbody doesnt have any active entry -->
                            <xsl:when test="$active_entries = '' and $thead_entries = ''">
                                <xsl:element name="{name()}">
                                    <row xsl:exclude-result-prefixes="#all">
                                        <entry xsl:exclude-result-prefixes="#all"/>
                                    </row>
                                </xsl:element>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:element name="{name()}">
                                    <xsl:apply-templates select="@* | node()"/>
                                </xsl:element>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="{name()}">
                            <xsl:apply-templates select="@* | node()"/>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>

        <!-- Revathi: 10May2018 - Commented the below code as per the clarification got for the footnote handling.
    Clarification got from Awntika: Need not generate @fntoken and @fnrtoken for the footnote handling and find the relevant fnr by identifying the element sup.
    So need not move the table to the preceeding sibling p-->
        <!--<xsl:choose>
            <!-\- Revathi - 7May2018 - When table is a sibling of p, then this table should be included inside the footnote created corresponding to it preceeding sibling p -\->
            <xsl:when test="self::table/parent::fnbody and self::table/preceding-sibling::*[1][name()='p']"/>
            <xsl:otherwise>
                <xsl:element name="{name()}">
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>-->
        <!-- Revathi: 07May2018 - Moved the below code as xsl:otherwise block -->
        <!--<xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>-->
    </xsl:template>

    <!--<xsl:template match="table" mode="footnote-table">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>-->
    <xsl:template match="thead/@*">
        <xsl:copy/>
    </xsl:template>

    <xsl:template match="table/@*[not(name() = 'frame')] | row/@*"/>

    <xsl:template match="table/@frame">
        <xsl:choose>
            <xsl:when test="$selectorID = 'dictionary'"/>
            <xsl:when test="$selectorID = ('precedents', 'treatises')">
                <xsl:attribute name="frame" select="'none'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="frame" select="'all'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tgroup">

        <!-- To find which entries has content. Because colspec is created for the active entries only. And the empty entries are suppressed in LA output file.-->
        <xsl:variable name="active_entries">
            <xsl:for-each-group select="self::tgroup//row" group-adjacent="self::row">
                <xsl:for-each select="current-group()/entry">
                    <xsl:if test="self::entry != ''">
                        <xsl:value-of select="position()"/>
                        <xsl:text>,</xsl:text>
                    </xsl:if>
                </xsl:for-each>

            </xsl:for-each-group>
        </xsl:variable>

        <!-- The $active_entries has all the active entry count for all the rows. So to get the distinct values of the active entries the below $distinct_entries is created.-->
        <xsl:variable name="distinct_entries">
            <xsl:value-of select="distinct-values(tokenize($active_entries, ','))"/>
        </xsl:variable>


        <!-- To find the number of active entries-->
        <xsl:variable name="Maxcols" as="xs:integer">
            <!-- A empty space is created as the last content of $distinct_entries because of this we are getting the actual count + 1. so we are reducing the count by 1  -->
            <xsl:value-of select="count(tokenize($distinct_entries, ' ')) - 1"/>
        </xsl:variable>

        <xsl:element name="{name()}">
            <xsl:attribute name="cols">
                <xsl:choose>
                    <!-- Revathi - 04May2018- Added the below condition to chk whether all the entries are junk entries -->
                    <xsl:when test="$Maxcols &lt; 0">
                        <xsl:value-of select="'0'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$Maxcols"/>
                    </xsl:otherwise>
                </xsl:choose>

            </xsl:attribute>
            <xsl:attribute name="colsep" select="1"/>
            <xsl:attribute name="rowsep" select="1"/>

            <!-- To create colspec element based on the cols count -->
            <xsl:variable name="colspec_type">
                <!-- Revathi: 04-May-2018 - Added the condition to check $Maxcols is not less than 0-->
                <xsl:if test="$Maxcols > 0">
                    <xsl:choose>
                        <xsl:when
                            test="substring(child::colspec[1]/@colwidth, string-length(child::colspec[1]/@colwidth), 1) = '*'">
                            <xsl:value-of select="'*'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="'in'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>

            </xsl:variable>

            <!-- In input, the colspec/@colwidth is in inches, to convert this into pixel, multiply the value with 1440 and append * in the end  -->
            <xsl:variable name="colspec">
                <!-- Revathi: 04-May-2018 - Added the condition to check $Maxcols is not less than 0-->
                <xsl:if test="$Maxcols > 0">
                    <xsl:for-each select="self::tgroup/colspec">
                        <xsl:if test="position() &lt;= $Maxcols">
                            <xsl:variable name="count" select="position()" as="xs:integer"/>
                            <!-- Revathi: 22May2018 - Incorporated the pixel to pixel conversion shared by Awntika -->
                            <xsl:choose>
                                <xsl:when test="$colspec_type = '*'">
                                    <xsl:variable name="colwidths" select="../colspec/@colwidth"/>
                                    <xsl:variable name="totalwidth"
                                        select="
                                            sum(for $x in $colwidths
                                            return
                                                if (contains($x, '*')) then
                                                    xs:decimal(substring-before($x, '*'))
                                                else
                                                    xs:decimal($x))"/>
                                    <xsl:value-of
                                        select="
                                            if (contains(parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth, '*')) then
                                                concat(format-number(xs:decimal(substring-before(parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth, '*')) * 100 div $totalwidth, '#'), '*')
                                            else
                                                concat(format-number(xs:decimal(parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth) * 100 div $totalwidth, '#'), '*')"
                                    />
                                </xsl:when>
                                <!-- To calculate pixel value - Strip the 'in' in the end of colspec/@colwidth value and multiply it by 1440 and append * in the end -->
                                <xsl:otherwise>
                                    <xsl:value-of
                                        select="concat(ceiling(number(replace(parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth, 'in', ''))) * 1440, '*')"
                                    />
                                </xsl:otherwise>
                            </xsl:choose>

                            <!--<xsl:value-of
                                select="concat(number(replace(parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth, 'in', '')) * 1440, '*')"/>-->
                            <xsl:text>,</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                    <!--<xsl:choose>
                        <xsl:when test="$selectorID = 'dictionary'">
                            <xsl:for-each select="self::tgroup/colspec">
                                <xsl:if test="position() &lt;= $Maxcols">
                                    <xsl:variable name="count" select="position()" as="xs:integer"/>
                                    <!-\- To calculate pixel value - Strip the 'in' in the end of colspec/@colwidth value and multiply it by 1440 and append * in the end -\->
                                    <xsl:value-of
                                        select="concat(number(replace(parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth, 'in', '')) * 1440, '*')"/>
                                    <xsl:text>,</xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:for-each select="self::tgroup/colspec">
                                <xsl:if test="position() &lt;= $Maxcols">
                                    <xsl:variable name="count" select="position()" as="xs:integer"/>
                                    <!-\- To calculate pixel value - Strip the 'in' in the end of colspec/@colwidth value and multiply it by 1440 and append * in the end -\->
                                    <xsl:choose>
                                        <xsl:when test="$colspec_type = '*'">
                                            <xsl:value-of
                                                select="parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth"
                                            />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of
                                                select="concat(number(replace(parent::tgroup/colspec[number(tokenize($distinct_entries, ' ')[$count])]/@colwidth, 'in', '')) * 1440, '*')"
                                            />
                                        </xsl:otherwise>
                                    </xsl:choose>


                                    <xsl:text>,</xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:otherwise>
                    </xsl:choose>-->
                </xsl:if>
            </xsl:variable>

            <!-- To create colspec element based on the cols count -->
            <!-- Revathi: 04May2018 - colspec element should be created only when there are any valid entries inside the table. So added condition to check $Maxcols is > 0 -->
            <xsl:if test="$Maxcols > 0">
                <xsl:for-each select="1 to $Maxcols">
                    <colspec colname="{current()}" colwidth="{tokenize($colspec,',')[current()]}"
                        xsl:exclude-result-prefixes="#all"/>
                </xsl:for-each>
            </xsl:if>

            <!-- To create thead -->
            <xsl:for-each-group select="self::tgroup//row" group-adjacent="self::row">
                <xsl:for-each select="current-group()">
                    <xsl:if test="current-group()/entry/text() = 'TABLE'">
                        <thead xsl:exclude-result-prefixes="#all">
                            <xsl:apply-templates select="." mode="thead"/>

                        </thead>
                    </xsl:if>
                </xsl:for-each>
            </xsl:for-each-group>

            <xsl:choose>
                <!-- Revathi: 04May2018 - The rows should be processed only if there are any valid entries in the table. If there is no valid entries then we need not process all the rows.-->
                <xsl:when test="$Maxcols > 0">
                    <xsl:apply-templates select="node()"/>
                </xsl:when>
                <xsl:otherwise>
                    <tbody xsl:exclude-result-prefixes="#all">
                        <row xsl:exclude-result-prefixes="#all">
                            <entry xsl:exclude-result-prefixes="#all"/>
                        </row>
                    </tbody>
                </xsl:otherwise>
            </xsl:choose>


        </xsl:element>
    </xsl:template>

    <xsl:template match="colspec"/>

    <xsl:template match="row" mode="thead">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="node()" mode="thead"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="entry" mode="thead">
        <xsl:variable name="active_entries">
            <xsl:for-each-group select="ancestor::table//row" group-adjacent="self::row">
                <xsl:for-each select="current-group()/entry">
                    <xsl:if test="self::entry != ''">
                        <xsl:value-of select="position()"/>
                        <xsl:text>,</xsl:text>
                    </xsl:if>
                </xsl:for-each>

            </xsl:for-each-group>
        </xsl:variable>

        <!-- The $active_entries has all the active entry count for all the rows. So to get the distinct values of the active entries the below $distinct_entries is created.-->
        <xsl:variable name="distinct_entries">
            <xsl:value-of select="distinct-values(tokenize($active_entries, ','))"/>
        </xsl:variable>

        <!-- To find the number of active entries-->
        <xsl:variable name="Maxcols">

            <!-- A empty space is created as the last content of $distinct_entries because of this we are getting the actual count + 1. so we are reducing the count by 1  -->
            <xsl:value-of select="count(tokenize($distinct_entries, ' ')) - 1"/>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="self::entry/node()">
                <xsl:element name="{name()}">
                    <xsl:attribute name="namest" select="1"/>
                    <xsl:attribute name="nameend" select="$Maxcols"/>
                    <xsl:attribute name="colsep" select="'0'"/>
                    <xsl:attribute name="rowsep" select="'0'"/>
                    <xsl:apply-templates select="node()"/>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="row">

        <xsl:choose>
            <xsl:when test="self::row//entry/text() = 'TABLE'"/>
            <xsl:when test="self::row//entry/node()">
                <xsl:element name="{name()}">
                    <xsl:variable name="count_of_valid_entry" as="xs:integer">
                        <xsl:value-of select="count(self::row//entry/node())"/>
                    </xsl:variable>

                    <xsl:variable name="active_entries">
                        <xsl:for-each-group select="ancestor::table//row" group-adjacent="self::row">
                            <xsl:for-each select="current-group()/entry">
                                <xsl:if test="self::entry != ''">
                                    <xsl:value-of select="position()"/>
                                    <xsl:text>,</xsl:text>
                                </xsl:if>
                            </xsl:for-each>

                        </xsl:for-each-group>
                    </xsl:variable>

                    <!-- The $active_entries has all the active entry count for all the rows. So to get the distinct values of the active entries the below $distinct_entries is created.-->
                    <xsl:variable name="distinct_entries">
                        <xsl:value-of select="distinct-values(tokenize($active_entries, ','))"/>
                    </xsl:variable>

                    <!-- To find the number of active entries-->
                    <xsl:variable name="count_of_max_entry" as="xs:integer">
                        <!-- A empty space is created as the last content of $distinct_entries because of this we are getting the actual count + 1. so we are reducing the count by 1  -->
                        <xsl:value-of select="count(tokenize($distinct_entries, ' ')) - 1"/>
                    </xsl:variable>

                    <!-- Calculate count of empty entries to be created to tally the cols count (This is to ensure proper alignment of all the rows inside table) -->
                    <xsl:variable name="diff_count" as="xs:integer"
                        select="$count_of_max_entry - $count_of_valid_entry"/>

                    <xsl:choose>
                        <xsl:when test="$diff_count > 0">
                            <xsl:for-each select="1 to $diff_count">
                                <entry xsl:exclude-result-prefixes="#all">
                                    <xsl:if
                                        test="$selectorID = 'dictionary' or $docinfo.selector = 'Transcripts'">
                                        <xsl:attribute name="colsep" select="'0'"/>
                                        <xsl:attribute name="rowsep" select="'0'"/>
                                    </xsl:if>
                                </entry>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>


                    <xsl:apply-templates select="@* | node()"/>
                </xsl:element>
            </xsl:when>
        </xsl:choose>

    </xsl:template>

    <xsl:template match="entry">
        <xsl:choose>
            <xsl:when test="self::entry/node()">
                <xsl:element name="{name()}">
                    <xsl:if test="$selectorID = 'dictionary' or $docinfo.selector = 'Transcripts'">
                        <xsl:attribute name="colsep" select="'0'"/>
                        <xsl:attribute name="rowsep" select="'0'"/>
                    </xsl:if>
                    <!-- Revathi: 22May2016 - Added the below condition check. As the entry PCDATA in commentary should be wrapped by the element p-limited-->
                    <xsl:choose>
                        <xsl:when test="$selectorID = ('precedents', 'treatises')">
                            <p-limited xsl:exclude-result-prefixes="#all">
                                <xsl:apply-templates select="node()"/>
                            </p-limited>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="node()"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!--<xsl:apply-templates select="node()"/>-->
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>


</xsl:stylesheet>

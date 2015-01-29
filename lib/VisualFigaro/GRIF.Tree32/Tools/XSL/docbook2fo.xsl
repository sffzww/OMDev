<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	version="1.0"
	xmlns="http://www.w3.org/TR/xhtml1/transitional"
	exclude-result-prefixes="#default">
        
<xsl:import href="../../Lib/docbook/fo/docbook.xsl"/>

<!-- Ne pas mettre d'image draft.png car on n'est pas suppose avoir de connexion-->
<xsl:variable name="draft.watermark.image"></xsl:variable>
<!-- A4 -->
<xsl:variable name="paper.type">A4</xsl:variable>
<!-- Ne pas indenter le text/tableau/autres .... -->
<xsl:param name="body.start.indent">0pt</xsl:param>

<!-- Marges -->
<xsl:param name="margin.left.inner" select="'0.8cm'"></xsl:param>
<xsl:param name="page.margin.outer" select="'0.8cm'"></xsl:param>
<xsl:param name="page.margin.top" select="'0.5cm'"></xsl:param>
<xsl:param name="page.margin.bottom" select="'0.5cm'"></xsl:param>

<xsl:attribute-set name="informaltable.properties">
  <xsl:attribute name="background-color">
    <xsl:choose>
      <xsl:when test="ancestor-or-self::table[1]/@tabstyle='shaded' or
        ancestor-or-self::informaltable[1]/@tabstyle='shaded'">#EEEEEE</xsl:when>
      <xsl:otherwise>inherit</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
  
  <xsl:attribute name="border-width">
    <xsl:choose>
      <xsl:when test="ancestor-or-self::table[1]/@tabstyle='shaded' or
        ancestor-or-self::informaltable[1]/@tabstyle='shaded'">0.5mm</xsl:when>
      <xsl:otherwise>inherit</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
  
   <xsl:attribute name="border-style">
    <xsl:choose>
      <xsl:when test="ancestor-or-self::table[1]/@tabstyle='shaded' or
        ancestor-or-self::informaltable[1]/@tabstyle='shaded'">solid</xsl:when>
      <xsl:otherwise>inherit</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:attribute-set>

<xsl:template name="table.cell.block.properties">
  <xsl:if test="ancestor::thead">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:if>
   <xsl:if test="ancestor-or-self::entry[1]/@cellstyle='important'">
  	 <xsl:attribute name="font-size">12</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:if>
</xsl:template>

<xsl:attribute-set name="section.title.properties">
  <xsl:attribute name="font-family">Verdana,sans-serif</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <!-- font size is calculated dynamically by section.heading template -->
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  <xsl:attribute name="space-before.minimum">1.2em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">1.4em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.6em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">1.0em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">1.2em</xsl:attribute>
  <xsl:attribute name="text-align">center</xsl:attribute>
  <xsl:attribute name="start-indent"><xsl:value-of select="$title.margin.left"></xsl:value-of></xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="section.title.level1.properties">
  <xsl:attribute name="font-size">12pt</xsl:attribute>
  <xsl:attribute name="font-style">italic</xsl:attribute>
  <!-- <xsl:attribute name="color">rgb(255,102,00)</xsl:attribute>
  <xsl:attribute name="border-bottom">1pt solid rgb(192,192,192)</xsl:attribute>
  <xsl:attribute name="padding-bottom">1pt</xsl:attribute>-->
</xsl:attribute-set>

<xsl:attribute-set name="section.level1.properties">
  <xsl:attribute name="font-size">8pt</xsl:attribute>
  <!-- <xsl:attribute name="font-style">italic</xsl:attribute>
  <xsl:attribute name="color">rgb(255,102,00)</xsl:attribute>
  <xsl:attribute name="border-bottom">1pt solid rgb(192,192,192)</xsl:attribute>
  <xsl:attribute name="padding-bottom">1pt</xsl:attribute>-->
</xsl:attribute-set>

<!-- Desactivation de la table des matieres -->
<xsl:param name="generate.toc">
</xsl:param>

<xsl:param name="generate.index" select="0" />

<!-- Redefine header.content to output filename and Grif version for PDF report-->
<xsl:variable name="header.column.widths">4 0 1</xsl:variable>
<xsl:template name="header.content">
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>
  <!--
  <fo:block>
    <xsl:value-of select="$pageclass"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="$sequence"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="$position"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="$gentext-key"/>
  </fo:block>
  -->
  <fo:block>
    <!-- sequence can be odd, even, first, blank -->
    <!-- position can be left, center, right -->
    <xsl:choose>
      <xsl:when test="$sequence = 'blank'">
        <!-- nothing -->
      </xsl:when>
      <xsl:when test="$position='left'">
        <!-- Same for odd, even, empty, and blank sequences -->
        <xsl:call-template name="draft.text"/>
        <!-- Use productname tag of articleinfo for printing filename -->
        <xsl:value-of select="/book/article/articleinfo/productname"/>
      </xsl:when>
      <xsl:when test="($sequence='odd' or $sequence='even') and $position='center'">
        <xsl:if test="$pageclass != 'titlepage'">
          <xsl:choose>
            <xsl:when test="ancestor::book and ($double.sided != 0)">
              <fo:retrieve-marker retrieve-class-name="section.head.marker"
                                  retrieve-position="first-including-carryover"
                                  retrieve-boundary="page-sequence"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates select="." mode="titleabbrev.markup"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </xsl:when>
      <xsl:when test="$position='center'">
        <!-- nothing for empty and blank sequences -->
      </xsl:when>
      <xsl:when test="$position='right'">
        <!-- Same for odd, even, empty, and blank sequences -->
        <xsl:call-template name="draft.text"/>
        <!-- Use productnumber tag of articleinfo for printing Grif version -->
        <xsl:value-of select="/book/article/articleinfo/productnumber"/>
      </xsl:when>
      <xsl:when test="$sequence = 'first'">
        <!-- nothing for first pages -->
      </xsl:when>
      <xsl:when test="$sequence = 'blank'">
        <!-- nothing for blank pages -->
      </xsl:when>
    </xsl:choose>
  </fo:block>
</xsl:template>

	<!-- Inline modifier -->
	<!-- =============== -->
<!-- <xsl:template match="important">
  <xsl:call-template name="inline.boldseq"/>
</xsl:template> -->

 
<xsl:attribute-set name="nongraphical.admonition.properties">
  <xsl:attribute name="font-size">1pt</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">0em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0em</xsl:attribute>
  <xsl:attribute name="margin-left">0pt</xsl:attribute>
  <xsl:attribute name="margin-right">0pt</xsl:attribute>
<!--  <xsl:attribute name="border-top">1pt solid rgb(0,128,0)</xsl:attribute>
  <xsl:attribute name="border-bottom">1pt solid rgb(0,128,0)</xsl:attribute>
  <xsl:attribute name="border-left">1pt solid rgb(0,128,0)</xsl:attribute>
  <xsl:attribute name="border-right">1pt solid rgb(0,128,0)</xsl:attribute>-->
  <xsl:attribute name="padding-top">0pt</xsl:attribute>
  <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
  <xsl:attribute name="padding-left">0pt</xsl:attribute>
  <xsl:attribute name="padding-right">0pt</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="admonition.title.properties">
  <xsl:attribute name="font-size">1pt</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  <xsl:attribute name="color">rgb(255,255,255)</xsl:attribute>
  <xsl:attribute name="background-color">rgb(255,255,255)</xsl:attribute>
<!--  <xsl:attribute name="padding-top">1pt</xsl:attribute>
  <xsl:attribute name="padding-bottom">1pt</xsl:attribute>
  <xsl:attribute name="padding-left">1pt</xsl:attribute>
  <xsl:attribute name="padding-right">1pt</xsl:attribute>-->
</xsl:attribute-set>


<xsl:attribute-set name="admonition.properties">
  <xsl:attribute name="color">rgb(0,0,0)</xsl:attribute>
  <xsl:attribute name="font-size">11pt</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
</xsl:attribute-set>

<!-- ================================== -->
<!-- Coupure des mots dans les cellules -->
<!-- ================================== -->
<!-- CA rajoute des espace invisible dans les 
entrées de tableau (contenant un para) pour couper les mots -->
<xsl:template match="entry/para">
	<fo:block country="en" hyphenate="true" wrap-option="wrap" >
	  <xsl:variable name="field_contents">
	    <xsl:value-of select="."/>
	  </xsl:variable>
	  <xsl:variable name="field_size">
	    <xsl:value-of select="string-length(.)"/>
	  </xsl:variable>
	  <xsl:call-template name="bit_stuffer">
	    <xsl:with-param name="field_contents" select="$field_contents"/>
	    <xsl:with-param name="field_size" select="$field_size"/>
	  </xsl:call-template>
	</fo:block>
</xsl:template>

<xsl:template name="bit_stuffer">
    <xsl:param name="field_contents"/>
    <xsl:param name="field_size" />
    <xsl:param name="count" select="1" />
    <xsl:if test="($count - 1) &lt; $field_size">
      <xsl:value-of select="substring($field_contents, $count,1)"/><xsl:text>&#x200b;</xsl:text>
      <xsl:call-template name="bit_stuffer">
        <xsl:with-param name="count" select="$count + 1"/>
        <xsl:with-param name="field_contents" select="$field_contents"/>
        <xsl:with-param name="field_size" select="$field_size"/>
      </xsl:call-template>
    </xsl:if>
 </xsl:template>
 

 
</xsl:stylesheet> 
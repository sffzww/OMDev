<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="grif2docbook.xsl"/>
<xsl:output method="xml" encoding="ISO-8859-1"/>

<xsl:template match="/export/datatable[@type='1']">
	<xsl:text>
	</xsl:text>
	<section>
		<informaltable> <tgroup cols="3"> 
			<colspec colnum="1" colwidth="30" align="center"/>
			<colspec colnum="2" colwidth="1*"/>
			<colspec colnum="3" colwidth="3*"/>
			<thead>
		      <row>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='num']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='event']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='law']/@val"/></entry>
		      </row>
		    </thead>
		    
			<tbody> 
				<xsl:apply-templates/>
			</tbody>
		</tgroup> </informaltable>
	</section>
	<xsl:text>
	</xsl:text>
</xsl:template>

<xsl:template match="/export/datatable/data[@type='1']">
	<xsl:call-template name="template-event"/>
</xsl:template>

<xsl:template name="template-event">
	<row>
		<entry><xsl:value-of select="prop[@key='ID']/@val"/></entry> 
		<entry><xsl:value-of select="prop[@key='Name']/@val"/></entry> 
		<entry><xsl:apply-templates select="law"/></entry> 
	</row>
	<xsl:text>
	</xsl:text>
</xsl:template>

<xsl:template match="law">
		<xsl:value-of select="@name"/>
		<xsl:text> :
		</xsl:text>
	<xsl:call-template name="lawFunc">
      <xsl:with-param name="debut" select="1" />
      <xsl:with-param name="fin" select="count(param)" />
    </xsl:call-template>
</xsl:template>

<xsl:template name="lawFunc">
  <xsl:param name="debut" select="0" />
  <xsl:param name="fin" select="0" />
  <xsl:if test="$debut &lt;= $fin">
  	<xsl:apply-templates select="param[$debut]"/>
  	<xsl:if test="$debut &lt; $fin">
  		<xsl:text>, </xsl:text>
  	</xsl:if>
    <xsl:call-template name="lawFunc">
      <xsl:with-param name="debut" select="($debut)+1" />
      <xsl:with-param name="fin" select="$fin" />
    </xsl:call-template>
  </xsl:if>
</xsl:template>


<xsl:template match="param">
	<xsl:value-of select="@name"/>
	<xsl:text> = </xsl:text>
	<xsl:value-of select="@value"/>
</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="xml" encoding="ISO-8859-1"/>

<xsl:strip-space elements="*"/>

<xsl:template match="/">
	<xsl:apply-templates/>
</xsl:template>
<xsl:param name="lang" select="/export/@lang"/>
<xsl:param name="resfile" select="concat(/export/@lang,'.xml')"/>

<xsl:template match="export">
<xsl:text>
</xsl:text>
	<article>
		<xsl:attribute name="lang">
		<xsl:value-of select="$lang"/>
		</xsl:attribute>
		<xsl:apply-templates/>
	<xsl:text>
	</xsl:text>
	</article>
</xsl:template>

<xsl:template match="gen">
	<xsl:text>
	</xsl:text>
	<articleinfo>
		<xsl:text>
		</xsl:text>
		<title><xsl:value-of select="@name"/></title>
		<subtitle><xsl:value-of select="@vers"/></subtitle>
		<abstract>
			<para>
				<xsl:value-of select="document($resfile)/labels/label[@key='report']/@val"/> : 
				<xsl:value-of select="/export/@date"/>
			</para>
			<para>
				<xsl:value-of select="document($resfile)/labels/label[@key='file']/@val"/> : 
				<xsl:value-of select="@file"/>
			</para>
			<para>
				<xsl:value-of select="document($resfile)/labels/label[@key='pid']/@val"/> : 
				<xsl:value-of select="@pid"/>
			</para>
			<para>
				<xsl:value-of select="document($resfile)/labels/label[@key='comment']/@val"/> : 
				<xsl:apply-templates/>
			</para>
			
		</abstract>
		<xsl:text>
		</xsl:text>
	</articleinfo>
</xsl:template>

<xsl:template match="page[@type='page']">
	<section>
		<para>
			<informalfigure> <mediaobject> <imageobject> 
				<imagedata align="center" fileref="{@img}" scale="40"/>
			</imageobject> </mediaobject> </informalfigure>  
		</para> 
	</section>
</xsl:template>

<xsl:template match="/export/datatable[@type='100']">
	<xsl:text>
	</xsl:text>
	<section>
		<informaltable> <tgroup cols="3"> 
			<colspec colnum="1" colwidth="90"/>
			<colspec colnum="2" colwidth="90"/>
			<thead>
		      <row>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='name']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='value']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='definition']/@val"/></entry>
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

<xsl:template match="/export/datatable[@type='101']">
	<xsl:text>
	</xsl:text>
	<section>
		<informaltable> <tgroup cols="2"> 
			<colspec colnum="1" colwidth="150"/>
			<colspec colnum="1" colwidth="100"/>
			<thead>
		      <row>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='name']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='value']/@val"/></entry>
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

<xsl:template match="/export/datatable/data[@type='100']">
	<xsl:call-template name="template-var"/>
</xsl:template>

<xsl:template name="template-var">
	<row>
		<entry><para><xsl:value-of select="prop[@key='Name']/@val"/></para></entry> 
		<entry><para><xsl:value-of select="prop[@key='Init']/@val"/></para></entry> 
		<entry><para><xsl:value-of select="prop[@key='Define']/@val"/></para></entry>
	</row>
	<xsl:text>
	</xsl:text>
</xsl:template>

<xsl:template match="/export/datatable/data[@type='101']">
	<xsl:call-template name="template-cst"/>
</xsl:template>

<xsl:template name="template-cst">
	<row>
		<entry><para><xsl:value-of select="prop[@key='Name']/@val"/></para></entry> 
		<entry><para><xsl:value-of select="prop[@key='Init']/@val"/></para></entry>
	</row>
	<xsl:text>
	</xsl:text>
</xsl:template>

</xsl:stylesheet>
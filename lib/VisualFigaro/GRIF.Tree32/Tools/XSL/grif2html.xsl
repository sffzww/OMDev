<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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
	<html>
		<xsl:attribute name="lang">
		<xsl:value-of select="$lang"/>
		</xsl:attribute>
		<xsl:apply-templates select="gen"/>
		
		<body>
		<xsl:apply-templates select="pages"/>
		<xsl:apply-templates select="datatable "/>
		</body>
	<xsl:text>
	</xsl:text>
	</html>
</xsl:template>

<xsl:template match="moca">
	<xsl:text>
	</xsl:text>
	<html>
		<body>
		<xsl:apply-templates select="options"/>
		<xsl:apply-templates select="states"/>
		</body>
	<xsl:text>
	</xsl:text>
	</html>
</xsl:template>

<xsl:template match="options">
	<p>
		<xsl:apply-templates select="option"/>
	</p>
</xsl:template>

<xsl:template match="option">
	<p>
		<xsl:value-of select="@name"/> : 
		<xsl:value-of select="@value"/>
	</p>
</xsl:template>

<xsl:template match="states">
	<p/>
	<p>
		<h1>
			TS<xsl:value-of select="@type"/>
		</h1>
		
		<xsl:apply-templates select="state"/>
	</p>
</xsl:template>

<xsl:template match="state">
	<p>
		<h2>
			<xsl:value-of select="@name"/>
		</h2>
		<table border="2px">
			<tr>
				<td>Time</td>
				<td>Value</td>
				<td>SD</td>
			</tr>
			<xsl:apply-templates select="point"/>
		</table>
	</p>
</xsl:template>
<xsl:template match="point">
	<tr>
		<td><xsl:value-of select="@time"/></td>
		<td><xsl:value-of select="@value"/></td>
		<td><xsl:value-of select="@sd"/></td>
	</tr>
</xsl:template>

<xsl:template match="gen">
	<xsl:text>
	</xsl:text>
	<head>
		<xsl:text>
		</xsl:text>
		<p>
			<xsl:value-of select="document($resfile)/labels/label[@key='name']/@val"/> : 
			<xsl:value-of select="@name"/>
		</p>
		<p>
			<xsl:value-of select="document($resfile)/labels/label[@key='version']/@val"/> : 
			<xsl:value-of select="@vers"/>
		</p>
		<p>
			<xsl:value-of select="document($resfile)/labels/label[@key='file']/@val"/> : 
			<xsl:value-of select="@file"/>
		</p>
		<p>
			<xsl:value-of select="document($resfile)/labels/label[@key='pid']/@val"/> : 
			<xsl:value-of select="@pid"/>
		</p>
		<p>
			<xsl:value-of select="document($resfile)/labels/label[@key='comment']/@val"/> : 
			<xsl:apply-templates/>
		</p>
		
		<xsl:text>
		</xsl:text>
	</head>
</xsl:template>

<xsl:template match="page">
	<p>
		<img src="file://{@img}" alt=""/>
	</p> 
</xsl:template>

<xsl:template match="/export/datatable[@type='100']">
	<xsl:text>
	</xsl:text>
	<section>
		<table border="2px">
			<tr>
				<td><xsl:value-of select="document($resfile)/labels/label[@key='name']/@val"/></td> 
				<td><xsl:value-of select="document($resfile)/labels/label[@key='value']/@val"/></td>
				<td><xsl:value-of select="document($resfile)/labels/label[@key='definition']/@val"/></td>
			</tr>
			<xsl:apply-templates/>
		</table>
	</section>
	<xsl:text>
	</xsl:text>
</xsl:template>

<xsl:template match="/export/datatable[@type='101']">
	<xsl:text>
	</xsl:text>
	<section>
		<table border="2px">
			<tr>
				<td><xsl:value-of select="document($resfile)/labels/label[@key='name']/@val"/></td> 
				<td><xsl:value-of select="document($resfile)/labels/label[@key='value']/@val"/></td>
			</tr>
			<xsl:apply-templates/>
		</table>
	</section>
	<xsl:text>
	</xsl:text>
</xsl:template>

<xsl:template match="/export/datatable/data[@type='100']">
	<xsl:call-template name="template-var"/>
</xsl:template>

<xsl:template name="template-var">
	<tr>
		<td><xsl:value-of select="prop[@key='Name']/@val"/></td> 
		<td><xsl:value-of select="prop[@key='Init']/@val"/></td> 
		<td><xsl:value-of select="prop[@key='Define']/@val"/></td>
	</tr>
	<xsl:text>
	</xsl:text>
</xsl:template>

<xsl:template match="/export/datatable/data[@type='101']">
	<xsl:call-template name="template-cst"/>
</xsl:template>

<xsl:template name="template-cst">
	<tr>
		<td><xsl:value-of select="prop[@key='Name']/@val"/></td> 
		<td><xsl:value-of select="prop[@key='Init']/@val"/></td> 
	</tr>
	<xsl:text>
	</xsl:text>
</xsl:template>

</xsl:stylesheet>
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="tree2docbookCTGcommon.xsl"/>

<xsl:output method="xml" encoding="ISO-8859-1" indent="yes"/>

<xsl:template match="/">
	<book>
		<!-- Attributes -->
		<xsl:attribute name="lang">
			<xsl:value-of select="$lang"/>
		</xsl:attribute>
		
		<!-- SIF -->
		<xsl:apply-templates select="export/datatable[@type='501']/sif" mode="sif-body"/>
	</book>
</xsl:template>

<xsl:template match="sif" mode="sif-body">
	<article>
		<!-- Header -->
		<xsl:call-template name="tHeader"/>
		
		<!-- Heading1 data -->
		<xsl:apply-templates select="." mode="heading1"/>
		<!-- Heading2 data -->
		<xsl:apply-templates select="." mode="heading2"/>
		
		<xsl:variable name="var-sif-id" select="@num"/>
		<xsl:variable name="var-page-idx" select="@page-idx"/>
		
		<!-- Architectural picture -->
		<xsl:call-template name="tPicture">
			<xsl:with-param name="pFileRef" select="/export/pages/page[@idx=$var-page-idx]/tool[@type='grp']/@imggrp"/>
			<xsl:with-param name="pScale" select="25"/>
		</xsl:call-template>
	
		<section>
			<title>
				<xsl:choose>
					<xsl:when test="@lasttype = 'PFD'">
						<xsl:value-of select="concat( concat(
										concat(document($resfile)/labels/label[@key='textundercurvePFD']/@val,@period),
										concat(' ',document($resfile)/labels/label[@key='YEAR']/@val)),
									 	concat(' = ',@formatedResult)
									 )"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat( concat(
										concat(document($resfile)/labels/label[@key='textundercurvePFH']/@val,@period),
										concat(' ',document($resfile)/labels/label[@key='YEAR']/@val)),
									  	concat(' = ',@formatedResult)
									 )"/>
					</xsl:otherwise>
				</xsl:choose>
			</title>
		</section>
		
		<!-- Curve data -->
		<xsl:apply-templates select="." mode="curve"/>
		
		<!-- Synthesis of chanels configuration -->
		<xsl:apply-templates select="." mode="beta"/>

		<!-- Synthesis of component parameters-->
		<xsl:apply-templates select="/export/datatable[@type='500']" mode="data-body">
			 <xsl:with-param name="param-sif-id" select="$var-sif-id"/>
		</xsl:apply-templates>
	</article>
</xsl:template>

<xsl:template match="datatable[@type='500']" mode="data-body">
	<xsl:param name="param-sif-id"/>
	<section>
		<informaltable> <tgroup cols="4"> 
			<colspec colname="c1" colnum="1" colwidth="0.7*"/>
			<colspec colname="c2" colnum="2" colwidth="0.6*"/>
			<colspec colname="c3" colnum="3" colwidth="1*"/>
			<colspec colname="c4" colnum="4" colwidth="4*"/>
			<thead>
				  <row>
					<entry></entry>
					<entry namest="c2" nameend="c3" align="center">
						<xsl:value-of select="document($resfile)/labels/label[@key='component']/@val"/>
					</entry>
					<entry><xsl:value-of select="document($resfile)/labels/label[@key='parameters']/@val"/></entry>
				  </row>
				</thead>
				<tbody>
					<!-- La première colonne contient le nom de la partie et le Beta InterChannel -->
					<xsl:variable name="vBetasensors" select="/export/datatable[@type='501']/sif[@num=$param-sif-id]/sifpart[@id='SENSORS']/sifprop[@name='beta']"/>
					<xsl:variable name="vSensorstitle" select="document($resfile)/labels/label[@key='sensors']/@val"/>
					<xsl:call-template name="tDisplayActuatorSensorInTable">
						<xsl:with-param name="pComp" select="data[@type='500' and @sif=$param-sif-id][prop[@key='SifPart' and @val='SENSORS']][1]"/>
						<xsl:with-param name="pCount" select="count(data[@type='500' and @sif=$param-sif-id][prop[@key='SifPart' and @val='SENSORS']])-1"/>
						<xsl:with-param name="pType" select="$vSensorstitle"/>
						<xsl:with-param name="pFirst">true</xsl:with-param>
					</xsl:call-template>
					<xsl:for-each select="data[@type='500' and @sif=$param-sif-id][prop[@key='SifPart' and @val='SENSORS']][position()>1]">
						<xsl:call-template name="tDisplayActuatorSensorInTable">
							<xsl:with-param name="pComp" select="."/>
						</xsl:call-template>
					</xsl:for-each>
					
					<xsl:variable name="vBetaactuators" select="/export/datatable[@type='501']/sif[@num=$param-sif-id]/sifpart[@id='ACTUATORS']/sifprop[@name='beta']"/>
					<xsl:variable name="vActuatorstitle" select="document($resfile)/labels/label[@key='actuators']/@val"/>
					<xsl:call-template name="tDisplayActuatorSensorInTable">
						<xsl:with-param name="pComp" select="data[@type='500' and @sif=$param-sif-id][prop[@key='SifPart' and @val='ACTUATORS']][1]"/>
						<xsl:with-param name="pCount" select="count(data[@type='500' and @sif=$param-sif-id][prop[@key='SifPart' and @val='ACTUATORS']])-1"/>
						<xsl:with-param name="pType" select="$vActuatorstitle"/>
						<xsl:with-param name="pFirst">true</xsl:with-param>
					</xsl:call-template>
					<xsl:for-each select="data[@type='500' and @sif=$param-sif-id][prop[@key='SifPart' and @val='ACTUATORS']][position()>1]">
						<xsl:call-template name="tDisplayActuatorSensorInTable">
							<xsl:with-param name="pComp" select="."/>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:for-each select="data[@type='500' and @sif=$param-sif-id][prop[@key='SifPart' and @val='SOLVERS']]">
						<xsl:call-template name="tDisplaySolverInTable">
							<xsl:with-param name="pComp" select="."/>
						</xsl:call-template>
					</xsl:for-each>
				</tbody>
		</tgroup> </informaltable>
	</section>
</xsl:template>

<xsl:template name="tDisplayActuatorSensorInTable">
	<xsl:param name="pComp"/>
	<xsl:param name="pCount"/>
	<xsl:param name="pType"/>
	<xsl:param name="pFirst"/>
		<xsl:variable name="vCode" select="$pComp/prop[@key='Code']/@val"/>
		<row>
			<xsl:if test="$pFirst">
				<entry>
					 <xsl:attribute name="morerows">
						 <xsl:value-of select="$pCount"/>
					 </xsl:attribute>
					<xsl:value-of select="$pType"/>
				</entry>
			</xsl:if>
			<entry>
				<xsl:value-of select="$pComp/prop[@key='codetrad']/@val"/>
			</entry>
			<entry>
				<xsl:value-of select="$pComp/prop[@key='Name']/@val"/><xsl:text> </xsl:text>
				<xsl:value-of select="$pComp/prop[@key='TypeInstruLbl']/@val"/>
			</entry>
			<entry>
				<xsl:call-template name="tDisplayPropertiesActuSensorParameters">
					<xsl:with-param name="pComp" select="$pComp"/>
				</xsl:call-template>
			</entry>
		</row>
</xsl:template>

<xsl:template name="tDisplaySolverInTable">
	<xsl:param name="pComp"/>
		<xsl:variable name="vCode" select="$pComp/prop[@key='Code']/@val"/>
		<row>
			<entry>
				<xsl:value-of select="document($resfile)/labels/label[@key='solver']/@val"/>
			</entry>
			<entry>
				<xsl:value-of select="$pComp/prop[@key='codetrad']/@val"/>
			</entry>
			<entry>
				<xsl:value-of select="$pComp/prop[@key='Name']/@val"/><xsl:text> </xsl:text>
				<xsl:value-of select="$pComp/prop[@key='TypeInstruLbl']/@val"/>
			</entry>
			<entry>
				<xsl:call-template name="tDisplayPropertiesSolver">
					<xsl:with-param name="pComp" select="$pComp"/>
				</xsl:call-template>
			</entry>
		</row>
</xsl:template>

</xsl:stylesheet>
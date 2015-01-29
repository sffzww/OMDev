<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" encoding="ISO-8859-1" indent="yes"/>

<xsl:strip-space elements="*"/>

<xsl:param name="lang" select="/export/@lang"/>
<xsl:param name="resfile" select="concat(/export/@lang,'.xml')"/>

<xsl:template name="tHeader">
	<!-- Use tags productname and productnumber of articleinfo to output in header file and Grif version -->
	<!-- Update docbook2fo.xsl in case of change -->
	<articleinfo>
		<productname><xsl:value-of select="/export/gen/@file"/></productname>
		<productnumber><xsl:value-of select="concat('GRIF ',/export/about/@defversion)"/></productnumber>
	</articleinfo>
</xsl:template>

<xsl:template match="sif" mode="heading1">
	<section>
		<informaltable> <tgroup cols="6"> 
			<colspec colnum="1" colwidth="1.4*"/>
			<colspec colnum="2" colwidth="0.6*"/>
			<colspec colnum="3" colwidth="1*"/>
			<colspec colnum="4" colwidth="1*"/>
			<colspec colnum="5" colwidth="1*"/>
			<colspec colnum="6" colwidth="1*"/>
			<thead>
		      <row>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='number']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='rev']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='date']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='auth']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='checker']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='validator']/@val"/></entry>
		      </row>
		    </thead>
			<tbody>
				<row>
					<entry><xsl:value-of select="@name"/></entry>
					<entry><xsl:value-of select="./sifprop[@name='rev']"/></entry>
					<entry><xsl:value-of select="./sifprop[@name='date']"/></entry>
					<entry><xsl:value-of select="./sifprop[@name='auth']"/></entry>
					<entry><xsl:value-of select="./sifprop[@name='checker']"/></entry>
					<entry><xsl:value-of select="./sifprop[@name='validator']"/></entry>
		        </row>
			</tbody>
		</tgroup> </informaltable>
	</section>
</xsl:template>

<xsl:template name="break">
  <xsl:param name="text" select="."/>
  <xsl:choose>
    <xsl:when test="contains($text, '\n')">
      <xsl:value-of select="substring-before($text, '\n')"/>
      <para>
      </para>
      <xsl:call-template name="break">
        <xsl:with-param 
          name="text" 
          select="substring-after($text, '\n')"
        />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$text"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template match="sif" mode="heading2">
	<section>
		<informaltable> <tgroup cols="2"> 
			<colspec colnum="1" colwidth="1*"/>
			<colspec colnum="2" colwidth="4*"/>
			<tbody>
				<row>
					<entry><xsl:value-of select="document($resfile)/labels/label[@key='loc']/@val"/></entry>
					<entry>
						<xsl:call-template name="break">
						    <xsl:with-param name="text" select="./sifprop[@name='loc']" />
						 </xsl:call-template>
					</entry>
		        </row>
		        <row>
					<entry><xsl:value-of select="document($resfile)/labels/label[@key='unit']/@val"/></entry>
					<entry>
						<xsl:call-template name="break">
						    <xsl:with-param name="text" select="./sifprop[@name='unit']" />
						 </xsl:call-template>
					</entry>
		        </row>
		        <row>
					<entry><xsl:value-of select="document($resfile)/labels/label[@key='func']/@val"/></entry>
					<entry>
						<xsl:call-template name="break">
						    <xsl:with-param name="text" select="./sifprop[@name='func']" />
						 </xsl:call-template>
					</entry>
		        </row>
		        <row>
					<entry><xsl:value-of select="document($resfile)/labels/label[@key='desc']/@val"/></entry>
					<entry>
						<xsl:call-template name="break">
						    <xsl:with-param name="text" select="@desc" />
						 </xsl:call-template>
					</entry>
		        </row>
		        <row>
					<entry><xsl:value-of select="document($resfile)/labels/label[@key='sensors']/@val"/></entry>
					<entry>
						<xsl:call-template name="break">
						    <xsl:with-param name="text" select="./sifprop[@name='sensorsloc']" />
						 </xsl:call-template>
					</entry>
		        </row>
		        <row>
					<entry><xsl:value-of select="document($resfile)/labels/label[@key='solver']/@val"/></entry>
					<entry>
						<xsl:call-template name="break">
						    <xsl:with-param name="text" select="./sifprop[@name='solverloc']" />
						 </xsl:call-template>
					</entry>
		        </row>
		        <row>
					<entry><xsl:value-of select="document($resfile)/labels/label[@key='actuators']/@val"/></entry>
					<entry>
						<xsl:call-template name="break">
						    <xsl:with-param name="text" select="./sifprop[@name='actuloc']" />
						 </xsl:call-template>
					</entry>
		        </row>
		        <row>
					<entry><xsl:value-of select="document($resfile)/labels/label[@key='pid']/@val"/></entry>
					<entry>
						<xsl:call-template name="break">
						    <xsl:with-param name="text" select="./sifprop[@name='pid']" />
						 </xsl:call-template>
					</entry>
		        </row>
		        <row>
					<entry><xsl:value-of select="document($resfile)/labels/label[@key='source']/@val"/></entry>
					<entry>
						<xsl:call-template name="break">
						    <xsl:with-param name="text" select="./sifprop[@name='source']" />
						 </xsl:call-template>
					</entry>
		        </row>
		        <row>
					<entry><xsl:value-of select="document($resfile)/labels/label[@key='cmt']/@val"/></entry>
					<entry>
						<xsl:call-template name="break">
						    <xsl:with-param name="text" select="./sifprop[@name='cmt']" />
						 </xsl:call-template>
					</entry>
		        </row>
			</tbody>
		</tgroup> </informaltable>
	</section>
</xsl:template>


<xsl:template match="sif" mode="curve">
	<section>
		<informaltable tabstyle="shaded"> 
		<tgroup cols="8"> 
			<colspec colnum="1" colwidth="0.45*"/>
			<colspec colnum="2" colwidth="0.50*"/>
			<colspec colnum="3" colwidth="0.45*"/>
			<colspec colnum="4" colwidth="0.50*"/>
			<colspec colnum="5" colwidth="1.4*"/>
			<colspec colnum="6" colwidth="1.4*"/>
			<colspec colnum="7" colwidth="0.70*"/>
			<colspec colnum="8" colwidth="1.15*"/>
			<thead>
		      <row>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='expvalue']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='obtvalue']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='exprrf']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='obtrrf']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='maxsilsensors']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='maxsilactuators']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='realisedsil']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='conclusion']/@val"/></entry>
		      </row>
		    </thead>
			<tbody>
				<row>
					<entry><xsl:value-of select="./sifprop[@name='expvalue']"/></entry>
					<entry><xsl:value-of select="./sifprop[@name='obtvalue']"/></entry>
					<entry><xsl:value-of select="./sifprop[@name='exprrf']"/></entry>
					<entry><xsl:value-of select="./sifprop[@name='achivedrrf']"/></entry>
					<entry><xsl:value-of select="./sifprop[@name='silsensors']"/></entry>
					<entry><xsl:value-of select="./sifprop[@name='silactuators']"/></entry>
					<entry cellstyle='important'><xsl:value-of select="./sifprop[@name='achievedvalue']"/></entry>
					<entry cellstyle='important'><xsl:value-of select="./sifprop[@name='conclusion']"/></entry>
		        </row>
			</tbody>
		</tgroup> </informaltable>
		<informaltable> <tgroup cols="2"> 
			<colspec colnum="1" colwidth="1*"/>
			<colspec colnum="2" colwidth="4*"/>
			<tbody>
				<row>
					<entry><xsl:value-of select="document($resfile)/labels/label[@key='rmk']/@val"/></entry>
					<entry>
						<xsl:call-template name="break">
						    <xsl:with-param name="text" select="./sifprop[@name='cmt2']" />
						 </xsl:call-template>
					</entry>
		        </row>
		        <row>
					<entry><xsl:value-of select="document($resfile)/labels/label[@key='cmt']/@val"/></entry>
					<entry>
						<xsl:call-template name="break">
						    <xsl:with-param name="text" select="./sifprop[@name='cmt3']" />
						 </xsl:call-template>
					</entry>
		        </row>
			</tbody>
		</tgroup> </informaltable>
		
		<informaltable> <tgroup cols="5"> 
			<colspec colnum="1" colwidth="1*"/>
			<colspec colnum="2" colwidth="1*"/>
			<colspec colnum="3" colwidth="1*"/>
			<colspec colnum="4" colwidth="1*"/>
			<colspec colnum="5" colwidth="1*"/>
			<thead>
		      <row>
		        <entry><xsl:text> </xsl:text></entry>
		        <entry> 
			        <xsl:variable name="vComputeType" select="./@lasttype"/>
			        <xsl:choose>
						<xsl:when test="$vComputeType = 'PFD'">
							<xsl:value-of select="document($resfile)/labels/label[@key='pfd']/@val"/>	
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="document($resfile)/labels/label[@key='pfh']/@val"/>
						</xsl:otherwise>
					</xsl:choose>
				</entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='rrf']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='silComputed']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='contribution']/@val"/></entry>
		      </row>
		    </thead>
			<tbody>
				<row>
					<entry><xsl:value-of select="document($resfile)/labels/label[@key='sensorPart']/@val"/></entry>
					<entry><xsl:value-of select="./sifpart[@id='SENSORS']/sifprop[@name='lastCompute']"/></entry>
					<entry><xsl:value-of select="./sifpart[@id='SENSORS']/sifprop[@name='rrf']"/></entry>
					<entry><xsl:value-of select="./sifpart[@id='SENSORS']/sifprop[@name='sil']"/></entry>
					<entry><xsl:value-of select="./sifpart[@id='SENSORS']/sifprop[@name='contrib']"/></entry>
		        </row>
		        <row>
					<entry><xsl:value-of select="document($resfile)/labels/label[@key='solverPart']/@val"/></entry>
					<entry><xsl:value-of select="./sifpart[@id='SOLVERS']/sifprop[@name='lastCompute']"/></entry>
					<entry><xsl:value-of select="./sifpart[@id='SOLVERS']/sifprop[@name='rrf']"/></entry>
					<entry><xsl:value-of select="./sifpart[@id='SOLVERS']/sifprop[@name='sil']"/></entry>
					<entry><xsl:value-of select="./sifpart[@id='SOLVERS']/sifprop[@name='contrib']"/></entry>
		        </row>
		        <row>
					<entry><xsl:value-of select="document($resfile)/labels/label[@key='actuatorPart']/@val"/></entry>
					<entry><xsl:value-of select="./sifpart[@id='ACTUATORS']/sifprop[@name='lastCompute']"/></entry>
					<entry><xsl:value-of select="./sifpart[@id='ACTUATORS']/sifprop[@name='rrf']"/></entry>
					<entry><xsl:value-of select="./sifpart[@id='ACTUATORS']/sifprop[@name='sil']"/></entry>
					<entry><xsl:value-of select="./sifpart[@id='ACTUATORS']/sifprop[@name='contrib']"/></entry>
		        </row>
		        <row>
					<entry><xsl:value-of select="document($resfile)/labels/label[@key='sifPart']/@val"/></entry>
					<entry><xsl:value-of select="./sifprop[@name='lastCompute']"/></entry>
					<entry><xsl:value-of select="./sifprop[@name='rrf']"/></entry>
					<entry><xsl:value-of select="./sifprop[@name='sil']"/></entry>
					<entry><xsl:value-of select="./sifprop[@name='contrib']"/></entry>
		        </row>
			</tbody>
		</tgroup> </informaltable>
	</section>
</xsl:template>

<xsl:template match="sif" mode="beta">
	<section> 
		<!-- configuration de l'architecture des capteurs  -->
		<informaltable> <tgroup cols="2"> 
			<colspec colnum="1" colwidth="60"/>
			<colspec colnum="2" colwidth="170"/>
			<thead>
		      <row>
		        <entry><!-- xsl:value-of select="document($resfile)/labels/label[@key='part']/@val"/  --></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='channel']/@val"/></entry>
		      </row>
		    </thead>
			<tbody>
				<xsl:call-template name="tDisplayArchitectureSensorInTable">
					<xsl:with-param name="pChan" select="./sifpart[@id='SENSORS']/channel[1]"/>
					<xsl:with-param name="pCount" select="count(./sifpart[@id='SENSORS']/channel)-1"/>
					<xsl:with-param name="pFirst">true</xsl:with-param>
					<xsl:with-param name="pSif" select="."/>
				</xsl:call-template>
				<xsl:for-each select="./sifpart[@id='SENSORS']/channel[position()>1]">
					<xsl:call-template name="tDisplayArchitectureSensorInTable">
						<xsl:with-param name="pChan" select="."/>
					</xsl:call-template>
				</xsl:for-each>
			</tbody>
		</tgroup> </informaltable>
		<!-- configuration de l'architecture des actionneurs -->
		<informaltable> <tgroup cols="3"> 
			<colspec colnum="1" colwidth="60"/>
			<colspec colnum="2" colwidth="170"/>
			<colspec colnum="3" colwidth="*"/>
			<thead>
		      <row>
		        <entry><!--xsl:value-of select="document($resfile)/labels/label[@key='part']/@val"/--></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='channel']/@val"/></entry>
		        <entry><xsl:value-of select="document($resfile)/labels/label[@key='actuator']/@val"/></entry>
		      </row>
		    </thead>
			<tbody>
			
				<xsl:call-template name="tDisplayArchitectureActuatorInTable">
					<xsl:with-param name="pChan" select="./sifpart[@id='ACTUATORS']/channel[1]"/>
					<xsl:with-param name="pCount" select="count(./sifpart[@id='ACTUATORS']/channel/actuator) -1"/>
					<xsl:with-param name="pFirst">true</xsl:with-param>
					<xsl:with-param name="pSif" select="."/>
				</xsl:call-template>
				<xsl:for-each select="./sifpart[@id='ACTUATORS']/channel[position()>1]">
					<xsl:call-template name="tDisplayArchitectureActuatorInTable">
						<xsl:with-param name="pChan" select="."/>
					</xsl:call-template>
				</xsl:for-each>				
			</tbody>
		</tgroup> </informaltable>
	</section>
</xsl:template>

<xsl:template name="tDisplayArchitectureSensorInTable">
	<xsl:param name="pSif"/>
	<xsl:param name="pChan"/>
	<xsl:param name="pCount"/>
	<xsl:param name="pFirst"/>
		<row>
			<xsl:if test="$pFirst">
				<entry>
					<xsl:attribute name="morerows">
						 <xsl:value-of select="$pCount"/>
					 </xsl:attribute>
					
					<xsl:value-of select="document($resfile)/labels/label[@key='sensors']/@val"/><xsl:text> </xsl:text>					
					<xsl:variable name="vBeta" select="$pSif/sifpart[@id='SENSORS']/sifprop[@name='beta']"/>
					<xsl:choose>
						<xsl:when test="$vBeta = 0">
							<xsl:text>Beta=</xsl:text><xsl:value-of select="$vBeta"/><xsl:text>% </xsl:text>	
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>Beta=</xsl:text><xsl:value-of select="$vBeta"/><xsl:text>%, </xsl:text>
							
							<xsl:variable name="vPeriod" select="$pSif/sifpart[@id='SENSORS']/sifprop[@name='period']"/>
							<xsl:value-of select="document($resfile)/labels/label[@key='period']/@val"/><xsl:text>=</xsl:text><xsl:value-of select="$vPeriod"/>

							<xsl:if test="not(string(number($vPeriod))='NaN')"> <!-- when value is number.  -->
								<xsl:text>h</xsl:text>
							</xsl:if>
							
							<xsl:text> </xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text>Conf=</xsl:text><xsl:value-of select="$pSif/sifpart[@id='SENSORS']/sifprop[@name='config']"/><xsl:text> </xsl:text>
				</entry>
			</xsl:if>
			<entry>
				<xsl:value-of select="$pChan/@id"/><xsl:text> : </xsl:text>
				<xsl:value-of select="document($resfile)/labels/label[@key='config']/@val"/><xsl:text>=</xsl:text><xsl:value-of select="$pChan/sifprop[@name='config']"/><xsl:text>, </xsl:text>
				<xsl:variable name="vBeta" select="$pChan/sifprop[@name='beta1']"/>
					<xsl:choose>
						<xsl:when test="$vBeta = 0">
							<xsl:text>Beta=</xsl:text><xsl:value-of select="$vBeta"/><xsl:text>% </xsl:text>	
						</xsl:when>
						<xsl:otherwise>
							<xsl:variable name="vPeriod" select="$pChan/sifprop[@name='period']"/>
							
							<xsl:text>Beta=</xsl:text><xsl:value-of select="$vBeta"/><xsl:text>%, </xsl:text>
							<xsl:value-of select="document($resfile)/labels/label[@key='period']/@val"/><xsl:text>=</xsl:text><xsl:value-of select="$vPeriod"/>
							
							<xsl:if test="not(string(number($vPeriod))='NaN')"> <!-- when value is number.  -->
								<xsl:text>h</xsl:text>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
			</entry>
		</row>
</xsl:template>

<xsl:template name="tDisplayArchitectureActuatorInTable">
	<xsl:param name="pSif"/>
	<xsl:param name="pChan"/>
	<xsl:param name="pCount"/>
	<xsl:param name="pFirst"/>
	
	<xsl:variable name="vCountChan" select="count($pChan/actuator)-1"/>
	<xsl:call-template name="tDisplayArchitectureActuatorInTable2">
				<xsl:with-param name="pSif" select="$pSif"/>
				<xsl:with-param name="pChan" select="$pChan"/>
				<xsl:with-param name="pCountPart" select="$pCount"/>
				<xsl:with-param name="pCountChan" select="$vCountChan"/>
				<xsl:with-param name="pFirstChan" select="$pFirst"/>
				<xsl:with-param name="pActuator" select="$pChan/actuator[1]"/>
				<xsl:with-param name="pFirstActuator">true</xsl:with-param>
	</xsl:call-template>

	<xsl:for-each select="$pChan/actuator[position()>1]">
		<xsl:call-template name="tDisplayArchitectureActuatorInTable2">
			<xsl:with-param name="pActuator" select="."/>
		</xsl:call-template>
	</xsl:for-each>	
</xsl:template>

<xsl:template name="tDisplayArchitectureActuatorInTable2">
	<xsl:param name="pSif"/>
	<xsl:param name="pChan"/>
	<xsl:param name="pActuator" />
	
	<xsl:param name="pCountPart"/>
	<xsl:param name="pCountChan"/>
	<xsl:param name="pFirstChan" />
	<xsl:param name="pFirstActuator" />
	
	
	
		<row>
			<xsl:if test="$pFirstChan">
				<entry>
					 <xsl:attribute name="morerows">
						 <xsl:value-of select="$pCountPart"/>
					 </xsl:attribute>
					
					<xsl:value-of select="document($resfile)/labels/label[@key='actuators']/@val"/><xsl:text> </xsl:text>					
					<xsl:variable name="vBeta" select="$pSif/sifpart[@id='ACTUATORS']/sifprop[@name='beta']"/>
					<xsl:choose>
						<xsl:when test="$vBeta = 0">
							<xsl:text>Beta=</xsl:text><xsl:value-of select="$vBeta"/><xsl:text>% </xsl:text>	
						</xsl:when>
						<xsl:otherwise>
							<xsl:variable name="vPeriod" select="$pSif/sifpart[@id='ACTUATORS']/sifprop[@name='period']"/>
						
							<xsl:text>Beta=</xsl:text><xsl:value-of select="$vBeta"/><xsl:text>%, </xsl:text>
							<xsl:value-of select="document($resfile)/labels/label[@key='period']/@val"/><xsl:text>=</xsl:text><xsl:value-of select="$vPeriod"/>
							
							<xsl:if test="not(string(number($vPeriod))='NaN')"> <!-- when value is number.  -->
								<xsl:text>h</xsl:text>
							</xsl:if>
							
							<xsl:text> </xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text>Conf=</xsl:text><xsl:value-of select="$pSif/sifpart[@id='ACTUATORS']/sifprop[@name='config']"/><xsl:text> </xsl:text>
				</entry>
			</xsl:if>
			<xsl:if test="$pFirstActuator">
				<entry>
					<xsl:attribute name="morerows">
						 <xsl:value-of select="$pCountChan"/>
					 </xsl:attribute>
					 
					 	<xsl:variable name="vBeta1Chan" select="$pChan/sifprop[@name='beta1']"/>
						<xsl:variable name="vBeta2Chan" select="$pChan/sifprop[@name='beta2']"/>
						
						<xsl:value-of select="$pChan/@id"/><xsl:text> : </xsl:text>
						<xsl:value-of select="document($resfile)/labels/label[@key='config']/@val"/><xsl:text>=</xsl:text><xsl:value-of select="$pChan/sifprop[@name='config']"/><xsl:text>, </xsl:text>
						<xsl:choose>
							<xsl:when test="$vBeta1Chan = 0 and $vBeta2Chan = 0">
								<xsl:text>Beta=</xsl:text><xsl:value-of select="$vBeta1Chan"/><xsl:text>%, </xsl:text>	
								<xsl:value-of select="document($resfile)/labels/label[@key='betasub']/@val"/><xsl:text>=</xsl:text><xsl:value-of select="$vBeta2Chan"/><xsl:text>% </xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:variable name="vPeriod" select="$pChan/sifprop[@name='period']"/>
								
								<xsl:text>Beta=</xsl:text><xsl:value-of select="$vBeta1Chan"/><xsl:text>%, </xsl:text>	
								<xsl:value-of select="document($resfile)/labels/label[@key='betasub']/@val"/><xsl:text>=</xsl:text><xsl:value-of select="$vBeta2Chan"/><xsl:text>%, </xsl:text>
								<xsl:value-of select="document($resfile)/labels/label[@key='period']/@val"/><xsl:text>=</xsl:text><xsl:value-of select="$vPeriod"/>
								
								<xsl:if test="not(string(number($vPeriod))='NaN')"> <!-- when value is number.  -->
									<xsl:text>h</xsl:text>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
				</entry>
			</xsl:if>
			<entry> 
				<xsl:variable name="vNbSousAct" select="$pActuator/sifprop[@name='subactuatorscount']"/>
				<xsl:choose>
					<xsl:when test="$vNbSousAct > 1">
						<xsl:variable name="vBeta" select="$pActuator/sifprop[@name='beta1']"/>
						
						<xsl:choose>
							<xsl:when test="$vBeta = 0">
								<xsl:value-of select="$pActuator/@id"/><xsl:text> : </xsl:text><xsl:value-of select="$vNbSousAct"/><xsl:text> </xsl:text><xsl:value-of select="document($resfile)/labels/label[@key='subactuators']/@val"/><xsl:text>, </xsl:text>
								<xsl:value-of select="document($resfile)/labels/label[@key='config']/@val"/><xsl:text>=</xsl:text><xsl:value-of select="$pActuator/sifprop[@name='config']"/><xsl:text>, </xsl:text>
								<xsl:text>Beta=</xsl:text><xsl:value-of select="$vBeta"/><xsl:text>% </xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:variable name="vPeriod" select="$pActuator/sifprop[@name='period']"/>
							
								<xsl:value-of select="$pActuator/@id"/><xsl:text> : </xsl:text><xsl:value-of select="$vNbSousAct"/><xsl:text> </xsl:text><xsl:value-of select="document($resfile)/labels/label[@key='subactuators']/@val"/><xsl:text>, </xsl:text>
								<xsl:value-of select="document($resfile)/labels/label[@key='config']/@val"/><xsl:text>=</xsl:text><xsl:value-of select="$pActuator/sifprop[@name='config']"/><xsl:text>, </xsl:text>
								<xsl:text>Beta=</xsl:text><xsl:value-of select="$vBeta"/><xsl:text>%, </xsl:text>
								<xsl:value-of select="document($resfile)/labels/label[@key='period']/@val"/><xsl:text>=</xsl:text><xsl:value-of select="$vPeriod"/>
								
								<xsl:if test="not(string(number($vPeriod))='NaN')"> <!-- when value is number.  -->
									<xsl:text>h</xsl:text>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
						
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$pActuator/@id"/><xsl:text> : </xsl:text><xsl:value-of select="$vNbSousAct"/><xsl:text> </xsl:text><xsl:value-of select="document($resfile)/labels/label[@key='subactuator']/@val"/>										
					</xsl:otherwise>
				</xsl:choose>
			</entry>
		</row>
</xsl:template>

<xsl:template name="tDisplayPropertiesChanelSensorParameters">

</xsl:template>

<xsl:template name="tDisplayPropertiesActuSensorParameters">
	<xsl:param name="pComp"/>
		<xsl:variable name="vLawType" select="$pComp/prop[@key='LawType']/@val"/>
		<xsl:call-template name="tDisplayProperty">
			<xsl:with-param name="pPropertyValue" select="document($resfile)/labels/label[@key=concat('lawtype',$vLawType)]/@val"/>
			<xsl:with-param name="pPropertyName" select="document($resfile)/labels/label[@key='law']/@val"/>
		</xsl:call-template>
		<xsl:call-template name="tDisplayProperty">
			<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='Lambda']/@val"/>
			<xsl:with-param name="pPropertyName" select="'Lambda'"/>
			<xsl:with-param name="pPropertyUnit">h</xsl:with-param>
			<xsl:with-param name="pSuperscript">-1</xsl:with-param>
		</xsl:call-template>
		
		<xsl:call-template name="tDisplayProperty">
			<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='Dff']/@val"/>
			<xsl:with-param name="pPropertyName" select="'LambdaD/Lambda'"/>
			<xsl:with-param name="pPropertyUnit">%</xsl:with-param>
		</xsl:call-template>
		
		<xsl:variable name="vDC" select="$pComp/prop[@key='DC']/@val"/>
		<xsl:call-template name="tDisplayProperty">
			<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='DC']/@val"/>
			<xsl:with-param name="pPropertyName" select="'DC'"/>
			<xsl:with-param name="pPropertyUnit">%</xsl:with-param>
			<xsl:with-param name="pNoComma">true</xsl:with-param>
		</xsl:call-template>
		
		<xsl:if test="$vDC!='0' or $vLawType='0'">
			<xsl:variable name="vMTTRUnit" select="$pComp/prop[@key='MTTRUnit']/@val"/>
			<xsl:text>, </xsl:text>
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='MTTR']/@val"/>
				<xsl:with-param name="pPropertyName" select="'MTTR'"/>
				<xsl:with-param name="pPropertyUnit" select="document($resfile)/labels/label[@key=$vMTTRUnit]/@val"/>
				<xsl:with-param name="pNoComma">true</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
			
		<xsl:variable name="vPart" select="$pComp/prop[@key='SifPart']/@val"/>
		<xsl:if test="$vPart='SENSORS'">
			<xsl:variable name="vDff" select="$pComp/prop[@key='Dff']/@val"/>
			<xsl:if test="$vDC!='0' and $vDff!='1'">
				<xsl:variable name="vMTTR2Unit" select="$pComp/prop[@key='MTTR2Unit']/@val"/>
				<xsl:text>, </xsl:text>
				<xsl:call-template name="tDisplayProperty">
					<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='MTTR2']/@val"/>
					<xsl:with-param name="pPropertyName" select="document($resfile)/labels/label[@key='mttr2']/@val"/>
					<xsl:with-param name="pPropertyUnit" select="document($resfile)/labels/label[@key=$vMTTR2Unit]/@val"/>
					<xsl:with-param name="pNoComma">true</xsl:with-param>
				</xsl:call-template>
			</xsl:if>
		</xsl:if>

		<xsl:if test="$vLawType!='2'">
			<xsl:variable name="vT1Unit" select="$pComp/prop[@key='T1Unit']/@val"/>
			<xsl:text>, </xsl:text>
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='T1']/@val"/>
				<xsl:with-param name="pPropertyName" select="'T1'"/>
				<xsl:with-param name="pPropertyUnit" select="document($resfile)/labels/label[@key=$vT1Unit]/@val"/>
				<xsl:with-param name="pNoComma">true</xsl:with-param>
			</xsl:call-template>
			<xsl:variable name="vT0Unit" select="$pComp/prop[@key='T0Unit']/@val"/>
			
			<xsl:text>, </xsl:text>
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='T0']/@val"/>
				<xsl:with-param name="pPropertyName" select="'T0'"/>
				<xsl:with-param name="pPropertyUnit" select="document($resfile)/labels/label[@key=$vT0Unit]/@val"/>
				<xsl:with-param name="pNoComma">true</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		
		<xsl:if test="$vDC!='0' or $vLawType!='2'">
			<xsl:text>, </xsl:text>
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='Gamma']/@val"/>
				<xsl:with-param name="pPropertyName" select="'Gamma'"/>
				<xsl:with-param name="pNoComma">true</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	
</xsl:template>

<xsl:template name="tDisplayPropertiesActuSensorOtherParameters">
	<xsl:param name="pComp"/>
		<!-- Partial Stroking -->
		<xsl:variable name="vPart" select="$pComp/prop[@key='SifPart']/@val"/>
		<xsl:variable name="vSubCode" select="$pComp/prop[@key='SubCode']/@val"/>
		<xsl:variable name="vPartial" select="$pComp/prop[@key='PartialStroking']/@val"/>
		<xsl:variable name="vLawType" select="$pComp/prop[@key='LawType']/@val"/>

		<xsl:if test="$vPart='ACTUATORS' and $vPartial='true' and $vLawType!='2'">
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='nbTestsPartialStroking']/@val"/>
				<xsl:with-param name="pPropertyName" select="document($resfile)/labels/label[@key='partialnb']/@val"/>
			</xsl:call-template>
			
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='EffPartialStroking']/@val"/>
				<xsl:with-param name="pPropertyName" select="document($resfile)/labels/label[@key='partialeff']/@val"/>
				<xsl:with-param name="pPropertyUnit">%</xsl:with-param>
			</xsl:call-template>
			
			<xsl:variable name="vKhiStrokeValue">
				<xsl:choose>
					<xsl:when test="$pComp/prop[@key='KhiPartialStroking']/@val='true'">1</xsl:when>
					<xsl:otherwise>0</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$vKhiStrokeValue"/>
				<xsl:with-param name="pPropertyName" select="document($resfile)/labels/label[@key='khiStroke']/@val"/>
			</xsl:call-template>
			
			<xsl:variable name="vPiStrokeUnit" select="$pComp/prop[@key='PiUnitPartialStroking']/@val"/>
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='PiPartialStroking']/@val"/>
				<xsl:with-param name="pPropertyName" select="document($resfile)/labels/label[@key='piStroke']/@val"/>
				<xsl:with-param name="pPropertyUnit" select="document($resfile)/labels/label[@key=$vPiStrokeUnit]/@val"/>
			</xsl:call-template>		
	
		</xsl:if>
			
		<xsl:if test="$vLawType!='2'">
			<xsl:variable name="vKhiValue">
				<xsl:choose>
					<xsl:when test="$pComp/prop[@key='Khi']/@val='true'">1</xsl:when>
					<xsl:otherwise>0</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$vKhiValue"/>
				<xsl:with-param name="pPropertyName" select="'Khi'"/>
			</xsl:call-template>
			<xsl:variable name="vPiUnit" select="$pComp/prop[@key='PiUnit']/@val"/>
			<xsl:choose>
				<xsl:when test="$vLawType='0'">
					<xsl:call-template name="tDisplayProperty">
						<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='Pi']/@val"/>
						<xsl:with-param name="pPropertyName" select="'Pi'"/>
						<xsl:with-param name="pPropertyUnit" select="document($resfile)/labels/label[@key=$vPiUnit]/@val"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="tDisplayProperty">
						<xsl:with-param name="pPropertyValue">0</xsl:with-param>
						<xsl:with-param name="pPropertyName" select="'Pi'"/>
						<xsl:with-param name="pPropertyUnit" select="document($resfile)/labels/label[@key=$vPiUnit]/@val"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='Sigma']/@val"/>
				<xsl:with-param name="pPropertyName" select="'Sigma'"/>
			</xsl:call-template>
			
			<xsl:choose>
				<xsl:when test="$pComp/prop[@key='LambdaStarEqualToLambda']/@val='true'">
					<xsl:call-template name="tDisplayProperty">
						<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='Lambda']/@val"/>
						<xsl:with-param name="pPropertyName" select="'Lambda&#42;'"/>
						<xsl:with-param name="pPropertyUnit">h</xsl:with-param>
						<xsl:with-param name="pSuperscript">-1</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="tDisplayProperty">
						<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='LambdaStar']/@val"/>
						<xsl:with-param name="pPropertyName" select="'Lambda&#42;'"/>
						<xsl:with-param name="pPropertyUnit">h</xsl:with-param>
						<xsl:with-param name="pSuperscript">-1</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
			
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='Omega']/@val"/>
				<xsl:with-param name="pPropertyName" select="'Omega'"/>
				<xsl:with-param name="pNoComma">true</xsl:with-param>
			</xsl:call-template>

		</xsl:if>

</xsl:template>

<xsl:template name="tDisplayPropertiesSolver">
	<xsl:param name="pComp"/>
		<xsl:if test="$pComp/prop[@key='LawType']/@val='0'">
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="document($resfile)/labels/label[@key='lawtypeSimple']/@val"/>
				<xsl:with-param name="pPropertyName" select="document($resfile)/labels/label[@key='law']/@val"/>
			</xsl:call-template>
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='SolverPFD']/@val"/>
				<xsl:with-param name="pPropertyName" select="document($resfile)/labels/label[@key='solverPFD']/@val"/>
			</xsl:call-template>
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='SolverPFH']/@val"/>
				<xsl:with-param name="pPropertyName" select="document($resfile)/labels/label[@key='solverPFH']/@val"/>
			</xsl:call-template>
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='SolverSIL']/@val"/>
				<xsl:with-param name="pPropertyName" select="document($resfile)/labels/label[@key='solverSIL']/@val"/>
				<xsl:with-param name="pNoComma">true</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="$pComp/prop[@key='LawType']/@val='1'">
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="document($resfile)/labels/label[@key='lawtypeAdvanced']/@val"/>
				<xsl:with-param name="pPropertyName" select="document($resfile)/labels/label[@key='law']/@val"/>
			</xsl:call-template>
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='Lambda']/@val"/>
				<xsl:with-param name="pPropertyName" select="'Lambda'"/>
				<xsl:with-param name="pPropertyUnit">h</xsl:with-param>
				<xsl:with-param name="pSuperscript">-1</xsl:with-param>
			</xsl:call-template>
			<xsl:variable name="vMTTRUnit" select="$pComp/prop[@key='MTTRUnit']/@val"/>
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='MTTR']/@val"/>
				<xsl:with-param name="pPropertyName" select="'MTTR'"/>
				<xsl:with-param name="pPropertyUnit" select="document($resfile)/labels/label[@key=$vMTTRUnit]/@val"/>
			</xsl:call-template>
			<xsl:variable name="vT1Unit" select="$pComp/prop[@key='T1Unit']/@val"/>
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='T1']/@val"/>
				<xsl:with-param name="pPropertyName" select="'T1'"/>
				<xsl:with-param name="pPropertyUnit" select="document($resfile)/labels/label[@key=$vT1Unit]/@val"/>
			</xsl:call-template>
			<xsl:variable name="vT0Unit" select="$pComp/prop[@key='T0Unit']/@val"/>
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='T0']/@val"/>
				<xsl:with-param name="pPropertyName" select="'T0'"/>
				<xsl:with-param name="pPropertyUnit" select="document($resfile)/labels/label[@key=$vT0Unit]/@val"/>
			</xsl:call-template>
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='Gamma']/@val"/>
				<xsl:with-param name="pPropertyName" select="'Gamma'"/>
				<xsl:with-param name="pNoComma">true</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
</xsl:template>
<xsl:template name="tDisplayPropertiesSolverAdvanced">
	<xsl:param name="pComp"/>
		<xsl:if test="$pComp/prop[@key='LawType']/@val='1'">
			<xsl:variable name="vKhiValue">
				<xsl:choose>
					<xsl:when test="$pComp/prop[@key='Khi']/@val='true'">1</xsl:when>
					<xsl:otherwise>0</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$vKhiValue"/>
				<xsl:with-param name="pPropertyName" select="'Khi'"/>
			</xsl:call-template>
			<xsl:variable name="vPiUnit" select="$pComp/prop[@key='PiUnit']/@val"/>
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='Pi']/@val"/>
				<xsl:with-param name="pPropertyName" select="'Pi'"/>
				<xsl:with-param name="pPropertyUnit" select="document($resfile)/labels/label[@key=$vPiUnit]/@val"/>
			</xsl:call-template>
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='Sigma']/@val"/>
				<xsl:with-param name="pPropertyName" select="'Sigma'"/>
			</xsl:call-template>

			<xsl:choose>
				<xsl:when test="$pComp/prop[@key='LambdaStarEqualToLambda']/@val='true'">
					<xsl:call-template name="tDisplayProperty">
						<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='Lambda']/@val"/>
						<xsl:with-param name="pPropertyName" select="'Lambda&#42;'"/>
						<xsl:with-param name="pPropertyUnit">h</xsl:with-param>
						<xsl:with-param name="pSuperscript">-1</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="tDisplayProperty">
						<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='LambdaStar']/@val"/>
						<xsl:with-param name="pPropertyName" select="'Lambda&#42;'"/>
						<xsl:with-param name="pPropertyUnit">h</xsl:with-param>
						<xsl:with-param name="pSuperscript">-1</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
			
			<xsl:call-template name="tDisplayProperty">
				<xsl:with-param name="pPropertyValue" select="$pComp/prop[@key='Omega']/@val"/>
				<xsl:with-param name="pPropertyName" select="'Omega'"/>
				<xsl:with-param name="pNoComma">true</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
</xsl:template>

<xsl:template name="tPicture">
	<xsl:param name="pFileRef"/>
	<xsl:param name="pTextUnderFigure"/>
	<xsl:param name="pScale"/>
		<section>
			<para>
				<informalfigure>
					<mediaobject>
						<imageobject> 
							<imagedata align="center" fileref="{$pFileRef}" scale="{$pScale}"/>
						</imageobject>
					  <xsl:if test="$pTextUnderFigure">
					  <caption align="bottom">
					  	  <para>
							  <important><xsl:value-of select="$pTextUnderFigure"/></important>
						  </para>
					  </caption>
					  </xsl:if>
					  </mediaobject>
				</informalfigure>  
			</para> 
			
		</section>
</xsl:template>

<xsl:template name="tDisplayProperty">
	<xsl:param name="pPropertyValue"/>
	<xsl:param name="pPropertyName"/>
	<xsl:param name="pPropertyUnit"/>
	<xsl:param name="pSuperscript"/>
	<xsl:param name="pNoComma">false</xsl:param>
		<xsl:variable name="pNewPropertyValue">
			<xsl:call-template name="tTranslatePropertyValue">
				<xsl:with-param name="pPropertyValue" select="$pPropertyValue"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:call-template name="tPrintProperty">
			<xsl:with-param name="pPropertyValue" select="$pNewPropertyValue"/>
			<xsl:with-param name="pPropertyName" select="$pPropertyName"/>
			<xsl:with-param name="pPropertyUnit" select="$pPropertyUnit"/>
			<xsl:with-param name="pSuperscript" select="$pSuperscript"/>
			<xsl:with-param name="pNoComma" select="$pNoComma"/>
		</xsl:call-template>
</xsl:template>

<xsl:template name="tTranslatePropertyValue">
	<xsl:param name="pPropertyValue"/>
		<xsl:choose>
			<xsl:when test="not(string(number($pPropertyValue))='NaN')">
				<!-- value is number. Nothing to do more -->
				<xsl:value-of select="$pPropertyValue"/>
			</xsl:when>
			<xsl:otherwise>
				<!-- value is not a simple number (can be 3e-5). Look if its value correspond to  a parameter -->
				<xsl:variable name="vParameter" select="/export/datatable[@type='101']/data[prop[@key='Name']/@val=$pPropertyValue]"/>
				<xsl:choose>
					<xsl:when test="$vParameter">
						<!-- we have found a parameter corresponding to the value -->
						<xsl:value-of select="$vParameter/prop[@key='Value']/@val"/>
					</xsl:when>
					<xsl:otherwise>
						<!-- no parameter found. We let the value as it is.--> 
						<xsl:value-of select="$pPropertyValue"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
</xsl:template>

<xsl:template name="tPrintProperty">
	<xsl:param name="pPropertyValue"/>
	<xsl:param name="pPropertyName"/>
	<xsl:param name="pPropertyUnit"/>
	<xsl:param name="pSuperscript"/>
	<xsl:param name="pNoComma">false</xsl:param>
		<xsl:choose>
			<xsl:when test="$pNoComma='true'">
				<xsl:choose>
					<xsl:when test="$pPropertyUnit">
						<xsl:choose>
							<xsl:when test="$pSuperscript">
								<xsl:value-of select="concat(concat(concat($pPropertyName,'='),$pPropertyValue),$pPropertyUnit)"/>
								<superscript>
									<xsl:value-of select="$pSuperscript"/>
								</superscript>
								<xsl:text>, </xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(concat(concat($pPropertyName,'='),$pPropertyValue),$pPropertyUnit)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(concat($pPropertyName,'='),$pPropertyValue)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$pPropertyUnit">
						<xsl:choose>
							<xsl:when test="$pSuperscript">
								<xsl:value-of select="concat(concat(concat($pPropertyName,'='),$pPropertyValue),$pPropertyUnit)"/>
								<superscript>
									<xsl:value-of select="$pSuperscript"/>
								</superscript>
								<xsl:text>, </xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(concat(concat(concat($pPropertyName,'='),$pPropertyValue),$pPropertyUnit),', ')"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(concat(concat($pPropertyName,'='),$pPropertyValue),', ')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
</xsl:template>

</xsl:stylesheet>
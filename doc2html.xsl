<?xml version="1.0" ?>
<!-- $Id$ -->

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:util="http://projects.closeedge.net/kobsd/xsl/util">
	<xsl:import href="util.xsl" />
	<xsl:output method="text" />

	<xsl:template match="doc">
<xsl:text><![CDATA[
<!DOCTYPE html PUBLIC "-//W3C//XHTML 1.0 Transitional//EN">
<html lang="en-US" xml:lang="en-US"
	xmlns="http://www.w3.org/1999/XHTML">
	<head>
		<title>]]></xsl:text>
		<xsl:value-of select="title" />
		<xsl:text><![CDATA[</title>
		<link rel="stylesheet" type="text/css" href="main.css" />
	</head>
	<body>
]]></xsl:text>
		<xsl:apply-templates />
		<xsl:text><![CDATA[
	</body>
</html>
]]></xsl:text>
	</xsl:template>

	<xsl:template match="sum|title" />

	<xsl:template match="sect">
		<xsl:apply-templates />
		<xsl:text><![CDATA[<hr />]]></xsl:text>
	</xsl:template>

	<xsl:template match="p">
		<xsl:text><![CDATA[<p>]]></xsl:text>
		<xsl:apply-templates />
		<xsl:text><![CDATA[</p>]]></xsl:text>
	</xsl:template>

	<xsl:template match="em">
		<xsl:text><![CDATA[<em>]]></xsl:text>
		<xsl:apply-templates />
		<xsl:text><![CDATA[</em>]]></xsl:text>
	</xsl:template>

	<xsl:template match="sy">
		<xsl:text><![CDATA[<strong>]]></xsl:text>
		<xsl:apply-templates />
		<xsl:text><![CDATA[</strong>]]></xsl:text>
	</xsl:template>

	<xsl:template match="pre">
		<xsl:text><![CDATA[<pre>]]></xsl:text>
		<xsl:apply-templates />
		<xsl:text><![CDATA[</pre>]]></xsl:text>
	</xsl:template>

	<xsl:template match="h">
		<xsl:text><![CDATA[<h3>]]></xsl:text>
		<xsl:apply-templates />
		<xsl:text><![CDATA[</h3>]]></xsl:text>
	</xsl:template>
	
	<xsl:template match="link">
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:value-of select="@href" />
			</xsl:attribute>
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<xsl:template match="tt|path">
		<xsl:text><![CDATA[<tt>]]></xsl:text>
		<xsl:apply-templates />
		<xsl:text><![CDATA[</tt>]]></xsl:text>
	</xsl:template>

	<xsl:template match="text()">
		<xsl:call-template name="util:string-replace">
			<xsl:with-param name="string">
				<xsl:call-template name="util:string-replace">
					<xsl:with-param name="string">
						<xsl:call-template name="util:string-replace">
							<xsl:with-param name="string">
								<xsl:call-template name="util:string-replace">
									<xsl:with-param name="string" select="." />
									<xsl:with-param name="search" select="'--'" />
									<xsl:with-param name="replacement" select="'&amp;mdash;'" />
								</xsl:call-template>
							</xsl:with-param>
							<xsl:with-param name="search" select="'``'" />
							<xsl:with-param name="replacement" select="'&amp;#8220;'" />
						</xsl:call-template>
					</xsl:with-param>
					<xsl:with-param name="search" select="&quot;''&quot;" />
					<xsl:with-param name="replacement" select="'&amp;#8221;'" />
				</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="search" select="&quot;'&quot;" />
			<xsl:with-param name="replacement" select="'&amp;#8217;'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>

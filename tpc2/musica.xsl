<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text" />
    
    <xsl:template match="obra">
        ###  http://www.semanticweb.org/miguel/ontologies/2020/1/musica#<xsl:value-of select="@id"/>
        :<xsl:value-of select="@id"/> rdf:type owl:NamedIndividual ,
        :Obra ;
        <xsl:for-each select="instrumentos/instrumento">:utiliza :<xsl:value-of select="../../@id"/>-<xsl:value-of select="generate-id()"/> ;
        </xsl:for-each>
        :titulo "<xsl:value-of select="titulo"/>"^^xsd:string ;
        :tipo "<xsl:value-of select="tipo"/>"^^xsd:string ;
        :compositor "<xsl:value-of select="compositor"/>"^^xsd:string .
        <xsl:apply-templates select = "instrumentos/instrumento" /> 
    </xsl:template>
    
    <xsl:template match="instrumento">
        ###  http://www.semanticweb.org/miguel/ontologies/2020/1/musica#<xsl:value-of select="../../@id"/>-<xsl:value-of select="generate-id()"/>
        :<xsl:value-of select="../../@id"/>-<xsl:value-of select="generate-id()"/> rdf:type owl:NamedIndividual ,
        :Instrumento ;<xsl:for-each select="partitura">
            :pertence :<xsl:value-of select="generate-id()"/> ;
        </xsl:for-each>
        :designacao "<xsl:value-of select="designacao"/>"^^xsd:string .
        <xsl:apply-templates select = "partitura" /> 
    </xsl:template>
    
    <xsl:template match="partitura">
        ###  http://www.semanticweb.org/miguel/ontologies/2020/1/musica#<xsl:value-of select="generate-id()"/>
        :<xsl:value-of select="generate-id()"/> rdf:type owl:NamedIndividual ,
        :Partitura ;
        :voz "<xsl:value-of select="@voz"/>"^^xsd:string ;
        :path "<xsl:value-of select="@path"/>"^^xsd:string ;
        :type "<xsl:value-of select="@type"/>"^^xsd:string .
    </xsl:template>
    
</xsl:stylesheet>
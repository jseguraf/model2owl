<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="xs math xd xsl uml xmi umldi dc fn"
    xmlns:uml="http://www.omg.org/spec/UML/20131001"
    xmlns:xmi="http://www.omg.org/spec/XMI/20131001"
    xmlns:umldi="http://www.omg.org/spec/UML/20131001/UMLDI"
    xmlns:dc="http://www.omg.org/spec/UML/20131001/UMLDC" xmlns:owl="http://www.w3.org/2002/07/owl#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dct="http://purl.org/dc/terms/"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:f="http://https://github.com/costezki/model2owl#" version="3.0">
    
    <xsl:import href="../common/checkers.xsl"/>
    <xsl:import href="../html-conventions-lib/utils-html-conventions.xsl"/>
    
    
    
    <xd:doc>
        <xd:desc>Getting all misused data-types and returning a warning  </xd:desc>
    </xd:doc>
    
    <xsl:template match="element[@xmi:type = 'uml:DataType']">
        <dl>
            <dt>
                <xsl:value-of select="@name"/>
            </dt>
            <xsl:call-template name="dataTypeElementNameChecker">
                <xsl:with-param name="dataTypeElement" select="."/>
            </xsl:call-template>
        </dl>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc>If the data-type in not a valid xsd or rdf data-type will return a warning as it might be misused</xd:desc>
        <xd:param name="dataTypeElement"/>
    </xd:doc>
    <xsl:template name="dataTypeElementNameChecker">
        <xsl:param name="dataTypeElement"/>
        <xsl:variable name="dataTypeElementName" select="$dataTypeElement/@name"/>
        <xsl:variable name="rdfOrXsdDataType" select="f:getXsdRdfDataTypeValues($dataTypeElementName,$xsdAndRdfDataTypes)"/>
        <xsl:if test="$rdfOrXsdDataType = ''">
            <xsl:sequence select="f:generateHtmlWarning('This is not a valid xsd or rdf data-type. Is this suppose to be a Class instead?')"/>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>
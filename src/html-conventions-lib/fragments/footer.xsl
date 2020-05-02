<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs math xd"
    version="3.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> May 2, 2020</xd:p>
            <xd:p><xd:b>Author:</xd:b> lps</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    
    <xsl:template name="footer">
        <footer class="text-center">
            <p> This document is generated automatically by the <a
                    href="https://github.com/costezki/model2owl" target="_blank">model2owl tool</a>
                developed in the context of <a
                    href="https://joinup.ec.europa.eu/solution/eprocurement-ontology">the
                    eProcurement Ontology initiative</a>.</p>
            <p>The template of this report is based on the <a
                    href="https://github.com/thomaspark/pubcss">PubCSS library</a>.</p>
            <p>&#169; Publications Office of the European Union, 2020</p>
        </footer>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        
        <script src="static/js/jquery-3.4.1.min.js"></script>
        <script src="static/js/jquery-ui.min.js"></script>
        <script src="static/js/bootstrap.min.js"></script>
        <script src="static/js/jquery.tocify.min.js"></script>
        
        <script>
            $(function () {
            //Calls the tocify method on your HTML div.
            $("#toc").tocify({
            selectors: "h1",
            theme: "bootstrap",
            hashGenerator: "pretty",
            ignoreSelector: ".skip-toc"
            });
            });
            
            $('.selector-heading').each(function(){
            let nextSiblingElementType = jQuery(this).next().prop('nodeName');
            if(nextSiblingElementType == "H2" || nextSiblingElementType == "DL" ){
            $(this).append(' <i class="fa fa-times-circle error"/>');
            }else{
            $(this).append(' <i class="fa fa-check-circle correct"/>');                        
            }
            });
        </script>
    </xsl:template>
    
</xsl:stylesheet>
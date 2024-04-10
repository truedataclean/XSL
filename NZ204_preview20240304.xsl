<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xs="http://www.w3.org/2001/XMLSchema" 
                exclude-result-prefixes="xs xsi">
    <!-- changes made on 31st-Mar-2020 IIC -->
    <!-- 23-Feb-2021, IIC
         NTM-289 : added an extra Location heading before K3771 named 'MECHANICS BAY'	
         NTM-291 : added macrons to geographic headers 
         10-Mar-2021, IIC
         NTM-289 : Updated border to MECHANICS BAY heading
         NTM-291 : Updated headings as per published NILL, SILL -->
    <!-- changes made on 2021, 2022, 2023 DPark -->
    
    <xsl:variable name="ti" select="*/TITLE"/>
    <xsl:template match="/">
        <html>
            <head>
                
                <!-- If using attached images etc in MS Word uncomment and edit the base path to point to the folder where the document was exported for word to find the files -->
                <xsl:if test="normalize-space(*/PUBLISHED_FILENAME)">
                    <base>
                        <xsl:variable name="last-hyphen" >
                            <xsl:call-template name="last-index-of">
                                <xsl:with-param name="txt" select="*/PUBLISHED_FILENAME"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:attribute name="target"><xsl:value-of select="'_blank'"/></xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:value-of select="substring(*/PUBLISHED_FILENAME,1,$last-hyphen)"/>
                        </xsl:attribute>
                    </base>
                </xsl:if>
                <!--                <base href="D:\IC\Work\Job6069_LINZMaintenance\NZ204_LINZ_QUERY\29-Nov-2018\NZ204\XML\" target="_blank" />-->
                <style type="text/css">
                    body{     
                    width: 100%;
                    font-family: "Helvetica Neue", Helvetica !important;
                    }
                    
                    h1{
                    font-size: 16pt;
                    font-family: "Helvetica Neue", Helvetica !important;
                    text-transform: capitalize;
                    text-align:center;
                    max-width: 380px;
                    margin: 0 auto;
                    }
                    
                    h2{
                    font-size: 15pt;
                    font-family: "Helvetica Neue", Helvetica !important;
                    text-transform: uppercase;
                    margin: 0 auto;
                    }
                    
                    h3{
                    font-size: 15pt;
                    font-family: "Helvetica Neue", Helvetica !important;
                    font-weight: normal;
                    margin: 0 auto;
                    }
                    
                    h4{
                    font-size: 13pt;
                    font-family: "Helvetica Neue", Helvetica !important;
                    font-weight: normal;
                    margin: 0 auto;
                    }
                    
                    h5{
                    font-size: 11pt;
                    font-family: "Helvetica Neue", Helvetica !important;
                    text-transform: uppercase;
                    margin: 0 auto;
                    }
                    
                    h6{
                    font-size: 11pt;
                    font-family: "Helvetica Neue", Helvetica !important;
                    font-weight: normal;
                    margin: 0 auto;
                    }
                    
                    table.contents{
                    font-size: 13pt;
                    font-family: "Helvetica Neue", Helvetica !important;
                    }
                    
                    .lightlist table{
                    width: 100%;
                    table-layout: fixed;
                    border-style: none;
                    }
                    
                    
                    .lightlist td{
                    padding-left: 0.25em;
                    padding-right: 0.25em;
                    vertical-align: top;
                    }
                    
                    <!-- .lightlist td{
                         border-style: none;
                         } -->
                         
                 .logo-edition-date{
                     background-image: url('LINZ-logo-T.tif');
                     background-repeat: no-repeat;
                     background-size: 100%;
                     box-sizing: border-box;
                     }
                     .layout_common_headings tr td{
                     padding-bottom:5px;
                     }
                     .abbreviations_inlights tr td{
                     padding-bottom:1px;
                     }
                     table { page-break-inside:auto }
                     tr { page-break-inside:avoid; page-break-after:auto }
                     td { page-break-inside:avoid; page-break-after:auto }
                         
             </style>
            </head>
            
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="NTC_PUBLICATION">
        <xsl:apply-templates select="SECTION_LIST/SECTION_LIST_ITEM/NM_CAT_SECTION/SECTION_CONTENT_LIST/SECTION_CONTENT_LIST_ITEM/NM_SECTION_LIGHTLIST_PRODUCT"/>
    </xsl:template>
    
    
    <!-- Dpark -->
    
    <!-- Dpark -->
    
    <xsl:template match="NM_NZ204_LOL_PUBLICATION">
        <div align="right" width="0px" height="0px">
            <img width="254" height="56" src="N:\HPD\shared\HPD40\PM_LINZConfiguration\Light List\LINZ-logo-T.tif" alt="LOGO_IMAGE" />
        </div>
        <xsl:variable name="publish_date">
            <xsl:value-of select="PUBLISH_DATE"/>
        </xsl:variable>     
        
        <p style="font-weight:bold;text-align:center;margin-top:200px;font-size:22pt;">NZ List of Lights</p>
        <p style="font-weight:bold;text-align:center;font-size:18pt;">(including accompanying notes)</p>
        <!-- <p style="font-weight:bold;text-align:center;margin-top:100px;font-size:42px;">NORTH ISLAND</p>-->
        <!-- xsl variables up and lo and translate() are used to change case -->  
        <!--<xsl:variable name="tname" select="SECTION_LIST/SECTION_LIST_ITEM/NM_NZ204_LIGHTLIST_GROUP/NZ_204_REGION"/>-->
        <!-- Dpark 28 Apr 2023-->
        <xsl:variable name="tname" select="SECTION_LIST/SECTION_LIST_ITEM/NM_NZ204_LIGHTLIST_GROUP/NZ_204_REGION"/>
        <xsl:choose>
            <xsl:when test="contains($tname,'NORTH ISLAND') or contains($tname,'North Island') or contains($tname,'north island')">
                <p style="font-weight:bold;text-align:center;font-size:32pt;margin-top:100px;">
                    <xsl:value-of select="'North Island'"/>
                </p>
            </xsl:when>
            <xsl:when test="contains($tname,'SOUTH ISLAND') or contains($tname,'South Island') or contains($tname,'south island')">
                <p style="font-weight:bold;text-align:center;font-size:32pt;margin-top:100px;">
                    <xsl:value-of select="'South Island'"/>
                </p>
            </xsl:when>
            <xsl:when test="contains($tname,'CHATHAM ISLAND') or contains($tname,'Chatham Island') or contains($tname,'chatham island')">
                <p style="font-weight:bold;text-align:center;font-size:32pt;margin-top:100px;">
                    <xsl:value-of select="'Chatham Island'"/>
                </p>
            </xsl:when>
            <xsl:otherwise>
            </xsl:otherwise>
        </xsl:choose>
        
        <!-- Dpark -->
        
        <p style=" text-align:center;margin-bottom:275px;font-size:14pt;">(updated to NTM Edition <xsl:value-of select="EDITION"/>, 
            <xsl:call-template name="publishdateformat">
                <xsl:with-param name="datestr" select="$publish_date"></xsl:with-param>
            </xsl:call-template>)</p>
        <p style="font-weight:bold;font-size:11pt;margin:0px; padding: 0px;">Disclaimer</p>
        <p style="font-size:11pt;margin:0; padding: 0px;">NZ Light Lists downloaded from <a href="http://www.linz.govt.nz/sea/nautical-information/list-lights" target="_blank">
                http://www.linz.govt.nz/sea/nautical-information/list-lights</a> do
            not meet the requirements as specified in Maritime Rules Part 25 Nautical Charts and
            Publications (pursuant to Section 36 of the Maritime Transport Act 1994).</p>
        <span><br style="mso-special-character:line-break; page-break-before:always"/></span>
        <div>           
            <p style= "font-weight:bold;text-align:center;font-size:12pt;">Abbreviations Used in New Zealand List of Lights</p>
            <div >
                <table width="100%" style="font:'Helvetica Neue', Helvetica !important;font-size:9pt; padding:0px; margin:0px; border-collapse:collapse;">
                    <tbody class="abbreviations_inlights">
                        <tr>
                            <td width="100">AHP.....................</td>
                            <td width="230">Above head of passes (in miles)</td>
                            <td width="100">NNE.....................</td>
                            <td width="250">North Northeast</td>
                        </tr>
                        <tr>
                            <td>AIS ......................</td>
                            <td>Automatic Identification System Station</td>
                            <td>NNW....................</td>
                            <td>North Northwest</td>
                        </tr>
                        <tr>
                            <td>Al.........................</td>
                            <td>Alternating</td>
                            <td>NW.......................</td>
                            <td>Northwest</td>
                        </tr>
                        <tr>
                            <td>bl..........................</td>
                            <td>Blast</td>
                            <td>Oc........................</td>
                            <td>Occulting</td>
                        </tr>
                        <tr>
                            <td>Bu........................</td>
                            <td>Blue</td>
                            <td>Oc(. .)...................</td>
                            <td>Group occulting</td>
                        </tr>
                        <tr>
                            <td>CALM..................</td>
                            <td>Catenary Anchor Leg Mooring</td>
                            <td>Occas..................</td>
                            <td>Occasional</td>
                        </tr>
                        <tr>
                            <td>Dia.......................</td>
                            <td>Diaphone</td>
                            <td style="font-weight:bold;">(P)........................</td>
                            <td>Preliminary</td>
                        </tr>
                        <tr>
                            <td>Dir Lt....................</td>
                            <td>Direction Light</td>
                            <td>PA........................</td>
                            <td>Position approximate</td>
                        </tr>
                        <tr>
                            <td>E..........................</td>
                            <td>East</td>
                            <td>PEL......................</td>
                            <td>Port Entry Light</td>
                        </tr>
                        <tr>
                            <td>ec.........................</td>
                            <td>Eclipse (phase)</td>
                            <td>Q..........................</td>
                            <td>Quick flashing</td>
                        </tr>
                        <tr>
                            <td>ED........................</td>
                            <td>Existence Doubtful</td>
                            <td>R..........................</td>
                            <td>Red</td>
                        </tr>
                        <tr>
                            <td>ENE......................</td>
                            <td>East Northeast</td>
                            <td>Ra refl..................</td>
                            <td>Radar reflector</td>
                        </tr>
                        <tr>
                            <td>ESE......................</td>
                            <td>East Southeast</td>
                            <td>Racon..................</td>
                            <td>Radar responder beacon</td>
                        </tr>
                        <tr>
                            <td>Explos..................</td>
                            <td>Explosive fog signal</td>
                            <td>RC.......................</td>
                            <td>Circular radio beacon</td>
                        </tr>
                        <tr>
                            <td>F..........................</td>
                            <td>Fixed</td>
                            <td>Ramark................</td>
                            <td>Radar beacon</td>
                        </tr>
                        <tr>
                            <td>FFl........................</td>
                            <td>Fixed and flashing</td>
                            <td>Ro Bn...................</td>
                            <td>Radio beacon</td>
                        </tr>
                        <tr>
                            <td>FFl(. .)...................</td>
                            <td>Fixed and group flashing</td>
                            <td>Rot.......................</td>
                            <td>Rotating</td>
                        </tr>
                        <tr>
                            <td>Fl..........................</td>
                            <td>Flashing</td>
                            <td>RTE......................</td>
                            <td>Radar Target Enhancer</td>
                        </tr>
                        <tr>
                            <td>Fl(. .).....................</td>
                            <td>Group flashing</td>
                            <td>S..........................</td>
                            <td>South</td>
                        </tr>
                        <tr>
                            <td>fl...........................</td>
                            <td>Flash (phase)</td>
                            <td>s...........................</td>
                            <td>Seconds</td>
                        </tr>
                        <tr>
                            <td>FPSO...................</td>
                            <td>Floating Production Storage and</td>
                            <td>SAR.....................</td>
                            <td>Search and Rescue</td>
                        </tr>
                        <tr>
                            <td> </td>
                            <td>Offloading facility</td>
                            <td>SBM.....................</td>
                            <td>Single Buoy Mooring</td>
                        </tr>
                        <tr>
                            <td>FSO.....................</td>
                            <td>Floating Storage and Offloading facility</td>
                            <td>SE........................</td>
                            <td>Southeast</td>
                        </tr>
                        <tr>
                            <td>FSU......................</td>
                            <td>Floating Storage Unit</td>
                            <td>si .........................</td>
                            <td>Silence</td>
                        </tr>
                        <tr>
                            <td>G .........................</td>
                            <td>Green</td>
                            <td>Sig Stn.................</td>
                            <td>Signal Station</td>
                        </tr>
                        <tr>
                            <td>GRP.....................</td>
                            <td>Glass Reinforced Plastic</td>
                            <td>SPM.....................</td>
                            <td>Single Point Mooring</td>
                        </tr>
                        <tr>
                            <td>HFPB...................</td>
                            <td>High Focal Plane Buoy</td>
                            <td>SSE......................</td>
                            <td>South Southeast</td>
                        </tr>
                        <tr>
                            <td>(hor).....................</td>
                            <td>Horizontal</td>
                            <td>SSW.....................</td>
                            <td>South Southwest</td>
                        </tr>
                        <tr>
                            <td>I............................</td>
                            <td>Interrupted</td>
                            <td>SV.........................</td>
                            <td>Sodium vapour discharge</td>
                        </tr>
                        <tr>
                            <td>Intens...................</td>
                            <td>Intensified sector</td>
                            <td> </td>
                            <td>lamp <span>orange</span> in colour</td>
                        </tr>
                        <tr>
                            <td>Irreg.....................</td>
                            <td>Irregular</td>
                            <td>SW........................</td>
                            <td>Southwest</td>
                        </tr>
                        <tr>
                            <td>Iso........................</td>
                            <td>Isophase</td>
                            <td style="font-weight:bold;">(T).........................</td>
                            <td>Temporary</td>
                        </tr>
                        <tr>
                            <td>Lanby...................</td>
                            <td>Large Automatic Navigational Buoy</td>
                            <td>TALM....................</td>
                            <td>Taut Anchor Leg Mooring</td>
                        </tr>
                        <tr>
                            <td>Lat.......................</td>
                            <td>Latitude</td>
                            <td style="font-weight:bold;">TD........................</td>
                            <td>Fog signal temporarily</td>
                        </tr>
                        <tr>
                            <td>Ldg Lts................</td>
                            <td>Leading Lights</td>
                            <td> </td>
                            <td>discontinued</td>
                        </tr>
                        <tr>
                            <td>LED......................</td>
                            <td>Light Emitting Diode</td>
                            <td style="font-weight:bold;">TE.........................</td>
                            <td>Light temporarily</td>
                        </tr>
                        <tr>
                            <td>LFl........................</td>
                            <td>Long flash</td>
                            <td> </td>
                            <td>extinguished</td>
                        </tr>
                        <tr>
                            <td>Lit.........................</td>
                            <td>Light (no details known)</td>
                            <td style="font-weight:bold;">TR........................</td>
                            <td>Racon temporarily</td>
                        </tr>
                        <tr>
                            <td>Long....................</td>
                            <td>Longitude</td>
                            <td> </td>
                            <td>discontinued</td>
                        </tr>
                        <tr>
                            <td>LPG.....................</td>
                            <td>Liquid Petroleum Gas</td>
                            <td>Unintens...............</td>
                            <td>Unintensified sector</td>
                        </tr>
                        <tr>
                            <td>lt...........................</td>
                            <td>Light (phase)</td>
                            <td>UQ........................</td>
                            <td>Ultra quick flashing</td>
                        </tr>
                        <tr>
                            <td>Lt F .....................</td>
                            <td>Light-float</td>
                            <td>(var).......................</td>
                            <td>Varying</td>
                        </tr>
                        <tr>
                            <td>Lts in line.............</td>
                            <td>Lights in line</td>
                            <td>(vert)......................</td>
                            <td>Vertical</td>
                        </tr>
                        <tr>
                            <td>(M)........................</td>
                            <td>Light owned by Maritime New Zealand</td>
                            <td>Vi...........................</td>
                            <td>Violet</td>
                        </tr>
                        <tr>
                            <td>M.........................</td>
                            <td>Sea miles</td>
                            <td>Vis.........................</td>
                            <td>Visible</td>
                        </tr>
                        <tr>
                            <td>m.........................</td>
                            <td>metres</td>
                            <td>VQ.........................</td>
                            <td>Very quick flashing</td>
                        </tr>
                        <tr>
                            <td>min.......................</td>
                            <td>Minutes</td>
                            <td>W..........................</td>
                            <td>West</td>
                        </tr>
                        <tr>
                            <td>Mo.......................</td>
                            <td>Morse code light or fog signal</td>
                            <td>W..........................</td>
                            <td>White</td>
                        </tr>
                        <tr>
                            <td>MV.......................</td>
                            <td>Mercury vapour discharge lamp</td>
                            <td>Whis......................</td>
                            <td>Whistle</td>
                        </tr>
                        <tr>
                            <td> </td>
                            <td><span>greenish-white</span> in colour</td>
                            <td>WNW....................</td>
                            <td>West Northwest</td>
                        </tr>
                        <tr>
                            <td>N..........................</td>
                            <td>North</td>
                            <td>WSW.....................</td>
                            <td>West Southwest</td>
                        </tr>
                        <tr>
                            <td>NE........................</td>
                            <td>Northeast</td>
                            <td>Y...........................</td>
                            <td><span>Yellow</span>, <span>amber</span> or <span>orange</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <span><br style="mso-special-character:line-break; page-break-before:always"/></span>
        <div style= "margin-top:10px;">
            <p style= "font-weight:bold; text-align:center; font-size:12pt; margin:0px 0px 5px 0px;">Layout of Column Headings in New Zealand List of Lights</p>
            <div style= "margin-bottom: 10px ; ">
                <table style="font-size:9pt; margin:0px; padding:0px;" class="layout_common_headings">
                    <tr>
                        <td width="80">Column 1:</td>
                        <td >Contains the number of each light.</td>
                    </tr>
                    <tr>
                        <td valign="top">Column 2:</td>
                        <td >
                            Location, name.<br></br>
                            The names of lights having a range of 15 miles and over are printed in <b>bold</b> type.<br></br>
                            Names of lights owned by Maritime New Zealand are annotated(M).
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">Column 3:</td>
                        <td >Latitude and longitude are given to two decimal places of a minute.</td>
                    </tr>
                    
                    <!--
                         </table>
                         </div>
                         
                         <table style="margin-top:6px;margin-bottom:6px;background-color:silver;border-top:1px solid black;border-bottom:1px solid black;">
                         <tr>
                         <td><p style="text-align:justify;font-size:8.5pt;font-weight:bold;margin:5px;">IMPORTANT NOTE:</p>
                         <p style="font-size:8.5pt;margin:0;"><span  style="font-family:'Helvetica Neue', Helvetica !important;"><i>“Positions given are approximate. They are included only to help in the identification of features on charts. It is possible to
                         find differences, especially in longitude, of several tenths of a minute between these positions and those on charts in use,
                         as a result of the variations between geodetic reference systems”</i></span>(refer page A-8, section 4.3, para. 4, M12 Standardization 
                         of List of Lights and Fog Signals 2004. IHO.)
                         </p>
                         </td>
                         </tr>
                         </table>
                         
                         <br/>
                         <div style="margin-bottom:200px; ">
                         <table style="font-size:9pt; margin:0px; padding:0px;" class="layout_common_headings" >
                    -->
                    <tr>
                        <td width="80">Column 4: </td>
                        <td>Characteristics. </td>
                    </tr>
                    <tr>
                        <td>Column 5: </td>
                        <td>Elevation in metres. </td>
                    </tr>
                    <tr>
                        <td>Column 6: </td>
                        <td>Range in sea miles, in bold type if 15 miles or more. </td>
                    </tr>
                    <tr>
                        <td>Column 7: </td>
                        <td>Description of structure and its height in metres. </td>
                    </tr>
                    <tr>
                        <td>Column 8: </td>
                        <td>Remarks, including phase, sectors and arcs of visibility.</td>
                    </tr>
                </table>
            </div>
            <p style="margin : 0px 0px 210px 0px; padding: 0px; text-align:center;font-size:12pt;font-weight:bold;">Refer to <a href="http://www.linz.govt.nz" target="_blank">http://www.linz.govt.nz</a> to obtain a full extract from the NZ Nautical Almanac for general information relating to the NZ List of Lights
            </p>
        </div>
        <p><br style="mso-special-character:line-break; page-break-before:always"/></p>
        <xsl:apply-templates select="SECTION_LIST/SECTION_LIST_ITEM/NM_NZ204_LIGHTLIST_GROUP">
            <xsl:sort select="INTERNATIONAL_NUMBER"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="NM_NZ204_LIGHTLIST_GROUP | NM_SECTION_LIGHTLIST_PRODUCT">
        <xsl:apply-templates select="SECTION_CONTENT_LIST"/>
    </xsl:template>
    
    <xsl:template match="*"/>
    
    <xsl:template match="SECTION_CONTENT_LIST">
        <xsl:variable name="publish_date">
            <xsl:value-of select="../../../../PUBLISH_DATE"/>
        </xsl:variable> 
        <xsl:if test="SECTION_CONTENT_LIST_ITEM/NM_LIGHT_LIST_RECORD or SECTION_CONTENT_LIST_ITEM/NM_SECTION_LIGHTLIST_PRODUCT">
            <table style="font-family:'Helvetica Neue', Helvetica !important; border-collapse:collapse; padding: 0px; margin:0px; width:100%; font-size: 8pt;" width="100%">
                
                <!-- border-top:1px solid black;border-bottom:1px solid black; -->
                <thead>
                    
                    <h6 style="text-align:left;font-family:'Helvetica Neue', Helvetica !important;font-size:8pt;  background-color:white; ">Corrected to NZ Notices to Mariners Fortnightly Edition No <xsl:value-of select="../../../../EDITION"/>, dated <xsl:call-template name="publishdateformat">
                            <xsl:with-param name="datestr" select="$publish_date"></xsl:with-param>
                        </xsl:call-template>
                    </h6>
                    
                    <div style = " border-top: 1px solid #696969;">
                        <!--<div style = " border-top: 1px solid #ebe010;">-->
                        <tr style="width:100%; background-color:silver; ">
                            <th colspan="8">
                                <h1>
                                    <xsl:variable name="tname" select="../NZ_204_REGION"/>
                                    <xsl:choose>
                                        <!--<xsl:when test="$tname='NORTH ISLAND'">-->
                                        <xsl:when test="contains($tname,'NORTH ISLAND') or contains($tname,'North Island') or contains($tname,'north island')">
                                            <xsl:variable name="thname" select="'North Island'"/>
                                        </xsl:when>
                                        <xsl:when test="contains($tname,'SOUTH ISLAND') or contains($tname,'South Island') or contains($tname,'south island')">
                                            <xsl:value-of select="'South Island'"/>
                                        </xsl:when>
                                        <xsl:when test="contains($tname,'CHATHAM ISLAND') or contains($tname,'Chatham Island') or contains($tname,'chatham island')">
                                            <xsl:value-of select="'Chatham Island'"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </h1>
                            </th>
                        </tr>
                    </div>
                    <tr style="height:25px; text-align:center; background:silver;">
                        <td style="width:10%;vertical-align:text-top; font-size:7pt !important;"><table style="border-collapse:collapse; padding: 0px; margin:0px; font-size:7pt"><tr><td>Int. K No.</td></tr></table></td>
                        <td style="width:15%;vertical-align:text-top; font-size:7pt !important;"><table style="border-collapse:collapse; padding: 0px; margin:0px; font-size:7pt"><tr><td>Location - Name</td></tr></table></td>
                        <td style="width:8.9%;vertical-align:text-top; font-size:7pt !important;" width="150">
                            
                            <table style="border-collapse:collapse; padding: 0px; margin:0px; font-size:7pt">
                                <tr><td width="100" >Lat</td><td>S</td></tr>
                                <tr><td>Long</td>
                                    <!--<td>E</td>-->
                                    <!--Dpark Add 2021 ST-->
                                    <xsl:choose>
                                        <xsl:when test="contains($ti,'Chatham')">
                                            <td>W</td>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <td>E</td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <!--Dpark Add 2021 END-->	
                                    
                                </tr>
                                
                                
                            </table>    
                            
                        </td>
                        <td style="width:12.4%;vertical-align:text-top; font-size:7pt !important;"><table style="border-collapse:collapse; padding: 0px; margin:0px; font-size:7pt"><tr><td>Characteristics</td></tr></table></td>
                        <td style="width:7%;vertical-align:text-top; font-size:7pt !important;"><table style="text-align:center; border-collapse:collapse; padding: 0px; margin:0px; font-size:7pt"><tr><td>Elevation metres</td></tr></table></td>
                        <td style="width:6%;vertical-align:text-top; font-size:7pt !important;"><table style="text-align:center; border-collapse:collapse; padding: 0px; margin:0px; font-size:7pt"><tr><td>Range miles</td></tr></table></td>
                        <td style="width:19%;vertical-align:text-top; font-size:7pt !important;"><table style="text-align:center; border-collapse:collapse; padding: 0px; margin:0px; font-size:7pt;"><tr><td>Structure <br/> Height in metres</td></tr></table></td>
                        <td style="width:22%;vertical-align:text-top; font-size:7pt !important;"><table style="border-collapse:collapse; padding: 0px; margin:0px; font-size:7pt"><tr><td>Remarks</td></tr></table></td>
                    </tr>
                    <tr keep-together.within-page="always" style="background:silver;">
                        <td style="text-align:center; border-bottom: 1px solid #696969; font-size:7pt !important;">(1)</td>
                        <td style="text-align:center; border-bottom: 1px solid #696969; font-size:7pt !important;">(2)</td>
                        <td style="text-align:center; border-bottom: 1px solid #696969; font-size:7pt !important;">(3)</td>
                        <td style="text-align:center; border-bottom: 1px solid #696969; font-size:7pt !important;">(4)</td>
                        <td style="text-align:center; border-bottom: 1px solid #696969; font-size:7pt !important;">(5)</td>
                        <td style="text-align:center; border-bottom: 1px solid #696969; font-size:7pt !important;">(6)</td>
                        <td style="text-align:center; border-bottom: 1px solid #696969; font-size:7pt !important;">(7)</td>
                        <td style="text-align:center; border-bottom: 1px solid #696969; font-size:7pt !important;">(8)</td>
                    </tr>
                </thead>  
                <xsl:apply-templates select="SECTION_CONTENT_LIST_ITEM/NM_LIGHT_LIST_RECORD | SECTION_CONTENT_LIST_ITEM/NM_SECTION_LIGHTLIST_PRODUCT/SECTION_CONTENT_LIST/SECTION_CONTENT_LIST_ITEM/NM_LIGHT_LIST_RECORD"/>
          
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>       
  
            </table>
            
        </xsl:if>
        
    </xsl:template>
    
    <xsl:template match="SECTION_CONTENT_LIST_ITEM">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="NM_LIGHT_LIST_RECORD">
        <xsl:variable name="gValue">
            <xsl:for-each select="LUM_GEO_RANGE/node()">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:for-each>
        </xsl:variable>
        <!-- <xsl:if test="INTERNATIONAL_NUMBER !=''">
             <tr>
             <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
             <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
             </tr>
             </xsl:if>-->
        <xsl:if test="INTERNATIONAL_NUMBER=3690.4">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <th colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></th>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Parengarenga Harbour</td>
            </tr>	
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3690.6">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Houhora Harbour</td>	
            </tr>	
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3691">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Rangaunu Harbour</td>
            </tr>	
        </xsl:if>
        <!-- <p><br /></p> blank line -->
        <xsl:if test="INTERNATIONAL_NUMBER=3691.35">
            <p style = "line-height:60px;"><xsl:text>&#160;</xsl:text></p>
            
        </xsl:if>
        
        <xsl:if test="INTERNATIONAL_NUMBER=3691.4">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Awanui Channel</td>
            </tr>
            
        </xsl:if>
        
        <xsl:if test="INTERNATIONAL_NUMBER=3692">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        
        
        <xsl:if test="INTERNATIONAL_NUMBER=3696.5">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Port Mangōnui</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3698">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Whangaroa Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3699">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Cavalli Islands</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3700">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Bay of Islands Harbour</td>
            </tr>	
        </xsl:if>
        
        <xsl:if test="INTERNATIONAL_NUMBER=3700.5">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3700.625">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3704.3">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3708">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Opua</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3709">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Eastern Bay of Islands</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3710.3">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Whangaruru Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3712">
            <p><br style="mso-special-character:line-break; page-break-before:always"/></p>
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Tutukaka Harbour</td>	
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3714">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Hen and Chicken Islands</td>
            </tr>
        </xsl:if>
        
        <xsl:if test="INTERNATIONAL_NUMBER=3716">
            
            <p style = "line-height:25px;"><xsl:text>&#160;</xsl:text></p>
            
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Whangārei Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3717.4">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Shell Cut Reach</td>
            </tr>
        </xsl:if>
        

        <xsl:if test="INTERNATIONAL_NUMBER=3718.751">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Shoal Bay</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3718.76">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Parua Bay</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3718.8">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Tamaterau Beach</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3717.41">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3718.9">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3720">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Wellington Reach</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3721">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Channel TO Portland</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3722">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Portland</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3722.1">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3722.7">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Channel TO Whangārei</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3725.8">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Port Whangārei</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3729.6">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Hātea River</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3734">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Mokohinau Islands</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3735">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Mangawhai Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3736">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Great Barrier Island (Aotea Island)</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3736.1">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3737">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Omaha Bay</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3738">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Hauraki Gulf / Tīkapa Moana</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3738.64">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3741.72">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3744">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Auckland Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3748">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3764">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Devonport</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3770">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3771">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Mechanics Bay</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3798.1">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3800">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Westhaven Boat Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3833">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Upper Waitematā Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3838">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3840">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3845.4">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Waiheke Island</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3847.8">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3849">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Tamaki River</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3849.72">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3850.2">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Tamaki Strait</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3850.6">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Waiheke Channel</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3852">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Firth Of Thames</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3860">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Thames</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3861">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3893">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Mercury Bay</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3893.2">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Whitianga Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3897">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Whangamatā Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3898.197">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Katikati Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3898.218">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3899">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Tauranga Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3899.05">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3899.7">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3905">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3919.3">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3919.36">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3920.4">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3922">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Bay Of Plenty</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3932">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">East Coast</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3954">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Tūranganui-a-Kiwa / Poverty Bay</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER='3958_1'">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>

        <xsl:if test="INTERNATIONAL_NUMBER=3980.5">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Napier Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3981.7">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3990">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Inner Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=3994">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4004">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Wellington Harbour (Port Nicholson)</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4020">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4024">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Lambton Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4057.6">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>

        <xsl:if test="INTERNATIONAL_NUMBER=4061">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Cook Strait</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4066.3">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Te Awarua-o-Porirua Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4072">
            
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Whanganui Port</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4076">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER='4087.5_1'">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4091">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Port Taranaki</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4095.5">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4096">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Taharoa</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4101">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Kawhia Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4104">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Whāingaroa Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4107">
            <p style = "line-height:25px;"><xsl:text>&#160;</xsl:text></p>
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Manukau Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4110.8">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4116.15">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Wairopa Channel</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4116.32">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4116.8">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4130">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Kaipara Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4135">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4151">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Hokianga Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4182">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Golden Bay / Mohua</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4198">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Tarakohe Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4204">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Tasman Bay / Te Tai-o-Aorere</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4212">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Motueka</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4220.16">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Māpua</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4222">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Port Nelson</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4225">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4231.08">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4231.2">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Boat Harbour Channel</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4233">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Tasman Bay / Te Tai-o-Aorere</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4238">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Te Aumiti / French Pass</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4242">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Chetwode Islands</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4242.1">
        <p style = "line-height:25px;"><xsl:text>&#160;</xsl:text></p>
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Pelorus Sound / Te Hoiere</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4243">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Havelock Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4243.51">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4244">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Cook Strait</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4248">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Queen Charlotte Sound / Tōtaranui</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4253">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4256">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Picton Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4260.2">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4262">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Tory Channel / Kura Te Au</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4268.3">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Cook Strait</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4268.4">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4275">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Kaikōura Peninsula</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4286">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Lyttelton Harbour / Whakaraupō</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4287.9">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4296">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4310">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4314">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Akaroa Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4324">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Timaru Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4329">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4348">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Oamaru Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4363">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Otago Harbour</td>
            </tr>
        </xsl:if>
        <!--                         -->	
        <xsl:if test="INTERNATIONAL_NUMBER=4365">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
        </xsl:if>
        <!--                         -->
        <xsl:if test="INTERNATIONAL_NUMBER=4366">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4366.9">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Lower Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4367.7">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4369.6">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4370.2">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Port Chalmers</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4372.1">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4372.4">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Upper Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4374.1">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Victoria Channel</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4374.16">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4374.47">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4374.76">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4374.98">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Dunedin</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4388">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Stewart Island / Rakiura</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4397">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Bluff Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4424">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4432">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Riverton / Aparima</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4438">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Foveaux Strait</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4446">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Fiordland</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4464">
        <p style = "line-height:5px;"><xsl:text>&#160;</xsl:text></p>
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Milford Sound / Piopiotahi</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4466">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Jackson Bay / Okahu</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4470">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Greymouth Harbour</td>
            </tr>
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4486">
            <tr>
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
            </tr>
            <tr bgcolor="#efeff5">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;">Westport and Buller River</td>
            </tr>
            
        </xsl:if>
        <xsl:if test="INTERNATIONAL_NUMBER=4491">
            
            
            <tr style="mso-special-character:line-break; page-break-before:always;">
                <td style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
                <td colspan="7" style="border-bottom:1px solid #696969;width:10%;vertical-align:text-top;page-break-before:always;"></td>
            </tr>
            
            
        </xsl:if>
        <xsl:choose>
            <xsl:when test="not(contains(INTERNATIONAL_NUMBER,'_'))">
                <tr>
                    <td keep-together.within-page="always" style="border-top:1px solid silver;width:6%;vertical-align:text-top;"><b><xsl:value-of select="INTERNATIONAL_NUMBER"/></b></td>
                    <td keep-together.within-page="always" style="border-top:1px solid silver;width:10%;vertical-align:text-top;">
                        <xsl:copy-of select="LOC_NAME_CHART_NUM_ENG/node()"/>
                        <xsl:if test="NM_LIGHTS_OBMNZ='Yes'">
                            <xsl:text> (M)</xsl:text>
                        </xsl:if>
                        <!-- <xsl:choose>
                             <xsl:when test="number($gValue) &gt;= 15">
                             <b>
                             <xsl:copy-of select="LOC_NAME_CHART_NUM_ENG/node()"/>
                             </b>
                             <xsl:if test="NM_LIGHTS_OBMNZ='Yes'">
                             <xsl:text> (M)</xsl:text>
                             </xsl:if>
                             
                             </xsl:when>
                             <xsl:otherwise>
                             <xsl:copy-of select="LOC_NAME_CHART_NUM_ENG/node()"/>
                             <xsl:if test="NM_LIGHTS_OBMNZ='Yes'">
                             <xsl:text> (M)</xsl:text>
                             </xsl:if>
                             </xsl:otherwise>
                             </xsl:choose>-->
                     </td>
                    <td keep-together.within-page="always" style="border-top:1px solid silver;width:7%;vertical-align:text-top;text-align:right;padding-right:5px;"><xsl:value-of select="POSITION/LATITUDE"/>
                        <br/>
                        <xsl:value-of select="POSITION/LONGITUDE"/>
                    </td>
                    <td keep-together.within-page="always" style="border-top:1px solid silver;width:8%;vertical-align:text-top;padding-left:2px;"><xsl:copy-of select="LIGHT_CHARACTERISTICS_ENG/node()"/></td>
                    <td keep-together.within-page="always" style="border-top:1px solid silver;width:5%;vertical-align:text-top;text-align:center;"><xsl:copy-of select="LIGHT_HEIGHT/node()"/></td>
                    <td keep-together.within-page="always" style="border-top:1px solid silver;width:5%;vertical-align:text-top;text-align:center;">
                        <!--<xsl:choose>
                             <xsl:when test="number($gValue) &gt;= 15">
                             <b>                    
                             <xsl:copy-of select="LUM_GEO_RANGE/node()"/>
                             </b>                            
                             </xsl:when>
                             <xsl:otherwise>
                             <xsl:copy-of select="LUM_GEO_RANGE/node()"/>
                             </xsl:otherwise>
                             </xsl:choose>-->
                        <xsl:copy-of select="LUM_GEO_RANGE/node()"/>
                    </td>
                    <td keep-together.within-page="always" style="border-top:1px solid silver;width:10%;vertical-align:text-top;">
                        
                        <!-- Dpark-20210319 change node() to value with address-->
                        <xsl:choose>
                            <xsl:when test="DESC_STRUCT_HEIGHT_ENG/text()[2]!= ''">
                                
                                <xsl:copy-of select="DESC_STRUCT_HEIGHT_ENG/text()[2]"/>
                                
                                <xsl:variable name="desc1" select="DESC_STRUCT_HEIGHT_ENG/text()[1]"/>
                                <xsl:if test="$desc1 != ''">
                                    <p style="text-align:left;margin-top: 0px;margin-bottom: 2px;">
                                        <xsl:value-of select="$desc1"/>
                                    </p>
                                </xsl:if>
                                <xsl:variable name="height" select="DESC_STRUCT_HEIGHT_ENG[1]/p[1]/text()[1]"/>
                                <xsl:if test="$height != ''">
                                    <p style="text-align:center;margin-top: 0px;margin-bottom: 2px;">
                                        <xsl:value-of select="$height"/>
                                    </p>
                                </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:copy-of select="DESC_STRUCT_HEIGHT_ENG/text()[1]"/>
                                <xsl:variable name="height" select="DESC_STRUCT_HEIGHT_ENG[1]/p[1]/text()[1]"/>
                                <xsl:if test="$height != ''">
                                    <p style="text-align:center;margin-top: 0px;margin-bottom: 2px;">
                                        <xsl:value-of select="$height"/>
                                    </p>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>						
                        <!-- Dpark-20210319 -->
                        
                    </td>
                    <td keep-together.within-page="always" style="border-top:1px solid silver;width:20%;vertical-align:text-top;margin-left: 5px;"><!--<p style="margin-left: 15px"><xsl:copy-of select="NM_REMARKS"/></p>--><xsl:copy-of select="NM_REMARKS"/>
                        <!--<xsl:value-of select="count(i)"/>-->
                        
                        <!--<p style="margin-left: 15px"><xsl:copy-of select="OBSERVATION_ENG"></xsl:copy-of></p>-->
                        
                        <!--Dpark 20230328 update the remark(observation)column order for case TE..;-->
                        <xsl:variable name="obser" select="OBSERVATION_ENG"/>
                        <xsl:variable name="obser1" select="substring-before($obser, ';')"/>
                        <xsl:variable name="obser2" select="substring-after($obser, ';')"/>
                        
                        <xsl:choose>
                            <xsl:when test="contains($obser, ';')">
                                <xsl:copy-of select="substring-before($obser, 'TE')"></xsl:copy-of>
                                <br/><xsl:copy-of select="substring-before($obser2, '(T)')"></xsl:copy-of>
                                <br/><strong><xsl:copy-of select="substring-after($obser1, 'refl ')"></xsl:copy-of></strong>
                            </xsl:when>
                            <xsl:when test="contains($obser, 'CAUTION')">
                                <xsl:copy-of select="translate($obser, 'CAUTION','Caution')"></xsl:copy-of>
                            </xsl:when>
                            
                            <xsl:otherwise>
                                
                                <xsl:copy-of select="OBSERVATION_ENG"></xsl:copy-of>
                                
                            </xsl:otherwise>
                        </xsl:choose>
                        <!--Dpark 20230328-->
                        
                        
                        <xsl:choose>
                            <xsl:when test="NM_LIGHTS_STATUS='Temporary'">
                                <!--<xsl:text> (T) </xsl:text>-->
                                <br/><strong> T </strong>
                            </xsl:when>
                            <xsl:when test="NM_LIGHTS_STATUS='Racon temporarily discontinued'">
                                <!--<xsl:text> (TR) </xsl:text>-->
                                <br/><strong> TR </strong>
                            </xsl:when>
                            <xsl:when test="NM_LIGHTS_STATUS='Preliminary'">
                                <!--<xsl:text> (P) </xsl:text>-->
                                <br/><strong> P </strong>
                            </xsl:when>
                            <xsl:when test="NM_LIGHTS_STATUS='Temporarily discontinued (non-light AtoN)'">
                                <!-- <xsl:text> (TD) </xsl:text>-->
                                <br/><strong> TD </strong>
                            </xsl:when>
                            <xsl:when test="NM_LIGHTS_STATUS='Temporarily extinguished (light AtoN)'">
                                <br/><strong> TE </strong>
                            </xsl:when>
                            <xsl:otherwise/>
                        </xsl:choose>
                        <xsl:if test="NM_LIGHTS_STATUS != ''">
                            <strong><xsl:value-of select="../../../NM_YEAR_PUB"/></strong>	
                        </xsl:if>
                    </td>
                </tr>
            </xsl:when>
            <xsl:otherwise>
                <tr>
                    <td keep-together.within-page="always" style="width:6%;vertical-align:text-top;"><b><xsl:if test="not(contains(INTERNATIONAL_NUMBER,'_'))"><xsl:value-of select="INTERNATIONAL_NUMBER"/></xsl:if></b></td>
                    <td keep-together.within-page="always" style="width:10%;vertical-align:text-top;">
                        <xsl:choose>
                            <xsl:when test="number($gValue) &gt;= 15">
                                <b>
                                    <xsl:copy-of select="LOC_NAME_CHART_NUM_ENG/node()"/>
                                </b>
                                <xsl:if test="NM_LIGHTS_OBMNZ='Yes'">
                                    <xsl:text> (M)</xsl:text>
                                </xsl:if>
                                
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:copy-of select="LOC_NAME_CHART_NUM_ENG/node()"/>
                                <xsl:if test="NM_LIGHTS_OBMNZ='Yes'">
                                    <xsl:text> (M)</xsl:text>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                    <td style="width:7%;vertical-align:text-top;text-align:right;padding-right:5px;"><xsl:value-of select="POSITION/LATITUDE"/>
                        <br/>
                        <xsl:value-of select="POSITION/LONGITUDE"/>
                    </td>
                    <td keep-together.within-page="always" style="width:8%;vertical-align:text-top;padding-left:2px;"><xsl:copy-of select="LIGHT_CHARACTERISTICS_ENG/node()"/></td>
                    <td keep-together.within-page="always" style="width:5%;vertical-align:text-top;text-align:center;"><xsl:copy-of select="LIGHT_HEIGHT/node()"/></td>
                    <td keep-together.within-page="always" style="width:5%;vertical-align:text-top;text-align:center;">
                        <xsl:choose>
                            <xsl:when test="number($gValue) &gt;= 15">
                                <b>                    
                                    <xsl:copy-of select="LUM_GEO_RANGE/node()"/>
                                </b>                            
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:copy-of select="LUM_GEO_RANGE/node()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                    <td keep-together.within-page="always" style="width:10%;vertical-align:text-top; padding-right:5px;">
                        
                        <!-- Dpark-20210319 change node() to value with address-->
                        <xsl:choose>
                            <xsl:when test="DESC_STRUCT_HEIGHT_ENG/text()[2]!= ''">
                                
                                <xsl:copy-of select="DESC_STRUCT_HEIGHT_ENG/text()[2]"/>
                                
                                <xsl:variable name="desc1" select="DESC_STRUCT_HEIGHT_ENG/text()[1]"/>
                                <xsl:if test="$desc1 != ''">
                                    <p style="text-align:left;margin-top: 0px;margin-bottom: 2px;">
                                        <xsl:value-of select="$desc1"/>
                                    </p>
                                </xsl:if>
                                <xsl:variable name="height" select="DESC_STRUCT_HEIGHT_ENG[1]/p[1]/text()[1]"/>
                                <xsl:if test="$height != ''">
                                    <p style="text-align:center;margin-top: 0px;margin-bottom: 2px;">
                                        <xsl:value-of select="$height"/>
                                    </p>
                                </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:copy-of select="DESC_STRUCT_HEIGHT_ENG/text()[1]"/>
                                <xsl:variable name="height" select="DESC_STRUCT_HEIGHT_ENG[1]/p[1]/text()[1]"/>
                                <xsl:if test="$height != ''">
                                    <p style="text-align:center;margin-top: 0px;margin-bottom: 2px;">
                                        <xsl:value-of select="$height"/>
                                    </p>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>						
                        <!-- Dpark-20210319 -->
                        
                    </td>
                    
                    <td keep-together.within-page="always" style="width:20%;vertical-align:text-top;margin-left: 5px;"><!--<p style="margin-left: 15px"><xsl:copy-of select="NM_REMARKS"/></p>--><xsl:copy-of select="NM_REMARKS/i"/>						
                        <!--<p style="margin-left: 15px"><xsl:copy-of select="OBSERVATION_ENG"></xsl:copy-of></p>-->                       
                        <xsl:copy-of select="OBSERVATION_ENG"></xsl:copy-of>
                        <xsl:choose>
                            <xsl:when test="NM_LIGHTS_STATUS='Temporary'">
                                <!--<xsl:text> (T) </xsl:text>-->
                                <br/><strong> T </strong>
                            </xsl:when>
                            <xsl:when test="NM_LIGHTS_STATUS='Racon temporarily discontinued'">
                                <!--<xsl:text> (TR) </xsl:text>-->
                                <br/><strong> TR </strong>
                            </xsl:when>
                            <xsl:when test="NM_LIGHTS_STATUS='Preliminary'">
                                <!--<xsl:text> P </xsl:text>-->
                                <br/><strong> P </strong>
                            </xsl:when>
                            <xsl:when test="NM_LIGHTS_STATUS='Temporarily discontinued (non-light AtoN)'">
                                <!--<xsl:text> (TD) </xsl:text>-->
                                <br/><strong> TD </strong>
                            </xsl:when>
                            <xsl:when test="NM_LIGHTS_STATUS='Temporarily extinguished (light AtoN)'">
                                <!--<xsl:text> (TE) </xsl:text>-->
                                <br/><strong> TE </strong>
                            </xsl:when>
                            <xsl:otherwise/>
                        </xsl:choose>
                        <xsl:if test="NM_LIGHTS_STATUS != ''">
                            <strong><xsl:value-of select="../../../NM_YEAR_PUB"/></strong>	
                        </xsl:if>
                    </td>
                </tr>
                
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    <xsl:template name="last-index-of">
        <xsl:param name="txt"/>
        <xsl:param name="remainder" select="$txt"/>
        <xsl:param name="delimiter" select="'\'"/>
        
        <xsl:choose>
            <xsl:when test="contains($remainder, $delimiter)">
                <xsl:call-template name="last-index-of">
                    <xsl:with-param name="txt" select="$txt"/>
                    <xsl:with-param name="remainder" select="substring-after($remainder, $delimiter)"/>
                    <xsl:with-param name="delimiter" select="$delimiter"/>
                </xsl:call-template>      
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="lastIndex" select="string-length(substring($txt, 1, string-length($txt)-string-length($remainder)))+1"/>
                <xsl:choose>
                    <xsl:when test="string-length($remainder)=0">
                        <xsl:value-of select="string-length($txt)"/>
                    </xsl:when>
                    <xsl:when test="$lastIndex>0">
                        <xsl:value-of select="($lastIndex - string-length($delimiter))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="0"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>             
    </xsl:template>
    <!-- for PUBLISH_DATE format -->
    <xsl:template name="publishdateformat">
        <xsl:param name="datestr" />
        <!-- input format yyyymmdd -->
        <!-- output format june yy -->
        <xsl:variable name="dd">
            <xsl:value-of select="substring($datestr,9,2)" />
        </xsl:variable>
        <xsl:variable name="mm">
            <xsl:value-of select="substring($datestr,6,2)" />
        </xsl:variable>
        <xsl:variable name="yy">
            <xsl:value-of select="substring($datestr,1,4)" />
        </xsl:variable>
        <xsl:value-of select="$dd" />
        <xsl:text> </xsl:text>
        <xsl:choose>
            <xsl:when test="$mm = '01'"> January  </xsl:when>
            <xsl:when test="$mm = '02'"> February </xsl:when>
            <xsl:when test="$mm = '03'"> March </xsl:when>
            <xsl:when test="$mm = '04'"> April </xsl:when>
            <xsl:when test="$mm = '05'"> May </xsl:when>
            <xsl:when test="$mm = '06'"> June </xsl:when>
            <xsl:when test="$mm = '07'"> July </xsl:when>
            <xsl:when test="$mm = '08'"> August </xsl:when>
            <xsl:when test="$mm = '09'"> September </xsl:when>
            <xsl:when test="$mm = '10'"> October </xsl:when>
            <xsl:when test="$mm = '11'"> November </xsl:when>
            <xsl:when test="$mm = '12'"> December </xsl:when>
        </xsl:choose>
        
        <xsl:text> </xsl:text>
        
        <xsl:value-of select="$yy" />
    </xsl:template>
    
</xsl:stylesheet>

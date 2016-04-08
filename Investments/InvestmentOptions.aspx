<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="InvestmentOptions.aspx.cs" Inherits="RetirementFunds.Investments.InvestmentOptions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
<tr bgcolor="#FFFFFF" class="column">
    <td>
        <br />
        <div style="width:98%; padding-top:24px">
            <!--main content area -->
            <table width="100%" border="0" cellspacing="2" cellpadding="6">
                <tr>
                    <td><div style="margin:20px"></div></td>
                </tr>
                <tr>
                    <td>
                        <!-- This is the primary content area  -->
                        <br />
                        <div id="divPlanInformation" runat="server" visible="false" style="text-align:right">
                            <font class="planHeader">Current Plan: <asp:Label ID="lblPlaneNameHeader" runat="server" /></font>
                        </div>                        
                        <div style="width:98%; padding: 20px 16px 12px 8px;">
                            <span class="headers">investment options</span>
                            <br />
                            <br />
                            <table cellspacing="0" cellpadding="5" width="50%">
                                <tr> 
                                    <td>
                                        <p class="texth2">Learn About Your Investment Fund Options</p>
                                        <span class="text1">Here are brief summaries of each of your NERT investment options. 
                                        To read each fund's prospectus, click on the highlighted fund name. </span>
                                    </td>
                                </tr> 
                                <tr> 
                                    <td>
                                        <table border="0" cellpadding="4" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td align="center" valign="top"><img id="Img1" src="../images/logos/METLIFE.GIF" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">Guaranteed Fund</p>
                                                        <p><font color="#800040" class="red_header"><b>Investment Advisor:</b></font><b class="black_bold"> Metropolitan Life Insurance Co..</b></p>
                                                        <p class="text2"><b>Objective:</b> <b><a href="/Pdfs/MetLife.pdf" target="new">The 
                                                        The MetLife Stable Value Fund </a></b> <span class="text1">The MetLife Stable Value fund provides 
			a guarantee of both principal and interest to Participant-initiated withdrawals </span></p>
                                                        <p class="text2"><img id="Img2" src="~/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr>                    
                                                <tr>
                                                    <td align="center" valign="top"><img id="Img3" src="../images/logos/wells_fargo.gif" width="61" height="47" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">Government Securities Fund</p>
                                                        <p><font color="#800040" class="red_header"><b>Investment Advisor:</b></font><b class="black_bold"> Wells Fargo</b></p>
                                                        <p class="text2"><b>Objective:</b> <b><a href="/Pdfs/WellsFargoFunds.pdf" target="new">The Wells Fargo Government Securities Fund</a></b><span class="text1"> 
                                                        seeks to produce total return by investing for a high level 
                                                        of current income with a moderate degree of share price fluctuation. 
                                                        The Fund normally invests at least 80% of its total assets 
                                                        in U.S. government securities.</span></p>
                                                        <p class="text2"><a href="/Pdfs/WF_gov.pdf" target="_blank"><b></b></a></p>                            
                                                        <p class="text2"><img id="Img4" src="~/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>
                                                    </td>
                                                </tr>            
                                                <tr>
                                                    <td align="center" valign="top"><img id="Img5" src="../images/logos/wells_fargo.gif" width="61" height="47" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">Corporate Bond Fund</p>
                                                        <p><span class="red_header"><font color="#800040"><b>Investment Advisor:</b></font> </span><b class="black_bold">Wells Fargo
                                                        </b></p>
                                                        <p class="text2"><b><a href="/Pdfs/WellsFargoFunds.pdf" target="new">The
                                                        Wells Fargo Advantage Income Plus Fund</a></b><span class="text1"> seeks total return by investing for a
                                                        high level of current income with a moderate degree of share price
                                                        fluctuation. The Fund invests primarily in investment grade corporate
                                                        debt obligations.
                                                        </span></p>
                                                        <p class="text2"><a href="/Pdfs/WF_corp.pdf" target="_blank"><b></b></a></p>                            
                                                        <p class="text2"><img id="Img6" src="~/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" valign="top"><img id="Img7" src="~/images/fundvang.gif" width="166" height="32" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">Balanced Fund</p>
                                                        <p><font color="#800040" class="red_header"><b>Investment Advisor:</b></font><b class="black_bold"> Wellington
                                                        Management Company</b></p>
                                                        <p class="text2"><b>Objective: <a href="/Pdfs/wellington.pdf" target="new">The
                                                        Vanguard Wellington Fund</a></b><span class="text1"> seeks long-term capital appreciation
                                                        and income by varying the allocation of assets of the Portfolio among
                                                        stocks, corporate bonds, government, growth and income, and money market
                                                        funds. It is designed for conservative investors who are seeking a
                                                        balanced investment program offering relative capital stability, a
                                                        reasonable level of income and the potential for capital appreciation
                                                        while limiting investment risk.</span></p>
                                                        <p class="text2"><a href="/Pdfs/Vanguard_Wellington.pdf" target="_blank"><b></b></a></p>                            
                                                        <p class="text2"><img id="Img8" src="~/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr>            
                                                <tr>
                                                    <td align="center" valign="top"><img id="Img9" src="~/images/logos/principal.gif" width="60" height="33" alt="Principal" runat="server"/></td>
                                                    <td>
                                                        <span class="texth2">Real Estate</span>
                                                        <br/>
                                                        <font color="#800040" class="red_header"><b>Investment Advisor:</b></font><b class="black_bold"> Principal Global Advisors</b>
                                                        <p class="text2"><b>Objective: <a href="/Pdfs/Principal_US_Property.pdf" target="new">The Principal US Property Account</a></b><span class="text1"> Seeking long-term capital appreciation and income by varying the allocation of assets of the Portfolio among stocks, corporate bonds, government, growth and income, and money market funds.</span></p>
                                                                           
                                                        <p class="text2"><a href="/Pdfs/principal.pdf" target="_blank"><b></b></a></p>                            
                                                        <p class="text2"><img id="Img10" src="~/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" valign="top"><img id="Img11" src="~/images/pioneer.gif" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">Value Fund</p>
                                                        <p><font color="#800040" class="red_header"><b>Investment Advisor:</b></font><b class="black_bold"> Pioneer Investments</b><br/>
                                                        </p>
                                                        <p class="text2"><b>Objective : <a href="/Pdfs/PioneerCullen.pdf" target="new">The
                                                        Pioneer Fundamental Value  Fund</a> </b><span class="text1"> restricts itself to the large/mid capitalization value sector of the  equity markets.&nbsp;
                                                        Value is commonly defined as lower P/E and price to book  multiples, but can include other factors</span></p>
                                                        <p class="text2"><a href="/Pdfs/PioneerCullenValue.pdf" target="_blank"><b></b></a></p>            
                                                        <p class="text2"><img id="Img12" src="~/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" valign="top"><img id="Img13" src="~/images/fundvang.gif" width="166" height="32" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">S&amp;P 500 Index Fund</p>
                                                        <p><font color="#800040" class="red_header"><b>Investment Advisor:</b></font><b class="black_bold"> Vanguard
                                                        Core Management Group</b></p>
                                                        <p class="text2"><b>Objective: <a href="/Pdfs/sp500index.pdf" target="new">The
                                                        Vanguard Index Fund</a> </b><span class="text1">seeks to mirror the performance of the
                                                        Standard and Poor's 500 Composite Stock Price Index (the &quot;S&amp;P
                                                        500 Index&quot;), which emphasizes large capitalization companies. The
                                                        fund is designed for long-term investors seeking the advantages of a
                                                        low-cost, &quot;passive&quot; approach for investing in a diversified
                                                        portfolio of common stocks.</span></p>
                                                        <p class="text2"><a href="/Pdfs/Vanguard_500.pdf" target="_blank"><b></b></a></p>                            
                                                        <p class="text2"><img id="Img14" src="~/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr>                    
                                                <tr>
                                                    <td align="center" valign="top"><img id="Img15" src="~/images/TRowePricelogo.GIF" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">Growth Fund:</p>
                                                        <p><font color="#800040" class="red_header"><b>Investment Advisor:</b></font> <span class="black_bold">T Rowe Price</span></p>
                                                        <p class="text2"><b>Objective: <a href="/Pdfs/TRowePriceGrowth.pdf" target="new">T Rowe Price</a></b><span class="text1">  The T Rowe Pricel  Growth Fund seeks long term growth of capital; income is secondary. 
				The fund generally looks for companies with an above-average rate of earnings growth and a lucrative niche in the economy. 
                                                        </span></p>
                                                        <p class="text2"><a href="/Pdfs/TRowePrice.pdf" target="_blank"><b></b></a></p>                            
                                                        <p class="text2"><img id="Img16" src="~/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" valign="top"><img id="Img17" src="../images/PIMCO.jpg" width="115" height="27" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">Foreign Bonds</p>
                                                        <p><font color="#800040" class="red_header"><b>Investment Advisor:</b></font> <span class="black_bold">Pimco</span></p>
                                                        <p class="text2"><b>Objective:<a href="/Pdfs/pimco.pdf" target="new"> <span class="style1">The Pimco Foreign Bond Fund</a></b><span class="text1"> seeks maximum total return,  consistent with preservation of capital. The fund invests at least 80% of assets in Fixed Income instruments issued outside the United States</span></p>                            
                                                        <p class="text2"><a href="/Pdfs/PIMCO Foreign Bond.pdf" target="_blank"><b></b></a></p>                            
                                                        <p class="text2"><img id="Img18" src="~/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" valign="top"><img id="Img19" src="../images/artisan_blk_wht.jpg" width="75" height="75" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">International Fund</p>
                                                        <p><span class="red_header"><font color="#800040"><b>Investment Advisor:</b></font> </span><b class="black_bold">Artisan Partners Limited Partnership</b></p>
                                                        <p class="text2"><b>Objective: <a href="/Pdfs/artisan.pdf" target="new">The
                                                        Artisan International Fund</a> </b><span class="text1">provides investors with diversified 
                                                        exposure to the international equity markets, across capitalizations and regions, 
                                                        with a focus on well-managed growth companies.  The Fund seeks to identify companies 
                                                        with sustainable growth of 10% to 40% annually; valued at a price/earning ratio at a discount to the expected growth rate; strong industry 
                                                        presence with a dominant or accelerating position; and effective management 
                                                        with a focus on shareholder value.</span></p>
                                                        <p class="text2"><a href="/Pdfs/Artisan_intl.pdf" target="_blank"><b></b></a></p>                            
                                                        <p class="text2"><img id="Img20" src="~/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr>            
                                                <tr>
                                                    <td align="center" valign="top"><img id="Img21" src="~/images/Hennessy.JPG" width="110" height="56" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">The Hennessy Focus Fund </p>
                                                        <p><font color="#800040" class="red_header"><b>Investment Advisor:</b></font><b class="black_bold"> Hennessy</b></p>
                                                        <p class="text2"><b>Objective:</b> <b><a href="/Pdfs/FBRFocus.pdf" target="new">The
                                                        Hennessy Focus Fund</a></b><span class="text1"> The <strong>Hennessy Focus Fund</strong> focuses exclusively on smaller public companies.&nbsp; The fund is free to move  between growth and value depending on where opportunities exist.</span></p>
                                                        <p class="text2"><a href="/Pdfs/FBRFocus1.pdf" target="_blank"><b></b></a></p>
                                                        <p class="text2"><img id="Img22" src="~/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <td align="center" valign="top"><img id="Img23" src="../images/PIMCO.jpg" width="115" height="27" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">Commodities</p>
                                                        <p><font color="#800040" class="red_header"><b>Investment Advisor:</b></font> <span class="black_bold">Pimco</span></p>
                                                        <p class="text2"><b>Objective:<a href="/Pdfs/Pimco Commodity.pdf" target="new"><span class="style1">The Pimco Commodity Real Return Strategy Fund</a></b></span>
                                                        <span class="text1"> The Commodity Real Return Strategy Fund is an actively managed portfolio that provides investors commodities exposure across various sectors including energy, industrial and precious metals, livestock and agriculture.
                                                         The Fund actively manages the exposure to commodity futures and collateralizes those positions with an actively managed portfolio of intermediate duration Treasury Inflation Protection Securities.</span></p>                           
                                                        <p class="text2"><a href="/Pdfs/PIMCO Commodity Fund.pdf" target="_blank"><b></b></a></p>  
                                                        <p class="text2"><img id="Img24" src="~/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>                                                     
                                                    </td>
                                                </tr>           
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>   
                            </table>
                        </div>
                    </td>
                </tr>							
            </table>
			<!-- end - main content area -->
	    </div>
	</td>
	<td width="15"></td>
	<td rowspan="3" class="dropShadow">&nbsp;</td>
</tr>
</asp:Content>

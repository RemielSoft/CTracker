<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="Step_1_2.aspx.cs" Inherits="RetirementFunds.Participant.Step_1_2" %>
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
                        <div style="width:98%; padding: 20px 16px 12px 8px;">
                            <span class="headers">investment options</span>
                            <br />
                            <br />
                            <table cellspacing="0" cellpadding="5" width="52%">
                                <tr> 
                                    <td>
                                    <p class="texth2">Learn About Your Investment Fund Options</p>
                                    <span class="text1">Here are brief summaries of each of your NERT investment options. 
                                    To read each fund's prospectus, click on the highlighted fund name. 
                                    To review Euclid's detailed analysis of each fund, click on "more 
                                    fund info."</span>
                                    </td>
                                </tr> 
                                <tr> 
                                    <td>
                                        <table border="0" cellpadding="4" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td align="center" valign="top"><img src="/images/logos/provident_mutual_logo.gif" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">Guaranteed Fund</p>
                                                        <p><font color="#800040" class="red_header"><b>Investment Advisor:</b></font><b class="black_bold"> Nationwide Provident
                                                        Life Insurance Co.</b></p>
                                                        <p class="text2"><b>Objective:</b> <b><a href="/Pdfs/provident.pdf" target="new">The 
                                                        Nationwide Provident Fixed Income Fund</a></b> <span class="text1">offers 
                                                        a high level of income with guaranteed rates of return. The 
                                                        Fund invests in high quality investment grade issues such 
                                                        as public bonds, private placements and commercial mortgages. 
                                                        Principal in the fund is guaranteed, and interest rates are 
                                                        declared in advance and are guaranteed for the contract year.</span></p>
                                                        <p class="text2"><img src="/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" valign="top"><img src="/images/logos/wells_fargo.gif" width="61" height="47" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">Government Securities Fund</p>
                                                        <p><font color="#800040" class="red_header"><b>Investment Advisor:</b></font><b class="black_bold"> Wells Fargo</b></p>
                                                        <p class="text2"><b>Objective:</b> <b><a href="/Pdfs/strong.pdf" target="new">The Wells Fargo Government Securities Fund</a></b><span class="text1"> 
                                                        seeks to produce total return by investing for a high level 
                                                        of current income with a moderate degree of share price fluctuation. 
                                                        The Fund normally invests at least 80% of its total assets 
                                                        in U.S. government securities.</span></p>
                                                        <p class="text2"><a href="/Pdfs/WF_gov.pdf" target="_blank"><b>more fund info</b></a></p>                                                    
                                                        <p class="text2"><img src="/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" valign="top"><img src="/images/logos/wells_fargo.gif" width="61" height="47" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">Corporate Bond Fund</p>
                                                        <p><span class="red_header"><font color="#800040"><b>Investment Advisor:</b></font> </span><b class="black_bold">Wells Fargo
                                                        </b></p>
                                                        <p class="text2"><b><a href="/Pdfs/strong.pdf" target="new">The
                                                        Wells Fargo Corporate Bond Fund</a></b><span class="text1"> seeks total return by investing for a
                                                        high level of current income with a moderate degree of share price
                                                        fluctuation. The Fund invests primarily in investment grade corporate
                                                        debt obligations.</span></p>
                                                        <p class="text2"><a href="/Pdfs/WF_corp.pdf" target="_blank"><b>more fund info</b></a></p>
                                                        <p class="text2"><img src="/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" valign="top"><img src="/images/fundvang.gif" width="166" height="32" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">Balanced Fund</p>
                                                        <p><font color="#800040" class="red_header"><b>Investment Advisor:</b></font><b class="black_bold"> Wellington
                                                        Management Company</b></p>
                                                        <p class="text2"><b>Objective: <a href="/Pdfs/wellington.pdf" target="new">The
                                                        Vanguard Wellington Fund</a> </b><span class="text1"> seeks long-term capital appreciation
                                                        and income by varying the allocation of assets of the Portfolio among
                                                        stocks, corporate bonds, government, growth and income, and money market
                                                        funds. It is designed for conservative investors who are seeking a
                                                        balanced investment program offering relative capital stability, a
                                                        reasonable level of income and the potential for capital appreciation
                                                        while limiting investment risk.</span></p>
                                                        <p class="text2"><a href="/Pdfs/Vanguard_Wellington.pdf" target="_blank"><b>more fund info</b></a></p>
                                                        <p class="text2"><img src="/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" valign="top"><img src="/images/logos/principal.gif" width="60" height="33" alt="Principal" runat="server"/></td>
                                                    <td>
                                                        <span class="texth2">Real Estate</span>
                                                        <br/>
                                                        <font color="#800040" class="red_header"><b>Investment Advisor:</b></font><b class="black_bold"> Principal Global Advisors</b>
                                                        <p class="text2"><b>Objective: <a href="/Pdfs/principal_property_acct.pdf" target="new">The Principal US Property Account</a> </b><span class="text1"> Seeking long-term capital appreciation and income by varying the allocation of assets of the Portfolio among stocks, corporate bonds, government, growth and income, and money market funds.</span></p>
                                                        <p class="text2"><a href="/Pdfs/principal.pdf" target="_blank"><b>more fund info</b></a></p>
                                                        <p class="text2"><img src="/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" valign="top"><img src="/images/pioneer.gif" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">The Pioneer Cullen  Fund</p>
                                                        <p><font color="#800040" class="red_header"><b>Investment Advisor: </b></font><span class="black_bold">Pioneer Investment Management, Inc.</span><br/></p>
                                                        <p><span class="text2"><strong>Objective :</strong></span> <span class="text2">The <span class="style1">Pioneer Cullen  Fund</span> restricts itself to the large/mid capitalization value sector of the  equity markets.&nbsp; Value is commonly defined as lower P/E and price to book  multiples, but can include other factors</span></span></p>
                                                        <p class="text2"><img src="/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" valign="top"><img src="/images/fundvang.gif" width="166" height="32" alt="" runat="server"/></td>
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
                                                        <p class="text2"><a href="/Pdfs/Vanguard_500.pdf" target="_blank"><b>more fund info</a></b></p>
                                                        <p class="text2"><img src="/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" valign="top"><img src="/images/husic.jpg" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">The Husic Capital  Growth Fund:</p>
                                                        <p><font color="#800040" class="red_header"><b>Investment Advisor:</b></font> <span class="black_bold">Husic  Capital Management</span></p>
                                                        <p class="text2"><b>Objective: <a href="/Pdfs/fidelity.pdf" target="new">Husic Capital  Management</a></b><span class="text1">  The Husic Capital  Growth Fund seeks to take advantage of emerging industries and technologies by  investing in the companies developing these products and services</span></p>
                                                        <p class="text2"><a href="/Pdfs/FidelityBC.pdf" target="_blank"><!--- <b>more fund info</b> ---></a></p>
                                                        <p class="text2"><img src="/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" valign="top"><img src="/images/PIMCO.jpg" width="115" height="27" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">Foreign Bonds</p>
                                                        <p><font color="#800040" class="red_header"><b>Investment Advisor:</b></font> <span class="black_bold">Pimco</span></p>
                                                        <p class="text2"><strong>Objective:</strong> <span class="style1">The Pimco Foreign Bond Fund</span> seeks maximum total return,  consistent with preservation of capital. The fund invests at least 80% of  assets in Fixed Income instruments issued outside the United States</p>
                                                        <p class="text2"><img id="Img2" src="/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" valign="top"><img src="/images/artisan_blk_wht.jpg" width="75" height="75" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">Artisan International Fund</p>
                                                        <p><span class="red_header"><font color="#800040"><b>Investment Advisor:</b></font> </span><b class="black_bold">Artisan Partners Limited Partnership</b></p>
                                                        <p class="text2"><b>Objective: <a href="/Pdfs/artisan.pdf" target="new">The
                                                        Artisan International Fund</a> </b><span class="text1">provides investors with diversified 
                                                        exposure to the international equity markets, across capitalizations and regions, 
                                                        with a focus on well-managed growth companies.  The Fund seeks to identify companies 
                                                        with sustainable growth of 10% to 40% annually; valued at a price/earning ratio at a discount to the expected growth rate; strong industry 
                                                        presence with a dominant or accelerating position; and effective management 
                                                        with a focus on shareholder value.</span></p>
                                                        <p class="text2"><a href="/Pdfs/Artisan_intl.pdf" target="_blank"><b>more fund info</b></a></p>
                                                        <p class="text2"><img src="/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" valign="top"><img src="/images/fbr.jpg" width="42" height="56" alt="" runat="server"/></td>
                                                    <td>
                                                        <p class="texth2">The FBR Small Cap Fund </p>
                                                        <p><font color="#800040" class="red_header"><b>Investment Advisor:</b></font><b class="black_bold"> FBR</b></p>
                                                        <p class="text2"><b>Objective:</b> <b><a href="/Pdfs/parnassus.pdf" target="new">The
                                                        FBR Small Cap Fund</a></b><span class="text1"> The <strong>FBR Small Cap Fund</strong> focuses exclusively on smaller public companies.&nbsp; The fund is free to move  between growth and value depending on where opportunities exist.</span></p>
                                                        <p class="text2">&nbsp;</p>
                                                        <p class="text2"><a href="/Pdfs/ParnassusA.pdf" target="_blank"><!--- <b>more fund info</b> ---></a></p>
                                                        <p class="text2"><img src="/images/sepb.gif" width="250" height="1" alt="" runat="server"/></p>      
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>  
                                <tr>
                                    <td align="right">
                                        <p align="right"><img id="Img1" src="/images/arrow4.gif" alt="" runat="server"/><a href="/Participant/Step_1_3.aspx"><b>Step 3 -- Review Fund Performance</b></a></p>
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

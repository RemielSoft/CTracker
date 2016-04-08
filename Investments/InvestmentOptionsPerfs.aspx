<%@ Page Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="InvestmentOptionsPerfs.aspx.cs" Inherits="RetirementFunds.Investments.InvestmentOptionsPerfs" %>

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
                        <table width="96%" border="0" cellpadding="4">
          <tr align="left"> 
            <td> 
<p class="texth2">Fund Performance as of August 31, 2003</p>
		    <table border="0" cellPadding="3" width="100%">
            <table border="0" cellPadding="3" width="100%">
              <tbody> 
              <tr> 
                <td align="center" bgColor="#f0f0f0" colSpan="2" class="txt1bold">FUNDS</td>
                <td align="center" bgColor="#f0f0f0" class="txt1bold" width="11%">Volatility 
                  Factor</td>
                <td align="center" bgColor="#f0f0f0" class="txt1bold" width="10%">YEAR TO DATE</td>
                <td align="center" bgColor="#f0f0f0" class="txt1bold" width="10%">1 YEAR</td>
                <td align="center" bgColor="#f0f0f0" class="txt1bold" width="10%">3 YEARS</td>
                <td align="center" bgColor="#f0f0f0" class="txt1bold" width="12%">5 YEARS</td>
              </tr>
              <tr vAlign="top"> 
                <td align="center" bgColor="#e0e0e0" height="64" width="30%"><img src="/images/fundprov.gif" width="123" height="45"><a href="http://www.nert.com/nertapp/pdfs/provident.pdf" target="new"><br>
                  </a></td>
                <td bgColor="#e0e0e0" rowspan="2" width="19%" class="txt1bold">GUARANTEED INTEREST</td>
                <td bgColor="#e0e0e0" rowspan="2" width="11%" class="text1">0.0</td>
                <td align="center" bgColor="#e0e0e0" rowspan="2" width="10%" class="text1">4.00% APR</td>
                <td align="center" bgColor="#e0e0e0" rowspan="2" width="10%" class="text1">4.78%</td>
                <td align="center" bgColor="#e0e0e0" rowspan="2" width="10%" class="text1">5.17%</td>
                <td align="center" bgColor="#e0e0e0" rowspan="2" width="12%" class="text1">5.54%</td>
              </tr>
              <tr vAlign="top"> 
                <td align="left" bgColor="#e0e0e0" width="30%"><a href="/Pdfs/provident.pdf" target="new">The 
                  Provident Mutual Fixed Income Fund</a> <span class="text1">is a stable value
                  account that offers guaranteed rates of return with no risk to principal</span>.</td>
              </tr>
              <tr vAlign="top"> 
                <td align="center" bgColor="#f0f0f0" height="50" width="30%"><img src="/images/fundstrong.gif" width="44" height="44"><a href="http://www.nert.com/nertapp/pdfs/strong.pdf" target="new"><br>
                  </a></td>
                <td bgColor="#f0f0f0" rowspan="2" class="txt1bold" width="19%">GOVERNMENT SECURITIES</td>
                <td bgColor="#f0f0f0" rowspan="2" width="11%" class="text1">0.18</td>
                <td align="center" bgColor="#f0f0f0" rowspan="2" width="10%" class="text1">0.33%</td>
                <td align="center" bgColor="#f0f0f0" rowspan="2" width="10%" class="text1">10.46%</td>
                <td align="center" bgColor="#f0f0f0" rowspan="2" width="10%" class="text1">10.17%</td>
                <td align="center" bgColor="#f0f0f0" rowspan="2" width="12%" class="text1">7.42%</td>
              </tr>
              <tr vAlign="top"> 
                <td align="left" bgColor="#f0f0f0" width="30%"><a href="/Pdfs/strong.pdf" target="new"> 
                  The Strong Government Securities Fund</a> <span class="text1">seeks 
                  the maximum income possible while preserving capital by investing 
                  in government debt instruments with intermediate maturity dates.</span></td>
              </tr>
              <tr vAlign="top"> 
                <td align="center" bgColor="#e0e0e0" height="64" width="30%"><img src="/images/fundstrong.gif" width="44" height="44"><a href="http://www.nert.com/nertapp/pdfs/strong.pdf" target="new"><br>
                  </a></td>
                <td bgColor="#e0e0e0" rowspan="2" class="txt1bold" width="19%">CORPORATE BONDS</td>
                <td bgColor="#e0e0e0" rowspan="2" width="11%" class="text1">0.26</td>
                <td align="center" bgColor="#e0e0e0" rowspan="2" width="10%" class="text1">5.73%</td>
                <td align="center" bgColor="#e0e0e0" rowspan="2" width="10%" class="text1">1.39%</td>
                <td align="center" bgColor="#e0e0e0" rowspan="2" width="10%" class="text1">5.33%</td>
                <td align="center" bgColor="#e0e0e0" rowspan="2" width="12%" class="text1">4.57%</td>
              </tr>
              <tr vAlign="top"> 
                <td align="left" bgColor="#e0e0e0" width="30%"><a href="/Pdfs/strong.pdf" target="new"> 
                  The Strong Corporate Bond Fund</a><span class="text1"> seeks 
                  total return by investing for a high level of current income 
                  with moderate degree of share price fluctuation. The Fund normally 
                  invests primarily in investment grade corporate debt obligations.</span> 
                </td>
              </tr>
              <tr vAlign="top"> 
                <td align="center" bgColor="#f0f0f0" height="62" width="30%"><img src="/images/fundvang.gif" width="166" height="32"><br>
                </td>
                <td bgColor="#f0f0f0" rowspan="2" class="txt1bold" width="19%">BALANCED</td>
                <td bgColor="#f0f0f0" rowspan="2" width="11%" class="text1">0.57</td>
                <td align="center" bgColor="#f0f0f0" rowspan="2" width="10%" class="text1">9.98%</td>
                <td align="center" bgColor="#f0f0f0" rowspan="2" width="10%" class="text1">-6.90%</td>
                <td align="center" bgColor="#f0f0f0" rowspan="2" width="10%" class="text1">2.31%</td>
                <td align="center" bgColor="#f0f0f0" rowspan="2" width="12%" class="text1">4.61%</td>
              </tr>
              <tr vAlign="top"> 
                <td align="left" bgColor="#f0f0f0" width="30%"><a href="/Pdfs/wellington.pdf" target="new">The 
                  Vanguard Wellington Fund</a> <span class="text1">seeks long-term 
                  capital appreciation and income by varying the allocation of 
                  assets of the Portfolio among stocks, corporate bonds, government, 
                  growth and income, and money market funds.</span></td>
              </tr>
              <tr vAlign="top"> 
                <td align="center" bgColor="#f0f0f0" width="30%"><img src="/images/MFS.gif" width="130" height="32"><br>
                </td>
                <td bgColor="#f0f0f0" rowspan="2" class="txt1bold" width="19%">VALUE</td>
                <td bgColor="#f0f0f0" rowspan="2" width="11%" class="text1">0.78</td>
                <td align="center" bgColor="#f0f0f0" rowspan="2" width="9%" class="text1">9.89%</td>
                <td align="center" bgColor="#f0f0f0" rowspan="2" width="10%" class="text1">-13.79%</td>
                <td align="center" bgColor="#f0f0f0" rowspan="2" width="9%" class="text1">0.98%</td>
                <td align="center" bgColor="#f0f0f0" rowspan="2" width="12%" class="text1">5.19%</td>
              </tr>
              <tr vAlign="top"> 
                <td align="left" bgColor="#f0f0f0" width="30%"> <a href="/Pdfs/mfsvalue.pdf" target="new">The 
                  MFS Value Fund </a><span class="text1">seeks undervalued, income-producing 
                  stocks with capital appreciation potential.</span></td>
              </tr>
              <tr vAlign="top"> 
                <td align="center" bgColor="#e0e0e0" width="30%"><img src="/images/fundvang.gif" width="166" height="32"><br>
                </td>
                <td bgColor="#e0e0e0" rowspan="2" class="txt1bold" width="19%">S&amp;P 
                  500 INDEX</td>
                <td bgColor="#e0e0e0" rowspan="2" width="11%" class="text1">1.00</td>
                <td align="center" bgColor="#e0e0e0" rowspan="2" width="10%" class="text1">15.86%</td>
                <td align="center" bgColor="#e0e0e0" rowspan="2" width="10%" class="text1">-22.15%</td>
               <td align="center" bgColor="#e0e0e0" rowspan="2" width="10%" class="text1">-14.60%</td>
                <td align="center" bgColor="#e0e0e0" rowspan="2" width="12%" class="text1">-0.61%</td>
              </tr>
              <tr vAlign="top"> 
                <td align="left" bgColor="#e0e0e0" width="30%"><a href="/Pdfs/sp500index.pdf" target="new">The 
                  Vanguard Index Fund</a><span class="text1"> seeks to mirror the performance 
                  of the S&amp;P 500, one of the leading stock market barometers.</span></td>
              </tr>
              <tr vAlign="top"> 
                <td align="center" bgColor="#f0f0f0" width="30%"><img src="/images/fundfidelity.gif" width="135" height="35"><br>
                </td>
                <td bgColor="#f0f0f0" rowspan="2" class="txt1bold" width="19%">QUALITY GROWTH</td>
                <td bgColor="#f0f0f0" rowspan="2" width="11%" class="text1">1.10</td>
                <td align="center" bgColor="#f0f0f0" rowspan="2" width="10%" class="text1">15.22%</td>
                <td align="center" bgColor="#f0f0f0" rowspan="2" width="10%" class="text1">-25.32%</td>
                <td align="center" bgColor="#f0f0f0" rowspan="2" width="10%" class="text1">-17.70%</td>
                <td align="center" bgColor="#f0f0f0" rowspan="2" width="12%" class="text1">-1.37%</td>
              </tr>
              <tr vAlign="top"> 
                <td align="left" bgColor="#f0f0f0" height="118" width="30%"> 
                  <p></p>
                  <a href="/Pdfs/fidelity.PDF" target="new">The 
                  Fidelity Blue Chip Fund</a> <span class="text1">seeks to 
                  achieve long-term capital growth by investing in blue chips 
                  stocks with high capitalization.</span></td>
              </tr>
              <tr vAlign="top"> 
                <td align="center" bgColor="#e0e0e0" width="30%"><img src="/images/ultra.gif" width="60" height="60"><br>
                </td>
                <td bgColor="#e0e0e0" rowspan="2"  width="19%" class="txt1bold">AGGRESSIVE GROWTH</td>
                <td bgColor="#e0e0e0" rowspan="2" width="11%" class="text1">1.23</td>
                <td align="center" bgColor="#e0e0e0" rowspan="2" class="text1" width="10%">17.42%</td>
                <td align="center" bgColor="#e0e0e0" rowspan="2" class="text1" width="10%">-23.15%</td>
                <td align="center" bgColor="#e0e0e0" rowspan="2" width="10%" class="text1">-19.30%</td>
                <td align="center" bgColor="#e0e0e0" rowspan="2" width="12%" class="text1">0.01%</td>
              </tr>
              <tr vAlign="top"> 
                <td align="left" bgColor="#e0e0e0" width="30%"> <a href="/Pdfs/amcentury.pdf" target="new">The 
                  American Century Ultra Fund</a> <span class="text1">seeks 
                  to take advantage of emerging industries and technologies by 
                  investing in the companies developing these products and services.</span></td>
              </tr>
              <tr vAlign="top"> 
                <td align="center" bgColor="#e0e0e0" width="30%"><img src="/images/artisan_blk_wht.jpg" width="60" height="60"><br>
                </td>
                <td bgColor="#e0e0e0" rowspan="2" class="txt1bold" width="19%">INTERNATIONAL</td>
                <td bgColor="#e0e0e0" rowspan="2" width="11%" class="text1">1.30</td>
                <td align="center" bgColor="#e0e0e0" rowspan="2" width="10%" class="text1">10.07%</td>
                <td align="center" bgColor="#e0e0e0" rowspan="2" width="10%" class="text1">-18.90%</td>
                <td align="center" bgColor="#e0e0e0" rowspan="2" width="10%" class="text1">-14.55%</td>
                <td align="center" bgColor="#e0e0e0" rowspan="2" width="12%" class="text1">7.89%</td>
              </tr>
              <tr vAlign="top"> 
                <td align="left" bgColor="#e0e0e0" width="30%"> <a href="/Pdfs/artisan.pdf" target="new">The 
                  Artisan International Fund</a><span class="text1"> seeks to take
                  advantage of international companies poised for superior earnings growth.</span></td>
              </tr>
              <tr vAlign="top"> 
                <td align="center" bgColor="#f0f0f0" width="30%"><img src="/images/fundparn.gif" width="125" height="84"><br>
                </td>
                <td bgColor="#f0f0f0" rowspan="2" class="txt1bold" width="19%">SOCIALLY CONSCIOUS</td>
                <td bgColor="#f0f0f0" rowspan="2" width="11%" class="text1">1.58</td>
               <td align="center" bgColor="#f0f0f0" rowspan="2" width="10%" class="text1">15.28%</td>
                <td align="center" bgColor="#f0f0f0" rowspan="2" width="10%" class="text1">-28.05%</td>
                <td align="center" bgColor="#f0f0f0" rowspan="2" width="10%" class="text1">-7.51%</td>
                <td align="center" bgColor="#f0f0f0" rowspan="2" width="12%" class="text1">3.46%</td>
              </tr>
              <tr vAlign="top"> 
                <td align="left" bgColor="#f0f0f0" width="30%"><a href="/Pdfs/parnassus.pdf" target="new"> 
                  The Parnassus Fund</a> <span class="text1">invests in 
                  those firms whose products or business principles seek to follow 
                  socially responsible guidelines utilizing contrarian investment principles.</span></td>
              </tr>
              </tbody> 
            </table>

<hr noShade width="75%">
            <span class="text1">Fund Performance reflects the effect of all dividend, 
            interest, and realized and unrealized appreciation. Three and five 
            year results are annualized as of 12/31 of the previous calendar year. 
            All returns are net of investment management fees only and are exclusive 
            of any advisory or trust management fees as reported by the fund managers 
            for the period posted. Past performance is not necessarily indicative 
            of future returns.</span></td>
          </tr>
        </table>
        
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
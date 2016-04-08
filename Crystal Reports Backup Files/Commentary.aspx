<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="Commentary.aspx.cs" Inherits="RetirementFunds.Commentary.Commentary" %>
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
                            <span class="headers">market commentary</span>
                            <br />
                            <br />
                            <table width="50%" border="0" cellpadding="4">
                                <tr> 
                                    <td colspan="2"  style="text-align:left">
                                        <p class="text1">&nbsp;<span class="black_boldNoIndent" id="spLastCommentaryTitle" runat="server"></span></p>
                                        <p class="txt1bold" id="pLastCommentaryAuthor" runat="server">&nbsp;</p>
                                        <p class="text1">&nbsp;<span class="txt1bold" id="spLastCommentarySubTitle" runat="server"></span></p>
                                        <p class="text1" id="pLastCommentaryCommentary" runat="server">&nbsp;</p>
                                        <p class="text1" id="pLastCommentaryBonds" runat="server">&nbsp;</p>
                                        <p class="text1" id="pLastCommentaryMutualFunds" runat="server">&nbsp;</p>
                                        <p class="text1" id="pLastCommentartyOther1" runat="server">&nbsp;</p>
                                        <p class="text1" id="pLastCommentartyOther2" runat="server">&nbsp;</p>                                
                                        <br/>
                                        <br/>
                                        <table width="95%" border="0">
                                            <tr>
                                                <td class="black_bold" bgcolor="#CCCCCC">Recent return/risk statistics for the model portfolios (risk as measured by standard deviation)</td>
                                                <td class="black_bold" bgcolor="#CCCCCC"><div align="center">3 Year</div></td>
                                                <td class="black_bold" bgcolor="#CCCCCC"><div align="center">3 Years</div></td>
                                                <td class="black_bold" bgcolor="#CCCCCC"><div align="center">5 Years</div></td>
                                                <td class="black_bold" bgcolor="#CCCCCC"><div align="center">5 Years</div></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="textform"><div align="center">Return</div></td>
                                                <td class="textform"><div align="center">Standard Deviation</div></td>
                                                <td class="textform"><div align="center">Return </div></td>
                                                <td class="textform"><div align="center">Standard Deviation</div></td>
                                            </tr>
                                            <tr>
                                                <td class="textform" bgcolor="#639C9C">Stable Income</td>
                                                <td bgcolor="#639C9C"><div align="center"><span class="text2" id="spSIThreeYear" runat="server"></span></div></td>
                                                <td bgcolor="#639C9C"><div align="center"><span class="text2" id="spSIThreeYears" runat="server"></span></div></td>
                                                <td bgcolor="#639C9C"><div align="center"><span class="text2" id="spSIFiveYear" runat="server"></span></div></td>
                                                <td bgcolor="#639C9C"><div align="center"><span class="text2" id="spSIFiveYears" runat="server"></span></div></td>
                                            </tr>
                                            <tr>
                                                <td class="textform">Conservative Income</td>
                                                <td><div align="center"><span class="text2" id="spCIThreeYear" runat="server"></span></div></td>
                                                <td><div align="center"><span class="text2" id="spCIThreeYears" runat="server"></span></div></td>
                                                <td><div align="center"><span class="text2" id="spCIFiveYear" runat="server"></span></div></td>
                                                <td><div align="center"><span class="text2" id="spCIFiveYears" runat="server"></span></div></td>
                                            </tr>
                                            <tr bgcolor="#639C9C">
                                                <td class="textform">Traditional Pension</td>
                                                <td bgcolor="#639C9C"><div align="center"><span class="text2" id="spTPThreeYear" runat="server"></span></div></td>
                                                <td bgcolor="#639C9C"><div align="center"><span class="text2" id="spTPThreeYears" runat="server"></span></div></td>
                                                <td bgcolor="#639C9C"><div align="center"><span class="text2" id="spTPFiveYear" runat="server"></span></div></td>
                                                <td bgcolor="#639C9C"><div align="center"><span class="text2" id="spTPFiveYears" runat="server"></span></div></td>
                                            </tr>
                                            <tr>
                                                <td class="textform">Equity Oriented</td>
                                                <td><div align="center"><span class="text2" id="spEOThreeYear" runat="server"></span></div></td>
                                                <td><div align="center"><span class="text2" id="spEOThreeYears" runat="server"></span></div></td>
                                                <td><div align="center"><span class="text2" id="spEOFiveYear" runat="server"></span></div></td>
                                                <td><div align="center"><span class="text2" id="spEOFiveYears" runat="server"></span></div></td>
                                            </tr>
                                            <tr>
                                                <td></td><td></td><td></td><td></td><td></td>
                                            </tr>
                                        </table>
                                        <br/>
                                        <div id="divFunds" runat="server">
                                        </div>
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

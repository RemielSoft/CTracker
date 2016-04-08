<%@ Page Language="C#" MasterPageFile="~/MasterPage/Nert.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="NertAlloc_Step2.aspx.cs" Inherits="RetirementFunds.Participant.NertAlloc_Step2" %>
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
                        <div id="divPlanInformation" runat="server" visible="false" style="text-align:right">
                            <font class="planHeader">Current User: <asp:Label ID="lblUserHeader" runat="server" /></font><br />
                            <font class="planHeader">Current Plan: <asp:Label ID="lblPlaneNameHeader" runat="server" /></font>
                        </div> 
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <span class="headers">Investment Allocation</span>
                    </td>
                </tr>	
                <tr>
                    <td align="center">
                        <!-- 
                        <font class="texth2">Current Plan: <asp:Label ID="lblPlanName" runat="server" /> </font>
                        -->
                        <br /><br />
                        <font class="txt1bold">Use this form to change how your future contributions are allocated.
		                Investment Selection percentages must add up to 100%.
		                <br /></font>
		                <font class="txt1boldRed"><asp:Literal ID="litPortfolioStatement" runat="server" /></font>		                
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>	
                <tr>
                    <td>
                        <table cellpadding="2" cellspacing="2" width="100%">
                            <tr>
                                <td style="width:200px"></td>
                                <td valign="top" style="width:10px"><input id="rdCustom" type="radio" runat="server" name="FundMode" /></td>
                                <td valign="top" class="txt1bold" style="text-align:left;"><asp:Label ID="lblCustom" runat="server" Text="Custom"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width:200px"></td>
                                <td valign="top"></td>
                                <td valign="top" style="text-align:left;">
                                    <asp:DataGrid ID="dgGetPlans" runat="server" CellPadding="4" CellSpacing="2" BorderWidth="0" 
                                        DataKeyField="FUNDID"
                                        AutoGenerateColumns="false">
                                        <HeaderStyle CssClass="txt1bold" HorizontalAlign="Left" />                                        
                                        <Columns>
                                            <asp:BoundColumn DataField="FUNDID" Visible="false" />
                                            <asp:BoundColumn DataField="FUNDNAM" HeaderText="Investment Name" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundColumn DataField="ALLOPCT" HeaderText="Current%" ItemStyle-HorizontalAlign="Center" />
                                            <asp:TemplateColumn HeaderText="New%">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txtNew" Columns="4" 
                                                        Text='0' AutoPostBack="true"
                                                        OnTextChanged="txtNew_TextChanged"/>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                        </Columns>
                                    </asp:DataGrid>                                
                                </td>
                            </tr>
                            <tr>                                
                                <td style="text-align:center;" colspan="3">
                                    <font class="txt1bold">
                                        Pct Total: <asp:Label ID="lblTotal" runat="server" Text="0" />
                                    </font>
                                </td>                                
                            </tr>
                            <tr>
                                <td colspan="3">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:center;" colspan="3">
                                    <font class="txt1bold">
                                    INVESTMENT MODEL PORTFOLIO ALLOCATIONS
                                    </font>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:center;" colspan="3">
                                    NOTE – These Models are automatically rebalanced twice per year
                                </td>
                            </tr>                            
                            <tr>
                                <td style="width:200px"></td>
                                <td valign="top" style="width:10px"><input id="rdConservativeIncome" type="radio" runat="server" name="FundMode" /></td>
                                <td valign="top" class="txt1bold" style="text-align:left;"><asp:Label ID="lblConservativeIncome" runat="server" Text="Conservative Income"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width:200px"></td>
                                <td></td>
                                <td valign="top" style="text-align:left;">
                                    This portfolio is designed for the risk-averse investor with a intermediate time horizon and the need for some capital appreciation through equity participation and real estate, but the emphasis remains on current income. Portfolio mix:  20% stocks, 60% bonds, 20% real estate.
                                </td>
                            </tr>
                            <tr>
                                <td style="width:200px"></td>
                                <td></td>
                                <td valign="top" style="text-align:left;">
                                    <asp:DataGrid ID="dgConservative" runat="server" CellPadding="4" CellSpacing="2" BorderWidth="0" 
                                        DataKeyField="FUNDID"
                                        AutoGenerateColumns="false">
                                        <HeaderStyle CssClass="txt1bold" HorizontalAlign="Left" />                                        
                                        <Columns>
                                            <asp:BoundColumn DataField="FUNDID" Visible="false" />
                                            <asp:BoundColumn DataField="FUNDNAM" HeaderText="Investment Name" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundColumn DataField="pctnew" HeaderText="New%" ItemStyle-HorizontalAlign="Center" />
                                        </Columns>
                                    </asp:DataGrid>                                
                                </td>
                            </tr>                            
                            <tr>
                                <td style="width:200px"></td>
                                <td valign="top" style="width:10px"><input id="rdStableIncome" type="radio" runat="server" name="FundMode" /></td>
                                <td valign="top" class="txt1bold" style="text-align:left;"><asp:Label ID="lblStableIncome" runat="server" Text="Stable Income"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width:200px"></td>
                                <td></td>
                                <td valign="top" style="text-align:left;">
                                    This portfolio is designed for income rather than capital appreciation. It is appropriate for participants with short time horizons or who want to focus solely on income and wish to reduce capital losses. This allocation is for investors who are extremely risk averse even at the expense of total return.  Portfolio mix:  6% stocks, 74% bonds, 20% real estate.
                                </td>
                            </tr>
                            <tr>
                                <td style="width:200px"></td>
                                <td></td>
                                <td valign="top" style="text-align:left;">
                                    <asp:DataGrid ID="dgStable" runat="server" CellPadding="4" CellSpacing="2" BorderWidth="0" 
                                        DataKeyField="FUNDID"
                                        AutoGenerateColumns="false">
                                        <HeaderStyle CssClass="txt1bold" HorizontalAlign="Left" />                                        
                                        <Columns>
                                            <asp:BoundColumn DataField="FUNDID" Visible="false" />
                                            <asp:BoundColumn DataField="FUNDNAM" HeaderText="Investment Name" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundColumn DataField="pctnew" HeaderText="New%" ItemStyle-HorizontalAlign="Center" />
                                        </Columns>
                                    </asp:DataGrid>                                 
                                </td>
                            </tr>                            
                            <tr>
                                <td style="width:200px"></td>
                                <td valign="top" style="width:10px"><input id="rdTraditionalPension" type="radio" runat="server" name="FundMode" /></td>
                                <td valign="top" class="txt1bold" style="text-align:left;"><asp:Label ID="lblTraditionalPension" runat="server" Text="Traditional Pension"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width:200px"></td>
                                <td></td>
                                <td valign="top" style="text-align:left;">
                                    This portfolio mirrors what was once a common asset allocation among pension funds, but includes real estate to reduce risk and improve returns. It is appropriate for investors with an intermediate-to-long horizon who wish current income and maximum diversification. Portfolio mix:  54% stocks, 26% bonds, 20% real estate.
                                </td>
                            </tr>
                            <tr>
                                <td style="width:200px"></td>
                                <td></td>
                                <td valign="top" style="text-align:left;">
                                    <asp:DataGrid ID="dgTraditional" runat="server" CellPadding="4" CellSpacing="2" BorderWidth="0" 
                                        DataKeyField="FUNDID"
                                        AutoGenerateColumns="false">
                                        <HeaderStyle CssClass="txt1bold" HorizontalAlign="Left" />                                        
                                        <Columns>
                                            <asp:BoundColumn DataField="FUNDID" Visible="false" />
                                            <asp:BoundColumn DataField="FUNDNAM" HeaderText="Investment Name" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundColumn DataField="pctnew" HeaderText="New%" ItemStyle-HorizontalAlign="Center" />
                                        </Columns>
                                    </asp:DataGrid>                                 
                                </td>
                            </tr>                            
                            <tr>
                                <td style="width:200px"></td>
                                <td valign="top" style="width:10px"><input id="rdEquityOriented" type="radio" runat="server" name="FundMode" /></td>
                                <td valign="top" class="txt1bold" style="text-align:left;"><asp:Label ID="lblEquityOriented" runat="server" Text="Equity Oriented"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width:200px"></td>
                                <td></td>
                                <td valign="top" style="text-align:left;">
                                    This portfolio is designed around the equity markets. Some diversification is provided by real estate and a modest cash allocation, but total return is VERY dependent on the performance of the equity markets. This allocation is suitable for participants with long time horizons who are willing to accept the higher risk and return of the equity markets.  Portfolio mix:  75% stocks, 5% bonds, 20% real estate.
                                </td>
                            </tr>
                            <tr>
                                <td style="width:200px"></td>
                                <td></td>
                                <td valign="top" style="text-align:left;">
                                    <asp:DataGrid ID="dgEquityOriented" runat="server" CellPadding="4" CellSpacing="2" BorderWidth="0" 
                                        DataKeyField="FUNDID"
                                        AutoGenerateColumns="false">
                                        <HeaderStyle CssClass="txt1bold" HorizontalAlign="Left" />                                        
                                        <Columns>
                                            <asp:BoundColumn DataField="FUNDID" Visible="false" />
                                            <asp:BoundColumn DataField="FUNDNAM" HeaderText="Investment Name" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundColumn DataField="pctnew" HeaderText="New%" ItemStyle-HorizontalAlign="Center" />
                                        </Columns>
                                    </asp:DataGrid>                                 
                                </td>
                            </tr>                                                                                                                                            
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table>
                            <tr>
                                <td>Rebalance my investment portfolio </td>
                                <td>
                                    <asp:RadioButtonList ID="rdlRebalance" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="Yes" Selected="True">Yes</asp:ListItem>
                                        <asp:ListItem Value="No">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center"><asp:Button ID="btnProcess" runat="server" Text="Process" 
                            onclick="btnProcess_Click" /></td>
                </tr>	
                <tr>
                    <td align="center">
                        <asp:Label ID="lblMsg" ForeColor="Red" runat="server" Font-Size="Small" />
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

<%@ Page Language="C#" MasterPageFile="~/MasterPage/Nert.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="NertXfr_Step2.aspx.cs" Inherits="RetirementFunds.Participant.NertXfr_Step2" %>
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
                        <span class="headers">Investment Transfer</span>
                    </td>
                </tr>	
                <tr>
                    <td align="center">
                        <font class="texth3">Current Plan: <asp:Label ID="lblPlanName" runat="server" /> </font>
                        <br /><br />
                        <font class="txt1bold">Use this form to transfer investments between plan investment options. 
                        Transfers do not affect future contributions. <br />
                        Realignment of future contributions and account rebalancing can be done on the Investment Allocation Page.
                        <br />
		                <asp:Literal ID="litPortfolioStatement" runat="server" />
                        </font>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>	
                <tr>
                    <td align="center">
                        <table cellpadding="2" cellspacing="2" width="100%">
                            <tr>
                                <td style="width:200px"></td>
                                <td valign="top" style="width:10px"><input id="rdCustom" type="radio" runat="server" name="FundMode" checked /></td>
                                <td valign="top" class="txt1bold" style="text-align:left;"><asp:Label ID="lblCustom" runat="server" Text="Custom"></asp:Label></td>                                
                            </tr>
                            <tr>
                                <td style="width:200px"></td>
                                <td></td>
                                <td valign="top" style="text-align:left;">
                                    <asp:DataGrid ID="dgInvestments" runat="server" CellPadding="4" CellSpacing="2" BorderWidth="0" 
                                        AutoGenerateColumns="false">
                                        <HeaderStyle CssClass="txt1bold" HorizontalAlign="Left" />
                                        <Columns>
                                            <asp:BoundColumn DataField="FUNDID" Visible="False" />
                                            <asp:BoundColumn DataField="FUNDNAM" HeaderText="Investment Name" />
                                            <asp:BoundColumn DataField="Balance" DataFormatString="{0:c}" HeaderText="Balance" />
                                            <asp:TemplateColumn HeaderText="Transfer From %">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txtFrom" Columns="4" 
                                                        Text='0' AutoPostBack="true" 
                                                        OnTextChanged="txtTo_TextChanged"/>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="Transfer To %">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txtTo" Columns="4" 
                                                        Text='0' AutoPostBack="true"
                                                        OnTextChanged="txtTo_TextChanged"/>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                        </Columns>
                                    </asp:DataGrid>                                
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="3">
                                    <font class="txt1bold">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        Plan Total: <asp:Label ID="lblPlanTotal" runat="server" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        Pct Total: <asp:Label ID="lblPctTotal" runat="server" Text="0" />
                                    </font>                                
                                </td>                                
                            </tr> 
                            <!-- 
                            <tr>
                                <td style="text-align:center;" colspan="3">
                                    INVESTMENT MODEL PORTFOLIO ALLOCATIONS
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
                            -->                                                                                                                                            
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

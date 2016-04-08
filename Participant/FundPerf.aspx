<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="FundPerf.aspx.cs" Inherits="RetirementFunds.Participant.FundPerf" %>
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
                    </td>
                </tr>	
                <tr>
                    <td align="center">
                        <span class="headers">Fund Performance <asp:Label ID="lblAsOfDate" runat="server" /></span>
                    </td>
                </tr>	
                <tr>
                    <td>
                        <asp:DataGrid ID="dgFund" runat="server" CellPadding="4" CellSpacing="2" BorderWidth="0" 
                            AutoGenerateColumns="false">
                            <HeaderStyle CssClass="txt1bold" />
                            <Columns>
                                <asp:TemplateColumn HeaderText="">
                                    <ItemTemplate>
                                        <asp:Image ID="imgLogo" runat="server" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"imagefile") %>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFundType" runat="server" CssClass="txt1bold" Text='<%# DataBinder.Eval(Container.DataItem,"type") %>' /><br />
                                        <asp:HyperLink ID="lnkFundName" runat="server" CssClass="texth3" Target="_blank" NavigateUrl='<%# DataBinder.Eval(Container.DataItem,"url") %>' Text='<%# DataBinder.Eval(Container.DataItem,"fundname") %>' /><br />
                                        <asp:Label ID="lblFundDescription" runat="server" CssClass="text2" Text='<%# DataBinder.Eval(Container.DataItem,"funddescription") %>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="VolatilityFactor" DataFormatString="{0:F2}" ItemStyle-Wrap="false" HeaderText="Volatility Factor" />
                                <asp:BoundColumn DataField="ytd" DataFormatString="{0:F1}%" ItemStyle-Wrap="false" HeaderText="Year to Date" />
                                <asp:BoundColumn DataField="1year" DataFormatString="{0:F1}%" ItemStyle-Wrap="false" HeaderText="1<br>Year" />
                                <asp:BoundColumn DataField="3years" DataFormatString="{0:F1}%" ItemStyle-Wrap="false" HeaderText="3<br>Years" />
                                <asp:BoundColumn DataField="5years" DataFormatString="{0:F1}%" ItemStyle-Wrap="false" HeaderText="5<br>Years" />
                            </Columns>
                        </asp:DataGrid>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>		
                <tr>
                    <td class="text1">
                        <hr noShade width="75%">
                        Fund Performance reflects the effect of all dividend, 
                        interest, and realized and unrealized appreciation. Three and five 
                        year results are annualized as of 12/31 of the previous calendar year. 
                        All returns are net of investment management fees only, and are exclusive 
                        of any advisory or trust management fees,and are as reported by the fund managers 
                        for the period posted. Past performance is not necessarily indicative 
                        of future returns.
                    </td>
                </tr>	
                <tr>
                    <td>&nbsp;</td>
                </tr>				
            </table>
			<!-- end - main content area -->
	    </div>
	</td>
	<td width="15"></td>
	<td rowspan="3" class="dropShadow">&nbsp;</td>
</tr>
</asp:Content>

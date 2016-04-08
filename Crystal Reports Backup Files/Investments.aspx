<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="Investments.aspx.cs" Inherits="RetirementFunds.Sponsor.Investments" %>
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
                            <font class="planHeader">Current User: <asp:Label ID="lblUserHeader" runat="server" /></font><br />
                            <font class="planHeader">Current Plan: <asp:Label ID="lblPlaneNameHeader" runat="server" /></font>
                        </div>                        
                        <table width="96%" border="0" cellpadding="4">
          <tr align="left"> 
            <td> 
                <span class="headers">Investments</span>
                <br />
                <br />
                <ul>
              </font><li><A href="/Investments/InvestmentOptions.aspx" target="new"><B>Plan Investment Options</a></B></li>
              <li></font><a href="/News/euclid.aspx" target="new"><B>About the Investment Advisor</a></B></li>
              <li></font><A href="/Commentary/commentary.aspx" target="new"><B>Read the Latest Market Commentary</a></B></li>
              <li></font><A href="/Pdfs/invpol.pdf" target="new"><B>NERT Investment Policy Statement</a></B></li>
              <li></font><A href="/Participant/FundPerf.aspx" target="new"><B>Fund Performance</a></B></li>
              <li></font><A href="/Participant/KeyAdvisor.aspx" target="_self"><B>Key Advisor</a></B></li>
              </ul> 
                 
            </td>
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

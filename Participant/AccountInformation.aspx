<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="AccountInformation.aspx.cs" Inherits="RetirementFunds.Participant.AccountInformation" %>
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
                            <font class="planHeader">Current Plan: <asp:Label ID="lblPlanNameHeader" runat="server" /></font>
                        </div>
                        <br />
                        <div style="width:98%; padding: 20px 16px 12px 8px;">
                            <span class="headers">account information</span>
                            <br />
                            <br />
                            <table cellspacing="0" cellpadding="5" width="50%">
                                <tr> 
                                    <td valign="top" class="text1"> 
                                    <span class="text1">Here is where you can get current updates on your plan balance, 
                                    find out how your investment choices are performing, verify participant 
                                    loan payments and review your funds' volatility profile. For participants 
                                    with Key Advisor accounts, this is your link to trading your funds 
                                    with TD Waterhouse.</span>
                                    <p>To make changes to your account, click on &quot;Account Modification&quot; 
                                    on the right side of the page.</p>
                                    </td>
                                </tr>
                                <tr> 
                                    <td colspan="2" align="left">
                                        <ul>
                                            <li><a href="/Reports/ReportViewier.aspx?rname=webloanpay.rpt&from=p&pid=0&sid=1&ssnum=<%=Session["SSNUM"] %>" title="Loan Payment" target="_blank"><b>Loan Payment History</b></a></li> 
                                            <li><a href="/participant/AccountBalance.aspx"><b>Account Balance Inquiry</b></a></li>
                                            <li><a href="/Reports/ReportViewier.aspx?rname=webfundelection.rpt&from=p&pid=0&sid=1&ssnum=<%=Session["SSNUM"] %>" title="Current Investment Elections" target="_blank" ><b>Current Investment Elections</b></a></li> 
                                            <li><a href="/participant/FundPerf.aspx" target="_blank"><b>Fund Performance</b></a></li> 
                                            <li><a href="/Reports/ReportViewier.aspx?rname=webpartcrt.rpt&from=p&pid=0&sid=1&ssnum=<%=Session["SSNUM"] %>&nertPPlan=<%=Session["userPlan"]%>" title="Year-to-Date Employee Statement" target="_blank"><b>Year-to-Date Participant Statement</b></a></li>
                                            <li><a href="/Reports/ReportViewier.aspx?rname=webeetrans.rpt&from=p&pid=0&sid=1&ssnum=<%=Session["SSNUM"] %>" title="Year-to-Date  Account Transactions" target="_blank"><b>Year-to-Date Account Transactions</b></a></li>
                                            <li><a href="/Reports/ReportViewier.aspx?rname=webfundholdings.rpt&from=p&pid=0&sid=1&ssnum=<%=Session["SSNUM"] %>&nertPPlan=<%=Session["userPlan"]%>" title="Current Investment Mix" target="_blank"><b>Current Investment Mix</b></a></li>
                                            <li><a href="/participant/KeyAdvisor.aspx" target="_blank"><b>Key Advisor Accounts</b></a></li> 
                                            <li><a href="/participant/TaxSavings.aspx" target="_blank"><b>Tax Savings in a 401(k) Plan</b></a></li> 
                                            <li><a href="/PlanDocs/<%= planDocument %>.pdf" title="Plan Provisions" target="_blank"><b>Review Plan Provisions</b></a></li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr align="center"> 
                                    <td colspan="2" height="22">&nbsp;</td>
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

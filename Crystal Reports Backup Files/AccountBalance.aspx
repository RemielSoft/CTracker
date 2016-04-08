<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="AccountBalance.aspx.cs" Inherits="RetirementFunds.Participant.AccountBalance" %>
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
                            <font class="planHeader">Current Plan: <asp:Label ID="lblPlanNameHeader" runat="server" /></font>
                        </div>
                        <br />
                        <div style="width:98%; padding: 20px 16px 12px 8px;">
                            <span class="headers">account information</span>
                            <br />
                            <table cellspacing="0" cellpadding="5" width="50%">
                                <tr id="trNoRecordsFound" runat="server" visible="false"> 
                                    <td class="txt1bold">You do not have any PLANS or your Social Security number and PIN numbers are incorrect
                                    </td>
                                </tr>
                                <tr id="trData" runat="server" visible="false">
                                    <td>
                                        <table width="80%" cellpadding="6"> 
                                            <tr>
                                                <td class="txt1bold"></td>
                                                <td><b></b></td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td><p class="text1">Participant:</p></td>
                                                <td class="text1"><span id="spanName" runat="server"></span></td>  
                                                <td><p class="text1">SSN:</p></td>
                                                <td class="text1"><span id="spanSSN" runat="server"></span></td>
                                            </tr>
                                        </table>
                                        <br />
                                        <table width="80%" cellpadding="6" id="tblNert1" runat="server">
                                        </table>
                                        <br />
                                        <table width="67%" cellpadding="6" align="right">
                                            <tr>
                                                <td align="right" width="67%"><b><font face="Arial, Helvetica, sans-serif" size="-2" color="Maroon">Total Balance:</font></b></td>
                                                <td align="right"><b><font face="Arial, Helvetica, sans-serif" size="-2">$<span id="spanNert1SumBalance" runat="server"></span></font></b></td>
                                            </tr>
                                        </table>  
                                        <br />
                                        <table width="84%" cellpadding="6" id="tblNert2" runat="server">
                                        </table> 
                                        <br />
                                        <table width="67%" cellpadding="6" align="right">
                                            <tr>
                                                <td align="right" width="67%"><b><font face="Arial, Helvetica, sans-serif" size="-2" color="Maroon">Total Balance:</font></b></td>
                                                <td align="right"><b><font face="Arial, Helvetica, sans-serif" size="-2">$<span id="spanNert2SumBalance" runat="server"></span></font></b></td>
                                            </tr>
                                        </table>                                                                             	
                                    </td>
                                </tr>	
                                <tr> 
                                    <td align="left">
                                        <p>&nbsp;</p>
                                        <p class="texth2">Important Information About Your Account Balance</p>
                                        <p><span class="text1">The account balances shown above are as of the fund closing date 
                                        listed.  These balances do not reflect your employer's vesting schedule.  
                                        If you are not yet fully vested in your plan, your account balance 
                                        payable at distribution may vary from the amount shown.  In all cases, 
                                        distributions will be valued as of the trade date the securities are 
                                        sold and will be subject to the provisions of your plan.</span></p>
                                        <p><span class="text1">If you have any questions, please contact us at <a href="mailto:info@nert.com"><b>info@nert.com.</b></a></span></p>
                                        <br />
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

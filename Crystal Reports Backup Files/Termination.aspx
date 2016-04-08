<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="Termination.aspx.cs" Inherits="RetirementFunds.Participant.Termination" %>
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
                            <span class="headers">termination package</span>
                            <br />
                            <br />
                            <table cellspacing="0" cellpadding="5" width="50%">
                                <tr> 
                                    <td valign="top" class="text1"> <p><span class="text1">When you terminate employment, you have several options for your retirement plan assets.
                                    Generally, you may keep your funds in the plan until a future date, roll your balance into an IRA, take the funds 
                                    as a taxable distribution or transfer the funds to your new employer's plan.</span></p> </td>
                                </tr>
                                <tr> 
                                    <td>
                                        <ul>
                                            <li><a href="/Pdfs/StayInPlan.PDF" target="new"><b>Keep Me in My Current Plan</b></a></li>
                                            <li><a href="/Pdfs/Roll%20into%20NertIRA.PDF" target="new"><b>Convert My NERT Account to a Rollover IRA</b></a></li>
                                            <li><a href="/Pdfs/TakeInCash.PDF" target="new"><b>Pay Me My Account in Cash</b></a></li>
                                            <li><a href="/Pdfs/TransferOut.PDF" target="new"><b>Transfer My Account out of NERT</b></a></li>
                                        </ul>
                                        <span class="text1">These forms require Adobe Acrobat Reader.  To download your free copy, click on the icon.</span>
                                        <a href="http://www.adobe.com/products/acrobat/readstep2.html" target="new"><img src="/images/getacro.gif">
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

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="AccountModification.aspx.cs" Inherits="RetirementFunds.Participant.AccountModification" %>
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
                            <span class="headers">account modification</span>
                            <br />
                            <br />
                            <table cellspacing="0" cellpadding="5" width="50%">
                                <tr> 
                                    <td valign="top" class="text1"> 
                                        <p>To update your account information, 
                                        click on the item below, complete the form and return it to 
                                        your plan administrator unless otherwise indicated.</p>
                                        <p>Some of our forms require Adobe Acrobat.  If you don't already have this 
                                        installed on your computer, you can download a free copy of Adobe Acrobat 
                                        Reader.</p>
                                    </td>
                                </tr>
                                <tr> 
                                    <td colspan="2" align="left">
                                        <ul>
                                            <li><a href="/Pdfs/contrib.pdf" target="new"><b>Change my contribution percentage/amount</b></a></li>
                                            <!-- 
                                            <li><a href="/Pdfs/election.pdf" target="new"><b>Change my investment fund allocation</b></a></li>
                                            -->
                                            <li><a href="NertAlloc.aspx"><b>Change my investment fund allocation</b></a></li>
                                            <li><a href="/Pdfs/benefmodification.pdf" target="new"><b>Change my beneficiary</b></a></li>
                                            <!-- 
                                            <li><a href="/Pdfs/invtrf.pdf" target="new"><b>Exchange my money between NERT funds</b></a></li>
                                            -->
                                            <li><a href="NertXfr.aspx"><b>Exchange my money between NERT funds</b></a></li>
                                            <li><a href="/Pdfs/qrptrf.pdf" target="new"><b>Transfer my retirement account balances from another financial institution/plan to my current retirement plan account in NERT</b></a></li>
                                            <li><a href="/Pdfs/ira2pln.pdf" target="new"><b>Transfer my rollover IRA account into my current retirement account with NERT</b></a></li> 
                                            <li><a href="http://www.adobe.com/products/acrobat/readstep2.html" target="new"><img src="/images/getacro.gif" alt="" runat="server"/></a></li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr align="center"> 
                                    <td colspan="2" height="20">&nbsp;</td>
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

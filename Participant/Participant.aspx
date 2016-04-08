<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="Participant.aspx.cs" Inherits="RetirementFunds.Participant.Participant" %>
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
                        <br />
                        <div id="divPlanInformation" runat="server" visible="false" style="text-align:right">
                            <font class="planHeader">Current User: <asp:Label ID="lblUserHeader" runat="server" /></font><br />
                        </div>                        
                        <br />
                        <div style="width:98%; padding: 20px 16px 12px 8px;">
                            <span class="headers">for the participant</span>
                            <br />
                            <br />
                            <table cellspacing="0" cellpadding="5" width="50%">
                                <tr> 
                                    <td valign="top"><span class="text1">You have successfully logged into your 
                                    retirement plan through the National Employers Retirement Trust. You 
                                    may now enroll in your plan, learn more about your investment options, 
                                    print out a current benefit statement, calculate how much you'll need 
                                    to retire, or get forms to change your elections, beneficiaries, etc.  
                                    Please select your plan below, and then just click on one of the tabs 
                                    on the right side of the page to get you started.</span>
                                    </td>
                                </tr>
                                <tr> 
                                    <td colspan="2" align="center" class="textquote"> 
                                        It's the cornerstone to a secure retirement.
                                    </td>
                                </tr>
                                <tr align="center"> 
                                    <td colspan="2">
                                        <span class="texth2" id="pCurrentPlan" runat="server" visible="false">Current Plan: </span>
                                        <asp:DropDownList ID="ddlPlans" runat="server" CssClass="dropdownflat" AutoPostBack="true" OnSelectedIndexChanged="ddlPlans_SelectedIndexChanged" Visible="false"></asp:DropDownList>
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

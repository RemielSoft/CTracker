<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="Enrollment.aspx.cs" Inherits="RetirementFunds.Participant.Enrollment" %>
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
                            <span class="headers">for the participant</span>
                            <br /><br />
                            <table cellspacing="0" cellpadding="5" width="50%">
                                <tr> 
                                    <td align="center">
                                        <span class="texth2" id="pCurrentPlan" runat="server" visible="false">Current Plan: </span>
                                        <asp:DropDownList ID="ddlPlans" runat="server" CssClass="dropdownflat" AutoPostBack="true" OnSelectedIndexChanged="ddlPlans_SelectedIndexChanged" Visible="false"></asp:DropDownList>
                                    </td>
                                </tr> 
                                <tr> 
                                    <td>
                                        <span class="text1">Welcome to the NERT enrollment process. As 
                                        part of enrolling in your employer's retirement plan, you should know 
                                        about your plan's provisions and investment choices. Just complete 
                                        the following easy steps:</span> 
                                        <p></p>
                                        <ul class="text1">
                                            <li>Step 1 -- Review your plan's provisions</li> 
                                            <li>Step 2 -- Learn about your investment fund options available in NERT</li>
                                            <li>Step 3 -- Review fund performance</li>
                                            <li>Step 4 -- Take an investment risk assessment to learn what investment choices may be right for your goals</li>
                                            <li>Step 5 -- Complete enrollment forms, investment elections and beneficiary data.</li>
                                        </ul>
                                        <p class="texth2">To begin the enrollment process, click on Step One at the lower right corner of the screen.</p>
                                        <p align="right"><img src="/images/arrow4.gif" alt="" runat="server"/><a href="/PlanDocs/<%= planDocument %>.pdf" title="Plan Provisions" target="rpt"><b>Step One -- Review Plan Provisions</b></a></p>
                                        <p align="right"><img src="/images/arrow4.gif" alt="" runat="server"/><a href="/Participant/Step_1_2.aspx"><b>Step Two -- Learn About Your Investment Options</b></a></p>
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

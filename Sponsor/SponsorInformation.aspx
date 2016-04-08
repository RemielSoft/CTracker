<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="SponsorInformation.aspx.cs" Inherits="RetirementFunds.Sponsor.SponsorInformation" %>
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
                        <div style="width:98%; padding: 20px 16px 12px 8px;">
                            <span class="headers">sponsor information</span>
                            <br />
                            <br />
                            <table cellspacing="0" cellpadding="5" width="50%">
                                <tr> 
                                    <td valign="top" class="text1"> 
                                        <asp:DropDownList ID="ddlPlans"  runat="server" CssClass="dropdownflat" AutoPostBack="true" OnSelectedIndexChanged="ddlPlans_SelectedIndexChanged" Visible="true"></asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <ul>
                                            <li><a href="/PlanDocs/<%= planDocument %>.pdf" title="Plan Provisions" target="_blank"><b>Review Plan Provisions</b></a></li>
                                            <li><a href="/Reports/ReportViewier.aspx?rname=websumacct.rpt&from=s&pid=0&sid=1&ssnum=<%=Session["SSNUM"] %>" title="Investment Account Balances" target="_blank"><b>Plan Investment Account Balances</b></a></li> 
                                            <li><font color="#639C9C"><b>Employee Census Data Report</b></font>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/Reports/ReportViewier.aspx?rname=webcensus.rpt&from=s&pid=0&ssnum=<%=Session["SSNUM"] %>" title="Employee Census Data Report Pdf" target="_blank">Pdf</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/Reports/ReportViewier.aspx?rname=webcensus.rpt&from=s&pid=0&ssnum=<%=Session["SSNUM"] %>&mimetype=excel" title="Employee Census Data Report Excel" target="_blank">Excel</a></li>
                                            <li><a href="/Reports/ReportViewier.aspx?rname=websumacctpart.rpt&from=s&pid=0&sid=1&ssnum=<%=Session["SSNUM"] %>" title="Summary of Participant Accounts" target="_blank"><b>Summary of Participant Accounts</b></a></li>
                                            <li><font color="#639C9C"><b>Individual Participant Account</b></font>&nbsp;&nbsp;&nbsp;&nbsp;<span class="texth3">SSN:</span>&nbsp;&nbsp;<asp:TextBox ID="txtSSN" runat="server" CssClass="textbox" Columns="9"></asp:TextBox>&nbsp;&nbsp;<asp:Button ID="btnGetReport" runat="server" CssClass="buttonFlat" OnClick="btnGetReport_Click" Text="Go" /></li>
                                            <li><a href="/User/UserMaster.aspx"><b>Add New Employees</b></a></li>
                                            <li><a href="/Pdfs/nerterdr.pdf" target="new"><b>Employer's Plan Administration Manual</b></a></li>                                           
                                        </ul>
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

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="UserMaster.aspx.cs" Inherits="RetirementFunds.User.UserMaster" %>
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
                            <font class="planHeader">Current Plan: <asp:Label ID="lblPlaneNameHeader" runat="server" /></font>
                        </div>                          
                        <div style="width:98%; padding: 20px 16px 12px 8px;">
                            <span class="headers">account information</span>
                            <br />
                            <br />
                            <table cellspacing="0" cellpadding="5" width="100%">
                                <tr> 
                                    <td valign="top" class="text1">
                                        <span class="text1">To add new participants to your plan, please complete the fields below.
This information will be forwarded to your plan administrator, who will add these employees to our database.  
We will then mail the employee a PIN letter and enrollment instructions.  Employees who do not complete the 
enrollment process but who make/receive contributions to the plan will be invested in the Nationwide Provident 
Guaranteed Fund until we receive investment instructions from them.  For employees 
who don't want to enroll online, paper enrollment forms are also available through your administrator.</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <font class="texth2">Current Plan : <asp:Label ID="lblPlanName" runat="server" /></font>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Table ID="tblEmployee" runat="server" CellPadding="0" BorderWidth="0" Width="100%"></asp:Table>
                                    </td>
                                </tr>  
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center"><asp:Button ID="btnAddNew" runat="server" OnClick="btnAddNew_Click" Text="Add New" CssClass="formelement" ToolTip="Add New" /></td>
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

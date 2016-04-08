<%@ Page Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="NertXfr.aspx.cs" Inherits="RetirementFunds.Participant.NertXfr" %>

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
                        <span class="headers">Choose a plan</span>
                    </td>
                </tr>	
                <tr>
                    <td align="center">
                        <font class="texth2">Current Plan: <asp:Label ID="lblPlanName" runat="server" /> 
                        <br /><br />
                        <asp:Literal ID="litOr" runat="server">or</asp:Literal> </font>
                        <asp:DropDownList ID="ddlPlans"  runat="server" CssClass="dropdownflat" AutoPostBack="true" OnSelectedIndexChanged="ddlPlans_SelectedIndexChanged" Visible="true"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>	
                <tr>
                    <td align="center"><asp:Button ID="btnNext" runat="server" Text="Next" onclick="btnNext_Click" /></td>
                </tr>												
            </table>
			<!-- end - main content area -->
	    </div>
	</td>
	<td width="15"></td>
	<td rowspan="3" class="dropShadow">&nbsp;</td>
</tr>
</asp:Content>

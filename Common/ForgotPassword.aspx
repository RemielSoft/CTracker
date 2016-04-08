<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="RetirementFunds.Common.ForgotPassword" %>
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
                            <span class="headers">Forgot Password</span>
                            <br />
                            <br />
                            <table cellspacing="0" cellpadding="5" width="100%" id="tblMessage" runat="server" visible="false">
                                <tr>
                                    <td class="texth3"><asp:Label ID="lblMessage" runat="server"></asp:Label></td>
                                </tr>
                            </table>                             
                            <table cellspacing="0" cellpadding="5" width="100%" id="tblSSN" runat="server">
                                <tr>
                                    <td width="20%" align="right" class="texth3">SSN :</td>
                                    <td width="80%"><asp:TextBox ID="txtSSN" runat="server" CssClass="textbox" Columns="8" TabIndex="1"></asp:TextBox></td>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellspacing="4" cellpadding="4" id="tblSendPassword" runat="server">
                                <tr>
                                    <td width="40%" align="center"><asp:Button ID="btnSendPassword" runat="server" CssClass="buttonFlat" OnClick="btnSendPassword_Click" Text="Send Password" TabIndex="2"/></td>                                    
                                    <td width="60%"></td>
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

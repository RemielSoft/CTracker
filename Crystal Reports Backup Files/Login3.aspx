<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="Login3.aspx.cs" Inherits="RetirementFunds.Common.Login3" %>
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
                            <span class="headers">login</span>
                            <br />
                            <br />
                            <table width="100%" border="0" cellspacing="4" cellpadding="4">
                                <!-- 
                                <tr>
                                    <td width="20%" align="right" class="texth3">Sponsor / Participant :</td>
                                    <td width="80%">
                                        <asp:DropDownList ID="ddlUserType" runat="server" TabIndex="1" CssClass="dropdownflat">
                                            <asp:ListItem Text="Sponsor" Value="SPONSOR"></asp:ListItem>
                                            <asp:ListItem Text="Participant" Value="PARTICIPANT"></asp:ListItem>                                            
                                        </asp:DropDownList> 
                                    </td>
                                </tr>
                                -->                            
                                <tr>
                                    <td width="20%" align="right" class="texth3">SSN :</td>
                                    <td width="80%"><asp:TextBox ID="txtSSN" runat="server" CssClass="textbox" Columns="8" TabIndex="2"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td align="right" class="texth3" width="20%" >Password :</td>
                                    <td width="80%"><asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" TextMode="Password" Columns="8" TabIndex="3"></asp:TextBox></td>
                                </tr>                         
                            </table>
                            <table width="100%" border="0" cellspacing="4" cellpadding="4">
                                <tr>
                                    <td width="40%" align="center"><asp:Button ID="btnLogin" runat="server" CssClass="buttonFlat" OnClick="btnLogin_Click" Text="Login" TabIndex="4"/></td>                                    
                                    <td width="60%"></td>
                                </tr>  
                                <tr>
                                    <td width="40%" align="center"><asp:Label ID="lblMsg" runat="server" CssClass="texth3" ForeColor="Red" /></td>                                    
                                    <td width="60%"></td>
                                </tr>                      
                            </table>
                            <table width="100%" border="0" cellspacing="4" cellpadding="4">
                                <tr>
                                    <td align="right" class="texth3" width="20%" ></td>
                                    <td width="80%" align="left" class="texth2"><a href="ForgotPassword.aspx">Forgot Password</a></td>
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

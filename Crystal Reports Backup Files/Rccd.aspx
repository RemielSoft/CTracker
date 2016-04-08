<%@ Page Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="Rccd.aspx.cs" Inherits="RetirementFunds.Association.Rccd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 210px;
        }
    </style>
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
                        <table cellspacing="0" cellpadding="5" width="95%">
                        <tr>
                            <td valign="top" colspan="2">
                              <p class="texth1">Request Conference Presentation</p>
                              </td>
                          </tr>
                        <tr>
                            <td></td>
                            <td class="style1"><p class="texth2"><i>Employer Information</i></p>
                            </td>
                        </tr>
                        <tr>
                            <td align=right><font face="Arial, Helvetica, sans-serif" size="-1">Name:</font></td>
                            <td class="style1"><asp:TextBox ID="txtName" runat="server" Columns="30" TabIndex="2" CssClass="textbox"></asp:TextBox></td>
                            <td><asp:RequiredFieldValidator ID="reqValName" ControlToValidate="txtName" runat="server" ErrorMessage="You must enter the Company name."></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align=right valign=top><font face="Arial, Helvetica, sans-serif" size="-1">Address:</font></td>
                            <td class="style1"><asp:TextBox ID="txtAddress1" runat="server" Columns="30" TabIndex="2" CssClass="textbox"></asp:TextBox><br>
                            <asp:TextBox ID="txtAddress2" runat="server" Columns="30" TabIndex="2" CssClass="textbox"></asp:TextBox></td>
                            <td><asp:RequiredFieldValidator ID="reqValAddress" ControlToValidate="txtAddress1" runat="server" ErrorMessage="You must enter your address."></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align=right><font face="Arial, Helvetica, sans-serif" size="-1">Telephone:</font>	</td>
                            <td class="style1"><asp:TextBox ID="txtPhone" runat="server" Columns="30" TabIndex="2" CssClass="textbox"></asp:TextBox></td>
                            <td><asp:RequiredFieldValidator ID="reqValPhone" ControlToValidate="txtPhone" runat="server" ErrorMessage="You must enter your telephone number."></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align=right><font face="Arial, Helvetica, sans-serif" size="-1">Facsimile:</font></td>
                            <td class="style1"><asp:TextBox ID="txtFax" runat="server" Columns="30" TabIndex="2" CssClass="textbox"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align=right><font face="Arial, Helvetica, sans-serif" size="-1">E-Mail Address:</font></td>
                            <td class="style1"><asp:TextBox ID="txtEmail" runat="server" Columns="30" TabIndex="2" CssClass="textbox"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="style1"><p class="texth2"><i>Proposal Information</i></p></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="style1">
                                <asp:RadioButtonList ID="rblPlanType" runat="server">
                                    <asp:ListItem Text="Mail Presentation" Value="Mail"></asp:ListItem>
                                    <asp:ListItem Text="Download Now" Value="Download" Selected=True></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td align=right><font face="Arial, Helvetica, sans-serif" size="-1">Plan Type:</font></td>
                            <td class="style1"><asp:TextBox ID="txtPlanType" runat="server" Columns="30" TabIndex="2" CssClass="textbox"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="btnSubmit" Text="Submit Request" TabIndex="40" Width="50px" 
                                    runat="server" CssClass="buttonFlat" onclick="btnSubmit_Click" />
                                <asp:Button ID="btnReset" Text="Reset" TabIndex="40" Width="50px" 
                                    runat="server" CssClass="buttonFlat" CausesValidation="False" 
                                    onclick="btnReset_Click" />
                            </td>
                        </tr>
                        </table>

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
    
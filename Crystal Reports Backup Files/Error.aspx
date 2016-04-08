<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="RetirementFunds.Common.Error" %>
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
                            <span class="headers">error</span>
                            <br />
                            <br />
                            <table cellspacing="0" cellpadding="10" width="50%">
                                <tr> 
                                    <td width="185" valign="top"><div align="right"></div></td>
                                    <td width="2" valign="middle"><img src="~/images/sepa.gif" width="1" height="100" alt="" runat="server"/></td>
                                    <td width="273" valign="top" colspan="2"> 
                                        <div align="left">
                                        <p class="text1">&nbsp;</p>
                                        <p class="text1">An error has occured. Please try again or contact us at: <a href="mailto:info@nert.com" ><strong class="text1">info@nert.com</strong></a></p>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3"><span id="spanError" runat="server" visible="false"></span></td>
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

<%@ Page Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="MemberServices.aspx.cs" Inherits="RetirementFunds.Association.MemberServices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
<script type="text/javascript" language="javascript">

 function controlEnter (obj, event)
 {       
     var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;       
     if (keyCode == 13)
     {                   
        document.getElementById(obj).click();
                    return false;       
     }       
     else  {
                   return true;  
     }  
 }
</script>
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
                            <span class="headers">association member services</span>
                            <br />
                            <br />
                            <table cellspacing="0" cellpadding="5" width="50%">
                                <tr> 
                                    <td valign="top" class="text1"> 
                                        Please Enter Your Association's Initials:
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:TextBox ID="txtInitials" runat="server" Columns="17" TabIndex="1" CssClass="textbox"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Button ID="btnNext" Text="Next" TabIndex="40" Width="50px" runat="server" 
                                            CssClass="buttonFlat" onclick="btnNext_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
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

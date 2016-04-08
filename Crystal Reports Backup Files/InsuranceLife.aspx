<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="InsuranceLife.aspx.cs" Inherits="RetirementFunds.Insurance.InsuranceLife" %>
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
                            <span class="headers">get an insurance quote</span>
                            <br />
                            <br />
                            <p class="texth1" style="padding-left:25px;text-align:center;width:50%;">Life Insurance Proposal Request</p>
                            <div style="padding-left:25px;" id="divInputData" runat="server" visible="true">
                                <table border="0" width="50%" cellpadding="2">
                                    <tr> 
                                        <td width="35%" bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1">First Name</font></td>
                                        <td width="65%" bgcolor="#f0f0f0"><asp:TextBox ID="txtFirstName" runat="server" Columns="17" TabIndex="1" CssClass="textbox"></asp:TextBox></td>
                                    </tr>
                                    <tr> 
                                        <td width="35%" bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1">Last Name</font></td>
                                        <td width="65%" bgcolor="#e0e0e0"><asp:TextBox ID="txtLastName" runat="server" Columns="17" TabIndex="2" CssClass="textbox"></asp:TextBox></td>
                                    </tr>
                                    <tr> 
                                        <td width="35%" bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1">Address Line 1</font></td>
                                        <td width="65%" bgcolor="#f0f0f0"><asp:TextBox ID="txtAddress1" runat="server" Columns="30" TabIndex="3" CssClass="textbox"></asp:TextBox></td>
                                    </tr>
                                    <tr> 
                                        <td width="35%" bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1">Address Line 2</font></td>
                                        <td width="65%" bgcolor="#e0e0e0"><asp:TextBox ID="txtAddress2" runat="server" Columns="30" TabIndex="4" CssClass="textbox"></asp:TextBox></td>
                                    </tr>
                                    <tr> 
                                        <td width="35%" bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1">City</font></td>
                                        <td width="65%" bgcolor="#f0f0f0"><asp:TextBox ID="txtCity" runat="server" Columns="20" TabIndex="5" CssClass="textbox" MaxLength="30"></asp:TextBox></td>
                                    </tr>
                                    <tr> 
                                        <td width="35%" bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1">State</font></td>
                                        <td width="65%" bgcolor="#e0e0e0">
                                            <asp:DropDownList ID="ddlState" runat="server" CssClass="dropdownflat" TabIndex="6">
                                                <asp:ListItem Value="" Text="Select Your State" Selected="True"></asp:ListItem>
                                                <asp:ListItem Value="AL" Text="Alabama"></asp:ListItem>
                                                <asp:ListItem Value="AK" Text="Alaska"></asp:ListItem>
                                                <asp:ListItem Value="AZ" Text="Arizona"></asp:ListItem>
                                                <asp:ListItem Value="AR" Text="Arkansas"></asp:ListItem>
                                                <asp:ListItem Value="CA" Text="California"></asp:ListItem> 
                                                <asp:ListItem Value="CO" Text="Colorado"></asp:ListItem> 
                                                <asp:ListItem Value="CT" Text="Connecticut"></asp:ListItem> 
                                                <asp:ListItem Value="DE" Text="Delaware"></asp:ListItem> 
                                                <asp:ListItem Value="DC" Text="District of Columbia"></asp:ListItem> 
                                                <asp:ListItem Value="FL" Text="Florida"></asp:ListItem> 
                                                <asp:ListItem Value="GA" Text="Georgia"></asp:ListItem> 
                                                <asp:ListItem Value="HI" Text="Hawaii"></asp:ListItem> 
                                                <asp:ListItem Value="ID" Text="Idaho"></asp:ListItem> 
                                                <asp:ListItem Value="IL" Text="Illinois"></asp:ListItem> 
                                                <asp:ListItem Value="IN" Text="Indiana"></asp:ListItem> 
                                                <asp:ListItem Value="IA" Text="Iowa"></asp:ListItem> 
                                                <asp:ListItem Value="KS" Text="Kansas"></asp:ListItem> 
                                                <asp:ListItem Value="KY" Text="Kentucky"></asp:ListItem> 
                                                <asp:ListItem Value="LA" Text="Louisiana"></asp:ListItem> 
                                                <asp:ListItem Value="ME" Text="Maine"></asp:ListItem> 
                                                <asp:ListItem Value="MD" Text="Maryland"></asp:ListItem> 
                                                <asp:ListItem Value="MA" Text="Massachusetts"></asp:ListItem> 
                                                <asp:ListItem Value="MI" Text="Michigan"></asp:ListItem> 
                                                <asp:ListItem Value="MN" Text="Minnesota"></asp:ListItem> 
                                                <asp:ListItem Value="MS" Text="Mississippi"></asp:ListItem> 
                                                <asp:ListItem Value="MO" Text="Missouri"></asp:ListItem> 
                                                <asp:ListItem Value="MT" Text="Montana"></asp:ListItem> 
                                                <asp:ListItem Value="NE" Text="Nebraska"></asp:ListItem> 
                                                <asp:ListItem Value="NH" Text="New Hampshire"></asp:ListItem> 
                                                <asp:ListItem Value="NV" Text="Nevada"></asp:ListItem> 
                                                <asp:ListItem Value="NJ" Text="New Jersey"></asp:ListItem> 
                                                <asp:ListItem Value="NM" Text="New Mexico"></asp:ListItem> 
                                                <asp:ListItem Value="NY" Text="New York"></asp:ListItem> 
                                                <asp:ListItem Value="NC" Text="North Carolina"></asp:ListItem> 
                                                <asp:ListItem Value="ND" Text="North Dakota"></asp:ListItem> 
                                                <asp:ListItem Value="OH" Text="Ohio"></asp:ListItem> 
                                                <asp:ListItem Value="OK" Text="Oklahoma"></asp:ListItem> 
                                                <asp:ListItem Value="OR" Text="Oregon"></asp:ListItem> 
                                                <asp:ListItem Value="PA" Text="Pennsylvania"></asp:ListItem> 
                                                <asp:ListItem Value="RI" Text="Rhode Island"></asp:ListItem> 
                                                <asp:ListItem Value="SC" Text="South Carolina"></asp:ListItem> 
                                                <asp:ListItem Value="SD" Text="South Dakota"></asp:ListItem> 
                                                <asp:ListItem Value="TN" Text="Tennessee"></asp:ListItem> 
                                                <asp:ListItem Value="TX" Text="Texas"></asp:ListItem> 
                                                <asp:ListItem Value="UT" Text="Utah"></asp:ListItem> 
                                                <asp:ListItem Value="VT" Text="Vermont"></asp:ListItem> 
                                                <asp:ListItem Value="VA" Text="Virginia"></asp:ListItem> 
                                                <asp:ListItem Value="WA" Text="Washington"></asp:ListItem> 
                                                <asp:ListItem Value="WV" Text="West Virginia"></asp:ListItem> 
                                                <asp:ListItem Value="WI" Text="Wisconsin"></asp:ListItem> 
                                                <asp:ListItem Value="WY" Text="Wyoming"></asp:ListItem> 
                                            </asp:DropDownList>                    
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="35%" bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1">Zip</font></td>
                                        <td width="65%" bgcolor="#f0f0f0"><asp:TextBox ID="txtZip1" runat="server" Columns="5" TabIndex="7" CssClass="textbox" MaxLength="5"></asp:TextBox>
                                        &nbsp;-&nbsp;<asp:TextBox ID="txtZip2" runat="server" Columns="4" TabIndex="8" CssClass="textbox" MaxLength="4"></asp:TextBox></td>
                                    </tr>
                                    <tr> 
                                        <td width="35%" bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1">Phone Number</font></td>
                                        <td width="65%" bgcolor="#e0e0e0"><asp:TextBox ID="txtPhone1" runat="server" Columns="3" TabIndex="9" CssClass="textbox" MaxLength="3"></asp:TextBox>
                                        &nbsp;-&nbsp;<asp:TextBox ID="txtPhone2" runat="server" Columns="3" TabIndex="10" CssClass="textbox" MaxLength="3"></asp:TextBox>
                                        &nbsp;-&nbsp;<asp:TextBox ID="txtPhone3" runat="server" Columns="4" TabIndex="11" CssClass="textbox" MaxLength="4"></asp:TextBox></td>
                                    </tr>
                                    <tr> 
                                        <td width="35%" bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1">Fax Number</font></td>
                                        <td width="65%" bgcolor="#f0f0f0"><asp:TextBox ID="txtFax1" runat="server" Columns="3" TabIndex="12" CssClass="textbox" MaxLength="3"></asp:TextBox>
                                        &nbsp;-&nbsp;<asp:TextBox ID="txtFax2" runat="server" Columns="3" TabIndex="13" CssClass="textbox" MaxLength="3"></asp:TextBox>
                                        &nbsp;-&nbsp;<asp:TextBox ID="txtFax3" runat="server" Columns="4" TabIndex="14" CssClass="textbox" MaxLength="4"></asp:TextBox></td>
                                    </tr>
                                    <tr> 
                                        <td width="35%" bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1">Email Address</font></td>
                                        <td width="65%" bgcolor="#e0e0e0"><asp:TextBox ID="txtEmail" runat="server" Columns="30" TabIndex="15" CssClass="textbox" MaxLength="50"></asp:TextBox></td>
                                    </tr>
                                    <tr> 
                                        <td width="35%" bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1">Occupation</font></td>
                                        <td width="65%" bgcolor="#f0f0f0"><asp:TextBox ID="txtOccupation" runat="server" Columns="30" TabIndex="16" CssClass="textbox" MaxLength="50"></asp:TextBox></td>
                                    </tr>
                                    <tr> 
                                        <td width="35%" bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1">Date of Birth</font></td>
                                        <td width="65%" bgcolor="#e0e0e0"><asp:TextBox ID="txtDOB" runat="server" Columns="30" TabIndex="17" CssClass="textbox" MaxLength="50"></asp:TextBox></td>
                                    </tr>
                                    <tr> 
                                        <td colspan="2" bgcolor="#f0f0f0">
                                            <table border="0" width="100%">
                                                <tr>
                                                    <td><font face="Arial, Helvetica, sans-serif" size="-1">Tobacco used in the last 12 months? </font></td>
                                                    <td style="width:55%" align="left">
                                                        <asp:RadioButtonList ID="rblTobacco" runat="server" RepeatDirection="Horizontal" CssClass="radiobuttonlist" TabIndex="18">
                                                            <asp:ListItem Value="Yes" Text="YES"></asp:ListItem>
                                                            <asp:ListItem Value="No" Text="NO" Selected="True"></asp:ListItem>
                                                        </asp:RadioButtonList>                                    
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td bgcolor="#e0e0e0" width="35%"><font face="Arial, Helvetica, sans-serif" size="-1">Level Premium Period</font></td>
                                        <td bgcolor="#e0e0e0" width="65%">
                                            <asp:RadioButtonList ID="rblPeriod" runat="server" RepeatDirection="Horizontal" CssClass="radiobuttonlist" TabIndex="19">
                                                <asp:ListItem Value="1" Text="1 Year"></asp:ListItem>
                                                <asp:ListItem Value="10" Text="10 Year"></asp:ListItem>
                                                <asp:ListItem Value="20" Text="20 Year" Selected="True"></asp:ListItem>
                                                <asp:ListItem Value="40" Text="40 Year"></asp:ListItem>
                                                <asp:ListItem Value="LIFE" Text="Life"></asp:ListItem>
                                            </asp:RadioButtonList>                            
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td bgcolor="#f0f0f0" width="35%"><font face="Arial, Helvetica, sans-serif" size="-1">Amount of Coverage</font></td>
                                        <td bgcolor="#f0f0f0" width="65%"><font face="Arial, Helvetica, sans-serif" size="-1">$</font> <asp:TextBox ID="txtAmount" runat="server" Columns="10" TabIndex="20" CssClass="textbox" MaxLength="10"></asp:TextBox></td>
                                    </tr>
                                    <tr> 
                                        <td bgcolor="#e0e0e0" width="35%"><font face="Arial, Helvetica, sans-serif" size="-1"> Spousal Coverage</font></td>
                                        <td bgcolor="#e0e0e0" width="65%"><font face="Arial, Helvetica, sans-serif" size="-1">Age</font> <asp:TextBox ID="txtSpouseAge" runat="server" Columns="4" TabIndex="21" CssClass="textbox" MaxLength="4"></asp:TextBox>
                                        <font face="Arial, Helvetica, sans-serif" size="-1">Amount $</font> <asp:TextBox ID="txtSpouseAmount" runat="server" Columns="10" TabIndex="22" CssClass="textbox" MaxLength="10"></asp:TextBox></td>
                                    </tr>
                                    <tr> 
                                        <td bgcolor="#f0f0f0" width="35%"><font face="Arial, Helvetica, sans-serif" size="-1">Purpose </font></td>
                                        <td bgcolor="#f0f0f0" width="65%">
                                            <asp:RadioButtonList ID="rblPurpose" runat="server" RepeatDirection="Horizontal" CssClass="radiobuttonlist" TabIndex="23" RepeatColumns="5">
                                                <asp:ListItem Value="DEBT" Text="Debt"></asp:ListItem>
                                                <asp:ListItem Value="EDUCATION" Text="Education"></asp:ListItem>
                                                <asp:ListItem Value="INSURABILITY" Text="Insurability"></asp:ListItem>
                                                <asp:ListItem Value="ESTATE" Text="Estate"></asp:ListItem>
                                                <asp:ListItem Value="TAX" Text="Tax"></asp:ListItem>
                                                <asp:ListItem Value="PROTECTION" Text="Protection"  Selected="True"></asp:ListItem>
                                                <asp:ListItem Value="FUNDING" Text="Funding"></asp:ListItem>
                                                <asp:ListItem Value="LOCKIN" Text="Lock-in"></asp:ListItem>
                                                <asp:ListItem Value="PLANNING" Text="Planning"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr bgcolor="#e0e0e0"> 
                                        <td colspan="2">
                                            <table border="0" width="100%">
                                                <tr>
                                                    <td><font face="Arial, Helvetica, sans-serif" size="-1">Pre-existing Conditions? </font></td>
                                                    <td style="width:70%" align="left">
                                                        <asp:RadioButtonList ID="rblPreExisting" runat="server" RepeatDirection="Horizontal" CssClass="radiobuttonlist" TabIndex="24">
                                                            <asp:ListItem Value="Yes" Text="YES"></asp:ListItem>
                                                            <asp:ListItem Value="No" Text="NO" Selected="True"></asp:ListItem>
                                                        </asp:RadioButtonList>                                    
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="35%" bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1">Details, Comments </font></td>
                                        <td width="65%" bgcolor="#f7f3f7"><asp:TextBox ID="txtDetails" runat="server" TabIndex="25" CssClass="textbox" Rows="3" Columns="48" TextMode="MultiLine"></asp:TextBox></td>
                                    </tr>
                                    <tr bgcolor="#e0e0e0"> 
                                        <td align="center" colspan="2"><asp:Button ID="btnSubmit" runat="server" Text="Next" Width="50px" OnClick="btnSubmit_Click" />&nbsp;<input name="btnReset" id="btnReset" type="reset" value="Reset" style="width: 50px"/>
                                        </td>
                                    </tr>
                            </table>
                            </div>
                            <div style="padding-left:25px;" id="divInputValidation" runat="server" visible="false">
                                <table border="0" width="50%" cellpadding="2">
                                    <tr>
                                        <td bgcolor="#f0f0f0" width="35%"><font face="Arial, Helvetica, sans-serif" size="-1">Name       :</font></td>
                                        <td bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1"><asp:Label ID="lblName" runat="server"></asp:Label></font></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1">Address     :</font></td>
                                        <td bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1"><asp:Label ID="lblAddress" runat="server"></asp:Label></font></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1">City        :</font></td>
                                        <td bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1"><asp:Label ID="lblCity" runat="server"></asp:Label></font></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1">State       :</font></td>
                                        <td bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1"><asp:Label ID="lblState" runat="server"></asp:Label></font></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1">ZIP         :</font></td>
                                        <td bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1"><asp:Label ID="lblZip" runat="server"></asp:Label></font></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1">Day Phone   :</font></td>
                                        <td bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1"><asp:Label ID="lblPhone" runat="server"></asp:Label></font></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1">FAX         :</font></td>
                                        <td bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1"><asp:Label ID="lblFax" runat="server"></asp:Label></font></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1">Email       :</font></td>
                                        <td bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1"><asp:Label ID="lblEmail" runat="server"></asp:Label></font></td>                                
                                    </tr>
                                    <tr>
                                        <td bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1">Occupation  :</font></td>
                                        <td bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1"><asp:Label ID="lblOccupation" runat="server"></asp:Label></font></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1">DOB         :</font></td>
                                        <td bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1"><asp:Label ID="lblDOB" runat="server"></asp:Label></font></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1">Tobacco     :</font></td>
                                        <td bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1"><asp:Label ID="lblTobacco" runat="server"></asp:Label></font></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1">Period      :</font></td>
                                        <td bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1"><asp:Label ID="lblPeriod" runat="server"></asp:Label></font></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1">Amount      :</font></td>
                                        <td bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1"><asp:Label ID="lblAmount" runat="server"></asp:Label></font></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1">Spouse Age  :</font></td>
                                        <td bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1"><asp:Label ID="lblSpouseAge" runat="server"></asp:Label></font></td>
                                    </tr>                                
                                    <tr>
                                        <td bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1">Spouse Amt  :</font></td>
                                        <td bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1"><asp:Label ID="lblSpouseAmount" runat="server"></asp:Label></font></td>
                                    </tr>                                
                                    <tr>
                                        <td bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1">Purpose     :</font></td>
                                        <td bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1"><asp:Label ID="lblPurpose" runat="server"></asp:Label></font></td>
                                    </tr>                                
                                    <tr>
                                        <td bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1">Pre-Existing:</font></td>
                                        <td bgcolor="#f0f0f0"><font face="Arial, Helvetica, sans-serif" size="-1"><asp:Label ID="lblPreExisting" runat="server"></asp:Label></font></td>
                                    </tr>                                
                                    <tr>
                                        <td bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1">Detail      :</font></td>
                                        <td bgcolor="#e0e0e0"><font face="Arial, Helvetica, sans-serif" size="-1"><asp:Label ID="lblDetail" runat="server"></asp:Label></font></td>
                                    </tr>  
	                                <tr>	                        
	                                    <td colspan=2 align=center bgcolor="f0f0f0">
	                                        <asp:Button ID="btnGoBack" runat="server" Text="Go Back and Modify your Data" OnClick="btnGoBack_Click" />&nbsp;
	                                        <asp:Button ID="btnSubmitInformation" runat="server" Text="Submit Information" OnClick="btnSubmitInformation_Click" />
	                                    </td>
	                                </tr>                                                  
                                </table>
                            </div>   
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

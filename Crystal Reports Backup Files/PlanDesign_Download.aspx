<%@ Page Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="PlanDesign_Download.aspx.cs" Inherits="RetirementFunds.Insurance.PlanDesign_Download" %>

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
                            <span class="headers">design your plan</span>
                            <br />
                            <p class="texth1" style="padding-left:25px;">Retirement Plan Design Questionnaire </p>
                            <div style="padding-left:25px;width:55%;">
                            <table border="0" cellpadding="2" width="100%">
                                <tr>
                                    <td bgcolor="#E0E0E0" style="width:200px"><font face="Arial, Helvetica, sans-serif" size="-1">Company Name</font></td>
                                    <td bgcolor="#E0E0E0"><asp:TextBox ID="txtCompany" runat="server" Columns="17" TabIndex="1" CssClass="textbox"></asp:TextBox></td>
                                </tr>
                                <tr> 
                                    <td bgcolor="#F0F0F0"><font face="Arial, Helvetica, sans-serif" size="-1">First Name</font></td>
                                    <td bgcolor="#F0F0F0">
                                        <asp:TextBox ID="txtFirstName" runat="server" Columns="17" TabIndex="2" CssClass="textbox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqFirstName" ControlToValidate="txtFirstName" Text="Required" ForeColor="Red" runat="server" Display="Dynamic" />
                                    </td>
                                </tr>
                                <tr> 
                                    <td bgcolor="#E0E0E0"><font face="Arial, Helvetica, sans-serif" size="-1">Last Name</font></td>
                                    <td bgcolor="#E0E0E0">
                                        <asp:TextBox ID="txtLastName" runat="server" Columns="17" TabIndex="3" CssClass="textbox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqLastName" ControlToValidate="txtLastName" Text="Required" ForeColor="Red" runat="server" Display="Dynamic" />
                                    </td>
                                </tr>
                                <tr> 
                                    <td bgcolor="#F0F0F0"><font face="Arial, Helvetica, sans-serif" size="-1">Address </font></td>
                                    <td bgcolor="#F0F0F0">
                                        <asp:TextBox ID="txtAddress1" runat="server" Columns="30" TabIndex="4" CssClass="textbox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqAddress1" ControlToValidate="txtAddress1" Text="Required" ForeColor="Red" runat="server" Display="Dynamic" />
                                    </td>
                                </tr>
                                <tr> 
                                    <td bgcolor="#E0E0E0"><font face="Arial, Helvetica, sans-serif" size="-1">Address </font></td>
                                    <td bgcolor="#E0E0E0"><asp:TextBox ID="txtAddress2" runat="server" Columns="30" TabIndex="5" CssClass="textbox"></asp:TextBox></td>
                                </tr>
                                <tr> 
                                    <td bgcolor="#F0F0F0"><font face="Arial, Helvetica, sans-serif" size="-1">City</font></td>
                                    <td bgcolor="#F0F0F0">
                                        <asp:TextBox ID="txtCity" runat="server" Columns="20" TabIndex="6" CssClass="textbox" MaxLength="30"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqCity" ControlToValidate="txtCity" Text="Required" ForeColor="Red" runat="server" Display="Dynamic" />
                                    </td>
                                </tr>
                                <tr> 
                                    <td bgcolor="#E0E0E0"><font face="Arial, Helvetica, sans-serif" size="-1">State</font></td>
                                    <td bgcolor="#E0E0E0">
                                        <asp:DropDownList ID="ddlState" runat="server" CssClass="dropdownflat" TabIndex="7">
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
                                    <td bgcolor="#F0F0F0"><font face="Arial, Helvetica, sans-serif" size="-1">Zip</font></td>
                                    <td bgcolor="#F0F0F0">
                                        <asp:TextBox ID="txtZip" runat="server" Columns="15" TabIndex="8" CssClass="textbox" MaxLength="15"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqZip" ControlToValidate="txtZip" Text="Required" ForeColor="Red" runat="server" Display="Dynamic" />
                                    </td>
                                </tr>
                                <tr> 
                                    <td bgcolor="#E0E0E0"><font face="Arial, Helvetica, sans-serif" size="-1">Daytime Phone Number</font></td>
                                    <td bgcolor="#E0E0E0"><asp:TextBox ID="txtDayTimePhone" runat="server" Columns="15" TabIndex="9" CssClass="textbox" MaxLength="15"></asp:TextBox> <font face="Arial, Helvetica, sans-serif" size="-1">nnn-nnn-nnnn</font></td>
                                </tr>
                                <tr> 
                                    <td bgcolor="#F0F0F0"><font face="Arial, Helvetica, sans-serif" size="-1">Evening Phone Number</font></td>
                                    <td bgcolor="#F0F0F0"><asp:TextBox ID="txtEveningPhone" runat="server" Columns="15" TabIndex="10" CssClass="textbox" MaxLength="15"></asp:TextBox> <font face="Arial, Helvetica, sans-serif" size="-1">nnn-nnn-nnnn</font></td>
                                </tr>
                                <tr> 
                                    <td bgcolor="#E0E0E0"><font face="Arial, Helvetica, sans-serif" size="-1">Fax Number</font></td>
                                    <td bgcolor="#E0E0E0"><asp:TextBox ID="txtFax" runat="server" Columns="15" TabIndex="11" CssClass="textbox" MaxLength="15"></asp:TextBox> <font face="Arial, Helvetica, sans-serif" size="-1">nnn-nnn-nnnn</font></td>
                                </tr>
                                <tr> 
                                    <td bgcolor="#F0F0F0"><font face="Arial, Helvetica, sans-serif" size="-1">Email Address</font></td>
                                    <td bgcolor="#F0F0F0">
                                        <asp:TextBox ID="txtEmail" runat="server" Columns="40" TabIndex="12" CssClass="textbox" MaxLength="80"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqEmail" ControlToValidate="txtEmail" Text="Required" ForeColor="Red" runat="server" Display="Dynamic" />
                                    </td>
                                </tr>
                                <tr> 
                                    <td bgcolor="#F0F0F0"><font face="Arial, Helvetica, sans-serif" size="-1">Presentation</font></td>
                                    <td bgcolor="#F0F0F0">
                                        <asp:RadioButtonList ID="rblPresentation" runat="server" RepeatDirection="Vertical" CssClass="radiobuttonlist" TabIndex="16">
                                            <asp:ListItem Value="Download" Text="Download" Selected="True"></asp:ListItem>
                                            <asp:ListItem Value="Email" Text="Email"></asp:ListItem>
                                        </asp:RadioButtonList> 
                                    </td>
                                </tr>
                                <tr> 
                                    <td bgcolor="#F0F0F0"><p>&nbsp;</p>
                                      <p><strong><font face="Arial, Helvetica, sans-serif" size="-1">Would you like a <em>free</em> Retirement Plan Design Analysis?  </font></strong></p>
                                      <p>&nbsp;</p>
                                    </td>
                                    <td bgcolor="#F0F0F0"><p>&nbsp;</p>
                                      <p><strong><font face="Arial, Helvetica, sans-serif" size="-1">Complete the optional infomation</font></strong> <strong><font face="Arial, Helvetica, sans-serif" size="-1">below </font></strong></p>
                                      <p>&nbsp;</p>
                                    </td>
                                </tr>
                                <tr> 
                                    <td bgcolor="#E0E0E0"><font face="Arial, Helvetica, sans-serif" size="-1">Occupation</font></td>
                                    <td bgcolor="#E0E0E0"><asp:TextBox ID="txtOccupation" runat="server" Columns="30" TabIndex="13" CssClass="textbox" MaxLength="30"></asp:TextBox></td>
                                </tr>
                                <tr> 
                                    <td bgcolor="#F0F0F0"><font face="Arial, Helvetica, sans-serif" size="-1">Date of Birth</font></td>
                                    <td bgcolor="#F0F0F0"><asp:TextBox ID="txtDateOfBirth" runat="server" Columns="30" TabIndex="14" CssClass="textbox" MaxLength="30"></asp:TextBox>
                                     <font face="Arial, Helvetica, sans-serif" size="-1">eg 12/5/85 </font></td>
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td bgcolor="#E0E0E0"><font face="Arial, Helvetica, sans-serif" size="-1">Annual Earnings</font></td>
                                    <td bgcolor="#E0E0E0"><font size="-1" face="Arial, Helvetica, sans-serif">$</font>
                                        <asp:TextBox ID="txtAnnualEarnings" runat="server" Columns="12" TabIndex="15" CssClass="textbox" MaxLength="12" Text="0"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td colspan="2" bgcolor="#F0F0F0">
                                        <table border="0" width="100%">
                                            <tr>
                                                <td><font face="Arial, Helvetica, sans-serif" size="-1">Do you currently participate in or maintain a retirement plan? </font></td>
                                                <td style="width:33%" align="left">
                                                    <asp:RadioButtonList ID="rblPlan" runat="server" RepeatDirection="Horizontal" CssClass="radiobuttonlist" TabIndex="16">
                                                        <asp:ListItem Value="Yes" Text="YES"></asp:ListItem>
                                                        <asp:ListItem Value="No" Text="NO" Selected="True"></asp:ListItem>
                                                    </asp:RadioButtonList>                                    
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr> 
                                    <td bgcolor="#E0E0E0"><font face="Arial, Helvetica, sans-serif" size="-1">If yes, identify the type(s) of Plan(s) and their estimated level of assets.</font></td>
                                    <td bgcolor="#E0E0E0"><asp:TextBox ID="txtCurrentPlans" runat="server" TabIndex="17" CssClass="textbox" Rows="3" Columns="42" TextMode="MultiLine"></asp:TextBox></td>
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td bgcolor="#F0F0F0"><font face="Arial, Helvetica, sans-serif" size="-1">Current Contribution Per Year</font></td>
                                    <td bgcolor="#F0F0F0"><font size="-1" face="Arial, Helvetica, sans-serif">$</font>
                                        <asp:TextBox ID="txtContribute" runat="server" Columns="12" TabIndex="18" CssClass="textbox" MaxLength="12"  Text="0"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr bgcolor="#E0E0E0"> 
                                    <td colspan="2" bgcolor="#E0E0E0"><font face="Arial, Helvetica, sans-serif" size="-1">How many individuals are employed by your business? </font>
                                        <asp:TextBox ID="txtEmployees" runat="server" Columns="4" TabIndex="19" CssClass="textbox" MaxLength="4"  Text="0"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td colspan="2" bgcolor="#F0F0F0"><font face="Arial, Helvetica, sans-serif" size="-1">What is the name of your business? </font>
                                        <asp:TextBox ID="txtBusiness" runat="server" Columns="30" TabIndex="20" CssClass="textbox" MaxLength="50"></asp:TextBox> 
                                    </td>
                                </tr>
                                <tr bgcolor="#E0E0E0"> 
                                    <td colspan="2" bgcolor="#E0E0E0"><font face="Arial, Helvetica, sans-serif" size="-1">How is it structured? </font>
                                        <asp:DropDownList ID="ddlBusinessType" runat="server" CssClass="dropdownflat" TabIndex="21">
                                            <asp:ListItem Value="Sole Proprietorship" Text="Sole Proprietorship" Selected="True"></asp:ListItem>
                                            <asp:ListItem Value="Corporation" Text="Corporation"></asp:ListItem>
                                            <asp:ListItem Value="Limited Liability Corporation" Text="Limited Liability Corporation"></asp:ListItem>
                                            <asp:ListItem Value="Partnership" Text="Partnership"></asp:ListItem>
                                            <asp:ListItem Value="Non-Profit Organization" Text="Non-Profit Organization"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td colspan="2" bgcolor="#F0F0F0">
                                        <table border="0" width="100%">
                                            <tr>
                                                <td><font size="-1" face="Arial, Helvetica, sans-serif">My spouse is employed by me. </font></td>
                                                <td style="width:65%">
                                                    <asp:RadioButtonList ID="rblSpouseEmployee" runat="server" RepeatDirection="Horizontal" CssClass="radiobuttonlist" TabIndex="22">
                                                        <asp:ListItem Value="Yes" Text="YES"></asp:ListItem>
                                                        <asp:ListItem Value="No" Text="NO" Selected="True"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td colspan="2" bgcolor="#E0E0E0"><font size="-1" face="Arial, Helvetica, sans-serif">My spouse is employed at </font>
                                        <asp:TextBox ID="txtSpouseCompany" runat="server" Columns="30" TabIndex="23" CssClass="textbox" MaxLength="50"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td colspan="2" bgcolor="#F0F0F0">
                                        <table border="0" width="100%">
                                            <tr>
                                                <td><font size="-1" face="Arial, Helvetica, sans-serif">My spouse participates in a plan at work. </font></td>
                                                <td style="width:55%">
                                                    <asp:RadioButtonList ID="rblSpouseHasPlan" runat="server" RepeatDirection="Horizontal" CssClass="radiobuttonlist" TabIndex="24">
                                                        <asp:ListItem Value="Yes" Text="YES"></asp:ListItem>
                                                        <asp:ListItem Value="No" Text="NO" Selected="True"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                        </table>                            
                                    </td>
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td colspan="2" bgcolor="#E0E0E0"><font size="-1" face="Arial, Helvetica, sans-serif">My spouse's type of plan is </font>
                                        <asp:TextBox ID="txtSpousePlanType" runat="server" Columns="30" TabIndex="25" CssClass="textbox" MaxLength="50"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td colspan="2" bgcolor="#F0F0F0"><font face="Arial, Helvetica, sans-serif" size="-1">Please enter a rating of 1-5 for each item below based on the following scale<br>
                                        1=Strongly Disagree 2=Mildly Disagree 3=Neutral 4=Somewhat Agree 5=Strongly Agree</font>
                                    </td>
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td bgcolor="#E0E0E0"><font face="Arial, Helvetica, sans-serif" size="-1">I want to maximize retirement benefits for owners/key employees.</font></td>
                                    <td bgcolor="#E0E0E0">
                                        <table border="0" width="100%">
                                            <tr>
                                                <td style="width:15px"><font face="Arial, Helvetica, sans-serif" size="-1">- &nbsp;</font></td>
                                                <td style="width:175px">
                                                    <asp:RadioButtonList ID="rblRating1" runat="server" RepeatDirection="Horizontal" CssClass="radiobuttonlist" TabIndex="26">
                                                        <asp:ListItem Value="Strongly Disagree" Text="1"></asp:ListItem>
                                                        <asp:ListItem Value="Mildly Disagree" Text="2"></asp:ListItem>
                                                        <asp:ListItem Value="Neutral" Text="3" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="Somewhat Agree" Text="4"></asp:ListItem>
                                                        <asp:ListItem Value="Strongly Agree" Text="5"></asp:ListItem>
                                                    </asp:RadioButtonList>                                    
                                                </td>
                                                <td><font face="Arial, Helvetica, sans-serif" size="-1">&nbsp;+ </font></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td bgcolor="#F0F0F0"><font face="Arial, Helvetica, sans-serif" size="-1">I want to maximize my tax deduction.</font></td>
                                    <td bgcolor="#E0E0E0">
                                        <table border="0" width="100%">
                                            <tr>
                                                <td style="width:15px"><font face="Arial, Helvetica, sans-serif" size="-1">- &nbsp;</font></td>
                                                <td style="width:175px">
                                                    <asp:RadioButtonList ID="rblRating2" runat="server" RepeatDirection="Horizontal" CssClass="radiobuttonlist" TabIndex="27">
                                                        <asp:ListItem Value="Strongly Disagree" Text="1"></asp:ListItem>
                                                        <asp:ListItem Value="Mildly Disagree" Text="2"></asp:ListItem>
                                                        <asp:ListItem Value="Neutral" Text="3" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="Somewhat Agree" Text="4"></asp:ListItem>
                                                        <asp:ListItem Value="Strongly Agree" Text="5"></asp:ListItem>
                                                    </asp:RadioButtonList>                                    
                                                </td>
                                                <td><font face="Arial, Helvetica, sans-serif" size="-1">&nbsp;+ </font></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td bgcolor="#E0E0E0"><font face="Arial, Helvetica, sans-serif" size="-1">I want to allow employees to save for their retirement.</font></td>
                                    <td bgcolor="#E0E0E0">
                                        <table border="0" width="100%">
                                            <tr>
                                                <td style="width:15px"><font face="Arial, Helvetica, sans-serif" size="-1">- &nbsp;</font></td>
                                                <td style="width:175px">
                                                    <asp:RadioButtonList ID="rblRating3" runat="server" RepeatDirection="Horizontal" CssClass="radiobuttonlist" TabIndex="28">
                                                        <asp:ListItem Value="Strongly Disagree" Text="1"></asp:ListItem>
                                                        <asp:ListItem Value="Mildly Disagree" Text="2"></asp:ListItem>
                                                        <asp:ListItem Value="Neutral" Text="3" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="Somewhat Agree" Text="4"></asp:ListItem>
                                                        <asp:ListItem Value="Strongly Agree" Text="5"></asp:ListItem>
                                                    </asp:RadioButtonList>                                   
                                                </td>
                                                <td><font face="Arial, Helvetica, sans-serif" size="-1">&nbsp;+ </font></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td bgcolor="#F0F0F0"><font face="Arial, Helvetica, sans-serif" size="-1">I would offer a matching employer contribution to help employees save for their retirement.</font></td>
                                    <td bgcolor="#E0E0E0">
                                        <table border="0" width="100%">
                                            <tr>
                                                <td style="width:15px"><font face="Arial, Helvetica, sans-serif" size="-1">- &nbsp;</font></td>
                                                <td style="width:175px">
                                                    <asp:RadioButtonList ID="rblRating4" runat="server" RepeatDirection="Horizontal" CssClass="radiobuttonlist" TabIndex="29">
                                                        <asp:ListItem Value="Strongly Disagree" Text="1"></asp:ListItem>
                                                        <asp:ListItem Value="Mildly Disagree" Text="2"></asp:ListItem>
                                                        <asp:ListItem Value="Neutral" Text="3" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="Somewhat Agree" Text="4"></asp:ListItem>
                                                        <asp:ListItem Value="Strongly Agree" Text="5"></asp:ListItem>
                                                    </asp:RadioButtonList>                                   
                                                </td>
                                                <td><font face="Arial, Helvetica, sans-serif" size="-1">&nbsp;+ </font></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td bgcolor="#E0E0E0"><font face="Arial, Helvetica, sans-serif" size="-1">Employees generally have long service with our organization.</font></td>
                                     <td bgcolor="#E0E0E0">
                                        <table border="0" width="100%">
                                            <tr>
                                                <td style="width:15px"><font face="Arial, Helvetica, sans-serif" size="-1">- &nbsp;</font></td>
                                                <td style="width:175px">
                                                    <asp:RadioButtonList ID="rblRating5" runat="server" RepeatDirection="Horizontal" CssClass="radiobuttonlist" TabIndex="30">
                                                        <asp:ListItem Value="Strongly Disagree" Text="1"></asp:ListItem>
                                                        <asp:ListItem Value="Mildly Disagree" Text="2"></asp:ListItem>
                                                        <asp:ListItem Value="Neutral" Text="3" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="Somewhat Agree" Text="4"></asp:ListItem>
                                                        <asp:ListItem Value="Strongly Agree" Text="5"></asp:ListItem>
                                                    </asp:RadioButtonList>                                   
                                                </td>
                                                <td><font face="Arial, Helvetica, sans-serif" size="-1">&nbsp;+ </font></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td bgcolor="#F0F0F0"><font face="Arial, Helvetica, sans-serif" size="-1">I can generally produce better investment results than a professional advisor.</font></td>
                                    <td bgcolor="#E0E0E0">
                                        <table border="0" width="100%">
                                            <tr>
                                                <td style="width:15px"><font face="Arial, Helvetica, sans-serif" size="-1">- &nbsp;</font></td>
                                                <td style="width:175px">
                                                    <asp:RadioButtonList ID="rblRating6" runat="server" RepeatDirection="Horizontal" CssClass="radiobuttonlist" TabIndex="31">
                                                        <asp:ListItem Value="Strongly Disagree" Text="1"></asp:ListItem>
                                                        <asp:ListItem Value="Mildly Disagree" Text="2"></asp:ListItem>
                                                        <asp:ListItem Value="Neutral" Text="3" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="Somewhat Agree" Text="4"></asp:ListItem>
                                                        <asp:ListItem Value="Strongly Agree" Text="5"></asp:ListItem>
                                                    </asp:RadioButtonList>                                   
                                                </td>
                                                <td><font face="Arial, Helvetica, sans-serif" size="-1">&nbsp;+ </font></td>
                                            </tr>
                                        </table> 
                                    </td>
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td bgcolor="#E0E0E0"><font face="Arial, Helvetica, sans-serif" size="-1">I need a better understanding of what I will have to live on at retirement.</font></td>
                                    <td bgcolor="#E0E0E0">
                                        <table border="0" width="100%">
                                            <tr>
                                                <td style="width:15px"><font face="Arial, Helvetica, sans-serif" size="-1">- &nbsp;</font></td>
                                                <td style="width:175px">
                                                    <asp:RadioButtonList ID="rblRating7" runat="server" RepeatDirection="Horizontal" CssClass="radiobuttonlist" TabIndex="32">
                                                        <asp:ListItem Value="Strongly Disagree" Text="1"></asp:ListItem>
                                                        <asp:ListItem Value="Mildly Disagree" Text="2"></asp:ListItem>
                                                        <asp:ListItem Value="Neutral" Text="3" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="Somewhat Agree" Text="4"></asp:ListItem>
                                                        <asp:ListItem Value="Strongly Agree" Text="5"></asp:ListItem>
                                                    </asp:RadioButtonList>                                   
                                                </td>
                                                <td><font face="Arial, Helvetica, sans-serif" size="-1">&nbsp;+ </font></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td bgcolor="#F0F0F0"><font face="Arial, Helvetica, sans-serif" size="-1">If I could, I would like to deduct from my taxes:</font></td>                   
                                    <td bgcolor="#E0E0E0" style="width:250px;">
                                        <asp:RadioButtonList ID="rblTaxes" runat="server" RepeatDirection="Horizontal" CssClass="radiobuttonlist" TabIndex="33">
                                            <asp:ListItem Value="10K" Text="$10,000"  Selected="True"></asp:ListItem>
                                            <asp:ListItem Value="30K" Text="$30,000"></asp:ListItem>
                                            <asp:ListItem Value="OVER30K" Text="over $30,000"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>                    
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td bgcolor="#E0E0E0"><font size="-1" face="Arial, Helvetica, sans-serif">I would like to retire in:</font></td>
                                    <td bgcolor="#E0E0E0">
                                        <asp:RadioButtonList ID="rblRetire" runat="server" RepeatDirection="Horizontal" CssClass="radiobuttonlist" TabIndex="34">
                                            <asp:ListItem Value="10 YEARS" Text="10Yrs."></asp:ListItem>
                                            <asp:ListItem Value="20 YEARS" Text="20Yrs."  Selected="True"></asp:ListItem>
                                            <asp:ListItem Value="Age 65" Text="Age 65"></asp:ListItem>
                                            <asp:ListItem Value="AGE OTHER" Text="Age"></asp:ListItem>
                                        </asp:RadioButtonList>&nbsp;
                                        <asp:TextBox ID="txtRetirementAge" runat="server" Columns="4" TabIndex="35" CssClass="textbox" MaxLength="4"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td bgcolor="#F0F0F0"><font size="-1" face="Arial, Helvetica, sans-serif">The best time to phone me for the initial consultation is:</font></td>
                                    <td bgcolor="#F0F0F0"><asp:TextBox ID="txtTime1" runat="server" Columns="20" TabIndex="36" CssClass="textbox" MaxLength="40"></asp:TextBox></td>
                                </tr>
                                <tr bgcolor="#F0F0F0"> 
                                    <td bgcolor="#E0E0E0"><font size="-1" face="Arial, Helvetica, sans-serif">An alternate time to phone me for the initial consultation is:</font></td>
                                    <td bgcolor="#E0E0E0"><asp:TextBox ID="txtTime2" runat="server" Columns="20" TabIndex="37" CssClass="textbox" MaxLength="40"></asp:TextBox></td>
                                </tr>
                                <tr >
                                    <td bgcolor="#F0F0F0"><asp:Image ID="imgCaptcha" runat="server" Width="200px" /></td>
                                    <td bgcolor="#F0F0F0"><asp:TextBox ID="txtCAPTCHA" runat="server" Columns="20" TabIndex="39" CssClass="textbox" MaxLength="40" Text="Enter Security Word"></asp:TextBox></td>
                                </tr>
                                <tr align="center"> 
                                    <td colspan="2" bgcolor="#E0E0E0"><asp:Button ID="btnGo" Text="Go" TabIndex="40" 
                                            Width="50px" runat="server" CssClass="buttonFlat" onclick="btnGo_Click" />
                                    </td>
                                </tr>
                                <tr align="center"> 
                                    <td colspan="2" bgcolor="#E0E0E0">
                                        <asp:ValidationSummary ID="valSummary" runat="server" EnableClientScript="true" />
                                    </td>
                                </tr>
                                <tr align="center"> 
                                    <td colspan="2" bgcolor="#E0E0E0">
                                        <asp:Label ID="lblMsg" runat="server" />
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

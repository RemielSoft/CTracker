<%@ Page Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="Step_1_4.aspx.cs" Inherits="RetirementFunds.Participant.Step_1_4" %>
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
                            <span class="headers">Contribution Election and Beneficiary Designation Form</span>
                            <br />
                            <P><p class="texth2">Contribution Elections</P>

                            <P><span class="text1">In order to complete your enrollment, please provide the
                            information below so we can set up your accounts.</span></P>

                            <form action="/nertapp/script/enrollconfirm.cfm" method="post">
                            <table border="1" cellpadding="10" width="550">
                              <tr>
                                <td width="22%" bgcolor="#CCCCCC"><font color="Red">*</font><span class="txt1bold">Employee Name</span></td>
                                <td width="78%" bgcolor="#CCCCCC">&nbsp;<span class="text1">
                            	<asp:Label ID="lblName" runat="server" /></span></td>
                              </tr>
                              <tr>
                                <td width="22%"><font color="Red">*</font><span class="txt1bold">Address
                                  1</span></td>
                                <td width="78%">
                                    <asp:TextBox ID="txtAddr1" CssClass="text1" runat="server" />
                                    <asp:RequiredFieldValidator ID="reqAddr1" ControlToValidate="txtAddr1" Text="*" ForeColor="Red" runat="server" />
                                </td>
                              </tr>
                              <tr>
                                <td width="22%"><span class="txt1bold">Address 2</span></td>
                                <td width="78%"><asp:TextBox ID="txtAddr2" CssClass="text1" runat="server" /></td>
                              </tr>
                              <tr>
                                <td width="22%"><font color="Red">*</font><span class="txt1bold">City/State/Zip</span></td>
                                <td width="78%">
                                    <asp:TextBox ID="txtCity" CssClass="text1" runat="server" Columns="30" />,
                                    <asp:TextBox ID="txtState" CssClass="text1" runat="server" Columns="4" />
                                    <asp:TextBox ID="txtZip" CssClass="text1" runat="server" Columns="15" />
                                    <asp:RequiredFieldValidator ID="reqCity" ControlToValidate="txtCity" Text="*" ForeColor="Red" runat="server" />
                                    <asp:RequiredFieldValidator ID="reqState" ControlToValidate="txtState" Text="*" ForeColor="Red" runat="server" />
                                    <asp:RequiredFieldValidator ID="reqZip" ControlToValidate="txtZip" Text="*" ForeColor="Red" runat="server" />
                                </td>
                              </tr>
                              <tr>
                                <td width="22%" bgcolor="#CCCCCC"><font color="Red">*</font><span class="txt1bold">Birth Date</span></td>
                                <td width="78%" bgcolor="#CCCCCC">
                                    <asp:TextBox ID="txtBirthDate" CssClass="text1" runat="server" Columns="12" />    
                                    <asp:RequiredFieldValidator ID="reqBirthDate" ControlToValidate="txtBirthDate" Text="*" ForeColor="Red" runat="server" />                             
                                </td>
                              </tr>
                              <tr>
                                <td width="22%"><font color="Red">*</font><span class="txt1bold">Hire Date</span></td>
                                <td width="78%">
                                    <asp:TextBox ID="txtHireDate" CssClass="text1" runat="server" Columns="12" /> 
                                    <asp:RequiredFieldValidator ID="reqHireDate" ControlToValidate="txtHireDate" Text="*" ForeColor="Red" runat="server" />
                                </td>
                              </tr>
                              <tr>
                                <td width="22%"><span class="txt1bold">Plan Name</span></td>
                                
                                <td width="78%"><asp:Label ID="lblPlanName" runat="server" CssClass="text1" /></td>
                              </tr>
                            </table>

                            <span class="text1">

                            <p><span class="text1"><b>Upon becoming eligible to join the plan, I understand that contributions may be made on my behalf under the
                            plan.  I hereby elect one of the following choices:</b></span></p>
                            <table border="1" width="550" cellpadding="10">
                              <tr>
                                <td width="15%" align="center"><asp:RadioButton ID="rb401KAccept" GroupName="401K" Checked="true" runat="server" /></td>
                                <td width="85%"><span class="text1"><b>For 401(k), Profit Sharing, Target Benefit or Money Purchase
                                  Plans:</b>&nbsp; I wish to enroll in my employer's retirement plan as
                                  listed above.&nbsp; I understand my employer may make contributions to an
                                  account on my behalf based on the investment elections I have chosen.</span></td>
                              </tr>
                              <tr>
                                <td width="15%" align="center">
                            <span class="text1">
                                <asp:RadioButton ID="rb401KDecline" GroupName="401K" runat="server" />
                            </td>
                                <td width="85%"><span class="text1">I decline to participate at this time.&nbsp;
                                  I understand that if I decline, I may have to wait until the plan's next entry date.</span></td>
                              </tr>
                             
                             </table>
                             <BR>
                             <span class="text1"><b>If you elected to participate in your employer's 401(k) or SIMPLE plan, you may enter either a dollar amount
                             or percentage of pay you would like to contribute, but not both.</b></p></span>
                             <BR>
                             <table border="1" width="550" cellpadding="10">
                              <tr>
                                <td width="15%" valign="middle" align="center">
                                    <asp:DropDownList ID="ddl401KPercent" runat="server" CssClass="text1">
                                        <asp:ListItem>00</asp:ListItem>
                                        <asp:ListItem>01</asp:ListItem>
                                        <asp:ListItem>02</asp:ListItem>
                                        <asp:ListItem>03</asp:ListItem>
                                        <asp:ListItem>04</asp:ListItem>
                                        <asp:ListItem>05</asp:ListItem>
                                        <asp:ListItem>06</asp:ListItem>
                                        <asp:ListItem>07</asp:ListItem>
                                        <asp:ListItem>08</asp:ListItem>
                                        <asp:ListItem>09</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                        <asp:ListItem>13</asp:ListItem>
                                        <asp:ListItem>14</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        <asp:ListItem>16</asp:ListItem>
                                        <asp:ListItem>17</asp:ListItem>
                                        <asp:ListItem>18</asp:ListItem>
                                        <asp:ListItem>19</asp:ListItem>
                                        <asp:ListItem>20</asp:ListItem>
                                        <asp:ListItem>21</asp:ListItem>
                                        <asp:ListItem>22</asp:ListItem>
                                        <asp:ListItem>23</asp:ListItem>
                                        <asp:ListItem>24</asp:ListItem>
                                        <asp:ListItem>25</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td width="85%"><span class="text1"><b>For 401(k) & SIMPLE participants:</b>&nbsp; I wish to enroll in my employer's plan.&nbsp; 
	                            I authorize the following percentage of my compensation to be deducted from my pay, up to
	                            the limit allowed by law. &nbsp;&nbsp;
	                            I understand that my contributions may be further subject to limits established by the IRS 
	                            and that I will be contacted if that is the case.</span></td>
                              </tr>
                              <tr>
                                <td width="15%">
                                <asp:TextBox ID="txt401Amount" runat="server" Columns="10" CssClass="text1" />
	                            <span class="text1">(enter $ amt., maximum $11,000)</span></td>
                                <td width="85%"><span class="text1"><b>For 401(k) & SIMPLE participants:&nbsp;</b> I wish
                                  to enroll in my employer's plan.&nbsp; I authorize the following dollar amount to be
                                  deducted from my <b>annual</b> pay.&nbsp; I understand that my
                                  contributions may be further subject to limits established by the IRS and
                                  that I will be contacted if that is the case.</span></td>
                              </tr>
                              
                            </table>
                              <p class="texth2">Please designate your beneficiary and relationship in the
                            fields below.&nbsp;&nbsp;</p>
                            <span class="text1"><p>If you are married, your account balance will automatically be paid to your
	                            spouse, unless your spouse signs a notarized waiver consenting to a different
	                            beneficiary. If you are not married and you do not designate a beneficiary, your
	                            account value will be paid to your estate. If you marry after making this
	                            designation, your spouse automatically becomes the beneficiary and your prior beneficiary
	                            designation is revoked.</p></span>

                            <b><p><span class="text1">I hereby designate as
                            primary beneficiary(ies) the person(s) named below to receive
                            my accrued benefits payable from my employer’s retirement plan by reason of my
                            death. This designation supersedes any other election I may have made previously
                            regarding these retirement benefits.</p>
                            </b>
                            <table border="1" cellpadding="10" width="550">
                              <tr>
                                <td width="38%" bgcolor="#CCCCCC"><font color="Red">*</font><span class="txt1bold">Primary
                                  Beneficiary Name</span></td>
                                <td width="62%" bgcolor="#CCCCCC">
                                    <asp:TextBox ID="txtBenName1" runat="server" CssClass="text1" Columns="40" />
                                    <asp:RequiredFieldValidator ID="reqBenName1" ControlToValidate="txtBenName1" Text="*" ForeColor="Red" runat="server" />
                                </td>
                              </tr>
                              <tr>
                                <td width="38%"><span class="txt1bold">Beneficiary
                                  Address</span></td>
                                <td width="62%">
                                    <asp:TextBox ID="txtBenAddr1" runat="server" CssClass="text1" Columns="40" />
                                </td>
                              </tr>
                              <tr>
                                <td width="31%"><span class="txt1bold">City/State/Zip</span></td>
                                <td width="69%">
                                    <asp:TextBox ID="txtBenCity1" runat="server" CssClass="text1" />
                                    <asp:DropDownList ID="ddlBenState1" runat="server" CssClass="text1">
                                        <asp:ListItem Value=""></asp:ListItem>
                                        <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                        <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                        <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                        <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                                        <asp:ListItem Value="CA">California</asp:ListItem>
                                        <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                        <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                        <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                        <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                                        <asp:ListItem Value="FL">Florida</asp:ListItem>
                                        <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                        <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                        <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                        <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                        <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                        <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                        <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                        <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                        <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                        <asp:ListItem Value="ME">Maine</asp:ListItem>
                                        <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                        <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                        <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                        <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                                        <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                        <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                        <asp:ListItem Value="MT">Montana</asp:ListItem>
                                        <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                                        <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                        <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                        <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                        <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                        <asp:ListItem Value="NY">New York</asp:ListItem>
                                        <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                        <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                        <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                        <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                        <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                        <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                        <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                        <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                        <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                        <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                        <asp:ListItem Value="TX">Texas</asp:ListItem>
                                        <asp:ListItem Value="UT">Utah</asp:ListItem>
                                        <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                        <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                        <asp:ListItem Value="WA">Washington</asp:ListItem>
                                        <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                        <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                        <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="txtBenZip1" Columns="5" runat="server" />
                                </td>
                              </tr>
                              <tr>
                                <td width="38%"><font color="Red">*</font><span class="txt1bold">Relationship&nbsp;</span></td>
                                <td width="62%">
                                    <asp:TextBox ID="txtBenRelation1" runat="server" CssClass="text1" Columns="40" />
                                    <asp:RequiredFieldValidator ID="reqBenRelation1" ControlToValidate="txtBenRelation1" Text="*" ForeColor="Red" runat="server" />
                                </td>
                              </tr>
                              <tr>
                                <td width="38%"><font color="Red">*</font><span class="txt1bold">% of
                                  Benefit&nbsp;</span></td>

                                <td width="62%">
                                    <asp:TextBox ID="txtBenPercent1" runat="server" CssClass="text1" Columns="3" />
                                    <asp:RequiredFieldValidator ID="reqBenPercent1" ControlToValidate="txtBenPercent1" Text="*" ForeColor="Red" runat="server" />
                                </td>
                                </tr>
                              </table>
                            <b>
                            </b>
                            <table border="1" cellpadding="10" width="550">
                              <tr>
                                <td width="36%" bgcolor="#CCCCCC"><span class="txt1bold">Primary
                                  Beneficiary Name</span></td>
                                <td width="64%" bgcolor="#CCCCCC">
                                <asp:TextBox ID="txtBenName2" runat="server" CssClass="text1" Columns="40" /></td>
                              </tr>
                              <tr>
                                <td width="36%"><span class="txt1bold">Beneficiary Address</span></td>
                                <td width="64%"><asp:TextBox ID="txtBenAddr2" runat="server" CssClass="text1" Columns="40" /></td>
                              </tr>
                              <tr>
                                <td width="36%"><span class="txt1bold">City/State/Zip</font></td>
                                <td width="64%"><asp:TextBox ID="txtBenCity2" runat="server" CssClass="text1" />
                                    <asp:DropDownList ID="ddlBenState2" runat="server" CssClass="text1">
                                        <asp:ListItem Value=""></asp:ListItem>
                                        <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                        <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                        <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                        <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                                        <asp:ListItem Value="CA">California</asp:ListItem>
                                        <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                        <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                        <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                        <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                                        <asp:ListItem Value="FL">Florida</asp:ListItem>
                                        <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                        <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                        <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                        <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                        <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                        <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                        <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                        <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                        <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                        <asp:ListItem Value="ME">Maine</asp:ListItem>
                                        <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                        <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                        <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                        <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                                        <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                        <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                        <asp:ListItem Value="MT">Montana</asp:ListItem>
                                        <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                                        <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                        <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                        <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                        <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                        <asp:ListItem Value="NY">New York</asp:ListItem>
                                        <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                        <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                        <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                        <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                        <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                        <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                        <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                        <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                        <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                        <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                        <asp:ListItem Value="TX">Texas</asp:ListItem>
                                        <asp:ListItem Value="UT">Utah</asp:ListItem>
                                        <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                        <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                        <asp:ListItem Value="WA">Washington</asp:ListItem>
                                        <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                        <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                        <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="txtBenZip2" Columns="5" runat="server" /></td>
                              </tr>
                              <tr>
                                <td width="31%"><span class="txt1bold">Relationship&nbsp;</span></td>
                            <span class="text1">

                            <td width="69%">
                                <asp:TextBox ID="txtBenRelation2" runat="server" CssClass="text1" Columns="40" />
                            </td>
                                </tr>
                              <tr>
                                <td width="31%"><span class="txt1bold">% of Benefit&nbsp;</span></td>
                            <span class="text1">

                            <td width="69%"><asp:TextBox ID="txtBenPercent2" runat="server" CssClass="text1" Columns="3" /></td>
                                </tr>
                              </table>
                              
                              <BR><font color="Red"><font face="Arial, Helvetica, sans-serif" size="-1">* Required Field</font><BR><BR>
                                <p><span class="text1"><b>If my beneficiary(ies) designated above does(do) not survive me, I hereby designate
                            the following as my contingent beneficiary:</b></p>
                            <table border="1" cellpadding="10" width="550">
                              <tr>
                                <td width="34%" bgcolor="#CCCCCC"><span class="txt1bold">Contingent
                                  Beneficiary Name</span></td>
                                <td width="66%" bgcolor="#CCCCCC"><span class="text1">
	                            <asp:TextBox ID="txtBenName3" runat="server" CssClass="text1" Columns="40" /></font></td>
                              </tr>
                              <tr>
                                <td width="34%"><span class="txt1bold">Relationship&nbsp;</span></td>


                            <td width="66%">
                                <asp:TextBox ID="txtBenRelation3" runat="server" CssClass="text1" Columns="40" />
                            </td>
                                </tr>
                              </table>
                                </span>
	                            <BR>
                            <table border="0" width="550">
                            <tr><td align="center">
                                <p align="center"></p>
                                <asp:Button ID="btnConfirm" Text="Confirm My Elections" runat="server" />
                            </td></tr></table>  
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

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="Sponsor.aspx.cs" Inherits="RetirementFunds.Sponsor.Sponsor" %>
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
                    <td class="text1">
                        <br />
                        <div id="divPlanInformation" runat="server" visible="false" style="text-align:right">
                            <font class="planHeader">Current User: <asp:Label ID="lblUserHeader" runat="server" /></font><br />
                            <font class="planHeader">Current Plan: <asp:Label ID="lblPlaneNameHeader" runat="server" /></font>
                        </div>                        
                        <br /><br />                        
                        You have successfully logged into your retirement plan through the National Employers Retirement Trust. 
                        You may now enroll in your plan, learn more about your investment options, print out a current benefit statement, calculate how much you'll need to retire, or get forms to change your elections, beneficiaries,  or add employees. 
                        Please select your plan below, and then just click on one of the options at the top of the page to get started. 
                        <!-- This is the primary content area  -->
                        <!-- Commented out
                        <br />
                        <div style="width:98%; padding: 20px 16px 12px 8px;">
                            <span class="headers">for the plan sponsor</span>
                            <br />
                            <br />
                            <table width="50%" border="0" cellspacing="2" cellpadding="6">
                                <tr align="left"> 
                                    <td width="49%" align="right" valign="top"> 
                                        <span class="text1">
                                        Whether your goal is directing a larger slice of the pension pie 
                                        to owners and key executives, or responding to employee requests for 
                                        a retirement plan, we can tailor</span> 
                                    </td>
                                    <td width="2%" align="center" valign="middle"><img id="Img2" height="75" src="~/images/sepa.gif" width="1" alt="" runat="server" /></td>
                                    <td width="49%" valign="top"> 
                                        <p><span class="text1">a plan that will meet 
                                        your needs and cost constraints. If you have an existing plan, we 
                                        can show you how to better design it to meet your needs.</span></p>
                                    </td>
                                </tr>
                            </table>
                            <table width="50%" border="0" cellpadding="4">
                                <tr> 
                                    <td colspan="2" align="center"> 
                                        <p class="textquote">It's an Opportunity to Reward Employees and Structure a Sound Financial Future.</p>
                                    </td>
                                </tr>
                                <tr> 
                                    <td valign="top" width="49%"> 
                                        <p class="texth2">Flexible Plan Design </p>
                                        <p class="text1">We offer the following types of plan designs: </p>
                                        <p class="texth3">Defined Contribution Plans: </p>
                                        <ul>
                                            <li>Keogh Corporate</li>                 
                                            <li>401(k) with or without employer match </li>
                                            <li>Profit Sharing</li> 
                                            <li>Money Purchase Pension</li> 
                                            <li>Target Benefit</li> 
                                            <li>Age-Weighted</li> 
                                            <li>Keogh</li> 
                                            <li>IRA</li> 
                                            <li>Non-Qualified Deferred Compensation</li>
                                        </ul>
                                        <p class="texth2">Rewarding Your Employees </p>
                                        <p class="text2">Establishing a plan can enhance employee loyalty 
                                        and can be designed to provide meaningful benefits to key employees 
                                        without excess costs. Employee contributions made with before-tax 
                                        dollars in a 401(k) plan, for example, offer greater earning power 
                                        than other savings vehicles. Participants can readily appreciate 
                                        the plan's value as they see their savings grow.</p>
                                    </td>
                                    <td width="51%"> 
                                        <p class="texth2">Customizing Your Plan</p>              
                                        <p class="text1">Some issues you should consider before setting up 
                                        or redesigning a plan:</p>
                                        <ul>
                                            <li>What level of financial commitment are 
                                            you willing to make as the employer?</li> 
                                            <li>Considering the age, risk tolerance, 
                                            life-styles and financial planning knowledge of the employee 
                                            group, what types of investment options should be offered?</li> 
                                            <li>Should participating employees be able to 
                                            direct the investment of employer contributions?</li> 
                                            <li>Do you wish to limit the number of times per year participating 
                                            employees may transfer their contributions from one investment 
                                            option to another?</li>
                                        </ul>
                                        <p class="text2">We can meet with you to discuss these issues and 
                                        develop a plan that makes sense for your organization. </p>
                                        <p class="texth2">Tax-deductible Contributions</p>
                                        <p class="text2">Administration fees and employer contributions 
                                        may be tax-deductible. Depending on your plan design and funding 
                                        goals, we can create a plan design that permits flexible funding 
                                        from year to year, or one that targets a specific level of benefit 
                                        and funding commitment.</p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        -->
                        
                    </td>                    
                </tr>
                <tr>
                    <td align="center">
                        <span class="headers">It's the cornerstone to a secure retirement.</span>
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
            </table>
			<!-- end - main content area -->
	    </div>
	</td>
	<td width="15"></td>
	<td rowspan="3" class="dropShadow">&nbsp;</td>
</tr>
</asp:Content>

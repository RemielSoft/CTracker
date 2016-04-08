<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="AdministrativeFeatures.aspx.cs" Inherits="RetirementFunds.Sponsor.AdministrativeFeatures" %>
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
                        <div id="divPlanInformation" runat="server" visible="false" style="text-align:right">
                            <font class="planHeader">Current User: <asp:Label ID="lblUserHeader" runat="server" /></font><br />
                            <font class="planHeader">Current Plan: <asp:Label ID="lblPlaneNameHeader" runat="server" /></font>
                        </div>                          
                        <span class="headers">administrative features</span>
                            <br />
                            <br />
                            <table width="96%" border="0" cellpadding="4">
                              <tr align="left"> 
                                <td> 
                                  <p class="texth2">Plan Design Services</p>
                                  <span class="text1">Proper plan design is the starting point for all 
                                    effective retirement plans. Thomas F. Barrett, Inc. has the expertise 
                                    and experience to design a plan that meets both your company's 
                                    specific needs and those of your employees. </p>
                                  <p class="texth2"> Flexibility of Plan Options</p>
                                  <span class="text1">We will help you to select loan, vesting and eligibility 
                                    features to custom design your plan. Our array of prominent investment 
                                    options and contribution strategies can help you structure the 
                                    plan that best fits your company. </p>
                                  <p class="texth2"> Trustee Services</p>
                                  <span class="text1">Cardinal Bank acts as trustee for the National 
                                    Employers Retirement Trust and will provide group trustee services 
                                    relating to the trust and its investments. </p>
                                  <p class="texth2"> Plan Administration</p>
                                  <span class="text1">Thomas F. Barrett, Inc. acts as the third party 
                                    administrator for the employers participating in the trust, and 
                                    will generally handle the paperwork involved in processing contributions, 
                                    loan payments and distributions. </p>
                                  <p class="texth2"> Plan Document</p>
                                  <span class="text1">We use a pre-approved volume submitter plan document 
                                    in establishing your plan. This may allow you to reduce your legal 
                                    and Internal Revenue Service filing fees compared to a custom 
                                    plan document, while maintaining maximum flexibility in the plan's 
                                    design. In certain cases we can use existing plan documents if 
                                    minimal modifications are required. </p>
                                  <span class="text1">On an ongoing basis, this helps you keep the plan 
                                    in compliance and reduces your cost for amendments. When required 
                                    due to regulatory changes or plan administration issues, we will 
                                    prepare amendments for your plan.</p>
                                  <p class="texth2">Plan Administration Services Include:</p>
                                  <ul>
                                    <p class="text1"><li> Plan design services 
                                    <li> Plan document and summary plan 
                                  description 
                                    <li> Submission of plan to the IRS for 
                                  determination letter 
                                    <li> Enrollment and meeting services 
                                  (participant meetings, video, investment transfers based on 
                                  participant elections) 
                                    <li> Allocations of contributions and 
                                  investment transfers based on participant elections 
                                    <li> Plan valuation(s) for the employer and 
                                  participant statements 
                                    <li> Participant loans (if selected in plan 
                                  design) 
                                    <li> Reporting and confirmation of 
                                  investments, plan activity and anti-discrimination testing 
                                    <li> Preparation of Form 1099-R, Form 5500 and 
                                  related attachments 
                                    <li> Daily valuation of Plan assets</li>
                                  </ul></span>
                                  <p class="texth2">Download Applications in PDF Format:</p>
                                  <ul>
                                    
                                  </font><li><A href="/Pdfs/formsim.pdf" target=new><b>Savings Incentive Match Plan for Employees 
	                          of Small Employers (SIMPLE)</B></A>
                                  <li></font><A href="/Pdfs/formira.pdf" target=new><b>Individual Retirement 
                                      Trust Account (IRA)</B></A>
                                  <li></font><A href="/Pdfs/formsep.pdf" target=new><b>Simplified Employee 
                                      Pension-Individual (SEP)</B></A>
                                    </li>
                                  </ul>
                                  
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

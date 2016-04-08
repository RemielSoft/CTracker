<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="AdminServices.aspx.cs" Inherits="RetirementFunds.Sponsor.AdminServices" %>
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
                        <table width="96%" border="0" cellpadding="4">
          <tr align="left"> 
            <td> 
              <span class="headers">Admin Services</span>
                            <br />
                            <br />
                            <span class=texth3>We have developed highly efficient systems which 
            provide both accurate and timely reporting for your retirement 
            plan.</span>
              <p class="texth2"> Daily Transaction Processing</p>
              <p class="text1">The plan sponsor gathers the plan's transactions 
                and submits them to NERT (National Employers Retirement Trust) 
                for processing. These items include contributions, loan repayments, 
                benefit payment requests, investment allocation changes, participant 
                enrollments, etc.  After each deposit, you'll receive a confirmation 
		statement outlining the transactions just completed.</p>
              <p class="texth2">Participant Reporting Services</p>
              <p class="text1">Each participant receives a detailed quarterly account statement 
		to allow monitoring of contributions and investment results. Participants also receive 
		a Personal Identification Number (PIN) so they can access their account data online.  
		As plan sponsor, you'll receive a comprehensive quarterly valuation outlining all plan 
		activity for the period.</p>
              <p class="texth2">Annual Services</p>
              <p class="text1">Cardinal Bank, as trustee for NERT, prepares Form 1099-R reporting 
		for participant distributions.  These forms are sent to participants receiving distributions 
		during the calendar year by the following January 31.  Cardinal also submits this Form 1099 
		reporting to the IRS, relieving the plan sponsor of this responsibility.</p>
		<p class="text1">As part of your annual year-end reporting, we will also prepare 
		Form 5500 and related attachments for your plan. If your plan 
                requires actuarial certification or FASB 87 reporting for your 
                auditors, we also provide that service.</p>
              <p class="text1">Thomas F. Barrett, Inc. gives the plan sponsor 
                direct access to professional pension administrators, investment advisors and 
		pension attorneys who are familiar with the operation of your plan and can answer 
		specific questions regarding recordkeeping, reporting and day-to-day plan administration 
                issues.</p>
                 
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

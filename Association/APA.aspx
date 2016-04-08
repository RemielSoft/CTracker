<%@ Page Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="APA.aspx.cs" Inherits="RetirementFunds.Association.APA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="<%=Page.ResolveUrl("~/Content/Styles/Site.css") %>" rel="stylesheet" type="text/css" />
<style>
    #links_bar a{
        color: #203ef1;
        font-size: 18px;
        text-decoration: underline;
        font-weight: bold;
    }
    #links_bar a:hover{
        text-decoration: none;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
<tr bgcolor="#FFFFFF" valign="top" class="column">
    <td colspan="2" class="nert_banner"></td>    
    <td class="dropShadow"></td>
</tr>
<tr bgcolor="#FFFFFF" valign="top">
    <td>
        <div id="page">
            <div id="content">
		        <div class="wrap">

			        <div class="fl">
				        <h3>The NERT Advantage.</h3>
				        <ul class="v_list">
					        <li>No Retirement Plan Document Fees</li>
					        <li>IRS Reporting Fees Waived for 3 years</li>
					        <li>Signature Ready EGTRRA Approved</li>
					        <li>Customized Reporting + Analysis</li>
					        <li>Full Service Administration</li>
					        <li>In-house Actuarial and Legal Capability</li>
					        <li>Complimentary Confidential Analysis</li>
				        </ul>
			        </div>

		        </div>

		        <h3>The Choice Is Simple.</h3>
		        <p>
			        We believe a conversation is the difference between just getting <br/>
			        by and fulfulling your goals for a financially secure retirement.
			        <br/>
			        <br/>
			        NERT is the National Employers Retirement Trust endorsed by <br/>
			        The APA Insurance Trust to provide member retirement <br/>
			        plan consulting services.
		        </p>
	        </div>
	        <!-- Content #END -->
            <div id="links_bar">
                <h3 style="padding-left: 10px">Want More Information?</h3>
                <p>
                    <a href="<%= Page.ResolveUrl("~/Insurance/PlanDesign_Download.aspx") %>">Request a Complimentary Plan Design </a>
                </p>
                <p>
                    <a href="<%= Page.ResolveUrl("~/Insurance/PlanDesign_Download.aspx") %>">Request Whitepaper "Retirement Plan Asset and Tax Strategies for Practicing Psychologists"</a>
                </p>
                <div id="info">
		            <h3>Or Call 1-888-271-8035 ext. 154</h3>
		            <p><i>Provided for APA members by:</i></p>
		            <p class="logo">
			            <img src="<%=Page.ResolveUrl("~/Content/images/trust_logo.gif")%>" alt=""/>
			            <span>American Psychological Assn.Insurance Trust</span>
		            </p>
	            </div>
            </div>
        </div>
    </td>
    <td width="15"></td>
    <td rowspan="3" class="dropShadow">&nbsp;</td>
</tr>
</asp:Content>


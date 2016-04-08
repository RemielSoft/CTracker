<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="TrustServices.aspx.cs" Inherits="RetirementFunds.Sponsor.TrustServices" %>
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
                        <table width="97%" border="0" cellpadding="4">
          <tr align="left"> 
            <td>
            <span class="headers">Trust Services</span>
                <br />
                <br />
            <p><p class="texth3">As a retirement plan sponsor, you need to 
		know your plan offers not only a wide variety of investment options, 
		but is also in compliance with all relevant tax regulations.  The National Employers 
		Retirement Trust offers a full range of trust document services for you.</p>

		<p><p class="text1">NERT has established a Group Trust Agreement 
		which permits us to operate and maintain this Trust.  The National 
		Employer Retirement has also obtained an </font><a href="/Pdfs/nertirs.pdf" target=new>
		<b>IRS Approval Letter dated 7/23/99</b></a> approving the structure and 
		tax qualification of the trust.  Sandy Spring Trust serves as the directed 
		trustee and executes trades and maintains trust records for NERT.</p>
<p class="texth1">Sandy Spring Trust Information </p>

              <p class="texth2">Corporate Profile<br></p>
                <p></p> 
                <p><span class="text1">Sandy Spring Trust was established in 1987 as the fiduciary arm of Sandy Spring Bank, a community Bank whose history dates back to 1868. Since then we have grown as a strong local provider of Wealth Management and Trust services in the Washington metropolitan area. Sandy Spring Trust provides time-tested strategies on how to protect your family, support your business and manage your assets. Our professionals are all employees of Sandy Spring Trust, providing clients with hundreds of years of collective experience in the prudent management of assets and supporting families with their estate, financial and tax planning needs. We also specialize in supporting business owners with their own unique strategies.


<P>
</span>
            
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

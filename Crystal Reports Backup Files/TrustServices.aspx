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
		tax qualification of the trust.  Cardinal Bank, Inc. serves as the directed 
		trustee and executes trades and maintains trust records for NERT.</p>
<p class="texth1">Cardinal Bank Trust Information </p>

              <p class="texth2">Corporate Profile<br></p>
                <p></p> 
                <p><span class="text1">Cardinal Trust and Investment Services was founded in 1991 as Rushmore Savings. The experienced trust employees have many long time client relationships. The trust division currently acts as trustee or custodian for more than $5B in assets. 
<P>
Cardinal Trust and Investment Services operates locally; offering full fiduciary services for both individuals and businesses. These services include escrows, trusts, wills and estates, custody services, investment management, and retirement plans. Our custodial record keeping systems enable us to customize to your unique needs. Our systems automate the interactive processes required by the financial services marketplace, linking asset managers, brokers, exchanges, banks and settlement agents and custodians. Click here for more information. 
<P>
Cardinal Trust and Investment Services handles a broad range of individual and corporate clients including pension funds, financial institutions, foundations, accountants, attorneys, investment advisors, and a variety of mutual funds and corporations.</span>
            
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

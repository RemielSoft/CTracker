<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="Step_1_3.aspx.cs" Inherits="RetirementFunds.Participant.Step_1_3" %>
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
                            <span class="headers">for the participant</span>
                            <br />
                            <table cellspacing="0" cellpadding="5" width="52%" >
                                <tr> 
                                    <td>
                                        <p class="texth2">Fund Performance <span id="spAsOfDate" runat="server"></span></p>
                                    </td>
                                </tr>
                                <tr> 
                                    <td>
                                        <table ID="tblFunds" runat="server" borderwidth="0" cellpadding="0" cellspacing="0" width="100%">
                                        </table>
                                    </td>
                                </tr>
                                <tr> 
                                    <td>
                                        <hr width="75%"/>
                                        <span class="text1">Fund Performance reflects the effect of all dividend, 
                                        interest, and realized and unrealized appreciation. Three and five 
                                        year results are annualized as of 12/31 of the previous calendar year. 
                                        All returns are net of investment management fees only, and are exclusive 
                                        of any advisory or trust management fees, and are as reported by the fund managers 
                                        for the period posted. Past performance is not necessarily indicative 
                                        of future returns.</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p align="right"><img src="/images/arrow4.gif" alt="" runat="server"/><a href="/Participant/NertAlloc.aspx" target="_blank">Step 4 -- Select Investment Options</a></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p align="right"><img src="/images/arrow4.gif" alt="" runat="server"/><a href="/Participant/Step_1_4.aspx" >Step 5 -- Complete Participant Enrollment</a></p>
                                    </td>
                                </tr>
                            </table>                            
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

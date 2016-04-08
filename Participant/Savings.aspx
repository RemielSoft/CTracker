<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="Savings.aspx.cs" Inherits="RetirementFunds.Participant.Savings" %>
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
                            <span class="headers">retirement savings projection</span>
                            <br />
                            <br />
                            <table cellspacing="0" cellpadding="5" width="51%">
                                <tr>
                                    <td width="75%" bgcolor="#F0F0F0" align="right" class="text1">How old are you?</td>
                                    <td width="25%" bgcolor="#F0F0F0"><asp:TextBox id="txtAge" runat="server" CssClass="textbox" Columns="4" MaxLength="3"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td width="75%" bgcolor="#E0E0E0" align="right" class="text1">Projected retirement age:</td>
                                    <td width="25%" bgcolor="#E0E0E0"><asp:TextBox id="txtRetirementAge" runat="server" CssClass="textbox" Columns="4" Text="65"></asp:TextBox></td>
                                </tr>
                                <tr>       
                                    <td width="75%" bgcolor="#F0F0F0" align="right" class="text1">Desired annual income at retirement (in today's dollars):</td>
                                    <td width="25%" bgcolor="#F0F0F0"><asp:TextBox id="txtAnnualIncomeAtRetirement" runat="server" CssClass="textbox" Columns="15" Text="100000"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td width="75%" bgcolor="#E0E0E0" align="right" class="text1">Estimated inflation rate until retirement:</td>
                                    <td width="25%" bgcolor="#E0E0E0">
                                        <asp:DropDownList ID="ddlEstimatedInflation" runat="server" CssClass="dropdownflat">
                                            <asp:ListItem Text="0%" Value="0" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="1%" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2%" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3%" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="4%" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="5%" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="6%" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="7%" Value="7"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="75%" bgcolor="#F0F0F0" align="right" class="text1">Current balance of your 401(k) assets and other retirement assets:</td>
                                    <td width="25%" bgcolor="#F0F0F0"><asp:TextBox id="txtCurrentRetirementAssets" runat="server" CssClass="textbox" Columns="15" Text="0"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td width="75%" bgcolor="#E0E0E0" align="right" class="text1">Current monthly employee contribution to 401(k) and other retirement plans:</td>
                                    <td width="25%" bgcolor="#E0E0E0"><asp:TextBox id="txtCurrentContribution" runat="server" CssClass="textbox" Columns="8" Text="0"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td width="75%" bgcolor="#F0F0F0" align="right" class="text1">Estimated interest rate return on your investments until retirement:</td>
                                    <td width="25%" bgcolor="#F0F0F0">
                                        <asp:DropDownList ID="ddlEstIntRateUntilRetirement" runat="server" CssClass="dropdownflat">
                                            <asp:ListItem Text="8%" Value="8"></asp:ListItem>
                                            <asp:ListItem Text="1%" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2%" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3%" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="4%" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="5%" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="6%" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="7%" Value="7"></asp:ListItem>
                                            <asp:ListItem Text="8%" Value="8"></asp:ListItem>
                                            <asp:ListItem Text="9%" Value="9"></asp:ListItem>
                                            <asp:ListItem Text="10%" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="11%" Value="11"></asp:ListItem>
                                            <asp:ListItem Text="12%" Value="12"></asp:ListItem>
                                            <asp:ListItem Text="13%" Value="13"></asp:ListItem>
                                            <asp:ListItem Text="14%" Value="14"></asp:ListItem>
                                            <asp:ListItem Text="15%" Value="15"></asp:ListItem>
                                            <asp:ListItem Text="16%" Value="16"></asp:ListItem>
                                            <asp:ListItem Text="17%" Value="17"></asp:ListItem>
                                            <asp:ListItem Text="18%" Value="18"></asp:ListItem>
                                            <asp:ListItem Text="19%" Value="19"></asp:ListItem>
                                            <asp:ListItem Text="20%" Value="20"></asp:ListItem>      
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="75%" bgcolor="#E0E0E0" align="right" class="text1">Estimated interest rate return on your investments after retirement:</td>
                                    <td width="25%" bgcolor="#E0E0E0">
                                        <asp:DropDownList ID="ddlEstIntRateAfterRetirement" runat="server" CssClass="dropdownflat">
                                            <asp:ListItem Text="5%" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="1%" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2%" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3%" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="4%" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="5%" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="6%" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="7%" Value="7"></asp:ListItem>
                                            <asp:ListItem Text="8%" Value="8"></asp:ListItem>
                                            <asp:ListItem Text="9%" Value="9"></asp:ListItem>
                                            <asp:ListItem Text="10%" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="11%" Value="11"></asp:ListItem>
                                            <asp:ListItem Text="12%" Value="12"></asp:ListItem>
                                            <asp:ListItem Text="13%" Value="13"></asp:ListItem>
                                            <asp:ListItem Text="14%" Value="14"></asp:ListItem>
                                            <asp:ListItem Text="15%" Value="15"></asp:ListItem>
                                            <asp:ListItem Text="16%" Value="16"></asp:ListItem>
                                            <asp:ListItem Text="17%" Value="17"></asp:ListItem>
                                            <asp:ListItem Text="18%" Value="18"></asp:ListItem>
                                            <asp:ListItem Text="19%" Value="19"></asp:ListItem>
                                            <asp:ListItem Text="20%" Value="20"></asp:ListItem>      
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="75%" bgcolor="#F0F0F0" align="right" class="text1">Choose a life expectancy age:</td>
                                    <td width="25%" bgcolor="#F0F0F0"><asp:TextBox id="txtLifeExpectancy" runat="server" CssClass="textbox" Columns="5" Text="85"></asp:TextBox></td>
                                </tr>
                                <tr align="center"> 
                                    <td colspan="2" bgcolor="#E0E0E0">
                                        <asp:Button ID="btnSubmit" runat="server" Text="Calculate!" CssClass="buttonFlat" OnClick="btnSubmit_Click" />&nbsp;                                        
                                        <input type="reset" name="reset" value="Reset" id="btnReset" CssClass="buttonFlat" runat="server" />                                        
                                        <span style="display:none"><asp:Button ID="btnHidden" runat="server" Text="Hidden" CssClass="buttonFlat" OnClick="btnHidden_Click" /></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" bgcolor="#F0F0F0" class="txt1bold">Please 
                                    note that these projections do not include the value of any future 
                                    employer retirement contributions (such as a 401(k) match) or the 
                                    value of Social Security benefits payable at retirement.</td> 
                                </tr>  
                                <tr>
                                    <td colspan="2">
                                       <asp:UpdatePanel ID="upContribution" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div  align="center" bgcolor="#ffffff" class="txt1bold" id="divContribution" runat="server" visible="false" width="100%">
                                                    <br />
                                                    <br />
                                                    <table cellspacing="0" cellpadding="5" width="100%">
                                                        <tr>
                                                            <td>
                                                                Monthly Contribution Required = $<asp:Label ID="lblAmount" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnHidden" EventName="Click" />
                                            </Triggers>            
                                        </asp:UpdatePanel>                                     
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

<script type="text/javascript">
    function ValidateData(  txtAge, aaMsg,
                            txtRetirementAge, raMsg,
                            txtAnnualIncomeAtRetirement, pbaaMsg,
                            txtCurrentRetirementAssets, pvMsg,
                            txtCurrentContribution, ccontMsg,
                            txtLifeExpectancy, daMsg) {
        var returnValue = true;
        var errors = "";
        
        //Verify if all value are specified
        if (document.getElementById(txtAge).value.replace(/^\s\s*/, '').replace(/\s\s*$/, '').length == 0
            || document.getElementById(txtRetirementAge).value.replace(/^\s\s*/, '').replace(/\s\s*$/, '').length == 0
            || document.getElementById(txtAnnualIncomeAtRetirement).value.replace(/^\s\s*/, '').replace(/\s\s*$/, '').length == 0
            || document.getElementById(txtCurrentRetirementAssets).value.replace(/^\s\s*/, '').replace(/\s\s*$/, '').length == 0
            || document.getElementById(txtCurrentContribution).value.replace(/^\s\s*/, '').replace(/\s\s*$/, '').length == 0
            || document.getElementById(txtLifeExpectancy).value.replace(/^\s\s*/, '').replace(/\s\s*$/, '').length == 0) {

            errors +=  '- ' + ' All fields are required.\n';
            returnValue = false;
        }

        //Verify if all value are numeric
        if (!isValidNumber(document.getElementById(txtAge).value.replace(/^\s\s*/, '').replace(/\s\s*$/, ''))) {
            errors += '- ' + aaMsg + ' must contain a number.\n';
            returnValue = false;
        }

        if (!isValidNumber(document.getElementById(txtRetirementAge).value.replace(/^\s\s*/, '').replace(/\s\s*$/, ''))) {
            errors += '- ' + raMsg + ' must contain a number.\n';
            returnValue = false;        
        }

        if (!isValidNumber(document.getElementById(txtAnnualIncomeAtRetirement).value.replace(/^\s\s*/, '').replace(/\s\s*$/, ''))) {
            errors += '- ' + pbaaMsg + ' must contain a number.\n';
            returnValue = false;        
        }

        if (!isValidNumber(document.getElementById(txtCurrentRetirementAssets).value.replace(/^\s\s*/, '').replace(/\s\s*$/, ''))) {
            errors += '- ' + pvMsg + ' must contain a number.\n';
            returnValue = false;        
        }

        if (!isValidNumber(document.getElementById(txtCurrentContribution).value.replace(/^\s\s*/, '').replace(/\s\s*$/, ''))) {
            errors += '- ' + ccontMsg + ' must contain a number.\n';
            returnValue = false;        
        }

        if (!isValidNumber(document.getElementById(txtLifeExpectancy).value.replace(/^\s\s*/, '').replace(/\s\s*$/, ''))) {
            errors += '- ' + daMsg + ' must contain a number.\n';
            returnValue = false;        
        }                                                   
        
        // Verify for errors
        if( !returnValue ) 
        {
            alert('The following error(s) occurred:\n' + errors );
        }
        
        return returnValue;
    }

    // Validate if value is a number
    function isValidNumber(num) {
        Regex = /(^[0-9]*$)/;
        return Regex.test(num);
    }

    // Hide contribution
    function HideContribution(ctrlId) {
        document.getElementById(ctrlId).click();
    }                                                                                                                                                                        
</script>
</asp:Content>

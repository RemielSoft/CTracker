<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Nert.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="RetirementFunds.User.User" %>
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
                            <font class="planHeader">Current Plan: <asp:Label ID="lblPlaneNameHeader" runat="server" /></font>
                        </div>                          
                        <div style="width:98%; padding: 20px 16px 12px 8px;">
                            <span class="headers">account information</span>
                            <br />
                            <br />
		                    <table width="100%" align="center"  border="0">
		                        <tr>
			                        <td height="30" colspan="2" class="txt1bold" align="left">&nbsp;&nbsp;Employee Details:</td>
		                        </tr>
			                    <tr class="txt1bold">
				                    <td height="60" colspan="2">
				                      <font face="verdana" size="2" color="red"><asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label></font>				                      
				                    </td>
			                    </tr>
				                <tr class="txt1bold" id="trPlanId" runat="server" visible="false">
				                    <td align="right">PlanID:</td>
					                <td><asp:Label ID="lblPlanId" runat="server"></asp:Label></td>
				                </tr>
			                    <tr class="txt1bold">
				                    <td align="right">First Name:</td>
				                    <td><asp:TextBox ID="txtFirstName" runat="server" CssClass="formelement"></asp:TextBox>&nbsp;<font face="verdana" size="2" color="red"><sup>*</sup></font></td>
			                    </tr>
			                    <tr class="txt1bold">
				                    <td align="right">Middle Name:</td>
				                    <td><asp:TextBox ID="txtMiddleName" runat="server" CssClass="formelement"></asp:TextBox></td>	
			                    </tr>
			                    <tr class="txt1bold">
				                    <td align="right">Last Name:</td>
				                    <td><asp:TextBox ID="txtLastName" runat="server" CssClass="formelement"></asp:TextBox>&nbsp;<font face="verdana" size="2" color="red"><sup>*</sup></font></td>
			                    </tr>
			                    <tr class="txt1bold">
				                    <td align="right">SSN:</td>
				                    <td><asp:TextBox ID="txtSSN" runat="server" CssClass="formelement"></asp:TextBox>
				                        <asp:Label ID="lblSSN" runat="server" CssClass="formelement"></asp:Label>
				                        <font face="verdana" size="2" color="red"><sup>*</sup></font></td>
			                    </tr>
			                    <tr class="txt1bold">
				                    <td align="right">Birth Date:</td>
				                    <td><asp:TextBox ID="txtBirthDate" runat="server" CssClass="formelement"></asp:TextBox>&nbsp;<font face="verdana" size="2" color="red"><sup>*</sup></font></td>
			                    </tr>
			                    <tr class="txt1bold">
				                    <td align="right">Hire Date:</td>
				                    <td><asp:TextBox ID="txtHireDate" runat="server" CssClass="formelement"></asp:TextBox>&nbsp;<font face="verdana" size="2" color="red"><sup>*</sup></font></td>
			                    </tr>
			                    <tr class="txt1bold">
				                    <td align="right">Email:</td>
				                    <td><asp:TextBox ID="txtEmail" runat="server" CssClass="formelement"></asp:TextBox>&nbsp;<font face="verdana" size="2" color="red"><sup>*</sup></font></td>
			                    </tr>
			                    <tr class="txt1bold">
				                    <td align="right" colspan="2">
				                        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CausesValidation="false" CssClass="formelement" />&nbsp;
				                        <asp:Button ID="btnSave" runat="server" Text="Add Record" OnClick="btnSave_Click" />&nbsp;
				                        <asp:Button ID="btnSaveAddNew" runat="server" Text="Save and Add More" OnClick="btnSaveAddNew_Click" />&nbsp;
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
function validateForm(firstName, lastName, ssn, email, dob, dthire) {
	// Customize these calls for your form
	// Start ------->
    if (firstName.length > 0 && !validRequired(document.getElementById(firstName), "First Name"))
	    return false;

	if (lastName.length > 0 && !validRequired(document.getElementById(lastName), "Last Name"))
	    return false;

	if (ssn.length > 0 && !validRequired(document.getElementById(ssn), "SSN"))
	    return false;

	if (dob.length > 0 && !validDate(document.getElementById(dob), "Birth Date", true))
	    return false;

	if (dthire.length > 0 && !validDate(document.getElementById(dthire), "Hire Date", true))
	    return false;		

    if (email.length > 0 && !validEmail(document.getElementById(email), "Email Address", true))
		return false;
	// <--------- End
	
	return true;
}
function validRequired(formField,fieldLabel)
{
	var result = true;
	
	if (formField.value == "")
	{
		alert('Please enter a value for the "' + fieldLabel +'" field.');
		formField.focus();
		result = false;
	}
	
	return result;
}

function isEmailAddr(email)
{
  var result = false;
  var theStr = new String(email);
  var index = theStr.indexOf("@");
  if (index > 0)
  {
    var pindex = theStr.indexOf(".",index);
    if ((pindex > index+1) && (theStr.length > pindex+1))
	result = true;
  }
  return result;
}

function validEmail(formField,fieldLabel,required)
{
	var result = true;
	
	if (required && !validRequired(formField,fieldLabel))
		result = false;

	if (result && ((formField.value.length < 3) || !isEmailAddr(formField.value)) )
	{
		alert("Please enter a complete email address in the form: yourname@yourdomain.com");
		formField.focus();
		result = false;
	}
   
  return result;

}

function validDate(formField,fieldLabel,required)
{
	var result = true;

	if (required && !validRequired(formField,fieldLabel))
		result = false;
  
 	if (result)
 	{
 		var elems = formField.value.split("/");
 		
 		result = (elems.length == 3); // should be three components
 		
 		if (result)
 		{
 			var month = parseInt(elems[0],10);
  			var day = parseInt(elems[1],10);
 			var year = parseInt(elems[2],10);
			result = !isNaN(month) && (month > 0) && (month < 13) &&
						!isNaN(day) && (day > 0) && (day < 32) &&
						!isNaN(year) && (elems[2].length == 4);
 		}
 		
  		if (!result)
 		{
 			alert('Please enter a date in the format MM/DD/YYYY for the "' + fieldLabel +'" field.');
			formField.focus();		
		}
	} 
	
	return result;
}
</script>
</asp:Content>

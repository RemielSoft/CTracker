using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using RetirementFunds.Common;

namespace RetirementFunds.Insurance
{
    public partial class InsuranceLTC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            StringBuilder strBdr = new StringBuilder();

            strBdr.Append("<html>");
            strBdr.Append("<head>");
            strBdr.Append("<title>");
            strBdr.Append("</title>");
            strBdr.Append("</head>");
            strBdr.Append("<body>");
            strBdr.Append("<table border='1' cellspacing='2' cellpadding='2' width='100%'>");

            strBdr.Append("<tr>");
            strBdr.Append("<td width='20%'>FIRSTNAME:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.txtFirstName.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>LASTNAME:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.txtLastName.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>ADDRESS1:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.txtAddress1.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>ADDRESS2:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.txtAddress2.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>CITY:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.txtCity.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>STATE:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + ((this.ddlState.SelectedValue == "") ? "" : this.ddlState.SelectedValue.ToString()));
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>ZIP:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.txtZip1.Text.ToString() + "-" + this.txtZip2.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>PHONE:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.txtPhone1.Text.ToString() + "-" + this.txtPhone2.Text.ToString() + "-" + this.txtPhone3.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>FAX:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.txtFax1.Text.ToString() + "-" + this.txtFax2.Text.ToString() + "-" + this.txtFax3.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>EMAIL:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.txtEmail.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>OCCUPATION:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.txtOccupation.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>DOB:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.txtDOB.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>TOBACCO:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.rblTobacco.SelectedValue.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>WAITING PERIOD:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.rblWaitingPeriod.SelectedValue.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>BENEFIT PERIOD:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.rblBenefitPeriod.SelectedValue.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>DAILY BENEFIT AMOUNT:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.rblBenefitAmount.SelectedValue.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>HOME HEALTH:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.rblHomeHealthCoverage.SelectedValue.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>CURRENT NERT CLIENT:");
            strBdr.Append("</td>");
            strBdr.Append("<td>" + this.rblCurrentNertClient.SelectedValue.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>SOCIAL SECURITY NUMBER:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.txtSSN.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>PREEEXISTING:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.rblPreExisting.SelectedValue.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>DETAILS:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.txtDetails.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("</table>");
            strBdr.Append("</body>");
            strBdr.Append("</html>");

            try
            {
                // Send Email
                Utility.SendMail("Long Term Care Insurance Proposal Request"
                                    , strBdr.ToString()
                                    , System.Web.Configuration.WebConfigurationManager.AppSettings["fromAddress"].ToString()
                                    , System.Web.Configuration.WebConfigurationManager.AppSettings["toAddress"].ToString()
                                    , string.Empty
                                    , string.Empty
                                    , "html"
                                    , "high");

                Response.Redirect("~/Insurance/Confirmation.aspx", true);
            }
            catch (System.Threading.ThreadAbortException)
            {
            }
            catch(System.Exception exp)
            {
                if (Session["Error"] != null)
                {
                    Session.Remove("Error");
                }
                Session.Add("Error", exp.ToString());

                Response.Redirect("~/Common/Error.aspx", true);
            }
        }
    }
}

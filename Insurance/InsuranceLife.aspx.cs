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
    public partial class InsuranceLife : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            this.divInputData.Visible       = false;
            this.divInputValidation.Visible = true;

            // Populate validation fields
            this.lblName.Text           = this.txtFirstName.Text.ToString() + " " + this.txtLastName.Text.ToString();
            this.lblAddress.Text        = this.txtAddress1.Text.ToString() + " " + this.txtAddress2.Text.ToString();
            this.lblCity.Text           = this.txtCity.Text.ToString();
            this.lblState.Text          = (this.ddlState.SelectedValue == "") ? "" : this.ddlState.SelectedValue.ToString();
            this.lblZip.Text            = this.txtZip1.Text.ToString() + " " + this.txtZip2.Text.ToString();
            this.lblPhone.Text          = this.txtPhone1.Text.ToString() + " " + this.txtPhone2.Text.ToString() + " " + this.txtPhone3.Text.ToString();
            this.lblFax.Text            = this.txtFax1.Text.ToString() + " " + this.txtFax2.Text.ToString() + " " + this.txtFax3.Text.ToString();
            this.lblEmail.Text          = this.txtEmail.Text.ToString();
            this.lblOccupation.Text     = this.txtOccupation.Text.ToString();
            this.lblDOB.Text            = this.txtDOB.Text.ToString();
            this.lblTobacco.Text        = this.rblTobacco.SelectedValue.ToString();
            this.lblPeriod.Text         = this.rblPeriod.SelectedValue.ToString();
            this.lblAmount.Text         = "$" + this.txtAmount.Text.ToString();
            this.lblSpouseAge.Text      = this.txtSpouseAge.Text.ToString();
            this.lblSpouseAmount.Text   = "$" + this.txtSpouseAmount.Text.ToString();
            this.lblPurpose.Text        = this.rblPurpose.SelectedValue.ToString();
            this.lblPreExisting.Text    = this.rblPreExisting.SelectedValue.ToString();
            this.lblDetail.Text         = this.txtDetails.Text.ToString();
        }

        protected void btnGoBack_Click(object sender, EventArgs e)
        {
            this.divInputData.Visible       = true;
            this.divInputValidation.Visible = false;
        }

        protected void btnSubmitInformation_Click(object sender, EventArgs e)
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
            strBdr.Append("<td>&nbsp;" + this.lblState.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>ZIP:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.lblZip.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>PHONE:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.lblPhone.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>FAX:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.lblFax.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>EMAIL:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.lblEmail.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>OCCUPATION:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.lblOccupation.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>DOB:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.lblDOB.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>TOBACCO:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.lblTobacco.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>PERIOD:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.lblPeriod.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>AMOUNT:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.lblAmount.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>SPOUSEAGE:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.lblSpouseAge.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>SPOUSEAMT:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.lblSpouseAmount.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>PURPOSE:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.lblPurpose.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>PREEXISTING:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.lblPreExisting.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("<tr>");
            strBdr.Append("<td>DETAILS:");
            strBdr.Append("</td>");
            strBdr.Append("<td>&nbsp;" + this.lblDetail.Text.ToString());
            strBdr.Append("</td>");
            strBdr.Append("</tr>");

            strBdr.Append("</table>");
            strBdr.Append("</body>");
            strBdr.Append("</html>");

            try
            {
                // Send Email
                Utility.SendMail("Life Insurance Proposal Request"
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
            catch (System.Exception exp)
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

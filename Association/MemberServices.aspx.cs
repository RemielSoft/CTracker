using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RetirementFunds.Association
{
    public partial class MemberServices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtInitials.Attributes.Add("onkeypress", "return controlEnter('" + btnNext.ClientID + "', event)");
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (txtInitials.Text == "")
            {
                lblMsg.Text = "Initials is required.";
                lblMsg.Visible = true;
            }
            else if ((txtInitials.Text.ToUpper() != "APA") && (txtInitials.Text.ToUpper() != "NUCA") && (txtInitials.Text.ToUpper() != "DCDENTAL"))
            {
                lblMsg.Text = "The initials you entered are incorrect.  Please try again.";
                lblMsg.Visible = true;
            }
            else
            {
                Response.Redirect(txtInitials.Text + ".aspx");
            }
        }
    }
}

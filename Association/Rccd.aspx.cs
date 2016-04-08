using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RetirementFunds.Association
{
    public partial class Rccd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtAddress1.Text = "";
            txtAddress2.Text = "";
            txtEmail.Text = "";
            txtFax.Text = "";
            txtPhone.Text = "";
            txtPlanType.Text = "";

            reqValName.ErrorMessage = "";
            reqValAddress.ErrorMessage = "";
        }
    }
}

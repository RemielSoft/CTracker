using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RetirementFunds.Participant
{
    public partial class AccountInformation : System.Web.UI.Page
    {
        protected string planDocument = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet dsPlan = null;

            if (Session["nertPLogin"] == null)
            {
                Response.Redirect("~/Common/Login.aspx", true);
            }
            else if (Session["nertPPlan"] != null)
            {
                dsPlan = (DataSet)Session["nertPPlan"];

                planDocument = dsPlan.Tables[0].Rows[0]["planid"].ToString();
                lblPlanNameHeader.Text = dsPlan.Tables[0].Rows[0][1].ToString();
                lblUserHeader.Text = this.Session["Name"].ToString();
                divPlanInformation.Visible = true;
            }
        }
    }
}

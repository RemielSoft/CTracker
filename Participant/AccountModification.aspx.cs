using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RetirementFunds.Participant
{
    public partial class AccountModification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nertPLogin"] == null)
            {
                Response.Redirect("~/Common/Login.aspx", true);
            }
            
            if (Session["nertPPlan"] != null)
            {
                System.Data.DataSet dsTemp = (System.Data.DataSet)this.Session["nertPPlan"];
                lblPlanNameHeader.Text = dsTemp.Tables[0].Rows[0][1].ToString();
                lblUserHeader.Text = this.Session["Name"].ToString();
                divPlanInformation.Visible = true;
            }
        }
    }
}

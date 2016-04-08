using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RetirementFunds.Investments
{
    public partial class InvestmentOptionsPerfs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Display selected plan 
            if (this.Session["nertPPlan"] != null)
            {
                System.Data.DataSet dsTemp  = (System.Data.DataSet)this.Session["nertPPlan"];
                lblPlaneNameHeader.Text     = dsTemp.Tables[0].Rows[0][1].ToString();
                divPlanInformation.Visible  = true;
            }
        }
    }
}

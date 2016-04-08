using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RetirementFunds.Common
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Error"] != null
                && System.Web.Configuration.WebConfigurationManager.AppSettings["showError"] != null
                && Int16.Parse(System.Web.Configuration.WebConfigurationManager.AppSettings["showError"].ToString()) == 1)
            {
                this.spanError.InnerText    = Session["Error"].ToString();
                this.spanError.Visible      = true;
            }
        }
    }
}

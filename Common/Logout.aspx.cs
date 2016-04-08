using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RetirementFunds.Common
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear all session variable 
            this.Session.Abandon();

            // Redirect to home page
            Response.Redirect("/index.aspx", true);
        }
    }
}

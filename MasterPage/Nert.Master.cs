using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RetirementFunds.MasterPage
{
    public partial class Nert : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["Enrollment"] != null && this.Session["Enrollment"].ToString() == "True")
            {
                // Enrollment
                Menu1.DataSource = Server.MapPath("~/MenuEnrollment.xml");
                Menu1.DataBind();
            }
            else if (this.Session["nertSLogin_SSN"] != null)
            {
                // Sponsor
                Menu1.DataSource = Server.MapPath("~/MenuSponsor.xml");
                Menu1.DataBind();
            }
            else if (this.Session["nertPLogin_SSN"] != null)
            {
                // Participant
                Menu1.DataSource = Server.MapPath("~/MenuParticipant.xml");
                Menu1.DataBind();
            }
            else
            {
                Menu1.DataSource = Server.MapPath("~/Menu.xml");
                Menu1.DataBind();
            }

            // Verify if on participant pages
            if (Session["nertPLogin_SSN"] == null
                && this.Request.Path.ToString().ToLower().IndexOf("participant") != -1)
            {
                Response.Redirect("~/Common/Login5.aspx", true);
            }

            // Verify if on sponsor pages
            if (Session["nertSLogin_SSN"] == null
                && this.Request.Path.ToString().ToLower().IndexOf("sponsor") != -1)
            {
                Response.Redirect("~/Common/Login5.aspx", true);
            }
        }
    }
}

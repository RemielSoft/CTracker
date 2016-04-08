using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace RetirementFunds
{
    public partial class ThrowError : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnError_Click(object sender, EventArgs e)
        {
            //Response.Write(Request.PhysicalApplicationPath);
            //throw new Exception("error test");
            Response.Write((2 / 0.0).ToString());
            SqlConnection conn = new SqlConnection("bad conn");
            conn.Open();
        }
    }
}

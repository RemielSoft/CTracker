using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Oracle.DataAccess.Client;

namespace RetirementFunds.Common
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendPassword_Click(object sender, EventArgs e)
        {
            OracleDataAdapter   adapter = null;
            OracleConnection    conn    = null;
            DataSet             dsEmail = new DataSet();
            DataSet             ds      = new DataSet();
            bool                message = false;

            try
            {
                string sql = @" Select  EENUM
                                From    JOB
                                WHERE   SSNUM   = :SSN";

                conn = new OracleConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["NertAppOracleConnectionString"].ToString());
                adapter = new OracleDataAdapter(sql, conn);

                adapter.SelectCommand.Parameters.Add(":SSN", OracleDbType.Varchar2, 9).Value = txtSSN.Text.ToString().Trim();

                // Open connection
                conn.Open();

                // Fill DataSet
                adapter.Fill(ds);

                adapter = null;

                sql = @" Select  INTERNETADDR
                         From    PERSON
                         WHERE   SSNUM   = :SSN";

                adapter = new OracleDataAdapter(sql, conn);

                adapter.SelectCommand.Parameters.Add(":SSN", OracleDbType.Varchar2, 9).Value = txtSSN.Text.ToString().Trim();

                // Fill DataSet
                adapter.Fill(dsEmail);

                // Close Connection
                conn.Close();

                // Verify is SSN exits
                if (ds == null || ds.Tables.Count == 0
                    || ds.Tables[0].Rows.Count == 0)
                {
                    this.lblMessage.Text    = "The entered SSN number is invalid. Please re-enter the SSN number.";
                    message                 = true;
                }

                if (!message && (dsEmail == null || dsEmail.Tables.Count == 0
                    || dsEmail.Tables[0].Rows.Count == 0))
                {
                    this.lblMessage.Text            = "Email address does not exits. Please contact <a href='mailto:info@nert.com'>nert</a>.";
                    message                         = true;
                    this.tblSSN.Visible             = false;
                    this.tblSendPassword.Visible    = false;
                }

                if (!message)
                {
                    // Send Email
                    Utility.SendMail("Your nert password request."
                                    , "Your nert password is :" + ds.Tables[0].Rows[0]["EENUM"].ToString() + "."
                                    , System.Configuration.ConfigurationManager.AppSettings["fromAddress"].ToString()
                                    , dsEmail.Tables[0].Rows[0]["INTERNETADDR"].ToString()
                                    , string.Empty
                                    , string.Empty
                                    , ""
                                    , "");
                    
                    this.lblMessage.Text            = "Your password has been mailed to your email address, please check your email. Click here to <a href='Login.aspx'>Login</a>.";
                    message                         = true;
                    this.tblSSN.Visible             = false;
                    this.tblSendPassword.Visible    = false;
                }

                this.tblMessage.Visible = message;
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
            finally
            {
                if (conn != null && conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }

                conn = null;
                adapter = null;
            }
        }
    }
}

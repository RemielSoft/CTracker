using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Common;
using System.Data.OleDb;

namespace RetirementFunds.Common
{
    public partial class Login5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verify if HTTPS 
            if (bool.Parse(System.Web.Configuration.WebConfigurationManager.AppSettings["verifyHttpsOnLogin"].ToString())
                && this.Request.Url.ToString().ToLower().IndexOf("https") == -1)
            {
                Response.Redirect(this.Request.Url.ToString().Replace("http", "https"), true);
            }
            else
            {
                if (this.Session["nertSLogin_SSN"] != null)
                {
                    // Verify and remove participant session variable
                    if (this.Session["nertPLogin_SSN"] != null)
                    {
                        this.Session.Remove("nertPLogin_SSN");
                    }

                    Response.Redirect("~/Sponsor/Sponsor.aspx", true);
                }

                if (this.Session["nertPLogin_SSN"] != null)
                {
                    // Verify and remove sponsor session variable
                    if (this.Session["nertSLogin_SSN"] != null)
                    {
                        this.Session.Remove("nertSLogin_SSN");
                    }

                    Response.Redirect("~/Participant/Participant.aspx", true);
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            OleDbConnection conn = null;

            try
            {
                conn = new OleDbConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["NertAppOracleOleDb"].ToString());

                //Remove existing sponsor and participant session variables

                // Verify and remove sponsor session variable
                if (this.Session["nertSLogin"] != null)
                {
                    this.Session.Remove("nertSLogin");
                }

                // Verify and remove participant session variable
                if (this.Session["nertPLogin"] != null)
                {
                    this.Session.Remove("nertPLogin");
                }

                int i = 0;
                conn.Open();
                // Set Participant Session Variable
                //SetParticipant(txtSSN.Text.ToString().Trim(), txtPassword.Text.ToString().Trim(), conn);
                //-----------------------------------------------------------------------
                string sql = " Select  Count(*) From JOB WHERE SSNUM   = '" + txtSSN.Text.ToString().Trim();
                sql += "' AND EENUM = '" + txtPassword.Text.ToString().Trim() + "'";

                OleDbCommand cmd = new OleDbCommand(sql, conn);
                i = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                if (i >= 1)
                {
                    // Remove participant session value
                    if (this.Session["nertPLogin_SSN"] != null)
                    {
                        this.Session.Remove("nertPLogin_SSN");
                    }
                    // Remove sponsor session value
                    if (this.Session["nertSLogin_SSN"] != null)
                    {
                        this.Session.Remove("nertSLogin_SSN");
                    }
                    this.Session.Add("nertPLogin_SSN", txtSSN.Text.ToString().Trim());
                    this.Session.Add("nertSLogin_SSN", txtSSN.Text.ToString().Trim());

                    //Add old sessions
                    DataSet dsSSN = new DataSet();
                    DataTable dtSSN = new DataTable();
                    DataColumn dcSSN = new DataColumn("SSNUM", System.Type.GetType("System.String"));
                    dtSSN.Columns.Add(dcSSN);
                    DataRow drSSN = dtSSN.NewRow();
                    drSSN["SSNUM"] = txtSSN.Text.ToString().Trim();
                    dtSSN.Rows.Add(drSSN);
                    dsSSN.Tables.Add(dtSSN);
                    this.Session.Add("nertPLogin", dsSSN);
                    this.Session.Add("nertSLogin", dsSSN);

                    //Delete Sponsor Session Variable if password is only 4 characters long
                    if (txtPassword.Text.ToString().Trim().Length == 4)
                    {
                        this.Session.Remove("nertSLogin_SSN");
                        this.Session.Remove("nertSLogin");
                    }

                    // Remove participant plan session value
                    if (this.Session["nertPPlan"] != null)
                    {
                        this.Session.Remove("nertPPlan");
                    }
                }
                else
                {
                    //Username & Password combo not correct
                    lblMsg.Text = "Invalid login information.";
                }
                //------------------------------------------------------------------------

                // Set Enrollment Session Variable
                //SetEnrollment(conn);
                //------------------------------------------------------------------------
                sql = " Select count(ALLOSETID) From PARTALLOMSTR WHERE SSNUM = '" + txtSSN.Text.ToString().Trim() + "'";
                cmd.CommandText = sql;

                if (this.Session["Enrollment"] != null)
                {
                    this.Session.Remove("Enrollment");
                }

                i = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                if (i >= 1)
                {
                    // Set enrollment session value
                    this.Session.Add("Enrollment", "False");
                }
                else
                {
                    this.Session.Add("Enrollment", "True");
                }
                //-------------------------------------------------------------------------

                // Set User Name Session Variable
                //SetUserHeader(conn);
                //-------------------------------------------------------------------------
                sql = "select rtrim(concat(concat(firstnam, ' '), lastnam)) as NAME From PERSON WHERE SSNUM = '";
                sql += txtSSN.Text.ToString().Trim() + "'";
                cmd.CommandText = sql;

                if (this.Session["Name"] != null)
                {
                    this.Session.Remove("Name");
                }

                if (cmd.ExecuteScalar() != null)
                {
                    // Set enrollment session value
                    this.Session.Add("Name", cmd.ExecuteScalar().ToString());
                }
                //-------------------------------------------------------------------------

                //Set Sponsor Session Variable and redirect
                //-------------------------------------------------------------------------
                //-------------------------------------------------------------------------
                if (this.Session["nertSLogin_SSN"] != null || this.Session["nertPLogin_SSN"] != null)
                {
                    if (this.Session["Enrollment"] != null && this.Session["Enrollment"].ToString() == "True")
                    {
                        Response.Redirect("~/Participant/Enrollment.aspx", true);
                    }
                    if (txtPassword.Text.ToString().Trim().Length == 4)
                    {
                        Response.Redirect("~/Participant/Participant.aspx", true);
                    }
                    else
                    {
                        Response.Redirect("~/Sponsor/Sponsor.aspx", false);
                    }
                }

                // Close connection
                conn.Close();
            }
            catch (System.Threading.ThreadAbortException)
            {
                // Close connection
                if (conn != null && conn.State != ConnectionState.Closed)
                {
                    conn.Close();
                }
            }
            catch (System.Exception exp)
            {
                // Close connection
                if (conn != null && conn.State != ConnectionState.Closed)
                {
                    conn.Close();
                }

                if (Session["Error"] != null)
                {
                    Session.Remove("Error");
                }
                Session.Add("Error", exp.ToString());
                Response.Redirect("~/Common/Error.aspx", true);
            }
        }
    }
}

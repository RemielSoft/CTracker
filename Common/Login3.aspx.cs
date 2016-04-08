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
    public partial class Login3 : System.Web.UI.Page
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
                if (this.Session["nertSLogin"] != null)
                {
                    // Verify and remove participant session variable
                    if (this.Session["nertPLogin"] != null)
                    {
                        this.Session.Remove("nertPLogin");
                    }

                    Response.Redirect("~/Sponsor/Sponsor.aspx", true);
                }

                if (this.Session["nertPLogin"] != null)
                {
                    // Verify and remove sponsor session variable
                    if (this.Session["nertSLogin"] != null)
                    {
                        this.Session.Remove("nertSLogin");
                    }

                    Response.Redirect("~/Participant/Participant.aspx", true);
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            OracleConnection conn = null;

            try
            {
                conn = new OracleConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["NertAppOracleConnectionString"].ToString());

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

                // Set Participant Session Variable
                SetParticipant(txtSSN.Text.ToString().Trim(), txtPassword.Text.ToString().Trim(), conn);

                // Set Enrollment Session Variable
                SetEnrollment(conn);

                // Set User Name Session Variable
                SetUserHeader(conn);

                //Set Sponsor Session Variable and redirect
                if (VerifySponsor(txtSSN.Text.ToString().Trim(), txtPassword.Text.ToString().Trim(), conn))
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
                        Response.Redirect("~/Sponsor/Sponsor.aspx", true);
                    }
                }
                else
                {
                    //Username & Password combo not correct
                    lblMsg.Text = "Invalid login information.";
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


        private bool VerifySponsor(string username, string password, OracleConnection conn)
        {
            OracleDataAdapter adapter = null;
            DataSet ds = new DataSet();

            try
            {
                string sql = @" Select  ERID, SSNUM, EENUM
 	                                        From    JOB
                                            WHERE   SSNUM   = :SSN
                                            AND     EENUM   = :EENUM";

                
                adapter = new OracleDataAdapter(sql, conn);

                adapter.SelectCommand.Parameters.Add(":SSN", OracleDbType.Varchar2, 9).Value = txtSSN.Text.ToString().Trim();
                adapter.SelectCommand.Parameters.Add(":EENUM", OracleDbType.Varchar2, 9).Value = txtPassword.Text.ToString().Trim();
                                
                // Fill DataSet
                adapter.Fill(ds);

                if (ds != null && ds.Tables.Count > 0
                    && ds.Tables[0].Rows.Count >= 1)
                {
                    // Remove sponsor session value
                    if (this.Session["nertSLogin"] != null)
                    {
                        this.Session.Remove("nertSLogin");
                    }
                    this.Session.Add("nertSLogin", ds);

                    //Delete Sponsor Session Variable if password is only 4 characters long
                    if (password.Length == 4)
                    {
                        this.Session.Remove("nertSLogin");
                    }

                    return true;
                }
                else
                {
                    return false;
                }
                throw new Exception("error testing");
            }
            catch (System.Threading.ThreadAbortException)
            {
                return false;
            }
            catch (System.Exception exp)
            {
                throw exp;
            }
            finally
            {
                adapter = null;
            }
        }

        private void SetParticipant(string username, string password, OracleConnection conn)
        {
            OracleDataAdapter adapter = null;
            DataSet ds = new DataSet();

            string sql = @" Select  ERID, SSNUM, EENUM
 	                                From    JOB
                                    WHERE   SSNUM   = :SSN
                                    AND     EENUM   = :EENUM";

            conn = new OracleConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["NertAppOracleConnectionString"].ToString());
            adapter = new OracleDataAdapter(sql, conn);

            adapter.SelectCommand.Parameters.Add(":SSN", OracleDbType.Varchar2, 9).Value = txtSSN.Text.ToString().Trim();
            adapter.SelectCommand.Parameters.Add(":EENUM", OracleDbType.Varchar2, 9).Value = txtPassword.Text.ToString().Trim();
                        
            // Fill DataSet
            adapter.Fill(ds);

            if (ds != null && ds.Tables.Count > 0
                && ds.Tables[0].Rows.Count >= 1)
            {
                // Remove participant session value
                if (this.Session["nertPLogin"] != null)
                {
                    this.Session.Remove("nertPLogin");
                }

                this.Session.Add("nertPLogin", ds);

                // Remove participant plan session value
                if (this.Session["nertPPlan"] != null)
                {
                    this.Session.Remove("nertPPlan");
                }
            }
        }

        private void SetEnrollment(OracleConnection conn)
        {
            OracleDataAdapter adapter = null;
            DataSet ds = new DataSet();

            //            string sql = @" Select  ALLOPCT
            // 	                                From    RPTEEACCT1
            //                                    WHERE   SSNUM   = :SSN";

            string sql = @" Select  ALLOSETID
 	                                From    PARTALLOMSTR
                                    WHERE   SSNUM   = :SSN";

            adapter = new OracleDataAdapter(sql, conn);

            adapter.SelectCommand.Parameters.Add(":SSN", OracleDbType.Varchar2, 9).Value = txtSSN.Text.ToString().Trim();

            // Fill DataSet
            adapter.Fill(ds);

            if (this.Session["Enrollment"] != null)
            {
                this.Session.Remove("Enrollment");
            }

            if (ds != null && ds.Tables.Count > 0
                && ds.Tables[0].Rows.Count > 0)
            {
                // Set enrollment session value
                this.Session.Add("Enrollment", "False");
            }
            else
            {
                this.Session.Add("Enrollment", "True");
            }
        }

        private void SetUserHeader(OracleConnection conn)
        {
            OracleDataAdapter adapter = null;            
            DataSet ds = new DataSet();

            string sql = @"  select rtrim(concat(concat(firstnam, ' '), lastnam)) as NAME
 	                                From    PERSON
                                    WHERE   SSNUM   = :SSN";

            adapter = new OracleDataAdapter(sql, conn);

            adapter.SelectCommand.Parameters.Add(":SSN", OracleDbType.Varchar2, 9).Value = txtSSN.Text.ToString().Trim();
                        
            // Fill DataSet
            adapter.Fill(ds);
                        
            if (this.Session["Name"] != null)
            {
                this.Session.Remove("Name");
            }

            if (ds != null && ds.Tables.Count > 0
                && ds.Tables[0].Rows.Count > 0)
            {
                // Set enrollment session value
                this.Session.Add("Name", ds.Tables[0].Rows[0]["NAME"].ToString());
            }
        }
    }
}

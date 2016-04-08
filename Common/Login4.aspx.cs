using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;
using System.Data;

namespace RetirementFunds.Common
{
    public partial class Login4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verify if HTTPS 
            //if (bool.Parse(System.Web.Configuration.WebConfigurationManager.AppSettings["verifyHttpsOnLogin"].ToString())
            //    && this.Request.Url.ToString().ToLower().IndexOf("https") == -1)
            //{
            //    Response.Redirect(this.Request.Url.ToString().Replace("http", "https"), true);
            //}
            //else
            //{
            //    if (this.Session["nertSLogin_SSN"] != null)
            //    {
            //        // Verify and remove participant session variable
            //        if (this.Session["nertPLogin_SSN"] != null)
            //        {
            //            this.Session.Remove("nertPLogin_SSN");
            //        }

            //        Response.Redirect("~/Sponsor/Sponsor.aspx", true);
            //    }

            //    if (this.Session["nertPLogin_SSN"] != null)
            //    {
            //        // Verify and remove sponsor session variable
            //        if (this.Session["nertSLogin_SSN"] != null)
            //        {
            //            this.Session.Remove("nertSLogin_SSN");
            //        }

            //        Response.Redirect("~/Participant/Participant.aspx", true);
            //    }
            //}
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

                int i = 0;
                conn.Open();
                // Set Participant Session Variable
                //SetParticipant(txtSSN.Text.ToString().Trim(), txtPassword.Text.ToString().Trim(), conn);
                //-----------------------------------------------------------------------
                string sql = " Select  Count(*) From JOB WHERE SSNUM   = '" + txtSSN.Text.ToString().Trim();
                sql += "' AND EENUM = '" + txtPassword.Text.ToString().Trim() + "'";

                OracleCommand cmd = new OracleCommand(sql, conn);
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
                        //TOD: We need to remove the belwo comment  for both the line

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
                this.Session["SSNUM"] = txtSSN.Text.ToString().Trim();
                if (this.Session["nertSLogin_SSN"] != null || this.Session["nertPLogin_SSN"] != null)
                {
                    if (this.Session["Enrollment"] != null && this.Session["Enrollment"].ToString() == "True")
                    {
                        Response.Redirect("../Participant/Enrollment.aspx", true);
                        
                    }
                    if (txtPassword.Text.ToString().Trim().Length == 4)
                    {
                        Response.Redirect("../Participant/Participant.aspx", true);
                        //Temporary to get the Sponser Pages
                        //Response.Redirect("../Sponsor/Sponsor.aspx", true);
                    }
                    else
                    {
                      
                        Response.Redirect("../Sponsor/Sponsor.aspx", true);
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

            string sql = " Select  Count(*) From JOB WHERE   SSNUM   = '" + txtSSN.Text.ToString().Trim();
                sql += "' AND EENUM = '" + txtPassword.Text.ToString().Trim() + "'";

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

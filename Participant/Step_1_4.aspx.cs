using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Oracle.DataAccess.Client;

namespace RetirementFunds.Participant
{
    public partial class Step_1_4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nertPLogin"] == null)
            {
                Response.Redirect("~/Common/Login.aspx", true);
            }
            else
            {
                if (!this.IsPostBack)
                {
                    this.PopulateUI();
                }
            }
        }

        private void PopulateUI()
        {
            OracleDataAdapter adapter = null;
            OracleConnection conn = null;
            DataSet ds = null;
            DataSet dsName = new DataSet();
            DataSet dsJob = new DataSet();

            try
            {
                // Verify is plan is already selected
                if (this.Session["nertPLogin"] != null)
                {
                    ds = (DataSet)this.Session["nertPLogin"];

                    if (ds != null
                        && ds.Tables.Count > 0)
                    {
                        string sql = @" select  * 
                                        from    person 
                                        where   ssnum = :SSN ";

                        conn = new OracleConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["NertAppOracleConnectionString"].ToString());
                        adapter = new OracleDataAdapter(sql, conn);

                        adapter.SelectCommand.Parameters.Add(":SSN", OracleDbType.Varchar2, 9).Value = ds.Tables[0].Rows[0]["SSNUM"].ToString();

                        // Open connection
                        conn.Open();

                        // Fill DataSet
                        adapter.Fill(dsName);

                        // Close Connection
                        conn.Close();

                        if (dsName != null && dsName.Tables.Count > 0
                            && dsName.Tables[0].Rows.Count > 0)
                        {
                            // Setting information from Person table 
                            lblName.Text = dsName.Tables[0].Rows[0]["firstnam"].ToString() + " " + dsName.Tables[0].Rows[0]["midinitnam"].ToString() + dsName.Tables[0].Rows[0]["lastnam"].ToString();
                            txtAddr1.Text = dsName.Tables[0].Rows[0]["street1addr"].ToString();
                            txtAddr2.Text = dsName.Tables[0].Rows[0]["street2addr"].ToString();
                            txtCity.Text = dsName.Tables[0].Rows[0]["cityaddr"].ToString();
                            txtState.Text = dsName.Tables[0].Rows[0]["stateaddr"].ToString();
                            txtZip.Text = dsName.Tables[0].Rows[0]["zipaddr"].ToString();
                            txtBirthDate.Text = Convert.ToDateTime(dsName.Tables[0].Rows[0]["birthdate"].ToString()).ToShortDateString();

                        }

                        //Setting information from RPTEE1
                        sql = " select * from rptee1 where ssnum = :SSN";
                        adapter = new OracleDataAdapter(sql, conn);

                        adapter.SelectCommand.Parameters.Add(":SSN", OracleDbType.Varchar2, 9).Value = ds.Tables[0].Rows[0]["SSNUM"].ToString();

                        // Open connection
                        conn.Open();

                        // Fill DataSet
                        adapter.Fill(dsJob);

                        // Close Connection
                        conn.Close();

                        if (dsJob != null && dsJob.Tables.Count > 0
                            && dsJob.Tables[0].Rows.Count > 0)
                        {
                            // Setting information from Job table
                            txtHireDate.Text = Convert.ToDateTime(dsJob.Tables[0].Rows[0]["hiredate"].ToString()).ToShortDateString();
                        }

                        if (Session["nertPPlan"] != null)
                        {
                            DataSet dsPlan = (DataSet)Session["nertPPlan"];
                            lblPlanName.Text = dsPlan.Tables[0].Rows[0]["plannam"].ToString();
                        }
                    }
                }
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
                ds = null;
                conn = null;
                adapter = null;
            }
        }
    }
}

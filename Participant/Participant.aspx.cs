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
    public partial class Participant : System.Web.UI.Page
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

                    DataSet userPlan = (DataSet)Session["nertPPlan"];
                    Session["userPlan"] = userPlan.Tables[0].Rows[0]["planid"].ToString();
                }
            }
        }

        private void PopulateUI()
        {
            OracleDataAdapter   adapter = null;
            OracleConnection    conn    = null;
            DataSet             ds      = null;
            DataSet             dsTemp  = new DataSet();

            try
            {
                // Verify is plan is already selected
                if (this.Session["nertPPlan"] != null)
                {
                    ds = (DataSet)this.Session["nertPPlan"];
                    this.pCurrentPlan.Visible   = true;
                    this.ddlPlans.Visible       = false;
                    this.pCurrentPlan.InnerHtml = "Current Plan: " + ds.Tables[0].Rows[0]["plannam"].ToString();
                }
                else
                {
                    ds = (DataSet)this.Session["nertPLogin"];

                    if (ds != null
                        && ds.Tables.Count > 0)
                    {
                        string sql = @" select  planid,plannam 
                                        from    planstat 
                                        where   planid not like 'Z%' 
                                        and     planid in (select planid from planee where ssnum = :SSN)";

                        conn = new OracleConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["NertAppOracleConnectionString"].ToString());
                        adapter = new OracleDataAdapter(sql, conn);

                        adapter.SelectCommand.Parameters.Add(":SSN", OracleDbType.Varchar2, 9).Value = ds.Tables[0].Rows[0]["SSNUM"].ToString();

                        // Open connection
                        conn.Open();

                        // Fill DataSet
                        adapter.Fill(dsTemp);

                        // Close Connection
                        conn.Close();

                        if (dsTemp != null && dsTemp.Tables.Count > 0
                            && dsTemp.Tables[0].Rows.Count == 1)
                        {
                            // Remove participant plan session value
                            if (this.Session["nertPPlan"] != null)
                            {
                                this.Session.Remove("nertPPlan");
                            }

                            this.Session.Add("nertPPlan", dsTemp);

                            this.pCurrentPlan.Visible   = true;
                            this.ddlPlans.Visible       = false;
                            this.pCurrentPlan.InnerHtml = "Current Plan: " + dsTemp.Tables[0].Rows[0]["plannam"].ToString();
                        }
                        else
                        {
                            this.pCurrentPlan.Visible   = false;
                            this.ddlPlans.Visible       = true;
                            ddlPlans.DataSource         = dsTemp;
                            ddlPlans.DataTextField      = "plannam";
                            ddlPlans.DataValueField     = "planid";
                            ddlPlans.DataBind();

                            ddlPlans.Items.Insert(0, new ListItem("Select Plan", ""));
                        }
                    }
                }

                lblUserHeader.Text = this.Session["Name"].ToString();
                divPlanInformation.Visible = true;
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

        protected void ddlPlans_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet     ds = new DataSet();
            DataTable   dt = new DataTable();
            DataRow     dr = null;
            dt.Columns.Add("planid", typeof(string));
            dt.Columns.Add("plannam", typeof(string));

            if (ddlPlans.SelectedIndex != -1)
            {
                dr = dt.NewRow();

                dr["planid"]    = ddlPlans.Items[ddlPlans.SelectedIndex].Value;
                dr["plannam"]   = ddlPlans.Items[ddlPlans.SelectedIndex].Text;

                dt.Rows.Add(dr);
                ds.Tables.Add(dt);

                // Remove participant plan session value
                if (this.Session["nertPPlan"] != null)
                {
                    this.Session.Remove("nertPPlan");
                }

                this.Session.Add("nertPPlan", ds);
            }
        }
    }
}

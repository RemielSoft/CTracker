using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using Oracle.DataAccess.Client;

namespace RetirementFunds.Participant
{
    public partial class NertXfr : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nertPLogin"] == null)
            {
                Response.Redirect("~/Common/Login.aspx", true);
            }

            if (!IsPostBack)
            {
                //Set a default plan if not already selected
                OracleDataAdapter adapter = null;
                OracleConnection conn = null;
                DataSet ds = null;
                DataSet dsTemp = new DataSet();

                try
                {
                    // Verify is plan is already selected
                    if (this.Session["nertPPlan"] != null)
                    {
                        ds = (DataSet)this.Session["nertPLogin"];

                        if (ds != null
                            && ds.Tables.Count > 0)
                        {
                            string sql = @" select  planid,plannam 
                                        from    planstat 
                                        where   planid not like 'Z%' 
                                        and     planid in (select planid from planee where ssnum = :SSN)";
                            //and     rownum <= 1";

                            conn = new OracleConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["NertAppOracleConnectionString"].ToString());
                            adapter = new OracleDataAdapter(sql, conn);

                            adapter.SelectCommand.Parameters.Add(":SSN", OracleDbType.Varchar2, 9).Value = ds.Tables[0].Rows[0]["SSNUM"].ToString();

                            // Open connection
                            conn.Open();

                            // Fill DataSet
                            adapter.Fill(dsTemp);

                            // Close Connection
                            conn.Close();

                            if (dsTemp != null && dsTemp.Tables.Count > 0 && !IsPostBack)
                            {
                                //Populate DDLPLans
                                ddlPlans.DataSource = dsTemp;
                                ddlPlans.DataTextField = "plannam";
                                ddlPlans.DataValueField = "planid";
                                ddlPlans.DataBind();

                                if (dsTemp.Tables[0].Rows.Count > 1)
                                {
                                    ddlPlans.Items.Insert(0, new ListItem("Select Plan", ""));
                                    litOr.Visible = true;
                                }
                                else
                                {
                                    litOr.Visible = false;
                                    ddlPlans.Visible = false;
                                }
                            }

                            //Only use the first row
                            for (int i = 1; i < dsTemp.Tables[0].Rows.Count; i++)
                            {
                                dsTemp.Tables[0].Rows.RemoveAt(i);
                            }
                            this.Session.Add("nertPPlan", dsTemp);

                            lblPlanName.Text = dsTemp.Tables[0].Rows[0][1].ToString();
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

        protected void ddlPlans_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPlans.SelectedItem.Text != "Select Plan")
            {
                //Reset Stored Plan in the Session
                DataSet ds = (DataSet)Session["nertPPlan"];
                ds.Tables[0].Rows.Clear();
                DataRow dr = ds.Tables[0].NewRow();
                dr[0] = ddlPlans.SelectedItem.Value;
                dr[1] = ddlPlans.SelectedItem.Text;
                ds.Tables[0].Rows.Add(dr);

                Session["nertPPlan"] = ds;

                lblPlanName.Text = ds.Tables[0].Rows[0][1].ToString();

                ddlPlans.SelectedIndex = 0;
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("NertXfr_Step2.aspx");
        }
    }
}

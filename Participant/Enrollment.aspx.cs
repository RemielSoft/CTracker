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
    public partial class Enrollment : System.Web.UI.Page
    {
        protected string planDocument = string.Empty;
        //protected string planName = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet dsPlan = null;
            OracleDataAdapter adapter = null;
            OracleConnection conn = null;
            DataSet ds = null;
            DataSet dsTemp = new DataSet();

            if (this.Session["nertPLogin"] == null)
            {
                Response.Redirect("~/Common/Login.aspx", true);
            }
            else if (this.Session["nertPPlan"] == null)
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
                        // There is only 1 plan for this user
                        if (this.Session["nertPPlan"] != null)
                        {
                            this.Session.Remove("nertPPlan");
                        }

                        this.Session.Add("nertPPlan", dsTemp);

                        this.pCurrentPlan.Visible = true;
                        this.ddlPlans.Visible = false;
                        this.pCurrentPlan.InnerHtml = "Current Plan: " + dsTemp.Tables[0].Rows[0]["plannam"].ToString();

                        dsPlan = (DataSet)Session["nertPPlan"];
                        planDocument = dsPlan.Tables[0].Rows[0]["planid"].ToString();
                    }
                    else if (dsTemp != null && dsTemp.Tables.Count > 0
                        && dsTemp.Tables[0].Rows.Count > 1)
                    {
                        // There are more than 1 plans for this user
                        this.pCurrentPlan.Visible = false;
                        this.ddlPlans.Visible = true;
                        ddlPlans.DataSource = dsTemp;
                        ddlPlans.DataTextField = "plannam";
                        ddlPlans.DataValueField = "planid";
                        ddlPlans.DataBind();

                        ddlPlans.Items.Insert(0, new ListItem("Select Plan", ""));
                    }
                    else
                    {
                        //There are no plan
                    }
                    
                    //planName = dsPlan.Tables[0].Rows[0]["plannam"].ToString();
                }
            }
            else if (Session["nertPPlan"] != null)
            {
                dsPlan = (DataSet)Session["nertPPlan"];
                planDocument = dsPlan.Tables[0].Rows[0]["planid"].ToString();
                //planName = dsPlan.Tables[0].Rows[0]["plannam"].ToString();
            }
        }

        protected void ddlPlans_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add("planid", typeof(string));
            dt.Columns.Add("plannam", typeof(string));

            if (ddlPlans.SelectedIndex != -1)
            {
                dr = dt.NewRow();

                dr["planid"] = ddlPlans.Items[ddlPlans.SelectedIndex].Value;
                dr["plannam"] = ddlPlans.Items[ddlPlans.SelectedIndex].Text;

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

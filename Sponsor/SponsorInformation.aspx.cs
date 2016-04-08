using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using Oracle.DataAccess.Client;

namespace RetirementFunds.Sponsor
{
    public partial class SponsorInformation : System.Web.UI.Page
    {
        protected string planDocument = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nertSLogin"] == null)
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

            if (Session["nertPPlan"] != null)
            {
                planDocument                = ((DataSet)Session["nertPPlan"]).Tables[0].Rows[0]["planid"].ToString();
                lblPlaneNameHeader.Text     = ((DataSet)Session["nertPPlan"]).Tables[0].Rows[0][1].ToString();
                lblUserHeader.Text = this.Session["Name"].ToString();
                divPlanInformation.Visible = true;

                Session["userPlan"] = planDocument; //planDocument.Tables[0].Rows[0]["planid"].ToString();
            }
        }

        protected void btnGetReport_Click(object sender, EventArgs e)
        {
            if (Session["TempSSN"] != null)
            {
                Session.Remove("TempSSN");
            }
            Session.Add("TempSSN", this.txtSSN.Text.ToString());

            this.Page.ClientScript.RegisterStartupScript(typeof(string), "openreport", "<script type='text/javascript'>window.open('/Reports/ReportViewier.aspx?rname=websumacctpart_oneparticipant.rpt&from=s&pid=0&sid=1&ssnum=" + txtSSN.Text + "');</script>");
        }

        private void PopulateUI()
        {
            OracleDataAdapter adapter = null;
            OracleConnection conn = null;
            DataSet ds = null;
            DataSet dsTemp = new DataSet();

            try
            {
                ds = (DataSet)this.Session["nertSLogin"];

                if (ds != null
                    && ds.Tables.Count > 0)
                {
                    string sql = @" select  planid,plannam 
                                        from    planstat 
                                        where   planid not like 'Z%' 
                                        and     planid in (select planid from planee where ssnum = :SSN)";

//                    string sql = @" select  planid,plannam 
//                                        from    planstat 
//                                        where   planid in (select distinct planid from planee where ssnum = :SSN)";

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
                        ddlPlans.DataSource     = dsTemp;
                        ddlPlans.DataTextField  = "plannam";
                        ddlPlans.DataValueField = "planid";
                        ddlPlans.DataBind();

                        if (dsTemp.Tables[0].Rows.Count > 1)
                        {
                            ddlPlans.Items.Insert(0, new ListItem("Select Plan", ""));
                        }

                        // If planid exists then select it
                        //if (Session["nertPPlan"] != null
                        //    && ddlPlans.Items.FindByValue(((DataSet)Session["nertPPlan"]).Tables[0].Rows[0]["planid"].ToString()) != null)
                        //{
                        //    ddlPlans.Items.FindByValue(((DataSet)Session["nertPPlan"]).Tables[0].Rows[0]["planid"].ToString()).Selected = true;
                        //}
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

                planDocument                = ((DataSet)Session["nertPPlan"]).Tables[0].Rows[0]["planid"].ToString();
                lblPlaneNameHeader.Text     = ((DataSet)Session["nertPPlan"]).Tables[0].Rows[0][1].ToString();
                divPlanInformation.Visible  = true;

                PopulateUI();
            }
        }
    }
}

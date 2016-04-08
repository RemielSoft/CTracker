using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Oracle.DataAccess.Client;

namespace RetirementFunds.Participant
{
    public partial class AccountBalance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nertPLogin"] == null)
            {
                Response.Redirect("~/Common/Login.aspx", true);
            }

            if (Session["nertPPlan"] != null)
            {
                System.Data.DataSet dsTemp = (System.Data.DataSet)this.Session["nertPPlan"];
                lblPlanNameHeader.Text = dsTemp.Tables[0].Rows[0][1].ToString();
                divPlanInformation.Visible = true;
            }
            
            PopulateUI();
        }

        private void PopulateUI()
        {
            OracleDataAdapter   adapter1    = null;
            OracleDataAdapter   adapter2    = null;
            OracleDataAdapter   adapter3    = null;
            OracleConnection    conn        = null;
            DataSet             ds1         = new DataSet();
            DataSet             ds2         = new DataSet();
            DataSet             ds3         = new DataSet();
            DataSet             dsTemp      = null;

            try
            {
                dsTemp = (DataSet)Session["nertPLogin"];

                string sql1 = @"SELECT  PLANNAM, FIRSTNAM,
 				                        LASTNAM, SNUM, ACCTNAM, ACCTID, 
				                        FUNDID, NUMUNITS, FUNDVAL, FUNDVALDATE, BALANCE 
                                FROM    NERT 
				                WHERE   ACCTNAM Not Like 'LOAN%' 
                                AND     SNUM = :SSN
                                AND     NUMUNITS > 0 
                                AND     BALANCE > 0 
                                ORDER BY FUNDID";
                string sql2 = @"SELECT  SNUM, FUNDID,FUNDVALDATE, SUM(BALANCE) AS FUNDBAL FROM NERT 
				                WHERE   ACCTNAM Not Like 'LOAN%' 
                                AND     SNUM = :SSN 
                                AND     NUMUNITS > 0 
				                GROUP BY SNUM, FUNDID, FUNDVALDATE";
                string sql3 = @"SELECT  SNUM, 
                                        SUM(BALANCE) AS SUMBAL 
                                FROM    NERT 
                                WHERE   ACCTNAM Not Like 'LOAN%' 
                                AND     SNUM = :SSN  
                                AND     NUMUNITS > 0 
                                GROUP BY SNUM";

                conn        = new OracleConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["NertAppOracleConnectionString"].ToString());
                adapter1    = new OracleDataAdapter(sql1, conn);
                adapter2    = new OracleDataAdapter(sql2, conn);
                adapter3    = new OracleDataAdapter(sql3, conn);

                adapter1.SelectCommand.Parameters.Add(":SSN", OracleDbType.Varchar2, 9).Value = dsTemp.Tables[0].Rows[0]["SSNUM"].ToString();
                adapter2.SelectCommand.Parameters.Add(":SSN", OracleDbType.Varchar2, 9).Value = dsTemp.Tables[0].Rows[0]["SSNUM"].ToString();
                adapter3.SelectCommand.Parameters.Add(":SSN", OracleDbType.Varchar2, 9).Value = dsTemp.Tables[0].Rows[0]["SSNUM"].ToString();

                // Open connection
                conn.Open();

                // Fill DataSet
                adapter1.Fill(ds1);
                adapter2.Fill(ds2);
                adapter3.Fill(ds3);

                // Close Connection
                conn.Close();

                if (ds1 != null && ds1.Tables.Count > 0
                    && ds1.Tables[0].Rows.Count == 0)
                {
                    this.trNoRecordsFound.Visible   = true;
                    this.trData.Visible             = false;
                }
                else if (ds1 != null && ds1.Tables.Count > 0
                    && ds1.Tables[0].Rows.Count > 0)
                {
                    this.trNoRecordsFound.Visible   = false;
                    this.trData.Visible             = true;

                    this.spanName.InnerHtml             = ds1.Tables[0].Rows[0]["FIRSTNAM"].ToString() + " " + ds1.Tables[0].Rows[0]["LASTNAM"].ToString();
                    this.spanSSN.InnerHtml              = ds1.Tables[0].Rows[0]["SNUM"].ToString();
                    this.spanNert1SumBalance.InnerHtml  = (ds3.Tables[0].Rows[0]["SUMBAL"].ToString().Trim().Length > 0 ? String.Format("{0:#,###.##}", Double.Parse(ds3.Tables[0].Rows[0]["SUMBAL"].ToString())) : "");
                    this.spanNert2SumBalance.InnerHtml  = (ds3.Tables[0].Rows[0]["SUMBAL"].ToString().Trim().Length > 0 ? String.Format("{0:#,###.##}", Double.Parse(ds3.Tables[0].Rows[0]["SUMBAL"].ToString())) : "");

                    HtmlTableRow tr;
                    HtmlTableCell tc1;
                    HtmlTableCell tc2;
                    HtmlTableCell tc3;
                    HtmlTableCell tc4;

                    #region Header Row
                    tr = new HtmlTableRow();
                    tc1 = new HtmlTableCell();
                    tc2 = new HtmlTableCell();
                    tc3 = new HtmlTableCell();
                    tc4 = new HtmlTableCell();

                    tc1.Width = "50%";
                    tc1.Align = "center";
                    tc1.Controls.Add(new LiteralControl("<font face=\"Arial, Helvetica, sans-serif\" size=\"-2\" color=\"Maroon\">Account Name</font>"));
                    tr.Cells.Add(tc1);

                    tc2.Align = "left";
                    tc2.Controls.Add(new LiteralControl("<font face=\"Arial, Helvetica, sans-serif\" size=\"-2\" color=\"Maroon\">Fund ID</font>"));
                    tr.Cells.Add(tc2);

                    tc3.Width = "30%";
                    tc3.Align = "center";
                    tc3.Controls.Add(new LiteralControl("<font face=\"Arial, Helvetica, sans-serif\" size=\"-2\" color=\"Maroon\">As Of</font>"));
                    tr.Cells.Add(tc3);

                    tc4.Align = "right";
                    tc4.Controls.Add(new LiteralControl("<font face=\"Arial, Helvetica, sans-serif\" size=\"-2\" color=\"Maroon\">Balance</font>"));
                    tr.Cells.Add(tc4);

                    tblNert1.Rows.Add(tr);
                    #endregion

                    #region Data Row Nert 1 query
                    for (int idx = 0; idx < ds1.Tables[0].Rows.Count; idx++)
                    {
                        tr = new HtmlTableRow();
                        tc1 = new HtmlTableCell();
                        tc2 = new HtmlTableCell();
                        tc3 = new HtmlTableCell();
                        tc4 = new HtmlTableCell();

                        tc1.Width = "50%";
                        tc1.Controls.Add(new LiteralControl("<b><font face=\"Arial, Helvetica, sans-serif\" size=\"-2\">" + ds1.Tables[0].Rows[idx]["ACCTNAM"].ToString() + "</font></b>"));
                        tr.Cells.Add(tc1);

                        tc2.Controls.Add(new LiteralControl("<b><font face=\"Arial, Helvetica, sans-serif\" size=\"-2\">" + ds1.Tables[0].Rows[idx]["FUNDID"].ToString() + "</font></b>"));
                        tr.Cells.Add(tc2);

                        tc3.Width = "30%";
                        tc3.Align = "center";
                        tc3.Controls.Add(new LiteralControl("<b><font face=\"Arial, Helvetica, sans-serif\" size=\"-2\">" + (ds1.Tables[0].Rows[idx]["FUNDVALDATE"].ToString().Trim().Length > 0 ? DateTime.Parse(ds1.Tables[0].Rows[idx]["FUNDVALDATE"].ToString()).ToString("dd-MMM-yy") : "") + "</font></b>"));
                        tr.Cells.Add(tc3);

                        tc4.Align = "right";
                        tc4.Controls.Add(new LiteralControl("<b><font face=\"Arial, Helvetica, sans-serif\" size=\"-2\">$" + (ds1.Tables[0].Rows[idx]["BALANCE"].ToString().Trim().Length > 0 ? String.Format("{0:#,###.##}",Double.Parse(ds1.Tables[0].Rows[idx]["BALANCE"].ToString())) : "") + "</font></b>"));
                        tr.Cells.Add(tc4);

                        tblNert1.Rows.Add(tr);
                    }
                    #endregion

                    #region Data Row Nert 2 query
                    for (int idx = 0; idx < ds2.Tables[0].Rows.Count; idx++)
                    {
                        tr = new HtmlTableRow();
                        tc1 = new HtmlTableCell();
                        tc2 = new HtmlTableCell();
                        tc3 = new HtmlTableCell();
                        tc4 = new HtmlTableCell();

                        tc1.Width = "67%";
                        tc1.Align = "right";
                        tc1.Controls.Add(new LiteralControl("<b><font face=\"Arial, Helvetica, sans-serif\" size=\"-2\" color=\"Maroon\">Total for Fund:</font></b>"));
                        tr.Cells.Add(tc1);

                        tc2.Controls.Add(new LiteralControl("<b><font face=\"Arial, Helvetica, sans-serif\" size=\"-2\">" + ds2.Tables[0].Rows[idx]["FUNDID"].ToString() + "</font></b>"));
                        tr.Cells.Add(tc2);

                        tc3.Width = "30%";
                        tc3.Align = "center";
                        tc3.Controls.Add(new LiteralControl("<b><font face=\"Arial, Helvetica, sans-serif\" size=\"-2\">" + (ds2.Tables[0].Rows[idx]["FUNDVALDATE"].ToString().Trim().Length > 0 ? DateTime.Parse(ds2.Tables[0].Rows[idx]["FUNDVALDATE"].ToString()).ToString("dd-MMM-yy") : "") + "</font></b>"));
                        tr.Cells.Add(tc3);

                        tc4.Align = "right";
                        tc4.Controls.Add(new LiteralControl("<b><font face=\"Arial, Helvetica, sans-serif\" size=\"-2\">$" + (ds2.Tables[0].Rows[idx]["FUNDBAL"].ToString().Trim().Length > 0 ? String.Format("{0:#,###.##}", Double.Parse(ds2.Tables[0].Rows[idx]["FUNDBAL"].ToString())) : "") + "</font></b>"));
                        tr.Cells.Add(tc4);

                        tblNert2.Rows.Add(tr);
                    }
                    #endregion
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

                conn        = null;
                adapter1    = null;
                adapter2    = null;
                adapter3    = null;
                dsTemp      = null;
                ds1         = null;
                ds2         = null;
                ds3         = null;
            } 
        }
    }
}

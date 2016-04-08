using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Text;
using Oracle.DataAccess.Client;
using System.Drawing;
using System.Web.Configuration;

using RetirementFunds.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace RetirementFunds.Participant
{
    public partial class NertAlloc_Step2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Display selected plan 
                if (this.Session["nertPPlan"] != null)
                {
                    System.Data.DataSet dsPlan = (System.Data.DataSet)this.Session["nertPPlan"];
                    lblPlaneNameHeader.Text = dsPlan.Tables[0].Rows[0][1].ToString();
                    lblUserHeader.Text = this.Session["Name"].ToString();
                    divPlanInformation.Visible = true;
                }

                OracleDataAdapter   adapter             = null;
                OracleDataAdapter   adapterPortfolio    = null;
                OracleConnection    conn                = null;
                DataSet             dsTemp              = new DataSet();
                DataSet             dsPortfolio         = new DataSet();
                
                try
                {
                    DataSet dsLogin = (DataSet)this.Session["nertPLogin"];
                    DataSet dsPPlan = (DataSet)Session["nertPPlan"];
                    int selectedFund = this.GetSelectedFund(dsLogin.Tables[0].Rows[0]["SSNUM"].ToString()
                                                            , dsPPlan.Tables[0].Rows[0][0].ToString() );

                    //Query "q_Get_plans_setup"
                    StringBuilder sbGetPlansSetup = new StringBuilder();
                    sbGetPlansSetup.Append("(select ");
                    sbGetPlansSetup.Append("sum(RPTEEACCT1.ENDBALAMT) as ENDBALAM, FUNDID, RPTPLANACCT1.FUNDNAM,RPTEEACCT1.ALLOPCT, INVPRODMSTR.INVPRODNAM , PERSON.FIRSTNAM, ");
                    sbGetPlansSetup.Append("PERSON.LASTNAM from ");
                    sbGetPlansSetup.Append("RPTPLANACCT1 INNER JOIN RPTEEACCT1  ON ((RPTPLANACCT1.PLANID = RPTEEACCT1.PLANID) AND (RPTPLANACCT1.YRENDDATE=RPTEEACCT1.YRENDDATE) ");
                    sbGetPlansSetup.Append("AND (RPTPLANACCT1.ACCTID = RPTEEACCT1.ACCTID) AND (RPTPLANACCT1.ADMINID = RPTEEACCT1.ADMINID) ");
                    sbGetPlansSetup.Append("AND (RPTPLANACCT1.RPTNAM = RPTEEACCT1.RPTNAM)) INNER JOIN RPTEE1 ON ");
                    sbGetPlansSetup.Append("((RPTEEACCT1.PLANID = RPTEE1.PLANID) AND (RPTEEACCT1.YRENDDATE = RPTEE1.YRENDDATE) AND (RPTEEACCT1.SSNUM = RPTEE1.SSNUM) ");
                    sbGetPlansSetup.Append("AND (RPTEEACCT1.ADMINID = RPTEE1.ADMINID) AND (RPTEEACCT1.RPTNAM = RPTEE1.RPTNAM)) ");
                    sbGetPlansSetup.Append("LEFT OUTER JOIN INVPRODMSTR ON RPTEEACCT1.INVPRODID = INVPRODMSTR.INVPRODID ");
                    sbGetPlansSetup.Append("INNER JOIN PERSON ON RPTEE1.SSNUM = PERSON.SSNUM ");
                    sbGetPlansSetup.Append("AND RPTEE1.SSNUM = '" + dsLogin.Tables[0].Rows[0]["SSNUM"].ToString() + "' ");
                    sbGetPlansSetup.Append("AND RPTPLANACCT1.PLANID = '" + dsPPlan.Tables[0].Rows[0][0].ToString() + "' ");
                    sbGetPlansSetup.Append("Group by RPTPLANACCT1.FUNDNAM ,RPTEEACCT1.ALLOPCT, INVPRODMSTR.INVPRODNAM , PERSON.FIRSTNAM, PERSON.LASTNAM , FUNDID ");
                    sbGetPlansSetup.Append("ORDER BY RPTPLANACCT1.FUNDNAM)");

                    //Query "q_Get_zero_funds"
                    StringBuilder sbGetZeroFunds = new StringBuilder();
                    sbGetZeroFunds.Append("select distinct(Fundid) , FUNDNAM from rptplanacct1 ");
                    sbGetZeroFunds.Append("where  planid = '" + dsPPlan.Tables[0].Rows[0][0].ToString() + "' and fundid != 'FIDELITY' ");
                    sbGetZeroFunds.Append("AND FUNDID !='20THCENT' AND FUNDID !='INVESTMNT' AND FUNDID !='LOAN' ");
                    sbGetZeroFunds.Append("and fundid not in ");
                    sbGetZeroFunds.Append("(SELECT distinct(RPTPLANACCT1.FUNDID) FROM ");
                    sbGetZeroFunds.Append("RPTPLAN1, RPTPLANACCT1, RPTEEACCT1, RPTEE1, INVPRODMSTR, PERSON WHERE ");
                    sbGetZeroFunds.Append("RPTPLAN1.PLANID = RPTPLANACCT1.PLANID AND ");
                    sbGetZeroFunds.Append("RPTPLAN1.YRENDDATE = RPTPLANACCT1.YRENDDATE AND ");
                    sbGetZeroFunds.Append("RPTPLAN1.ADMINID = RPTPLANACCT1.ADMINID AND ");
                    sbGetZeroFunds.Append("RPTPLAN1.RPTNAM = RPTPLANACCT1.RPTNAM AND ");
                    sbGetZeroFunds.Append("RPTPLANACCT1.PLANID = RPTEEACCT1.PLANID AND ");
                    sbGetZeroFunds.Append("RPTPLANACCT1.YRENDDATE = RPTEEACCT1.YRENDDATE AND ");
                    sbGetZeroFunds.Append("RPTPLANACCT1.ACCTID = RPTEEACCT1.ACCTID AND ");
                    sbGetZeroFunds.Append("RPTPLANACCT1.ADMINID = RPTEEACCT1.ADMINID AND ");
                    sbGetZeroFunds.Append("RPTPLANACCT1.RPTNAM = RPTEEACCT1.RPTNAM AND ");
                    sbGetZeroFunds.Append("RPTEEACCT1.PLANID = RPTEE1.PLANID AND ");
                    sbGetZeroFunds.Append("RPTEEACCT1.YRENDDATE = RPTEE1.YRENDDATE AND ");
                    sbGetZeroFunds.Append("RPTEEACCT1.SSNUM = RPTEE1.SSNUM AND ");
                    sbGetZeroFunds.Append("RPTEEACCT1.ADMINID = RPTEE1.ADMINID AND ");
                    sbGetZeroFunds.Append("RPTEEACCT1.RPTNAM = RPTEE1.RPTNAM AND ");
                    sbGetZeroFunds.Append("RPTEEACCT1.INVPRODID = INVPRODMSTR.INVPRODID (+) AND ");
                    sbGetZeroFunds.Append("RPTEE1.SSNUM = PERSON.SSNUM AND ");
                    sbGetZeroFunds.Append("RPTPLAN1.PLANID = '" + dsPPlan.Tables[0].Rows[0][0].ToString() + "' AND ");
                    sbGetZeroFunds.Append("RPTPLAN1.YRENDDATE >=(SELECT SYSDATE from DUAL) AND ");
                    sbGetZeroFunds.Append("RPTEEACCT1.SSNUM = '" + dsLogin.Tables[0].Rows[0]["SSNUM"].ToString() + "' )  ");

                    //Query "q_Get_plans"
                    StringBuilder sbGetPlans = new StringBuilder();
                    sbGetPlans.Append("SELECT distinct allFunds.FUNDID, allFunds.FUNDNAM, CASE WHEN RPT.ALLOPCT = 0 THEN NULL ELSE RPT.ALLOPCT END AS ALLOPCT, ");
                    sbGetPlans.Append("RPT.FIRSTNAM,  RPT.LASTNAM from ");
                    sbGetPlans.Append("(select distinct fundid, CASE WHEN fundid = 'FIXED INC' THEN 'NERT Nationwide Fixed Income Fund' ");
                    sbGetPlans.Append("WHEN fundid = 'TROWE' THEN 'NERT T Rowe Price Large Cap Growth Fund' ");
                    sbGetPlans.Append("WHEN fundid = 'FBR' THEN 'NERT FBR Focus Fund' ");
                    sbGetPlans.Append("ELSE fundnam END AS Fundnam ");
                    sbGetPlans.Append("from rptplanacct1 WHERE FUNDID IN ('FIXED INC','STRONGGV','PIMCO-FOR'");
                    sbGetPlans.Append(",'STRONGBD','PRINCRE','VANG-WEL2','PCVALUE','VANG-IND','FBR','ARTISAN','TROWE')) allFunds "); //'HUSIC'
                    sbGetPlans.Append("LEFT OUTER JOIN ( " + sbGetPlansSetup.ToString() + " ) RPT ON allFunds.FundId = RPT.FundId ");
                    sbGetPlans.Append("ORDER BY allFunds.FUNDNAM ");
                    //sbGetPlans.Append(" where FUNDNAM !='EERECV' AND FUNDNAM != 'ERRECV' ");
                    //sbGetPlans.Append("AND FUNDNAM !='FIDELITY' AND FUNDNAM !='20THCENT' AND FUNDNAM !='INVESTMNT' AND FUNDNAM !='LOAN' ");
                    //sbGetPlans.Append("AND FUNDNAM !='Loan' AND FUNDNAM !='EMPLOYEE RECEIVABLE' AND FUNDNAM !='EMPLOYER RECEIVABLE' ");

                    //Query "q_Get_Custom_Plan_Ifno"
                    StringBuilder sbGetCustomPlanInfo = new StringBuilder();
                    sbGetCustomPlanInfo.Append("select FUNDID,  ");
                    //sbGetCustomPlanInfo.Append("CASE WHEN fundid = 'FIXED INC' THEN 'NERT Nationwide Fixed Income Fund' WHEN fundid = 'TROWE' THEN 'NERT T Rowe Price Large Cap Growth Fund' WHEN fundid = 'FBR' THEN 'NERT FBR Focus Fund' ELSE RPTPLANACCT1.FUNDNAM END AS FUNDNAM, ");
                    sbGetCustomPlanInfo.Append("RPTPLANACCT1.FUNDNAM, ");
                    sbGetCustomPlanInfo.Append("sum(RPTEEACCT1.ENDBALAMT) as ENDBALAM, RPTEEACCT1.ALLOPCT, INVPRODMSTR.INVPRODNAM , PERSON.FIRSTNAM, PERSON.LASTNAM  ");
                    sbGetCustomPlanInfo.Append("from RPTPLANACCT1 INNER JOIN RPTEEACCT1  ON ((RPTPLANACCT1.PLANID = RPTEEACCT1.PLANID)  ");
                    sbGetCustomPlanInfo.Append("AND (RPTPLANACCT1.YRENDDATE=RPTEEACCT1.YRENDDATE) AND (RPTPLANACCT1.ACCTID = RPTEEACCT1.ACCTID)  ");
                    sbGetCustomPlanInfo.Append("AND (RPTPLANACCT1.ADMINID = RPTEEACCT1.ADMINID) AND (RPTPLANACCT1.RPTNAM = RPTEEACCT1.RPTNAM))  ");
                    sbGetCustomPlanInfo.Append("INNER JOIN RPTEE1 ON ((RPTEEACCT1.PLANID = RPTEE1.PLANID) AND (RPTEEACCT1.YRENDDATE = RPTEE1.YRENDDATE)  ");
                    sbGetCustomPlanInfo.Append("AND (RPTEEACCT1.SSNUM = RPTEE1.SSNUM) AND (RPTEEACCT1.ADMINID = RPTEE1.ADMINID) AND (RPTEEACCT1.RPTNAM = RPTEE1.RPTNAM))  ");
                    sbGetCustomPlanInfo.Append("LEFT OUTER JOIN INVPRODMSTR ON RPTEEACCT1.INVPRODID = INVPRODMSTR.INVPRODID  ");
                    sbGetCustomPlanInfo.Append("INNER JOIN PERSON ON RPTEE1.SSNUM = PERSON.SSNUM AND RPTEE1.SSNUM = '" + dsLogin.Tables[0].Rows[0]["SSNUM"].ToString() + "' AND RPTPLANACCT1.PLANID = '" + dsPPlan.Tables[0].Rows[0][0].ToString() + "'  ");
                    sbGetCustomPlanInfo.Append("Group by RPTPLANACCT1.FUNDNAM ,RPTEEACCT1.ALLOPCT, INVPRODMSTR.INVPRODNAM , PERSON.FIRSTNAM, PERSON.LASTNAM , FUNDID  ");
                    sbGetCustomPlanInfo.Append("union  ");
                    sbGetCustomPlanInfo.Append("select distinct(Fundid) ,  ");
                    sbGetCustomPlanInfo.Append("fundnam, ");
                    sbGetCustomPlanInfo.Append("NULL as \"ENDBALAM\", NULL as \"ALLOPCT\", NULL as \"INVPRODNAM\", NULL as \"FIRSTNAM\", NULL as \"LASTNAM\" ");
                    sbGetCustomPlanInfo.Append("from rptplanacct1 where FUNDNAM <> 'EMPLOYEE RECEIVABLE' and FUNDNAM <> 'EMPLOYER RECEIVABLE' and FUNDNAM <> 'NERT KeyAdvisor Acct' ");
                    sbGetCustomPlanInfo.Append("and planid = '" + dsPPlan.Tables[0].Rows[0][0].ToString() + "' and fundid != 'FIDELITY' AND FUNDID !='20THCENT' AND FUNDID !='INVESTMNT' AND FUNDID !='LOAN' and fundid  ");
                    sbGetCustomPlanInfo.Append("not in (SELECT distinct(RPTPLANACCT1.FUNDID) FROM RPTPLAN1, RPTPLANACCT1, RPTEEACCT1, RPTEE1, INVPRODMSTR, PERSON  ");
                    sbGetCustomPlanInfo.Append("WHERE RPTPLAN1.PLANID = RPTPLANACCT1.PLANID AND RPTPLAN1.YRENDDATE = RPTPLANACCT1.YRENDDATE  ");
                    sbGetCustomPlanInfo.Append("AND RPTPLAN1.ADMINID = RPTPLANACCT1.ADMINID AND RPTPLAN1.RPTNAM = RPTPLANACCT1.RPTNAM AND RPTPLANACCT1.PLANID = RPTEEACCT1.PLANID ");
                    sbGetCustomPlanInfo.Append("AND RPTPLANACCT1.YRENDDATE = RPTEEACCT1.YRENDDATE AND RPTPLANACCT1.ACCTID = RPTEEACCT1.ACCTID AND RPTPLANACCT1.ADMINID = RPTEEACCT1.ADMINID ");
                    sbGetCustomPlanInfo.Append("AND RPTPLANACCT1.RPTNAM = RPTEEACCT1.RPTNAM AND RPTEEACCT1.PLANID = RPTEE1.PLANID AND RPTEEACCT1.YRENDDATE = RPTEE1.YRENDDATE  ");
                    sbGetCustomPlanInfo.Append("AND RPTEEACCT1.SSNUM = RPTEE1.SSNUM AND RPTEEACCT1.ADMINID = RPTEE1.ADMINID AND RPTEEACCT1.RPTNAM = RPTEE1.RPTNAM  ");
                    sbGetCustomPlanInfo.Append("AND RPTEEACCT1.INVPRODID = INVPRODMSTR.INVPRODID (+) AND RPTEE1.SSNUM = PERSON.SSNUM AND RPTPLAN1.PLANID = '" + dsPPlan.Tables[0].Rows[0][0].ToString() + "'  ");
                    sbGetCustomPlanInfo.Append("AND RPTPLAN1.YRENDDATE >=(SELECT SYSDATE from DUAL) AND RPTEEACCT1.SSNUM = '" + dsLogin.Tables[0].Rows[0]["SSNUM"].ToString() + "' )  ");
                    sbGetCustomPlanInfo.Append("order by 2 ");

                    String availableFunds = Utility.GetAvailableFunds();

                    //Query "q_Get_plans"
                    StringBuilder sbGetPlansNew = new StringBuilder();
                    sbGetPlansNew.Append("SELECT distinct allFunds.FUNDID, allFunds.FUNDNAM, CASE WHEN RPT.ALLOPCT = 0 THEN NULL ELSE RPT.ALLOPCT END AS ALLOPCT, ");
                    sbGetPlansNew.Append("RPT.FIRSTNAM,  RPT.LASTNAM from ");
                    sbGetPlansNew.Append("(select distinct fundid, fundnam ");
                    sbGetPlansNew.Append("from rptplanacct1 WHERE FUNDID IN (" + availableFunds + ")) allFunds ");
                    sbGetPlansNew.Append("LEFT OUTER JOIN ( " + sbGetPlansSetup.ToString() + " ) RPT ON allFunds.FundId = RPT.FundId ");
                    sbGetPlansNew.Append("ORDER BY allFunds.FUNDNAM ");
                    
                    conn                = new OracleConnection(WebConfigurationManager.ConnectionStrings["NertAppOracleConnectionString"].ToString());
                    adapter             = new OracleDataAdapter(sbGetPlansNew.ToString(), conn);
                    adapterPortfolio    = new OracleDataAdapter("select invprodid, invprodnam from invprodmstr union select '0', 'Custom' from dual", conn);

                    // Open connection
                    conn.Open();

                    // Fill DataSet
                    adapter.Fill(dsTemp);

                    // Fill portfolio DataSet
                    adapterPortfolio.Fill(dsPortfolio);

                    // Close Connection
                    conn.Close();

                    dgGetPlans.DataSource = dsTemp;
                    dgGetPlans.DataBind();

                    // Populate litPortfolioStatement
                    String PortLabel;
                    StringBuilder sbPortLabel = new StringBuilder();
                    sbPortLabel.Append("select distinct invprodid from ");
                    sbPortLabel.Append("partallodet t, partallomstr r where ");
                    sbPortLabel.Append("t.allosetid = r.allosetid ");
                    sbPortLabel.Append("and r.ssnum = '" + dsLogin.Tables[0].Rows[0]["SSNUM"].ToString() + "' ");
                    sbPortLabel.Append("and createdatetime = ");
                    sbPortLabel.Append("(select max (createdatetime) from ");
                    sbPortLabel.Append("partallodet t, partallomstr r ");
                    sbPortLabel.Append("where (t.invprodid in (select invprodid from invprodmstr) ");
                    sbPortLabel.Append("or t.invprodid = 0) and t.allosetid = r.allosetid ");
                    sbPortLabel.Append("and r.ssnum = '" + dsLogin.Tables[0].Rows[0]["SSNUM"].ToString() + "')");
                    OracleCommand cmd = new OracleCommand(sbPortLabel.ToString(), conn);
                    conn.Open();
                    PortLabel = cmd.ExecuteScalar().ToString();
                    if (PortLabel == "0" || PortLabel == "" || PortLabel == null)
                    {
                        //User didn't select a Portofolio
                        litPortfolioStatement.Text = "You have currently elected Custom allocation; the portfolio will not be automatically rebalanced semi annually.";
                    }
                    else
                    {
                        cmd = new OracleCommand("select invprodnam from invprodmstr where invprodid = " + PortLabel, conn);
                        PortLabel = cmd.ExecuteScalar().ToString();
                        litPortfolioStatement.Text = "You are currently invested in the " + PortLabel + " Model Portfolio Allocation.<br>";
                        litPortfolioStatement.Text += "If you elect custom allocation, the portfolio will not be automatically rebalanced semi annually.";
                    }
                    conn.Close();

                    // Populate portfolio
                    if (dsPortfolio != null
                        && dsPortfolio.Tables[0].Rows.Count > 0)
                    {
                        for (int idx = 0; idx < dsPortfolio.Tables[0].Rows.Count; idx++)
                        {
                            // Conservative
                            if (dsPortfolio.Tables[0].Rows[idx]["invprodnam"].ToString().ToLower().Contains("conservative"))
                            {
                                rdConservativeIncome.Value = dsPortfolio.Tables[0].Rows[idx]["invprodid"].ToString();
                                lblConservativeIncome.Text = dsPortfolio.Tables[0].Rows[idx]["invprodnam"].ToString();

                                if (selectedFund == int.Parse(dsPortfolio.Tables[0].Rows[idx]["invprodid"].ToString()))
                                {
                                    rdConservativeIncome.Checked = true;
                                }
                            }
                            // Stable
                            else if (dsPortfolio.Tables[0].Rows[idx]["invprodnam"].ToString().ToLower().Contains("stable"))
                            {
                                rdStableIncome.Value = dsPortfolio.Tables[0].Rows[idx]["invprodid"].ToString();
                                lblStableIncome.Text = dsPortfolio.Tables[0].Rows[idx]["invprodnam"].ToString();

                                if (selectedFund == int.Parse(dsPortfolio.Tables[0].Rows[idx]["invprodid"].ToString()))
                                {
                                    rdStableIncome.Checked = true;
                                }
                            }
                            // Traditional
                            else if (dsPortfolio.Tables[0].Rows[idx]["invprodnam"].ToString().ToLower().Contains("traditional"))
                            {
                                rdTraditionalPension.Value = dsPortfolio.Tables[0].Rows[idx]["invprodid"].ToString();
                                lblTraditionalPension.Text = dsPortfolio.Tables[0].Rows[idx]["invprodnam"].ToString();

                                if (selectedFund == int.Parse(dsPortfolio.Tables[0].Rows[idx]["invprodid"].ToString()))
                                {
                                    rdTraditionalPension.Checked = true;
                                }
                            }
                            // Equity
                            else if (dsPortfolio.Tables[0].Rows[idx]["invprodnam"].ToString().ToLower().Contains("equity"))
                            {
                                rdEquityOriented.Value = dsPortfolio.Tables[0].Rows[idx]["invprodid"].ToString();
                                lblEquityOriented.Text = dsPortfolio.Tables[0].Rows[idx]["invprodnam"].ToString();

                                if (selectedFund == int.Parse(dsPortfolio.Tables[0].Rows[idx]["invprodid"].ToString()))
                                {
                                    rdEquityOriented.Checked = true;
                                }
                            }
                            // Custom
                            else if (dsPortfolio.Tables[0].Rows[idx]["invprodnam"].ToString().ToLower().Contains("custom"))
                            {
                                rdCustom.Value = dsPortfolio.Tables[0].Rows[idx]["invprodid"].ToString();
                                lblCustom.Text = dsPortfolio.Tables[0].Rows[idx]["invprodnam"].ToString();

                                if (selectedFund == int.Parse(dsPortfolio.Tables[0].Rows[idx]["invprodid"].ToString()))
                                {
                                    rdCustom.Checked = true;
                                }
                            }
                        }
                    }

                    this.dgConservative.DataSource      = Utility.GetConservativeIncomeInformation(0, true);
                    this.dgConservative.DataBind();
                    this.dgStable.DataSource            = Utility.GetStableIncomeInformation(0, true);
                    this.dgStable.DataBind();
                    this.dgEquityOriented.DataSource    = Utility.GetEquityOrientedInformation(0, true);
                    this.dgEquityOriented.DataBind();
                    this.dgTraditional.DataSource       = Utility.GetTraditionalPensionInformation(0, true);
                    this.dgTraditional.DataBind();
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
                    dsTemp              = null;
                    dsPortfolio         = null;
                    conn                = null;
                    adapter             = null;
                    adapterPortfolio    = null;
                }
            }
        }

        protected void btnProcess_Click(object sender, EventArgs e)
        {
            if (CalculateTotal() != 100.0 && rdCustom.Checked)
            {
                //Do not process
                lblMsg.Text = "Please first specify allocations adding up to 100%.";
            }
            // Verify if any radio button is checked
            else if( rdCustom.Checked
                || rdEquityOriented.Checked
                || rdConservativeIncome.Checked
                || rdStableIncome.Checked
                || rdEquityOriented.Checked )
            {
                StringBuilder       sbMsg       = new StringBuilder();
                DataSet             dsEmail     = new DataSet();
                OracleDataAdapter   adapter     = null;
                DataSet             dsLogin     = (DataSet)this.Session["nertPLogin"];
                DataSet             dsPPlan     = (DataSet)Session["nertPPlan"];
                string              EmailSQL    = "select distinct internetaddr from person where ssnum = '" + dsLogin.Tables[0].Rows[0]["SSNUM"].ToString() + "'";
                OracleConnection    conn        = new OracleConnection(WebConfigurationManager.ConnectionStrings["NertAppOracleConnectionString"].ToString());
                adapter                         = new OracleDataAdapter(EmailSQL, conn);

                try
                {
                    // Open connection
                    conn.Open();

                    // Fill DataSet
                    adapter.Fill(dsEmail);

                    // Close Connection
                    conn.Close();

                    if (dsEmail.Tables[0].Rows.Count == 0)
                    {
                        //Not authorized for online trading
                        sbMsg.Remove(0, sbMsg.Length);
                        sbMsg.Append("You currently are not authorized for online trading. ");
                        sbMsg.Append("Please contact the Office of the Administrator at 1-888-271-8035 or ");
                        sbMsg.Append("email us at transfers@nert.com to establish You currently are not authorized for online trading.");
                        lblMsg.Text = sbMsg.ToString();
                    }
                    else
                    {
                        //Check for outstanding transfer transaction
                        DataSet dsOutstanding = new DataSet();
                        string OutstandingSQL = "select ssnum from nert_trans where ssnum = '" + dsLogin.Tables[0].Rows[0]["SSNUM"].ToString() + "' and planid = '";
                        OutstandingSQL += dsPPlan.Tables[0].Rows[0][0].ToString() + "' AND status < 2";
                        conn.Open();
                        adapter = new OracleDataAdapter(OutstandingSQL, conn);
                        adapter.Fill(dsOutstanding);
                        conn.Close();

                        if (dsOutstanding.Tables[0].Rows.Count > 0)
                        {
                            //There are outstanding transactions
                            sbMsg.Remove(0, sbMsg.Length);
                            sbMsg.Append("You have an outstanding transfer transaction for this plan. Please contact us at ");
                            sbMsg.Append("1-888-271-8035 or contact customer service via email at transfers@nert.com");
                            lblMsg.Text = sbMsg.ToString();
                        }
                        else
                        {
                            //There are no outstanding transactions
                            DataSet dsName = new DataSet();
                            DataSet dsNertTrans = new DataSet();
                            string NameSQL = "select firstnam, lastnam from person where ssnum = '" + dsLogin.Tables[0].Rows[0]["SSNUM"].ToString() + "'";
                            conn.Open();
                            adapter = new OracleDataAdapter(NameSQL, conn);
                            adapter.Fill(dsName);

                            //Insert into Nert_Trans
                            string hashSSNTime = SimpleHash.ComputeHash(dsLogin.Tables[0].Rows[0]["SSNUM"].ToString() + DateTime.Now.ToString(), "MD5", null);
                            string newNertTransSQL = "insert into nert_trans (tran_date, ssnum, planid, status, hash, firstnam, lastnam, rebalance) values ('";
                            newNertTransSQL += DateTime.Now.ToString("dd-MMM-yy") + "', '" + dsLogin.Tables[0].Rows[0]["SSNUM"].ToString() + "', '";
                            newNertTransSQL += dsPPlan.Tables[0].Rows[0][0].ToString() + "', 0, '" + hashSSNTime + "', '" + dsName.Tables[0].Rows[0]["firstnam"];
                            newNertTransSQL += "', '" + dsName.Tables[0].Rows[0]["lastnam"] + "','" + rdlRebalance.SelectedValue + "')";
                            OracleCommand cmdNertTrans = new OracleCommand(newNertTransSQL, conn);
                            cmdNertTrans.ExecuteNonQuery();
                            string newNertTransKey = "select max(trans_id) as trans_id from nert_trans where ssnum = '" + dsLogin.Tables[0].Rows[0]["SSNUM"].ToString();
                            newNertTransKey += "' and status = 0";
                            adapter = new OracleDataAdapter(newNertTransKey, conn);
                            adapter.Fill(dsNertTrans);

                            //Insert into individual Nert_Trans_Detail records
                            string NertTransKey = dsNertTrans.Tables[0].Rows[0][0].ToString();
                            string newNertTransDetailSQL;                           
                            OracleCommand cmdNertTransDetails;

                            DataTable dtTemp = null;

                            // Verify selected protfolio
                            if (rdCustom.Checked)
                            {
                                dtTemp = this.GetCustomInformation();
                                this.UpdateSelectedFund(dsLogin.Tables[0].Rows[0]["SSNUM"].ToString(), dsPPlan.Tables[0].Rows[0][0].ToString(), int.Parse(rdCustom.Value.ToString()), dsName);
                            }
                            else if (rdConservativeIncome.Checked)
                            {
                                dtTemp = Utility.GetConservativeIncomeInformation(0, false);
                                this.UpdateSelectedFund(dsLogin.Tables[0].Rows[0]["SSNUM"].ToString(), dsPPlan.Tables[0].Rows[0][0].ToString(), int.Parse(rdConservativeIncome.Value.ToString()), dsName);
                            }
                            else if (rdEquityOriented.Checked)
                            {
                                dtTemp = Utility.GetEquityOrientedInformation(0, false);
                                this.UpdateSelectedFund(dsLogin.Tables[0].Rows[0]["SSNUM"].ToString(), dsPPlan.Tables[0].Rows[0][0].ToString(), int.Parse(rdEquityOriented.Value.ToString()), dsName);
                            }
                            else if (rdStableIncome.Checked)
                            {
                                dtTemp = Utility.GetStableIncomeInformation(0, false);
                                this.UpdateSelectedFund(dsLogin.Tables[0].Rows[0]["SSNUM"].ToString(), dsPPlan.Tables[0].Rows[0][0].ToString(), int.Parse(rdStableIncome.Value.ToString()), dsName);
                            }
                            else if (rdTraditionalPension.Checked)
                            {
                                dtTemp = Utility.GetTraditionalPensionInformation(0, false);
                                this.UpdateSelectedFund(dsLogin.Tables[0].Rows[0]["SSNUM"].ToString(), dsPPlan.Tables[0].Rows[0][0].ToString(), int.Parse(rdTraditionalPension.Value.ToString()), dsName);
                            }

                            if (dtTemp != null)
                            {
                                for (int idx = 0; idx < dtTemp.Rows.Count; idx++)
                                {
                                    newNertTransDetailSQL = "insert into nert_trans_detail(trans_id, fundid, pctold, pctnew) values ('";
                                    newNertTransDetailSQL += NertTransKey + "', '" + dtTemp.Rows[idx]["fundid"].ToString() + "',";
                                    newNertTransDetailSQL += (Convert.ToDouble(dtTemp.Rows[idx]["pctold"].ToString()) / 100).ToString() + ",";
                                    newNertTransDetailSQL += (Convert.ToDouble(dtTemp.Rows[idx]["pctnew"].ToString()) / 100).ToString();
                                    newNertTransDetailSQL += ")";

                                    cmdNertTransDetails = new OracleCommand(newNertTransDetailSQL, conn);
                                    cmdNertTransDetails.ExecuteNonQuery();
                                }
                            }
                            else
                            {
                                throw new Exception("Error occurred when saving data");
                            }

                            conn.Close();

                            sbMsg.Remove(0, sbMsg.Length);
                            sbMsg.Append("Your transfer is pending and will be processed as soon as possible. ");
                            sbMsg.Append("You will receive an email from us requesting confirmation of this transfer. ");
                            sbMsg.Append("You will be unable to submit new transfers until your transfer is complete. ");
                            sbMsg.Append("Please contact the Office of the Administrator at transfers@nert.com or call 1-888-271-8035 if you have any questions. ");
                            sbMsg.Append("This confirms your requst to invest your plan contributions as above. Please print a copy for your records. ");
                            lblMsg.Text = sbMsg.ToString();

                            btnProcess.Visible = false;

                            //Constructing email
                            StringBuilder strBdr = new StringBuilder();

                            strBdr.Append("<html>");
                            strBdr.Append("<head>");
                            strBdr.Append("<title>");
                            strBdr.Append("</title>");
                            strBdr.Append("</head>");
                            strBdr.Append("<body>");
                            strBdr.Append("<P> In order to proceed with your transfer, we need your confirmation. Please ");
                            strBdr.Append("<a href='http://www.nert.com/Common/Confirm.aspx?hashstring=" + HttpUtility.UrlEncode(hashSSNTime) + "'>click here</a> ");
                            strBdr.Append("to confirm this transaction. Your transfer is pending and will be processed as soon as we ");
                            strBdr.Append("receive your confirmation. You will be unable to submit new transfers until your transfer ");
                            strBdr.Append("is complete. Please contact the office of the Administrator at transfers@nert.com or call ");
                            strBdr.Append("1-888-271-8035 if you have any questions.</p><p>This confirms your request to invest your ");
                            strBdr.Append("plan contributions as above. Please print a copy for your records.");
                            strBdr.Append("</body>");
                            strBdr.Append("</html>");

                            // Send Email
                            Utility.SendMail("Nert.com Fund Allocation"
                                                , strBdr.ToString()
                                                , System.Web.Configuration.WebConfigurationManager.AppSettings["fromAddress"].ToString()
                                                , dsEmail.Tables[0].Rows[0][0].ToString()
                                                , string.Empty
                                                , System.Web.Configuration.WebConfigurationManager.AppSettings["fromAddress"].ToString()
                                                , "html"
                                                , "high");
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
                    conn    = null;
                    adapter = null;
                }
            }
        }

        protected void txtNew_TextChanged(object sender, EventArgs e)
        {
            lblTotal.Text = CalculateTotal().ToString();
            if (CalculateTotal() == 100.0)
            {
                lblTotal.ForeColor = Color.Green;
            }
            else
            {
                lblTotal.ForeColor = Color.Red;
            }
        }

        protected double CalculateTotal()
        {
            double dblTotalPct = 0.0;
            string fundPct = "";
            decimal result;
            int fundCount = this.dgGetPlans.Items.Count;
            for (int i = 0; i < fundCount; i++)
            {
                if (decimal.TryParse(((TextBox)this.dgGetPlans.Items[i].Cells[2].FindControl("txtNew")).Text, out result))
                {
                    if (decimal.Parse(((TextBox)this.dgGetPlans.Items[i].Cells[2].FindControl("txtNew")).Text) < 0)
                    {
                        ((TextBox)this.dgGetPlans.Items[i].Cells[2].FindControl("txtNew")).Text = "0";
                    }
                }
                else
                {
                    ((TextBox)this.dgGetPlans.Items[i].Cells[2].FindControl("txtNew")).Text = "0";
                }
                fundPct = ((TextBox)this.dgGetPlans.Items[i].Cells[2].FindControl("txtNew")).Text;
                dblTotalPct += Convert.ToDouble(fundPct);
            }
            return dblTotalPct;
        }

        private int GetSelectedFund(string ssn, string planid)
        {
            object returnValue = null;


            //TODO : Commented this line as we are not getting SQL DB Access

            returnValue = null;//DatabaseFactory.CreateDatabase("NertAppSQLConnectionString").ExecuteScalar(CommandType.Text, "SELECT Alloc_FundMode FROM dbo.emps WITH (NOLOCK) WHERE ISNULL(Alloc_FundMode, 0) > 0 and ssn='" + ssn + "' and planid='" + planid + "'");

            return (returnValue == null) ? -1 : int.Parse(returnValue.ToString());
        }

        private void UpdateSelectedFund(string ssn, string planid, int protfolioId, DataSet dsPerson)
        {
            string sql = "SELECT COUNT(tbl_id) FROM dbo.emps WITH (NOLOCK) WHERE ssn='" + ssn + "' and planid='" + planid + "'";

            // Verify if ssn and plan id exists in emps table
            if (int.Parse(DatabaseFactory.CreateDatabase("NertAppSQLConnectionString").ExecuteScalar(CommandType.Text, sql).ToString()) > 0)
            {
                sql = "UPDATE dbo.emps SET Alloc_FundMode = " + protfolioId + " WHERE ssn='" + ssn + "' and planid='" + planid + "'";
                DatabaseFactory.CreateDatabase("NertAppSQLConnectionString").ExecuteNonQuery(CommandType.Text, sql);
            }
            else
            {
                sql = "INSERT INTO dbo.emps(first, planid, last, ssn, Alloc_FundMode) VALUES('"
                    + dsPerson.Tables[0].Rows[0]["firstnam"].ToString() + "','" + planid + "','"
                    + dsPerson.Tables[0].Rows[0]["lastnam"].ToString() + "','" + ssn + "'," 
                    + protfolioId + ")";

                DatabaseFactory.CreateDatabase("NertAppSQLConnectionString").ExecuteNonQuery(CommandType.Text, sql);
            }
        }

        private DataTable GetCustomInformation()
        {
            DataTable dt = new DataTable();
            DataRow dr;

            dt.Columns.Add("fundid", typeof(string));
            dt.Columns.Add("balance", typeof(double));
            dt.Columns.Add("pctold", typeof(double));
            dt.Columns.Add("pctnew", typeof(double));

            int fundCount = this.dgGetPlans.Items.Count;

            for (int idx = 0; idx < fundCount; idx++)
            {
                dr = dt.NewRow();

                dr["fundid"]    = dgGetPlans.Items[idx].Cells[0].Text;
                dr["balance"]   = "0";
                dr["pctold"]    = dgGetPlans.Items[idx].Cells[2].Text.Replace("&nbsp;","").Trim().Length > 0 ? (Convert.ToDouble(dgGetPlans.Items[idx].Cells[2].Text)).ToString() : "0";
                dr["pctnew"]    = (Convert.ToDouble(((TextBox)this.dgGetPlans.Items[idx].Cells[3].FindControl("txtNew")).Text)).ToString();

                dt.Rows.Add(dr);

                //Disabling the New% textbox
                ((TextBox)this.dgGetPlans.Items[idx].Cells[3].FindControl("txtNew")).ReadOnly = true;
                rdlRebalance.Enabled = false;
            }

            return dt; 
        }
    }
}

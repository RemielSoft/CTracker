using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Microsoft.Practices.EnterpriseLibrary.Data;

namespace RetirementFunds.Participant
{
    public partial class FundPerf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nertPLogin"] == null)
            {
                Response.Redirect("~/Common/Login.aspx", true);
            }

            if (!IsPostBack)
            {
                DataSet dsFunds = new DataSet();
                DataSet dsAsOfDate = new DataSet();
                
                Database db = DatabaseFactory.CreateDatabase("NertAppSQLConnectionString");
                DbCommand cmdFunds = db.GetSqlStringCommand(@"SELECT	*
                                                            FROM	dbo.fundinfo 
                                                            WHERE	[status] = 'A' order by volatilityfactor;");
                DbCommand cmdAsOfDate = db.GetSqlStringCommand(@"SELECT	*
                                                            FROM	asofdate 
                                                            WHERE	reportname = 'fundperf'");


                try
                {
                    dsFunds = db.ExecuteDataSet(cmdFunds);
                    dsAsOfDate = db.ExecuteDataSet(cmdAsOfDate);

                    lblAsOfDate.Text = dsAsOfDate.Tables[0].Rows[0]["AsOfDate"].ToString();
                    dgFund.DataSource = dsFunds;
                    dgFund.DataBind();
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
                    dsFunds = null;
                    cmdFunds = null;
                    db = null;
                }
            }
        }
    }
}

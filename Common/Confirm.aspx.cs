using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using Oracle.DataAccess.Client;

namespace RetirementFunds.Common
{
    public partial class Confirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((Request.QueryString["hashstring"] != null) && (Request.QueryString["hashstring"] != ""))
                {
                    OracleDataAdapter adapter = null;
                    OracleConnection conn = null;
                    DataSet dsNertTrans = new DataSet();

                    string sql = @" select  * 
                                    from    nert_trans 
                                    where   status = 0 
                                    and     hash = :HASH";

                    //string sql = "select * from nert_trans where status = 0 and hash = '" + Request.QueryString["hashstring"] + "'";
                    
                    conn = new OracleConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["NertAppOracleConnectionString"].ToString());
                    adapter = new OracleDataAdapter(sql, conn);

                    adapter.SelectCommand.Parameters.Add(":HASH", OracleDbType.Varchar2, 255).Value = Request.QueryString["hashstring"];

                    // Open connection
                    conn.Open();

                    // Fill DataSet
                    adapter.Fill(dsNertTrans);

                    // Close Connection
                    conn.Close();

                    if (dsNertTrans.Tables[0].Rows.Count != 0)
                    {
                        //Update NertTrans table
                        sql = @"update nert_trans set status = 1 where 
                                status = 0 
                                and hash = '" + Request.QueryString["hashstring"] + "'";
                        OracleCommand cmdUpdate = new OracleCommand(sql, conn);
                        conn.Open();
                        cmdUpdate.ExecuteNonQuery();
                        conn.Close();
                        lblMsg.Text = "You have successfully confirmed your transaction number " + dsNertTrans.Tables[0].Rows[0]["Trans_ID"].ToString() + ".";
                    }
                    else
                    {
                        lblMsg.Text = "Transaction could not be confirmed. Please try again or contact us for assistance.";
                    }
                }
                else
                {
                    lblMsg.Text = "You are missing the confirmation number. Please contact us for assistance.";
                }
            }
        }
    }
}

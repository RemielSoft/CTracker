using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Microsoft.Data.Odbc;
using System.Data.OleDb;
using System.Configuration;

namespace RetirementFunds.Common
{
    public partial class Login2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verify if HTTPS 
            if (bool.Parse(System.Web.Configuration.WebConfigurationManager.AppSettings["verifyHttpsOnLogin"].ToString())
                && this.Request.Url.ToString().ToLower().IndexOf("https") == -1)
            {
                Response.Redirect(this.Request.Url.ToString().Replace("http", "https"), true);
            }
            else
            {
                if (this.Session["nertSLogin"] != null)
                {
                    // Verify and remove participant session variable
                    if (this.Session["nertPLogin"] != null)
                    {
                        this.Session.Remove("nertPLogin");
                    }

                    Response.Redirect("~/Sponsor/Sponsor.aspx", true);
                }

                if (this.Session["nertPLogin"] != null)
                {
                    // Verify and remove sponsor session variable
                    if (this.Session["nertSLogin"] != null)
                    {
                        this.Session.Remove("nertSLogin");
                    }

                    Response.Redirect("~/Participant/Participant.aspx", true);
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
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

            // Set Participant Session Variable
            SetParticipant(txtSSN.Text.ToString().Trim(), txtPassword.Text.ToString().Trim());

            // Set Enrollment Session Variable
            SetEnrollment();

            // Set User Name Session Variable
            SetUserHeader();

            //Set Sponsor Session Variable and redirect
            if (VerifySponsor(txtSSN.Text.ToString().Trim(), txtPassword.Text.ToString().Trim()))
            {
                if (this.Session["Enrollment"] != null && this.Session["Enrollment"].ToString() == "True")
                {
                    Response.Redirect("~/Participant/Enrollment.aspx", true);
                }
                if (txtPassword.Text.ToString().Trim().Length == 4)
                {
                    Response.Redirect("~/Participant/Participant.aspx", true);
                }
                else
                {
                    Response.Redirect("~/Sponsor/Sponsor.aspx", true);
                }
            }
            else
            {
                //Username & Password combo not correct
                lblMsg.Text = "Invalid login information.";
            }
            /*
            OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["NertAppOracleOleDb"].ToString());
            conn.Open();
            string sql = " Select  ERID, SSNUM, EENUM From JOB WHERE SSNUM   = '" + txtSSN.Text.ToString().Trim() + "' ";
            sql += "AND EENUM = '" + txtPassword.Text.ToString().Trim() + "'";
            OleDbCommand cmd = new OleDbCommand(sql,conn);
            Response.Write(cmd.ExecuteScalar().ToString());
            Response.Write("Hello " + conn.State.ToString());
            conn.Close();
        */
            }

        private bool VerifySponsor(string username, string password)
        {
            OleDbConnection conn = null;
            DataSet ds = new DataSet();

            try
            {
                string sql = " Select  ERID, SSNUM, EENUM From JOB WHERE SSNUM   = '" + txtSSN.Text.ToString().Trim() + "' ";
                sql += "AND EENUM = '" + txtPassword.Text.ToString().Trim() + "'";

                conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["NertAppOracleOleDb"].ToString());
                OleDbCommand cmd = new OleDbCommand(sql,conn);
                
                // Open connection
                conn.Open();

                ds = convertDataReaderToDataSet(cmd.ExecuteReader());

                // Close Connection
                conn.Close();

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
                throw new Exception("error testing");
            }
            catch (System.Threading.ThreadAbortException)
            {
                return false;
            }
            catch (System.Exception exp)
            {
                if (Session["Error"] != null)
                {
                    Session.Remove("Error");
                }
                Session.Add("Error", exp.ToString());
                Response.Redirect("~/Common/Error.aspx", true);

                return false;
            }
            finally
            {
                if (conn != null && conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }

                conn = null;
            }
        }

        private void SetParticipant(string username, string password)
        {
            OleDbConnection conn = null;
            DataSet ds = new DataSet();

            string sql = " Select  ERID, SSNUM, EENUM From JOB WHERE   SSNUM = '" + txtSSN.Text.ToString().Trim() + "' ";
            sql += "AND EENUM = '" + txtPassword.Text.ToString().Trim() + "'";

            conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["NertAppOracleOleDb"].ToString());
            OleDbCommand cmd = new OleDbCommand(sql,conn);

            // Open connection
            conn.Open();

            ds = convertDataReaderToDataSet(cmd.ExecuteReader());

            // Close Connection
            conn.Close();

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

        private void SetEnrollment()
        {
            OleDbConnection conn = null;
            DataSet ds = new DataSet();

            string sql = " Select ALLOSETID From PARTALLOMSTR WHERE SSNUM   = '" + txtSSN.Text.ToString().Trim() + "' ";

            conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["NertAppOracleOleDb"].ToString());
            OleDbCommand cmd = new OleDbCommand(sql,conn);

            // Open connection
            conn.Open();

            ds = convertDataReaderToDataSet(cmd.ExecuteReader());

            // Close Connection
            conn.Close();

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

        private void SetUserHeader()
        {
            OleDbConnection conn = null;
            DataSet ds = new DataSet();

            string sql = "  select rtrim(concat(concat(firstnam, ' '), lastnam)) as NAME From PERSON ";
            sql += "WHERE   SSNUM   = '" + txtSSN.Text.ToString().Trim() + "' ";

            conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["NertAppOracleOleDb"].ToString());
            OleDbCommand cmd = new OleDbCommand(sql,conn);

            // Open connection
            conn.Open();

            ds = convertDataReaderToDataSet(cmd.ExecuteReader());

            // Close Connection
            conn.Close();

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

        public DataSet convertDataReaderToDataSet(OleDbDataReader reader)
        {
        DataSet dataSet = new DataSet();
        do
        {
        // Create new data table

        DataTable schemaTable = reader.GetSchemaTable();
        DataTable dataTable = new DataTable();

        if ( schemaTable != null )
        {
        // A query returning records was executed

        for ( int i = 0; i < schemaTable.Rows.Count; i++ )
        {
        DataRow dataRow = schemaTable.Rows[ i ];
        // Create a column name that is unique in the data table
        string columnName = ( string )dataRow[ "ColumnName" ]; //+ “<C” + i + “/>”;
        // Add the column definition to the data table
        DataColumn column = new DataColumn( columnName, ( Type )dataRow[ "DataType" ] );
        dataTable.Columns.Add( column );
        }

        dataSet.Tables.Add( dataTable );

        // Fill the data table we just created

        while ( reader.Read() )
        {
        DataRow dataRow = dataTable.NewRow();

        for ( int i = 0; i < reader.FieldCount; i++ )
        dataRow[ i ] = reader.GetValue( i );

        dataTable.Rows.Add( dataRow );
        }
        }
        else
        {
        // No records were returned

        DataColumn column = new DataColumn("RowsAffected");
        dataTable.Columns.Add(column);
        dataSet.Tables.Add( dataTable );
        DataRow dataRow = dataTable.NewRow();
        dataRow[0] = reader.RecordsAffected;
        dataTable.Rows.Add( dataRow );
        }
        }
        while ( reader.NextResult() );
        return dataSet;
        }


    }
}

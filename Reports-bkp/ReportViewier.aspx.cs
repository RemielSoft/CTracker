using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.Common;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

namespace RetirementFunds.Reports
{
    public partial class ReportViewier : System.Web.UI.Page
    {
        private string dataSource   = string.Empty;
        private string userId       = string.Empty;
        private string password     = string.Empty;
        private string reportName   = string.Empty;
        private string promptPID    = string.Empty;
        private string promptSSN    = string.Empty;
        private string mimeType     = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Verify is session variabe is set based on participant or sponsor
            if ( Request.QueryString["from"] != null
                && ((Request.QueryString["from"].ToLower().Equals("p")
                    && Session["nertPLogin"] == null )
                || (Request.QueryString["from"].ToLower().Equals("s")
                && Session["nertSLogin"] == null)))
            {
                Response.Redirect("~/Common/Login.aspx", true);
            }
            else if( Request.QueryString["from"] != null )
            {
                string          oracleConnString    = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["NertAppOracleConnectionString"].ConnectionString.ToString();
                string[]        connStrArray        = oracleConnString.Split(';');
                string[]        tempArray           = null;
                DataSet         dsLogin             = null;
                DataSet         dsPlan              = null;
                MemoryStream    oStream             = null;
                mimeType                            = (Request.QueryString["mimetype"] != null) ? Request.QueryString["mimetype"].ToString() : string.Empty;

                try
                {
                    // Retrieve connection information
                    for (int idx = 0; idx < connStrArray.Length; idx++)
                    {
                        tempArray = connStrArray[idx].Split('=');

                        // Data Source
                        if (tempArray[0].ToString().IndexOf("Data Source") != -1
                            && tempArray.Length == 2)
                        {
                            dataSource = tempArray[1].ToString();
                        }

                        // User Id
                        if (tempArray[0].ToString().IndexOf("User Id") != -1
                            && tempArray.Length == 2)
                        {
                            userId = tempArray[1].ToString();
                        }

                        // Password
                        if (tempArray[0].ToString().IndexOf("Password") != -1
                            && tempArray.Length == 2)
                        {
                            password = tempArray[1].ToString();
                        }
                    }

                    // Retrieve login and plan session
                    if (Session["nertPLogin"] != null
                        && Request.QueryString["from"].ToLower().Equals("p"))
                    {
                        dsLogin     = (DataSet)Session["nertPLogin"];
                        promptSSN   = dsLogin.Tables[0].Rows[0]["SSNUM"].ToString();
                    }

                    // Retrieve login and plan session
                    if( Request.QueryString["from"].ToLower().Equals("s") )
                    {
                        if (Session["TempSSN"] != null)
                        {
                            promptSSN = Session["TempSSN"].ToString();
                        }
                        else if (Session["nertSLogin"] != null)
                        {
                            dsLogin     = (DataSet)Session["nertSLogin"];
                            promptSSN   = dsLogin.Tables[0].Rows[0]["SSNUM"].ToString();
                        }
                    }

                    if (Session["nertPPlan"] != null)
                    {
                        dsPlan      = (DataSet)Session["nertPPlan"];
                        promptPID   = dsPlan.Tables[0].Rows[0]["planid"].ToString();
                    }

                    // Retrieve Report Name / Prompt0 (PID) / Prompt1 (SSN)
                    if (Request.QueryString["rname"] != null
                        && Request.QueryString["rname"].ToString().Length > 0)
                    {
                        reportName = Request.QueryString["rname"].ToString();
                        CrystalReportSource1.Report.FileName = reportName;
                    }

                    ParameterValues currentParameterValues = new ParameterValues();

                    if (Request.QueryString["pid"] != null
                        && Request.QueryString["pid"].ToString().Length > 0
                        && !string.IsNullOrEmpty(promptPID))
                    {
                        ParameterDiscreteValue pID = new ParameterDiscreteValue();
                        pID.Value = promptPID;

                        currentParameterValues.Clear();
                        currentParameterValues.Add(pID);

                        if (Int32.Parse(Request.QueryString["pid"].ToString()) == 0)
                        {
                            CrystalReportSource1.ReportDocument.DataDefinition.ParameterFields[0].ApplyCurrentValues(currentParameterValues);
                        }
                        else
                        {
                            CrystalReportSource1.ReportDocument.DataDefinition.ParameterFields[1].ApplyCurrentValues(currentParameterValues);
                        }
                    }

                    if (Request.QueryString["sid"] != null
                        && Request.QueryString["sid"].ToString().Length > 0
                        && !string.IsNullOrEmpty(promptSSN))
                    {
                        ParameterDiscreteValue pSSUM = new ParameterDiscreteValue();
                        pSSUM.Value = promptSSN;

                        currentParameterValues.Clear();
                        currentParameterValues.Add(pSSUM);

                        if (Int32.Parse(Request.QueryString["sid"].ToString()) == 0)
                        {
                            CrystalReportSource1.ReportDocument.DataDefinition.ParameterFields[0].ApplyCurrentValues(currentParameterValues);
                        }
                        else
                        {
                            CrystalReportSource1.ReportDocument.DataDefinition.ParameterFields[1].ApplyCurrentValues(currentParameterValues);
                        }
                    }

                    if (!string.IsNullOrEmpty(reportName))
                    {
                        // Set up connection info here
                        ConnectionInfo crConnInfo = new ConnectionInfo();

                        crConnInfo.ServerName = System.Configuration.ConfigurationManager.AppSettings["CRServerName"];
                        crConnInfo.UserID = System.Configuration.ConfigurationManager.AppSettings["CRUserID"];
                        crConnInfo.Password = System.Configuration.ConfigurationManager.AppSettings["CRPassword"];

                        foreach (CrystalDecisions.CrystalReports.Engine.Table table in CrystalReportSource1.ReportDocument.Database.Tables)
                        {
                            TableLogOnInfo crLogOnInfo = table.LogOnInfo;
                            crLogOnInfo.ConnectionInfo = crConnInfo;
                            table.ApplyLogOnInfo(crLogOnInfo);
                        }

                        Response.ClearHeaders();
                        Response.Clear();
                        if( string.IsNullOrEmpty( mimeType ) )
                        {
                            Response.ContentType = "application/pdf";
                            oStream = (MemoryStream)CrystalReportSource1.ReportDocument.ExportToStream(ExportFormatType.PortableDocFormat);
                        }
                        else
                        {
                            Response.ContentType = "application/vnd.ms-excel";
                            oStream = (MemoryStream)CrystalReportSource1.ReportDocument.ExportToStream(ExportFormatType.Excel);
                        }

                        //write report to the Response stream
                        Response.BinaryWrite(oStream.ToArray());
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
                    if (Session["TempSSN"] != null)
                    {
                        Session.Remove("TempSSN");
                    }
                    if (oStream != null)
                    {
                        oStream.Flush();
                        oStream.Close();
                        oStream.Dispose();
                    }

                    if (CrystalReportSource1.ReportDocument != null)
                    {
                        CrystalReportSource1.ReportDocument.Close();
                    }

                    oracleConnString    = null;
                    connStrArray        = null;
                    tempArray           = null;
                    dsLogin             = null;
                    dsPlan              = null;
                    oStream             = null;
                }
            }
        }
    }
}

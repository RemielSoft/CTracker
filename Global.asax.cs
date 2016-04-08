using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.AccessControl;

namespace RetirementFunds
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            //only comment

            //New Comment
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            //string logErrors = ConfigurationManager.AppSettings["LogErrors"];
            //if (logErrors == "True" && File.Exists(Request.PhysicalApplicationPath + "Log\\errors.txt"))
            //{
            //    Exception lastError;
            //    try
            //    {
            //        lastError = Server.GetLastError().InnerException;

            //        if (lastError != null)
            //        {
            //            StreamWriter sw = File.AppendText(Request.PhysicalApplicationPath + "Log\\errors.txt");

            //            sw.WriteLine(DateTime.Now.ToString() + "--------------------------------------------------------------------");
            //            //if (Session["nertPLogin_SSN"] != null)
            //            //{
            //            //    //DataSet ds = (DataSet)this.Session["nertPLogin"];
            //            //    //sw.WriteLine("nertPLogin is " + ds.Tables[0].Rows[0]["SSNUM"].ToString());
            //            //    sw.WriteLine("nertPLogin is " + Session["nertPLogin_SSN"].ToString());
            //            //}
            //            //if (Session["nertSLogin_SSN"] != null)
            //            //{
            //            //    //DataSet ds = (DataSet)this.Session["nertSLogin"];
            //            //    //sw.WriteLine("nertSLogin is " + ds.Tables[0].Rows[0]["SSNUM"].ToString());
            //            //    sw.WriteLine("nertSLogin is " + Session["nertSLogin_SSN"].ToString());
            //            //}
            //            sw.WriteLine(lastError.Source);
            //            sw.WriteLine(lastError.Message);
            //            sw.WriteLine(lastError.StackTrace);
            //            sw.WriteLine("-----------------------------------------------------------------------------------------");
            //            sw.Close();
            //        }
            //        else
            //        {
            //            StreamWriter sw = File.AppendText(Request.PhysicalApplicationPath + "Log\\errors.txt");

            //            sw.WriteLine(DateTime.Now.ToString() + "--------------------------------------------------------------------");
            //            //if (Session["nertPLogin_SSN"] != null)
            //            //{
            //            //    //DataSet ds = (DataSet)this.Session["nertPLogin"];
            //            //    //sw.WriteLine("nertPLogin is " + ds.Tables[0].Rows[0]["SSNUM"].ToString());
            //            //    sw.WriteLine("nertPLogin is " + Session["nertPLogin_SSN"].ToString());
            //            //}
            //            //if (Session["nertSLogin_SSN"] != null)
            //            //{
            //            //    //DataSet ds = (DataSet)this.Session["nertSLogin"];
            //            //    //sw.WriteLine("nertSLogin is " + ds.Tables[0].Rows[0]["SSNUM"].ToString());
            //            //    sw.WriteLine("nertSLogin is " + Session["nertSLogin_SSN"].ToString());
            //            //}
            //            sw.WriteLine(Server.GetLastError().Source);
            //            sw.WriteLine(Server.GetLastError().Message);
            //            sw.WriteLine(Server.GetLastError().StackTrace);
            //            sw.WriteLine("-----------------------------------------------------------------------------------------");
            //            sw.Close();
            //        }
            //    }
            //    finally
            //    {
            //        Response.Redirect("~/Common/Error.aspx");
            //    }
           // }
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}
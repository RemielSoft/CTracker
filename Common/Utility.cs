using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Configuration;

using System.Data.SqlClient;

namespace RetirementFunds.Common
{
    public class Utility
    {
        public static void SendMail(string subject
                                    , string body
                                    , string fromAddress
                                    , string toAddress
                                    , string ccAddress
                                    , string bccAddress
                                    , string format
                                    , string priotity)
        {
            MailMessage mailMsg         = new MailMessage();
            mailMsg.From                = new MailAddress(fromAddress);
            mailMsg.To.Add(toAddress);
            if (!string.IsNullOrEmpty(ccAddress))
            {
                mailMsg.CC.Add(ccAddress);
            }
            if (!string.IsNullOrEmpty(bccAddress))
            {
                mailMsg.Bcc.Add(bccAddress);
            }
            mailMsg.Subject             = subject;
            mailMsg.IsBodyHtml          = (format.ToLower().Equals("html")) ? true : false;
            mailMsg.BodyEncoding        = Encoding.UTF8;
            mailMsg.Body                = body;
            mailMsg.Priority            = (priotity.ToLower().Equals("high")) ? MailPriority.High : MailPriority.Normal;
            // Smtp configuration
            SmtpClient client           = new SmtpClient();
            client.Credentials          = new NetworkCredential(ConfigurationManager.AppSettings["SmtpClientUsername"], ConfigurationManager.AppSettings["SmtpClientPassword"]);
            client.Port                 = Convert.ToInt32(ConfigurationManager.AppSettings["SmtpClientPort"]); //or use 465            
            client.Host                 = ConfigurationManager.AppSettings["SmtpClientHost"];
            client.EnableSsl            = Convert.ToBoolean(ConfigurationManager.AppSettings["SmtpEnableSSL"]);
            object userState            = mailMsg;

            try
            {
                //you can also call client.Send(msg)
                client.Send(mailMsg);
            }
            catch (SmtpException exp)
            {
                throw;
            }
        }

        public static DataTable GetStableIncomeInformation(double balance, bool isFromZero)
        {
            DataTable   dt = new DataTable();
            DataRow     dr;

            dt.Columns.Add("fundid",    typeof(string));
            dt.Columns.Add("fundnam",   typeof(string));
            dt.Columns.Add("balance",   typeof(double));
            dt.Columns.Add("pctold",    typeof(double));
            dt.Columns.Add("pctnew",    typeof(double));

            using (SqlConnection connection =
                   new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["NertAppSQLConnectionString"].ToString()))
            {
                SqlCommand command =
                    new SqlCommand("SELECT fundid, fundnam, pct FROM dbo.InvestmentModelPortfolioAllocation WHERE modeltype ='StableIncome' order by fundnam;", connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                // Call Read before accessing data. 
                while (reader.Read())
                {
                    dr = dt.NewRow();

                    dr["fundid"] = String.Format("{0}", reader[0]);
                    dr["fundnam"] = String.Format("{0}", reader[1]);
                    dr["balance"] = balance.ToString();
                    dr["pctold"] = (isFromZero) ? "0" : String.Format("{0}", reader[2]);
                    dr["pctnew"] = String.Format("{0}", reader[2]);

                    dt.Rows.Add(dr);
                }

                // Call Close when done reading.
                reader.Close();
                connection.Close();
            }            

            /*
             * string[] strFundId  = { "PROVIDENT", "STRONGGV", "STRONGBD", "PRINCRE", "VANG-WEL2" };
            string[] strFundNam = { "NERT Nationwide Provident", "NERT Wells Fargo Gov Sec Fund", "NERT Wells Fargo Income Plus Fund", "NERT Principal Real Estate Fund", "NERT Vanguard Wellington Fund" };
            string[] strAlloc   = { "5", "30", "30", "25", "10" };

            for (int idx = 0; idx < strFundId.Length; idx++)
            {
                dr = dt.NewRow();

                dr["fundid"]    = strFundId[idx].ToString();
                dr["fundnam"]   = strFundNam[idx].ToString();
                dr["balance"]   = balance.ToString();
                dr["pctold"]    = (isFromZero) ? "0" : strAlloc[idx].ToString();
                dr["pctnew"]    = strAlloc[idx].ToString();

                dt.Rows.Add(dr);
            }
             */

            return dt;
        }

        public static DataTable GetConservativeIncomeInformation(double balance, bool isFromZero)
        {
            DataTable   dt = new DataTable();
            DataRow     dr;

            dt.Columns.Add("fundid",    typeof(string));
            dt.Columns.Add("fundnam",   typeof(string));
            dt.Columns.Add("balance",   typeof(double));
            dt.Columns.Add("pctold",    typeof(double));
            dt.Columns.Add("pctnew",    typeof(double));

            using (SqlConnection connection =
                   new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["NertAppSQLConnectionString"].ToString()))
            {
                SqlCommand command =
                    new SqlCommand("SELECT fundid, fundnam, pct FROM dbo.InvestmentModelPortfolioAllocation WHERE modeltype ='ConservativeIncome' order by fundnam;", connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                // Call Read before accessing data. 
                while (reader.Read())
                {
                    dr = dt.NewRow();

                    dr["fundid"] = String.Format("{0}", reader[0]);
                    dr["fundnam"] = String.Format("{0}", reader[1]);
                    dr["balance"] = balance.ToString();
                    dr["pctold"] = (isFromZero) ? "0" : String.Format("{0}", reader[2]);
                    dr["pctnew"] = String.Format("{0}", reader[2]);

                    dt.Rows.Add(dr);
                }

                // Call Close when done reading.
                reader.Close();
                connection.Close();
            }

            /*
            string[] strFundId  = { "PROVIDENT", "STRONGGV", "STRONGBD", "PRINCRE", "VANG-WEL2", "VANG-IND", "ARTISAN", "FBR" };
            string[] strFundNam = { "NERT Nationwide Provident", "NERT Wells Fargo Gov Sec Fund", "NERT Wells Fargo Income Plus Fund", "NERT Principal Real Estate Fund", "NERT Vanguard Wellington Fund", "NERT Vanguard Index Fund", "NERT Artisan Intl Fund", "NERT FBR Focus Fund" };
            string[] strAlloc   = { "5", "20", "20", "25", "10", "10", "5", "5" };

            for (int idx = 0; idx < strFundId.Length; idx++)
            {
                dr = dt.NewRow();

                dr["fundid"]    = strFundId[idx].ToString();
                dr["fundnam"]   = strFundNam[idx].ToString();
                dr["balance"]   = balance.ToString();
                dr["pctold"]    = (isFromZero) ? "0" : strAlloc[idx].ToString();
                dr["pctnew"]    = strAlloc[idx].ToString();

                dt.Rows.Add(dr);
            }
            */

            return dt;
        }

        public static DataTable GetTraditionalPensionInformation(double balance, bool isFromZero)
        {
            DataTable   dt = new DataTable();
            DataRow     dr;

            dt.Columns.Add("fundid",    typeof(string));
            dt.Columns.Add("fundnam",   typeof(string));
            dt.Columns.Add("balance",   typeof(double));
            dt.Columns.Add("pctold",    typeof(double));
            dt.Columns.Add("pctnew",    typeof(double));

            using (SqlConnection connection =
                   new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["NertAppSQLConnectionString"].ToString()))
            {
                SqlCommand command =
                    new SqlCommand("SELECT fundid, fundnam, pct FROM dbo.InvestmentModelPortfolioAllocation WHERE modeltype ='TraditionalPension' order by fundnam;", connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                // Call Read before accessing data. 
                while (reader.Read())
                {
                    dr = dt.NewRow();

                    dr["fundid"] = String.Format("{0}", reader[0]);
                    dr["fundnam"] = String.Format("{0}", reader[1]);
                    dr["balance"] = balance.ToString();
                    dr["pctold"] = (isFromZero) ? "0" : String.Format("{0}", reader[2]);
                    dr["pctnew"] = String.Format("{0}", reader[2]);

                    dt.Rows.Add(dr);
                }

                // Call Close when done reading.
                reader.Close();
                connection.Close();
            } 
            
            /*
            string[] strFundId = { "PROVIDENT", "STRONGGV", "STRONGBD", "PRINCRE", "PCVALUE", "VANG-IND", "FIDELITY", "20THCENT", "ARTISAN", "FBR" };
            string[] strFundNam = { "NERT Nationwide Provident", "NERT Wells Fargo Gov Sec Fund", "NERT Wells Fargo Income Plus Fund", "NERT Principal Real Estate Fund", "NERT Dodge & Cox Stock Fund", "NERT Vanguard Index Fund", "NERT Fidelity Blue Chip", "NERT American Century Ultra", "NERT Artisan Intl Fund", "NERT FBR Focus Fund" };
            string[] strAlloc   = { "2", "9", "9", "25", "8", "20", "4", "4", "11", "8" };

            for (int idx = 0; idx < strFundId.Length; idx++)
            {
                dr = dt.NewRow();

                dr["fundid"]    = strFundId[idx].ToString();
                dr["fundnam"]   = strFundNam[idx].ToString();
                dr["balance"]   = balance.ToString();
                dr["pctold"]    = (isFromZero) ? "0" : strAlloc[idx].ToString();
                dr["pctnew"]    = strAlloc[idx].ToString();

                dt.Rows.Add(dr);
            }
            */

            return dt;
        }

        public static DataTable GetEquityOrientedInformation(double balance, bool isFromZero)
        {
            DataTable   dt = new DataTable();
            DataRow     dr;

            dt.Columns.Add("fundid",    typeof(string));
            dt.Columns.Add("fundnam",   typeof(string));
            dt.Columns.Add("balance",   typeof(double));
            dt.Columns.Add("pctold",    typeof(double));
            dt.Columns.Add("pctnew",    typeof(double));

            using (SqlConnection connection =
                    new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["NertAppSQLConnectionString"].ToString()))
            {
                SqlCommand command =
                    new SqlCommand("SELECT fundid, fundnam, pct FROM dbo.InvestmentModelPortfolioAllocation WHERE modeltype ='EquityOriented' order by fundnam;", connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                // Call Read before accessing data. 
                while (reader.Read())
                {
                    dr = dt.NewRow();

                    dr["fundid"] = String.Format("{0}", reader[0]);
                    dr["fundnam"] = String.Format("{0}", reader[1]);
                    dr["balance"] = balance.ToString();
                    dr["pctold"] = (isFromZero) ? "0" : String.Format("{0}", reader[2]);
                    dr["pctnew"] = String.Format("{0}", reader[2]);

                    dt.Rows.Add(dr);
                }

                // Call Close when done reading.
                reader.Close();
                connection.Close();
            } 
            
            /*
            string[] strFundId = { "PROVIDENT", "PRINCRE", "PCVALUE", "VANG-IND", "FIDELITY", "20THCENT", "ARTISAN", "FBR" };
            string[] strFundNam = { "NERT Nationwide Provident", "NERT Principal Real Estate Fund", "NERT Dodge & Cox Stock Fund", "NERT Vanguard Index Fund", "NERT Fidelity Blue Chip", "NERT American Century Ultra", "NERT Artisan Intl Fund", "NERT FBR Focus Fund" };
            string[] strAlloc   = { "5", "20", "12", "25", "6", "6", "16", "10" };

            for (int idx = 0; idx < strFundId.Length; idx++)
            {
                dr = dt.NewRow();

                dr["fundid"]    = strFundId[idx].ToString();
                dr["fundnam"]   = strFundNam[idx].ToString();
                dr["balance"]   = balance.ToString();
                dr["pctold"]    = (isFromZero) ? "0" : strAlloc[idx].ToString();
                dr["pctnew"]    = strAlloc[idx].ToString();

                dt.Rows.Add(dr);
            }
            */
             
            return dt;
        }

        public static String GetAvailableFunds()
        {
            String ret = "";

            using (SqlConnection connection =
                    new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["NertAppSQLConnectionString"].ToString()))
            {
                SqlCommand command =
                    new SqlCommand("SELECT distinct fundid FROM dbo.InvestmentModelPortfolioAllocation ORDER BY fundid;", connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                bool doneBefore = false;

                // Call Read before accessing data. 
                while (reader.Read())
                {
                    if ( doneBefore )
                        ret += ",";
                    ret += "'";
                    ret += String.Format("{0}", reader[0]);
                    ret += "'";

                    doneBefore = true;
                }

                // Call Close when done reading.
                reader.Close();
                connection.Close();
            }

            return ret;
        }
    }
}

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
    public partial class Step_1_3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nertPLogin"] == null)
            {
                Response.Redirect("~/Common/Login.aspx", true);
            }
            else
            {
                DataSet ds = null;
                Database db = DatabaseFactory.CreateDatabase("NertAppSQLConnectionString");
                DbCommand commad = db.GetSqlStringCommand(@" SELECT	*
                                                                FROM	asofdate
                                                                WHERE	reportname = 'fundperf';
                                                                SELECT  *
                                                                FROM	fundinfo 
                                                                WHERE	[status] = 'A' 
                                                                ORDER	BY volatilityfactor;");

                HtmlTableRow tr;
                HtmlTableCell tcImage;
                HtmlTableCell tcFundInfo;
                HtmlTableCell tcVolatility;
                HtmlTableCell tcYtd;
                HtmlTableCell tc1year;
                HtmlTableCell tc3year;
                HtmlTableCell tc5year;
                HtmlImage img;

                try
                {
                    ds = db.ExecuteDataSet(commad);

                    #region Populate Fund Performance
                    if (ds != null &&
                        ds.Tables.Count > 0 &&
                        ds.Tables[0].Rows.Count > 0)
                    {
                        spAsOfDate.InnerHtml = (ds.Tables[0].Rows[0]["AsOfDate"].ToString().Length > 0 ? ds.Tables[0].Rows[0]["AsOfDate"].ToString() : "");
                    }
                    #endregion

                    #region Funds
                    if (ds != null &&
                        ds.Tables.Count > 0 &&
                        ds.Tables[1].Rows.Count > 0)
                    {
                        // Add Header row first
                        tr = new HtmlTableRow();
                        tcImage = new HtmlTableCell();
                        tcFundInfo = new HtmlTableCell();
                        tcVolatility = new HtmlTableCell();
                        tcYtd = new HtmlTableCell();
                        tc1year = new HtmlTableCell();
                        tc3year = new HtmlTableCell();
                        tc5year = new HtmlTableCell();

                        tcImage.Width = "60";
                        tr.Cells.Add(tcImage);

                        tcFundInfo.Width = "417";
                        tcFundInfo.Attributes.Add("class", "txt1bold");
                        tr.Cells.Add(tcFundInfo);

                        tcVolatility.Width = "70";
                        tcVolatility.InnerText = "Volatility Factor";
                        tcVolatility.Align = "center";
                        tcVolatility.Attributes.Add("class", "txt1bold");
                        tr.Cells.Add(tcVolatility);

                        tcYtd.Width = "70";
                        tcYtd.InnerText = "Year to Date";
                        tcYtd.Align = "center";
                        tcYtd.Attributes.Add("class", "txt1bold");
                        tr.Cells.Add(tcYtd);

                        tc1year.Width = "70";
                        tc1year.Controls.Add(new LiteralControl("1<br/> Year"));
                        tc1year.Align = "center";
                        tc1year.Attributes.Add("class", "txt1bold");
                        tr.Cells.Add(tc1year);

                        tc3year.Width = "70";
                        tc3year.Controls.Add(new LiteralControl("3<br/> Years"));
                        tc3year.Align = "center";
                        tc3year.Attributes.Add("class", "txt1bold");
                        tr.Cells.Add(tc3year);

                        tc5year.Width = "70";
                        tc5year.Controls.Add(new LiteralControl("5<br/> Years"));
                        tc5year.Align = "center";
                        tc5year.Attributes.Add("class", "txt1bold");
                        tr.Cells.Add(tc5year);

                        tblFunds.Rows.Add(tr);

                        for (int idx = 0; idx < ds.Tables[1].Rows.Count; idx++)
                        {
                            tr = new HtmlTableRow();
                            tcImage = new HtmlTableCell();
                            tcFundInfo = new HtmlTableCell();
                            tcVolatility = new HtmlTableCell();
                            tcYtd = new HtmlTableCell();
                            tc1year = new HtmlTableCell();
                            tc3year = new HtmlTableCell();
                            tc5year = new HtmlTableCell();
                            img = new HtmlImage();

                            img.Src = (ds.Tables[1].Rows[idx]["imagefile"] != null && ds.Tables[1].Rows[idx]["imagefile"].ToString().Length > 0) ? ds.Tables[1].Rows[idx]["imagefile"].ToString() : "";
                            img.Alt = "";

                            tcImage.Controls.Add(img);
                            tcImage.Width = "60";
                            tr.Cells.Add(tcImage);

                            tcFundInfo.Width = "417";
                            tcFundInfo.Controls.Add(new LiteralControl("<font class=\"txt1bold\">" + ds.Tables[1].Rows[idx]["type"].ToString() + "</font><br/><font class=\"texth3\"><a href=\"" + ds.Tables[1].Rows[idx]["url"].ToString() + "\" target=\"new\">" + ds.Tables[1].Rows[idx]["fundname"].ToString() + "</a></font><br/><font class=\"text2\">" + ds.Tables[1].Rows[idx]["funddescription"].ToString() + "</font>"));
                            tcFundInfo.Attributes.Add("class", "text2NoIndent");
                            tr.Cells.Add(tcFundInfo);

                            tcVolatility.Width = "70";
                            tcVolatility.InnerText = String.Format("{0:0.00}", Double.Parse((ds.Tables[1].Rows[idx]["volatilityfactor"].ToString().Length > 0 ? ds.Tables[1].Rows[idx]["volatilityfactor"].ToString() : "0")));
                            tcVolatility.Attributes.Add("class", "text2");
                            tr.Cells.Add(tcVolatility);

                            tcYtd.Width = "70";
                            tcYtd.InnerText = String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[idx]["ytd"].ToString().Length > 0 ? ds.Tables[1].Rows[idx]["ytd"].ToString() : "0"))) + "%";
                            tcYtd.Attributes.Add("class", "text2");
                            tr.Cells.Add(tcYtd);

                            tc1year.Width = "70";
                            tc1year.InnerText = String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[idx]["1year"].ToString().Length > 0 ? ds.Tables[1].Rows[idx]["1year"].ToString() : "0"))) + "%";
                            tc1year.Attributes.Add("class", "text2");
                            tr.Cells.Add(tc1year);

                            tc3year.Width = "70";
                            tc3year.InnerText = String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[idx]["3years"].ToString().Length > 0 ? ds.Tables[1].Rows[idx]["3years"].ToString() : "0"))) + "%";
                            tc3year.Attributes.Add("class", "text2");
                            tr.Cells.Add(tc3year);

                            tc5year.Width = "70";
                            tc5year.InnerText = String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[idx]["5years"].ToString().Length > 0 ? ds.Tables[1].Rows[idx]["5years"].ToString() : "0"))) + "%";
                            tc5year.Attributes.Add("class", "text2");
                            tr.Cells.Add(tc5year);

                            tblFunds.Rows.Add(tr);

                        }
                    }
                    #endregion
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
                    ds = null;
                    commad = null;
                    db = null;
                }
            }
        }
    }
}

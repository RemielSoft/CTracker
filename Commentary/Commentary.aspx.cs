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

namespace RetirementFunds.Commentary
{
    public partial class Commentary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet     ds      = null;
            Database    db      = DatabaseFactory.CreateDatabase("NertAppSQLConnectionString");
            DbCommand   commad  = db.GetSqlStringCommand(@"SELECT	title
		                                                            , author
		                                                            , subtitle
		                                                            , mutualfunds
		                                                            , bonds
		                                                            , commentary
		                                                            , other1
		                                                            , other2
		                                                            , dbo.commentary.dateentered
		                                                            , dbo.commentary.id
                                                            FROM	dbo.commentary WITH (NOLOCK)
                                                            WHERE	dateentered = (SELECT	MAX(dateentered) 
						                                                            FROM	dbo.commentary WITH (NOLOCK) );
                                                            SELECT	*
                                                            FROM	dbo.nertmodel 
                                                            WHERE	id =   (SELECT	id
			                                                               FROM		dbo.commentary WITH (NOLOCK)
			                                                               WHERE	 dateentered = (SELECT	MAX(dateentered) 
										                                                            FROM	dbo.commentary WITH (NOLOCK) ) ); 
                                                            SELECT	*
                                                            FROM	dbo.funds WITH (NOLOCK)
                                                            WHERE	[status] = 'A';");

            HtmlGenericControl gcFundName;
            HtmlGenericControl gcFundDesc;
            HtmlTable tblFunds;
            HtmlTableRow trHeader;
            HtmlTableRow trReturns;
            HtmlTableRow trFunds;
            HtmlTableCell tcHeaderCol1;
            HtmlTableCell tcHeaderCol2;
            HtmlTableCell tcHeaderCol3;
            HtmlTableCell tcHeaderCol4;
            HtmlTableCell tcReturnsCol1;
            HtmlTableCell tcReturnsCol2;
            HtmlTableCell tcReturnsCol3;
            HtmlTableCell tcReturnsCol4;
            HtmlTableCell tcFundsCol1;
            HtmlTableCell tcFundsCol2;
            HtmlTableCell tcFundsCol3;
            HtmlTableCell tcFundsCol4;

            try
            {
                ds = db.ExecuteDataSet(commad);

                #region Populate Commentary Main
                if (ds != null &&
                    ds.Tables.Count > 0 &&
                    ds.Tables[0].Rows.Count > 0)
                {
                    spLastCommentaryTitle.InnerHtml         = (ds.Tables[0].Rows[0]["title"].ToString().Length > 0 ? ds.Tables[0].Rows[0]["title"].ToString() : "");
                    pLastCommentaryAuthor.InnerHtml         = "&nbsp;" + (ds.Tables[0].Rows[0]["author"].ToString().Length > 0 ? ds.Tables[0].Rows[0]["author"].ToString() : "");
                    spLastCommentarySubTitle.InnerHtml      = (ds.Tables[0].Rows[0]["subtitle"].ToString().Length > 0 ? ds.Tables[0].Rows[0]["subtitle"].ToString() : "");
                    pLastCommentaryCommentary.InnerHtml     = "&nbsp;" + (ds.Tables[0].Rows[0]["commentary"].ToString().Length > 0 ? ds.Tables[0].Rows[0]["commentary"].ToString() : "");
                    pLastCommentaryBonds.InnerHtml          = "&nbsp;" + (ds.Tables[0].Rows[0]["bonds"].ToString().Length > 0 ? ds.Tables[0].Rows[0]["bonds"].ToString() : "");
                    pLastCommentaryMutualFunds.InnerHtml    = "&nbsp;" + (ds.Tables[0].Rows[0]["mutualfunds"].ToString().Length > 0 ? ds.Tables[0].Rows[0]["mutualfunds"].ToString() : "");

                    if (ds.Tables[0].Rows[0]["other1"].ToString().Trim().Length > 0)
                    {
                        pLastCommentartyOther1.InnerHtml = "&nbsp;" + (ds.Tables[0].Rows[0]["other1"].ToString().Length > 0 ? ds.Tables[0].Rows[0]["other1"].ToString() : "");
                    }
                    else
                    {
                        pLastCommentartyOther1.Visible = false;
                    }
                    if (ds.Tables[0].Rows[0]["other2"].ToString().Trim().Length > 0)
                    {
                        pLastCommentartyOther2.InnerHtml = "&nbsp;" + (ds.Tables[0].Rows[0]["other2"].ToString().Length > 0 ? ds.Tables[0].Rows[0]["other2"].ToString() : "");
                    }
                    else
                    {
                        pLastCommentartyOther2.Visible = false;
                    }
                }
                #endregion

                #region Commentary Nert Model
                if (ds != null &&
                    ds.Tables.Count > 0 &&
                    ds.Tables[1].Rows.Count > 0)
                {
                    // Stable Income
                    spSIThreeYear.InnerHtml     = (ds.Tables[1].Rows[0]["stable3r"].ToString().Length > 0 && Double.Parse(ds.Tables[1].Rows[0]["stable3r"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["stable3r"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["stable3r"].ToString().Length > 0 ? ds.Tables[1].Rows[0]["stable3r"].ToString() : "0"))) + "%";
                    spSIThreeYears.InnerHtml    = (ds.Tables[1].Rows[0]["stable3s"].ToString().Length > 0 && Double.Parse(ds.Tables[1].Rows[0]["stable3s"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["stable3s"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["stable3s"].ToString().Length > 0 ? ds.Tables[1].Rows[0]["stable3s"].ToString() : "0"))) + "%";
                    spSIFiveYear.InnerHtml      = (ds.Tables[1].Rows[0]["stable5r"].ToString().Length > 0 && Double.Parse(ds.Tables[1].Rows[0]["stable5r"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["stable5r"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["stable5r"].ToString().Length > 0 ? ds.Tables[1].Rows[0]["stable5r"].ToString() : "0"))) + "%";
                    spSIFiveYears.InnerHtml     = (ds.Tables[1].Rows[0]["stable5d"].ToString().Length > 0 && Double.Parse(ds.Tables[1].Rows[0]["stable5d"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["stable5d"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["stable5d"].ToString().Length > 0 ? ds.Tables[1].Rows[0]["stable5d"].ToString() : "0"))) + "%";

                    // Conservative Income
                    spCIThreeYear.InnerHtml     = (ds.Tables[1].Rows[0]["cons3r"].ToString().Length > 0 && Double.Parse(ds.Tables[1].Rows[0]["cons3r"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["cons3r"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["cons3r"].ToString().Length > 0 ? ds.Tables[1].Rows[0]["cons3r"].ToString() : "0"))) + "%";
                    spCIThreeYears.InnerHtml    = (ds.Tables[1].Rows[0]["cons3s"].ToString().Length > 0 && Double.Parse(ds.Tables[1].Rows[0]["cons3s"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["cons3s"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["cons3s"].ToString().Length > 0 ? ds.Tables[1].Rows[0]["cons3s"].ToString() : "0"))) + "%";
                    spCIFiveYear.InnerHtml      = (ds.Tables[1].Rows[0]["cons5r"].ToString().Length > 0 && Double.Parse(ds.Tables[1].Rows[0]["cons5r"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["cons5r"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["cons5r"].ToString().Length > 0 ? ds.Tables[1].Rows[0]["cons5r"].ToString() : "0"))) + "%";
                    spCIFiveYears.InnerHtml     = (ds.Tables[1].Rows[0]["cons5s"].ToString().Length > 0 && Double.Parse(ds.Tables[1].Rows[0]["cons5s"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["cons5s"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["cons5s"].ToString().Length > 0 ? ds.Tables[1].Rows[0]["cons5s"].ToString() : "0"))) + "%";

                    // Traditional Pension
                    spTPThreeYear.InnerHtml     = (ds.Tables[1].Rows[0]["trad3r"].ToString().Length > 0 && Double.Parse(ds.Tables[1].Rows[0]["trad3r"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["trad3r"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["trad3r"].ToString().Length > 0 ? ds.Tables[1].Rows[0]["trad3r"].ToString() : "0"))) + "%";
                    spTPThreeYears.InnerHtml    = (ds.Tables[1].Rows[0]["trad3s"].ToString().Length > 0 && Double.Parse(ds.Tables[1].Rows[0]["trad3s"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["trad3s"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["trad3s"].ToString().Length > 0 ? ds.Tables[1].Rows[0]["trad3s"].ToString() : "0"))) + "%";
                    spTPFiveYear.InnerHtml      = (ds.Tables[1].Rows[0]["trad5r"].ToString().Length > 0 && Double.Parse(ds.Tables[1].Rows[0]["trad5r"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["trad5r"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["trad5r"].ToString().Length > 0 ? ds.Tables[1].Rows[0]["trad5r"].ToString() : "0"))) + "%";
                    spTPFiveYears.InnerHtml     = (ds.Tables[1].Rows[0]["trad5s"].ToString().Length > 0 && Double.Parse(ds.Tables[1].Rows[0]["trad5s"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["trad5s"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["trad5s"].ToString().Length > 0 ? ds.Tables[1].Rows[0]["trad5s"].ToString() : "0"))) + "%";

                    // Equity Oriented
                    spEOThreeYear.InnerHtml     = (ds.Tables[1].Rows[0]["eqt3r"].ToString().Length > 0 && Double.Parse(ds.Tables[1].Rows[0]["eqt3r"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["eqt3r"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["eqt3r"].ToString().Length > 0 ? ds.Tables[1].Rows[0]["eqt3r"].ToString() : "0"))) + "%";
                    spEOThreeYears.InnerHtml    = (ds.Tables[1].Rows[0]["eqt3s"].ToString().Length > 0 && Double.Parse(ds.Tables[1].Rows[0]["eqt3s"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["eqt3s"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["eqt3s"].ToString().Length > 0 ? ds.Tables[1].Rows[0]["eqt3s"].ToString() : "0"))) + "%";
                    spEOFiveYear.InnerHtml      = (ds.Tables[1].Rows[0]["eqt5r"].ToString().Length > 0 && Double.Parse(ds.Tables[1].Rows[0]["eqt5r"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["eqt5r"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["eqt5r"].ToString().Length > 0 ? ds.Tables[1].Rows[0]["eqt5r"].ToString() : "0"))) + "%";
                    spEOFiveYears.InnerHtml     = (ds.Tables[1].Rows[0]["eqt5s"].ToString().Length > 0 && Double.Parse(ds.Tables[1].Rows[0]["eqt5s"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["eqt5s"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[1].Rows[0]["eqt5s"].ToString().Length > 0 ? ds.Tables[1].Rows[0]["eqt5s"].ToString() : "0"))) + "%";
                }
                #endregion

                #region Funds
                if (ds != null &&
                    ds.Tables.Count > 0 &&
                    ds.Tables[2].Rows.Count > 0)
                {
                    for (int idx = 0; idx < ds.Tables[2].Rows.Count; idx++)
                    {
                        gcFundName = new HtmlGenericControl();
                        gcFundDesc = new HtmlGenericControl();

                        tblFunds        = new HtmlTable();
                        trHeader        = new HtmlTableRow();
                        trReturns       = new HtmlTableRow();
                        trFunds         = new HtmlTableRow();
                        tcHeaderCol1    = new HtmlTableCell();
                        tcHeaderCol2    = new HtmlTableCell();
                        tcHeaderCol3    = new HtmlTableCell();
                        tcHeaderCol4    = new HtmlTableCell();
                        tcReturnsCol1   = new HtmlTableCell();
                        tcReturnsCol2   = new HtmlTableCell();
                        tcReturnsCol3   = new HtmlTableCell();
                        tcReturnsCol4   = new HtmlTableCell();
                        tcFundsCol1     = new HtmlTableCell();
                        tcFundsCol2     = new HtmlTableCell();
                        tcFundsCol3     = new HtmlTableCell();
                        tcFundsCol4     = new HtmlTableCell();

                        divFunds.Controls.Add(new LiteralControl("<br/>"));

                        gcFundName.InnerHtml = ds.Tables[2].Rows[idx]["fundname"].ToString();
                        gcFundName.Attributes.Add("class", "txt1bold");
                        gcFundDesc.InnerHtml = ds.Tables[2].Rows[idx]["description"].ToString();
                        gcFundDesc.Attributes.Add("class", "text2");
                        divFunds.Controls.Add(gcFundName);
                        divFunds.Controls.Add(new LiteralControl("&nbsp;-&nbsp;"));
                        divFunds.Controls.Add(gcFundDesc);
                        divFunds.Controls.Add(new LiteralControl("<br/><br/>"));

                        tblFunds.Width = "60%";

                        // Header columns
                        tcHeaderCol1.Width = "50%";
                        trHeader.Controls.Add(tcHeaderCol1);
                        tcHeaderCol2.Attributes.Add("class", "txt1bold");
                        tcHeaderCol2.Controls.Add(new LiteralControl("<div align=\"right\">QTR</div>"));
                        trHeader.Controls.Add(tcHeaderCol2);
                        tcHeaderCol3.Attributes.Add("class", "txt1bold");
                        tcHeaderCol3.Controls.Add(new LiteralControl("<div align=\"right\">1 Year</div>"));
                        trHeader.Controls.Add(tcHeaderCol3);
                        tcHeaderCol4.Attributes.Add("class", "txt1bold");
                        tcHeaderCol4.Controls.Add(new LiteralControl("<div align=\"right\">3 Year</div>"));
                        trHeader.Controls.Add(tcHeaderCol4);
                        tblFunds.Controls.Add(trHeader);

                        // Return Columns
                        tcReturnsCol1.InnerHtml = "Returns";
                        tcReturnsCol1.Attributes.Add("class", "txt1bold");
                        trReturns.Controls.Add(tcReturnsCol1);
                        tcReturnsCol2.Controls.Add(new LiteralControl("<div align=\"right\"><span class=\"text2\">" + (ds.Tables[2].Rows[idx]["qtr"].ToString().Length > 0 && Double.Parse(ds.Tables[2].Rows[idx]["qtr"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[2].Rows[idx]["qtr"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[2].Rows[idx]["qtr"].ToString().Length > 0 ? ds.Tables[2].Rows[idx]["qtr"].ToString() : "0"))) + "%" + "</span></div>"));
                        trReturns.Controls.Add(tcReturnsCol2);
                        tcReturnsCol3.Controls.Add(new LiteralControl("<div align=\"right\"><span class=\"text2\">" + (ds.Tables[2].Rows[idx]["oneyear"].ToString().Length > 0 && Double.Parse(ds.Tables[2].Rows[idx]["oneyear"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[2].Rows[idx]["oneyear"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[2].Rows[idx]["oneyear"].ToString().Length > 0 ? ds.Tables[2].Rows[idx]["oneyear"].ToString() : "0"))) + "%" + "</span></div>"));
                        trReturns.Controls.Add(tcReturnsCol3);
                        tcReturnsCol4.Controls.Add(new LiteralControl("<div align=\"right\"><span class=\"text2\">" + (ds.Tables[2].Rows[idx]["threeyears"].ToString().Length > 0 && Double.Parse(ds.Tables[2].Rows[idx]["threeyears"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[2].Rows[idx]["threeyears"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[2].Rows[idx]["threeyears"].ToString().Length > 0 ? ds.Tables[2].Rows[idx]["threeyears"].ToString() : "0"))) + "%" + "</span></div>"));
                        trReturns.Controls.Add(tcReturnsCol4);
                        tblFunds.Controls.Add(trReturns);

                        // Funds
                        tcFundsCol1.InnerHtml = ds.Tables[2].Rows[idx]["russell"].ToString();
                        tcFundsCol1.Attributes.Add("class", "txt1bold");
                        trFunds.Controls.Add(tcFundsCol1);
                        tcFundsCol2.Controls.Add(new LiteralControl("<div align=\"right\"><span class=\"text2\">" + (ds.Tables[2].Rows[idx]["Rqtr"].ToString().Length > 0 && Double.Parse(ds.Tables[2].Rows[idx]["Rqtr"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[2].Rows[idx]["Rqtr"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[2].Rows[idx]["Rqtr"].ToString().Length > 0 ? ds.Tables[2].Rows[idx]["Rqtr"].ToString() : "0"))) + "%" + "</span></div>"));
                        trFunds.Controls.Add(tcFundsCol2);
                        tcFundsCol3.Controls.Add(new LiteralControl("<div align=\"right\"><span class=\"text2\">" + (ds.Tables[2].Rows[idx]["Roneyear"].ToString().Length > 0 && Double.Parse(ds.Tables[2].Rows[idx]["Roneyear"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[2].Rows[idx]["Roneyear"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[2].Rows[idx]["Roneyear"].ToString().Length > 0 ? ds.Tables[2].Rows[idx]["Roneyear"].ToString() : "0"))) + "%" + "</span></div>"));
                        trFunds.Controls.Add(tcFundsCol3);
                        tcFundsCol4.Controls.Add(new LiteralControl("<div align=\"right\"><span class=\"text2\">" + (ds.Tables[2].Rows[idx]["Rthreeyears"].ToString().Length > 0 && Double.Parse(ds.Tables[2].Rows[idx]["Rthreeyears"].ToString()) < 0 && String.Format("{0:0.0}", Double.Parse((ds.Tables[2].Rows[idx]["Rthreeyears"].ToString()))) == "0.0" ? "-" : "") + String.Format("{0:0.0}", Double.Parse((ds.Tables[2].Rows[idx]["Rthreeyears"].ToString().Length > 0 ? ds.Tables[2].Rows[idx]["Rthreeyears"].ToString() : "0"))) + "%" + "</span></div>"));
                        trFunds.Controls.Add(tcFundsCol4);
                        tblFunds.Controls.Add(trFunds);

                        divFunds.Controls.Add(tblFunds);

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
                ds      = null;
                commad  = null;
                db      = null;
            }
        }
    }
}

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

namespace RetirementFunds.User
{
    public partial class UserMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Display selected plan 
            if (this.Session["nertPPlan"] != null)
            {
                System.Data.DataSet dsTemp  = (System.Data.DataSet)this.Session["nertPPlan"];
                lblPlanName.Text            = dsTemp.Tables[0].Rows[0][1].ToString();
                lblPlaneNameHeader.Text     = dsTemp.Tables[0].Rows[0][1].ToString();
                divPlanInformation.Visible  = true;
            }

            this.PopulateUI();
        }

        private void PopulateUI()
        {
            DataSet     ds      = null;
            Database    db      = DatabaseFactory.CreateDatabase("NertAppSQLConnectionString");
            DbCommand   commad  = db.GetSqlStringCommand(@"SELECT	tbl_id
		                                                            , planid
		                                                            , first
		                                                            , middle
		                                                            , last
		                                                            , ssn
		                                                            , dob
		                                                            , dthire
		                                                            , email
                                                            FROM	emps
                                                            WHERE	proc1 <> 'y'
                                                            AND		planid = @planId");

            if (Session["nertPPlan"] != null)
            {
                db.AddInParameter(commad, "planId", DbType.String, ((DataSet)Session["nertPPlan"]).Tables[0].Rows[0][0].ToString());
            }
            else
            {
                db.AddInParameter(commad, "planId", DbType.String, null);
            }

            try
            {
                ds = db.ExecuteDataSet(commad);

                TableRow tr             = new TableRow();
                TableCell firstName     = new TableCell();
                TableCell middleName    = new TableCell();
                TableCell lastName      = new TableCell();
                TableCell ssn           = new TableCell();
                TableCell birthDate     = new TableCell();
                TableCell hireDate      = new TableCell();
                TableCell email         = new TableCell();
                TableCell edit          = new TableCell();

                if( ds != null && ds.Tables[0].Rows.Count > 0 )
                {
                    tr.CssClass = "txt1bold";
                    tr.Height = Unit.Pixel(30);

                    // First Add header rows
                    firstName.Text = "First";
                    firstName.Attributes.Add("bgcolor","CCCCCC");
                    tr.Cells.Add(firstName);

                    middleName.Text = "M";
                    middleName.Attributes.Add("bgcolor", "CCCCCC");
                    tr.Cells.Add(middleName);

                    lastName.Text = "Last";
                    lastName.Attributes.Add("bgcolor", "CCCCCC");
                    tr.Cells.Add(lastName);

                    ssn.Text = "SSN";
                    ssn.Attributes.Add("bgcolor", "CCCCCC");
                    tr.Cells.Add(ssn);

                    birthDate.Text = "Birth Date";
                    birthDate.Attributes.Add("bgcolor", "CCCCCC");
                    tr.Cells.Add(birthDate);

                    hireDate.Text = "Hire Date";
                    hireDate.Attributes.Add("bgcolor", "CCCCCC");
                    tr.Cells.Add(hireDate);

                    email.Text = "Email";
                    email.Attributes.Add("bgcolor", "CCCCCC");
                    tr.Cells.Add(email);

                    edit.Text = "Edit";
                    edit.Attributes.Add("bgcolor", "CCCCCC");
                    tr.Cells.Add(edit);

                    tblEmployee.Rows.Add(tr);

                    for(int idx=0; idx<ds.Tables[0].Rows.Count; idx++)
                    {
                        tr            = new TableRow();
                        firstName     = new TableCell();
                        middleName    = new TableCell();
                        lastName      = new TableCell();
                        ssn           = new TableCell();
                        birthDate     = new TableCell();
                        hireDate      = new TableCell();
                        email         = new TableCell();
                        edit          = new TableCell();

                        firstName.Text = ds.Tables[0].Rows[idx]["first"].ToString();
                        tr.Cells.Add(firstName);

                        middleName.Text = ds.Tables[0].Rows[idx]["middle"].ToString();
                        tr.Cells.Add(middleName);

                        lastName.Text = ds.Tables[0].Rows[idx]["last"].ToString();
                        tr.Cells.Add(lastName);

                        ssn.Text = ds.Tables[0].Rows[idx]["ssn"].ToString();
                        tr.Cells.Add(ssn);

                        birthDate.Text = ds.Tables[0].Rows[idx]["dob"].ToString();
                        tr.Cells.Add(birthDate);

                        hireDate.Text = ds.Tables[0].Rows[idx]["dthire"].ToString();
                        tr.Cells.Add(hireDate);

                        email.Text = ds.Tables[0].Rows[idx]["email"].ToString();
                        tr.Cells.Add(email);

                        edit.Text = "<a href='User.aspx?action=edit&uid=" + ds.Tables[0].Rows[idx]["tbl_id"].ToString() + "'><img src='/images/icon_edit.gif' alt='Edit records' border='0'></a>";
                        tr.Cells.Add(edit);

                        tr.CssClass = "txt1bold";
                        tblEmployee.Rows.Add(tr);
                    }
                }
                else
                {
                    firstName.Text = "No records Found";
                    tr.Cells.Add(firstName);  
                    tblEmployee.Rows.Add(tr);
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
                ds      = null;
                commad  = null;
                db      = null;
            }
        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("User.aspx?action=add", true);
        }
    }
}

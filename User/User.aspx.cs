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
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Display selected plan 
            if (this.Session["nertPPlan"] != null)
            {
                System.Data.DataSet dsTemp  = (System.Data.DataSet)this.Session["nertPPlan"];
                lblPlaneNameHeader.Text     = dsTemp.Tables[0].Rows[0][1].ToString();
                divPlanInformation.Visible  = true;
            }

            if (Request.QueryString["action"].ToString().ToLower().Equals("edit")
                && !this.IsPostBack)
            {
                this.PopulateUI();
                this.btnSave.Text           = "Update";
                this.btnSaveAddNew.Visible  = false;
                this.txtSSN.Visible         = false;
                this.trPlanId.Visible       = true;
                this.btnSave.OnClientClick  = "return validateForm('" + this.txtFirstName.ClientID.ToString() + "','"
                                                                     + this.txtLastName.ClientID.ToString() + "','','"
                                                                     + this.txtEmail.ClientID.ToString() + "','"
                                                                     + this.txtBirthDate.ClientID.ToString() + "','"
                                                                     + this.txtHireDate.ClientID.ToString() + "');";
            }
            else
            {
                this.btnSave.OnClientClick = "return validateForm('" + this.txtFirstName.ClientID.ToString() + "','"
                                                                    + this.txtLastName.ClientID.ToString() + "','"
                                                                    + this.txtSSN.ClientID.ToString() + "','"
                                                                    + this.txtEmail.ClientID.ToString() + "','"
                                                                    + this.txtBirthDate.ClientID.ToString() + "','"
                                                                    + this.txtHireDate.ClientID.ToString() + "');";

                this.btnSaveAddNew.OnClientClick = "return validateForm('" + this.txtFirstName.ClientID.ToString() + "','"
                                                                            + this.txtLastName.ClientID.ToString() + "','"
                                                                            + this.txtSSN.ClientID.ToString() + "','"
                                                                            + this.txtEmail.ClientID.ToString() + "','"
                                                                            + this.txtBirthDate.ClientID.ToString() + "','"
                                                                            + this.txtHireDate.ClientID.ToString() + "');";
            }
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
                                                            WHERE	tbl_id = @tbl_id");

            if (Request.QueryString["uid"] != null)
            {
                db.AddInParameter(commad, "tbl_id", DbType.Int32, Request.QueryString["uid"].ToString());
            }
            else
            {
                db.AddInParameter(commad, "tbl_id", DbType.Int32, "0");
            }

            try
            {
                ds = db.ExecuteDataSet(commad);

                if (ds != null && ds.Tables[0].Rows.Count == 1)
                {
                    this.lblPlanId.Text     = ds.Tables[0].Rows[0]["planid"].ToString();
                    this.txtFirstName.Text  = ds.Tables[0].Rows[0]["first"].ToString();
                    this.txtMiddleName.Text = ds.Tables[0].Rows[0]["middle"].ToString();
                    this.txtLastName.Text   = ds.Tables[0].Rows[0]["last"].ToString();
                    this.lblSSN.Text        = ds.Tables[0].Rows[0]["ssn"].ToString();
                    this.txtBirthDate.Text  = ds.Tables[0].Rows[0]["dob"].ToString();
                    this.txtHireDate.Text   = ds.Tables[0].Rows[0]["dthire"].ToString();
                    this.txtEmail.Text      = ds.Tables[0].Rows[0]["email"].ToString();
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Database    db          = DatabaseFactory.CreateDatabase("NertAppSQLConnectionString");
            DbCommand   commad      = null;
            bool        recordSaved = true;

            try
            {
                if (Request.QueryString["action"].ToString().ToLower().Equals("edit"))
                {
                    commad = db.GetSqlStringCommand(@"UPDATE    emps
                                                  SET       first       = @firstName
                                                            , middle    = @middleName
                                                            , last      = @lastName
                                                            , dob       = @dob
                                                            , dthire    = @dthire
                                                            , email     = @email
                                                  WHERE     tbl_id      = @tbl_id");

                    db.AddInParameter(commad, "firstName", DbType.String, (this.txtFirstName.Text.Trim().Length > 0) ? this.txtFirstName.Text.ToString() : null);
                    db.AddInParameter(commad, "middleName", DbType.String, (this.txtMiddleName.Text.Trim().Length > 0) ? this.txtMiddleName.Text.ToString() : null);
                    db.AddInParameter(commad, "lastName", DbType.String, (this.txtLastName.Text.Trim().Length > 0) ? this.txtLastName.Text.ToString() : null);
                    db.AddInParameter(commad, "dob", DbType.String, (this.txtBirthDate.Text.Trim().Length > 0) ? this.txtBirthDate.Text.ToString() : null);
                    db.AddInParameter(commad, "dthire", DbType.String, (this.txtHireDate.Text.Trim().Length > 0) ? this.txtHireDate.Text.ToString() : null);
                    db.AddInParameter(commad, "email", DbType.String, (this.txtEmail.Text.Trim().Length > 0) ? this.txtEmail.Text.ToString() : null);
                    db.AddInParameter(commad, "tbl_id", DbType.Int32, Request.QueryString["uid"].ToString());

                    db.ExecuteNonQuery(commad);
                }
                else
                {
                    // Verify if record exists
                    if (!this.VerifyIfRecordExists())
                    {
                        commad = db.GetSqlStringCommand(@"INSERT INTO emps( planid, first, middle, last, ssn, dob, dthire, email, proc1, dateentered )
                                                  VALUES( @planid, @firstName, @middleName, @lastName, @ssn, @dob, @dthire, @email, @proc1, @dateEntered)");

                        db.AddInParameter(commad, "planid", DbType.String, ((System.Data.DataSet)this.Session["nertPPlan"]).Tables[0].Rows[0][0].ToString());
                        db.AddInParameter(commad, "firstName", DbType.String, (this.txtFirstName.Text.Trim().Length > 0) ? this.txtFirstName.Text.ToString() : null);
                        db.AddInParameter(commad, "middleName", DbType.String, (this.txtMiddleName.Text.Trim().Length > 0) ? this.txtMiddleName.Text.ToString() : null);
                        db.AddInParameter(commad, "lastName", DbType.String, (this.txtLastName.Text.Trim().Length > 0) ? this.txtLastName.Text.ToString() : null);
                        db.AddInParameter(commad, "ssn", DbType.String, (this.txtSSN.Text.Trim().Length > 0) ? this.txtSSN.Text.ToString() : null);
                        db.AddInParameter(commad, "dob", DbType.String, (this.txtBirthDate.Text.Trim().Length > 0) ? this.txtBirthDate.Text.ToString() : null);
                        db.AddInParameter(commad, "dthire", DbType.String, (this.txtHireDate.Text.Trim().Length > 0) ? this.txtHireDate.Text.ToString() : null);
                        db.AddInParameter(commad, "email", DbType.String, (this.txtEmail.Text.Trim().Length > 0) ? this.txtEmail.Text.ToString() : null);
                        db.AddInParameter(commad, "proc1", DbType.String, "n");
                        db.AddInParameter(commad, "dateEntered", DbType.DateTime, DateTime.Now);

                        db.ExecuteNonQuery(commad);
                    }
                    else
                    {
                        this.lblMessage.Text = "PlanID Duplicate Please change Plan.";
                        this.lblMessage.Visible = true;
                    }
                }
            }
            catch (System.Exception exp)
            {
                recordSaved = false;
                if (Session["Error"] != null)
                {
                    Session.Remove("Error");
                }
                Session.Add("Error", exp.ToString());
                Response.Redirect("~/Common/Error.aspx", true);
            }
            finally
            {
                commad  = null;
                db      = null;
            }

            if (recordSaved
                && !this.lblMessage.Visible)
            {
                Response.Redirect("UserMaster.aspx", true);
            }
        }

        protected void btnSaveAddNew_Click(object sender, EventArgs e)
        {
            Database    db      = DatabaseFactory.CreateDatabase("NertAppSQLConnectionString");
            DbCommand   commad  = null;
            bool recordSaved    = true;

            try
            {
                // Verify if record exists
                if (!this.VerifyIfRecordExists())
                {
                    commad = db.GetSqlStringCommand(@"INSERT INTO emps( planid, first, middle, last, ssn, dob, dthire, email, proc1, dateentered )
                                              VALUES( @planid, @firstName, @middleName, @lastName, @ssn, @dob, @dthire, @email, @proc1, @dateEntered)");

                    db.AddInParameter(commad, "planid", DbType.String, ((System.Data.DataSet)this.Session["nertPPlan"]).Tables[0].Rows[0][0].ToString());
                    db.AddInParameter(commad, "firstName", DbType.String, (this.txtFirstName.Text.Trim().Length > 0) ? this.txtFirstName.Text.ToString() : null);
                    db.AddInParameter(commad, "middleName", DbType.String, (this.txtMiddleName.Text.Trim().Length > 0) ? this.txtMiddleName.Text.ToString() : null);
                    db.AddInParameter(commad, "lastName", DbType.String, (this.txtLastName.Text.Trim().Length > 0) ? this.txtLastName.Text.ToString() : null);
                    db.AddInParameter(commad, "ssn", DbType.String, (this.txtSSN.Text.Trim().Length > 0) ? this.txtSSN.Text.ToString() : null);
                    db.AddInParameter(commad, "dob", DbType.String, (this.txtBirthDate.Text.Trim().Length > 0) ? this.txtBirthDate.Text.ToString() : null);
                    db.AddInParameter(commad, "dthire", DbType.String, (this.txtHireDate.Text.Trim().Length > 0) ? this.txtHireDate.Text.ToString() : null);
                    db.AddInParameter(commad, "email", DbType.String, (this.txtEmail.Text.Trim().Length > 0) ? this.txtEmail.Text.ToString() : null);
                    db.AddInParameter(commad, "proc1", DbType.String, "n");
                    db.AddInParameter(commad, "dateEntered", DbType.DateTime, DateTime.Now);

                    db.ExecuteNonQuery(commad);
                }
                else
                {
                    this.lblMessage.Text    = "PlanID Duplicate Please change Plan.";
                    this.lblMessage.Visible = true;
                }
            }
            catch (System.Exception exp)
            {
                recordSaved = false;
                if (Session["Error"] != null)
                {
                    Session.Remove("Error");
                }
                Session.Add("Error", exp.ToString());
                Response.Redirect("~/Common/Error.aspx", true);
            }
            finally
            {
                commad  = null;
                db      = null;
            }

            if (recordSaved
                && !this.lblMessage.Visible)
            {
                Response.Redirect("User.aspx?action=add", true);
            }
        }

        private bool VerifyIfRecordExists()
        {
            Database    db              = DatabaseFactory.CreateDatabase("NertAppSQLConnectionString");
            DbCommand   commad          = null;
            bool        recordExists    = false;

            try
            {
                commad = db.GetSqlStringCommand(@"SELECT count(*) FROM emps WHERE SSN=@ssn AND PlanId=@planid");

                db.AddInParameter(commad, "planid", DbType.String, ((System.Data.DataSet)this.Session["nertPPlan"]).Tables[0].Rows[0][0].ToString());
                db.AddInParameter(commad, "ssn", DbType.String, (this.txtSSN.Text.Trim().Length > 0) ? this.txtSSN.Text.ToString() : null);

                recordExists = Int32.Parse(db.ExecuteScalar(commad).ToString()) > 0 ? true : false;
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
                commad = null;
                db = null;
            }

            return recordExists;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserMaster.aspx", true);
        }
    }
}

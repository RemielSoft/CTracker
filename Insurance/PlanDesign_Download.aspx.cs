using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

using System.Text;
using RetirementFunds.Common;
using System.Drawing;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;

namespace RetirementFunds.Insurance
{
    public partial class PlanDesign_Download : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            TryNew();
            
            
        }

        public void TryNew()
        {
            char[] Valichars = {'1','2','3','4','5','6','7','8','9','0','a','b','c','d','e','f','g','h','i',
                           'j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z' };

            string Captcha = "";

            int LetterCount = MaxLetterCount > 6 ? MaxLetterCount : 6;
            for (int i = 0; i < LetterCount; i++)
            {
                int index = new Random(DateTime.Now.Millisecond).Next(Valichars.Count() - 1);
                Captcha += Valichars[index].ToString().ToUpper();
                Thread.Sleep(2);
            }

            GeneratedText = Captcha;

            // Generate a Randon Number between 0 and 2
            Random randomClass = new Random();
            int randomNumber = randomClass.Next(0, 3);

            imgCaptcha.ImageUrl = "GetImgText.ashx?CaptchaText=" + Captcha + "&imageUsed=" + randomNumber.ToString();
        }

        public int MaxLetterCount { get; set; }

        private string GeneratedText
        {
            get
            {
                return ViewState[this.ClientID + "text"] != null ?
                    ViewState[this.ClientID + "text"].ToString() : null;
            }
            set
            {
                // Encrypt the value before storing it in viewstate.
                ViewState[this.ClientID + "text"] = value;
            }
        }

        public bool GeneratedTextIsValid
        {
            get
            {
                bool result = GeneratedText.ToUpper() == txtCAPTCHA.Text.Trim().ToUpper();
                if (!result)
                    TryNew();
                return result;
            }
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            //Response.Write("text is " + this.GeneratedTextIsValid.ToString());
            //Response.Write("<br>page is " + this.IsValid.ToString());

            if (this.GeneratedTextIsValid == false)
            {
                lblMsg.Text = "You have entered a wrong security word.";
            }
            else
            {
                //Send email
                StringBuilder strBdr = new StringBuilder();

                strBdr.Append("<html>");
                strBdr.Append("<head>");
                strBdr.Append("<title>");
                strBdr.Append("</title>");
                strBdr.Append("</head>");
                strBdr.Append("<body>");
                strBdr.Append("<table border='1' cellspacing='2' cellpadding='2' width='100%'>");

                strBdr.Append("<tr>");
                strBdr.Append("<td width='20%'>FIRSTNAME:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtFirstName.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>LASTNAME:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtLastName.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>ADDRESS1:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtAddress1.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>ADDRESS2:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtAddress2.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>CITY:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtCity.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>STATE:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.ddlState.SelectedValue);
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>ZIP:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtZip.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>DAYTIME PHONE:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtDayTimePhone.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>EVENING PHONE:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtEveningPhone.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>FAX:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtFax.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>EMAIL:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtEmail.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>PRESENTATION:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.rblPresentation.SelectedItem.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>OCCUPATION:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtOccupation.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>DOB:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtDateOfBirth.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>ANNUAL EARNINGS:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtAnnualEarnings.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>CURRENTLY HAVE PLAN:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.rblPlan.SelectedItem.Value);
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>CURRENT PLAN:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtCurrentPlans.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>CURRENT CONTRIBUTION:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtContribute.Text);
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>NUM OF EMPLOYEES:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtEmployees.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>BUSINESS NAME:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtBusiness.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>BUSINESS STRUCTURE:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.ddlBusinessType.SelectedItem.Text);
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>SPOUSE EMPLOYED BY ME:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.rblSpouseEmployee.SelectedItem.Text);
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>SPOUSE COMPANY:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtSpouseCompany.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>SPOUSE HAS PLAN:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.rblSpouseHasPlan.SelectedItem.Value);
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>SPOUSE PLAN:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtSpousePlanType.Text);
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>RATING 1:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.rblRating1.SelectedItem.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>RATING 2:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.rblRating2.SelectedItem.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>RATING 3:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.rblRating3.SelectedItem.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>RATING 4:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.rblRating4.SelectedItem.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>RATING 5:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.rblRating5.SelectedItem.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>RATING 6:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.rblRating6.SelectedItem.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>RATING 7:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.rblRating7.SelectedItem.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>TAXES:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.rblTaxes.SelectedItem.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>RETIRE IN YEARS:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.rblRetire.SelectedItem.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>RETIRE IN YEARS OTHER:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtRetirementAge.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>BEST TIME FOR INITIAL CONSULTATION:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtTime1.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("<tr>");
                strBdr.Append("<td>ALTERNATE TIME FOR INITIAL CONSULTATION:");
                strBdr.Append("</td>");
                strBdr.Append("<td>&nbsp;" + this.txtTime2.Text.ToString());
                strBdr.Append("</td>");
                strBdr.Append("</tr>");

                strBdr.Append("</table>");
                strBdr.Append("</body>");
                strBdr.Append("</html>");

                try
                {
                    // Send Email
                    Utility.SendMail("Plan Design Request"
                                        , strBdr.ToString()
                                        , System.Web.Configuration.WebConfigurationManager.AppSettings["fromAddress"].ToString()
                                        , "apapension@nert.com"
                                        , string.Empty
                                        , string.Empty
                                        , "html"
                                        , "high");

                    //Insert inquiry into DB
                    InsertInquiry();

                    if (rblPresentation.SelectedItem.Text.ToString() == "Download")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script>window.open('../Association/APACONV2008.pdf', 'apa_doc');</script>");
                        lblMsg.Text = "Thank you for submitting your information. The plan has been opened in a separate window.";
                        lblMsg.ForeColor = Color.Green;

                        //Response.Redirect("~/Insurance/PlanDesignActionThankYou.aspx", true);
                        //Response.Redirect("~/Association/APACONV2008.pdf", true);
                    }
                    else if (rblPresentation.SelectedItem.Text.ToString() == "Email")
                    {
                        Response.Redirect("~/Insurance/PlanDesignActionThankYou.aspx", true);
                    }

                }
                catch (System.Threading.ThreadAbortException)
                {
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
            }
            
        }

        private void InsertInquiry()
        {
            Database db = DatabaseFactory.CreateDatabase("NertAppSQLConnectionString");
            DbCommand command = null;

            try
            {
                command = db.GetSqlStringCommand(@"INSERT INTO inquiries(Company,FirstName,LastName,Address1,Address2,City
                                    ,State,Zip1,Phoneday1,Phoneeve1,Fax1,Email,Occupation,DOB,Earnings
                                    ,HavePlan,CurrentPlans,Contrib,Employees,Busname,BusType,SpouseEmpl,SpouseBus,SpouseHasPlan
                                    ,SpousePlanType,Rating1,Rating2,Rating3,Rating4,Rating5,Rating6,Rating7,Taxes,Retire
                                    ,Time1,Time2,Notes,date_entered,status) VALUES (@company, @firstName, @lastName, @address1
                                    ,@address2, @city, @state, @zip, @dayPhone, @evePhone, @fax, @email, @occupation, @dob 
                                    ,@earnings, @havePlan, @currentPlan, @contribute, @employees, @business, @businessType
                                    ,@spouseEmp, @spouseCompany, @spouseHasPlan, @spousePlanType, @rating1, @rating2, @rating3
                                    ,@rating4, @rating5, @rating6, @rating7, @taxes, @retire, @time1, @time2, @notes, @dateEntered
                                    ,@status)");

                db.AddInParameter(command, "company", DbType.String, (this.txtCompany.Text.Trim().Length > 0) ? this.txtCompany.Text.ToString() : null);
                db.AddInParameter(command, "firstName", DbType.String, (this.txtFirstName.Text.Trim().Length > 0) ? this.txtFirstName.Text.ToString() : null);
                db.AddInParameter(command, "lastName", DbType.String, (this.txtLastName.Text.Trim().Length > 0) ? this.txtLastName.Text.ToString() : null);
                db.AddInParameter(command, "address1", DbType.String, (this.txtAddress1.Text.Trim().Length > 0) ? this.txtAddress1.Text.ToString() : null);
                db.AddInParameter(command, "address2", DbType.String, (this.txtAddress2.Text.Trim().Length > 0) ? this.txtAddress2.Text.ToString() : null);
                db.AddInParameter(command, "city", DbType.String, (this.txtCity.Text.Trim().Length > 0) ? this.txtCity.Text.ToString() : null);
                db.AddInParameter(command, "state", DbType.String, this.ddlState.SelectedItem.Value);
                db.AddInParameter(command, "zip", DbType.String, (this.txtZip.Text.Trim().Length > 0) ? this.txtZip.Text.ToString() : null);
                db.AddInParameter(command, "dayPhone", DbType.String, (this.txtDayTimePhone.Text.Trim().Length > 0) ? this.txtDayTimePhone.Text.ToString() : null);
                db.AddInParameter(command, "evePhone", DbType.String, (this.txtEveningPhone.Text.Trim().Length > 0) ? this.txtEveningPhone.Text.ToString() : null);
                db.AddInParameter(command, "fax", DbType.String, (this.txtFax.Text.Trim().Length > 0) ? this.txtFax.Text.ToString() : null);
                db.AddInParameter(command, "email", DbType.String, (this.txtEmail.Text.Trim().Length > 0) ? this.txtEmail.Text.ToString() : null);
                db.AddInParameter(command, "occupation", DbType.String, (this.txtOccupation.Text.Trim().Length > 0) ? this.txtOccupation.Text.ToString() : null);
                db.AddInParameter(command, "dob", DbType.String, (this.txtDateOfBirth.Text.Trim().Length > 0) ? this.txtDateOfBirth.Text.ToString() : null);
                db.AddInParameter(command, "earnings", DbType.Currency, (this.txtAnnualEarnings.Text.Trim().Length > 0) ? this.txtAnnualEarnings.Text.ToString() : null);
                db.AddInParameter(command, "havePlan", DbType.String, this.rblPlan.SelectedItem.Value);
                db.AddInParameter(command, "currentPlan", DbType.String, (this.txtCurrentPlans.Text.Trim().Length > 0) ? this.txtCurrentPlans.Text.ToString() : null);
                db.AddInParameter(command, "contribute", DbType.Currency, (this.txtContribute.Text.Trim().Length > 0) ? this.txtContribute.Text.ToString() : null);
                db.AddInParameter(command, "employees", DbType.Int32, (this.txtEmployees.Text.Trim().Length > 0) ? this.txtEmployees.Text.ToString() : null);
                db.AddInParameter(command, "business", DbType.String, (this.txtBusiness.Text.Trim().Length > 0) ? this.txtBusiness.Text.ToString() : null);
                db.AddInParameter(command, "businessType", DbType.String, this.ddlBusinessType.SelectedItem.Text);
                db.AddInParameter(command, "spouseEmp", DbType.String, this.rblSpouseEmployee.SelectedItem.Text);
                db.AddInParameter(command, "spouseCompany", DbType.String, (this.txtSpouseCompany.Text.Trim().Length > 0) ? this.txtSpouseCompany.Text.ToString() : null);
                db.AddInParameter(command, "spouseHasPlan", DbType.String, this.rblSpouseHasPlan.SelectedItem.Value);
                db.AddInParameter(command, "spousePlanType", DbType.String, (this.txtSpousePlanType.Text.Trim().Length > 0) ? this.txtSpousePlanType.Text.ToString() : null);
                db.AddInParameter(command, "rating1", DbType.String, this.rblRating1.SelectedItem.Text);
                db.AddInParameter(command, "rating2", DbType.String, this.rblRating2.SelectedItem.Text);
                db.AddInParameter(command, "rating3", DbType.String, this.rblRating3.SelectedItem.Text);
                db.AddInParameter(command, "rating4", DbType.String, this.rblRating4.SelectedItem.Text);
                db.AddInParameter(command, "rating5", DbType.String, this.rblRating5.SelectedItem.Text);
                db.AddInParameter(command, "rating6", DbType.String, this.rblRating6.SelectedItem.Text);
                db.AddInParameter(command, "rating7", DbType.String, this.rblRating7.SelectedItem.Text);
                db.AddInParameter(command, "taxes", DbType.String, this.rblTaxes.SelectedItem.Text);
                db.AddInParameter(command, "retire", DbType.String, this.rblRetire.SelectedItem.Text);
                db.AddInParameter(command, "time1", DbType.String, (this.txtTime1.Text.Trim().Length > 0) ? this.txtTime1.Text.ToString() : null);
                db.AddInParameter(command, "time2", DbType.String, (this.txtTime2.Text.Trim().Length > 0) ? this.txtTime2.Text.ToString() : null);
                db.AddInParameter(command, "notes", DbType.String, null);
                db.AddInParameter(command, "dateEntered", DbType.DateTime, DateTime.Now);
                db.AddInParameter(command, "status", DbType.String, "A");
                
                db.ExecuteNonQuery(command);
                    
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
                command = null;
                db = null;
            }
        }
    }
}

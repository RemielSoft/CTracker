using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RetirementFunds.Participant
{
    public partial class Savings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nertPLogin"] == null)
            {
                Response.Redirect("~/Common/Login.aspx", true);
            }
            else
            {
                this.btnSubmit.OnClientClick = @"return ValidateData('" + this.txtAge.ClientID + "','aa','"
                                                                        + this.txtRetirementAge.ClientID + "','ra','"
                                                                        + this.txtAnnualIncomeAtRetirement.ClientID + "','pbaa','"
                                                                        + this.txtCurrentRetirementAssets.ClientID + "','pv','"
                                                                        + this.txtCurrentContribution.ClientID + "','ccont','"
                                                                        + this.txtLifeExpectancy.ClientID + "','da')";

                this.btnReset.Attributes.Add("onclick", "HideContribution('" + this.btnHidden.ClientID + "')");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            divContribution.Visible = true;

            try
            {
                //double aa = double.Parse(txtAge.Text.ToString());
                int aa = Int32.Parse(txtAge.Text.ToString());
                int ra = Int32.Parse(txtRetirementAge.Text.ToString());
                double pbaa = double.Parse(this.txtAnnualIncomeAtRetirement.Text.ToString());
                double iinf = double.Parse(this.ddlEstimatedInflation.SelectedValue.ToString());
                double pv = double.Parse(txtCurrentRetirementAssets.Text.ToString());
                double ccont = double.Parse(txtCurrentContribution.Text.ToString());
                double ipre = double.Parse(ddlEstIntRateUntilRetirement.SelectedValue.ToString());
                double ipst = double.Parse(this.ddlEstIntRateAfterRetirement.SelectedValue.ToString());
                //double da = double.Parse(this.txtLifeExpectancy.Text.ToString());
                int da = Int32.Parse(this.txtLifeExpectancy.Text.ToString());


                double PVRA = pv * Math.Pow((1 + ipre / 100),Convert.ToDouble((ra - aa)));
                double PBRA = pbaa * Math.Pow((1 + iinf / 100), Convert.ToDouble((ra - aa)));
                //double FV = (Int32.Parse(Math.Round((PBRA * ((1 - (1 / (1 + ipst / 100 - iinf / 100)))), 0).ToString()) ^ Int32.Parse(Math.Round((da - ra), 0).ToString())) * ((1 + ipst / 100 - iinf / 100) / (ipst / 100 - iinf / 100));
                double temp = ipst / 100 - iinf / 100;
                double FV = PBRA * (1-(1/ Math.Pow(1 + temp, Convert.ToDouble((da - ra))))) * (1 + temp) / temp;
                //double FV = (Int32.Parse(Math.Round((PBRA * ((1 - (1 / (1 + ipst / 100 - iinf / 100)^ Int32.Parse(Math.Round((da - ra), 0).ToString()))))), 0).ToString())  * ((1 + ipst / 100 - iinf / 100) / (ipst / 100 - iinf / 100));
                double temp2 = ipre / 100 - iinf / 100;
                //double NC = (FV - PVRA) / ((Int32.Parse(Math.Round((1 + ipre / 100 - iinf / 100), 0).ToString()) ^ Int32.Parse(Math.Round(((ra - aa) - 1), 0).ToString())) / (ipre / 100 - iinf/100));
                double NC = (FV - PVRA) / ((Math.Pow((1+temp2), Convert.ToDouble((ra-aa))) - 1.0)/temp2);
                double NCmonthly = NC / 12;

                //NCmonthly = 0;
                NCmonthly = NCmonthly - ccont;

                this.lblAmount.Text = Math.Round(NCmonthly, 0).ToString();
            }
            catch
            {
                
            }
        }

        protected void btnHidden_Click(object sender, EventArgs e)
        {
            divContribution.Visible = false;
        }
    }
}

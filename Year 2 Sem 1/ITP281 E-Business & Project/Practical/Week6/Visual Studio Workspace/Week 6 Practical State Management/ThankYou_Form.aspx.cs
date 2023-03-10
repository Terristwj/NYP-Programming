using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ThankYou_Form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Query
        /**   lb_NAME.Text = Request.QueryString["CustName"];
              lb_NRIC.Text = Request.QueryString["NRIC"];
              lb_HP.Text = Request.QueryString["Hp"];
              lb_EMAIL.Text = Request.QueryString["Email"];
        **/

        //Session
        if (Session["CustName"] != "")
        {
            lb_NAME.Text = (string)Session["CustName"];
            lb_NRIC.Text = (string)Session["NRIC"];
            lb_HP.Text = (string)Session["Hp"];
            lb_EMAIL.Text = (string)Session["Email"];

            lb_Gender.Text = (string)Session["Gender"];
            lb_Notification.Text = (string)Session["Notifications"];
            lb_BirthdayMonth.Text = (string)Session["BirthdayMonth"];
        }
        else {
            lb_NAME.Text = "null";
            lb_NRIC.Text = "null";
            lb_HP.Text = "null";
            lb_EMAIL.Text = "null";
            lb_Gender.Text = "null";
            lb_Notification.Text = "null";
            lb_BirthdayMonth.Text = "null";
        }
    }

    protected void btn_BACK_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registration_Form.aspx");

    }
}
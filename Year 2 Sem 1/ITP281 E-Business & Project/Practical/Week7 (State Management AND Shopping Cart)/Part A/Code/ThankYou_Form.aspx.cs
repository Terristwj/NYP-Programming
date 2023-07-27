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
        Customer cust = new Customer();

        //From Registration_Form.aspx.cs
        cust = (Customer)Session["Registration"];

        lb_NAME.Text = cust.CustName;
        lb_NRIC.Text = cust.NRIC;
        lb_HP.Text = cust.Hp;
        lb_EMAIL.Text = cust.Email;
        lb_Gender.Text = cust.Gender;
        lb_Notification.Text = cust.Notifications;
        lb_BirthdayMonth.Text = cust.BirthdayMonth;
    }

    protected void btn_BACK_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registration_Form.aspx");

    }
}
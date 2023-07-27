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
        //Create a Customer Instance with default Constructor (with Null fields)
        Customer cust = new Customer();

        //Extract data from Session object "Registration and save it to a new Customer Object.
        cust = (Customer)Session["Registration"];

        //Extract data from CUSTOMER object and display them on the label
        lbl_CustName.Text = cust.CustName.ToString();
        lbl_NRIC.Text = cust.NRIC.ToString();
        lbl_Hp.Text = cust.Hp.ToString();
        lbl_Email.Text = cust.Email.ToString();
        lbl_Gender.Text = cust.Gender.ToString();
        lbl_Notifications.Text = cust.Notifications.ToString();
        lbl_BirthdayMonth.Text = cust.BirthdayMonth.ToString();
    }
    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registration_Form.aspx");
    }
}
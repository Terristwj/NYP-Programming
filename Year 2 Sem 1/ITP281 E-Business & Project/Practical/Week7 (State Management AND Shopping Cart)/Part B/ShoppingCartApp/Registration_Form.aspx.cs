using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration_Form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        //UPDATED!! extract info from textbox and save into a string variable
        string CustName = tb_CustName.Text;
        string NRIC = tb_NRIC.Text;
        string Hp = tb_Hp.Text;
        string Email = tb_Email.Text;

        //if rbl_gender is selected, the SelectedIndex will be more than -1.
        string gender = null;
        if (rbl_Gender.SelectedIndex > -1)
        {
            gender = rbl_Gender.SelectedItem.Text;
            //no longer be required
            //Session["Gender"] = gender;
        }

        //if cbl_Notifications is selected, the SelectedIndex will be more than -1.
        string notifications = null;
        if (cbl_Notifications.SelectedIndex > -1)
        {
            if (cbl_Notifications.Items[0].Selected)
            {
                notifications = notifications + cbl_Notifications.Items[0].Text + ";";
            }
            if (cbl_Notifications.Items[1].Selected)
            {
                notifications = notifications + cbl_Notifications.Items[1].Text + ";";
            }
        }

        //no longer be required
        //Session["Notifications"] = notifications; 

        string birthdayMonth = null;
        if (ddl_BirthdayMonth.SelectedIndex > -1)
        {
            birthdayMonth = ddl_BirthdayMonth.SelectedItem.Text;
        }

        //no longer be required
        //Session["BirthdayMonth"] = birthdayMonth;


        //NEW! Create an instance of a new Customer Class. Use the NEW keyword
        Customer cust = new Customer(CustName, NRIC, Hp, Email, gender, notifications, birthdayMonth);

        //NEW! Save Customer object into Session
        Session["Registration"] = cust;

        //Forward your request to ThankYou.aspx for procesing
        Response.Redirect("ThankYou_Form.aspx");

    }
}
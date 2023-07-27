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
 
    protected void btm_Submit_Click(object sender, EventArgs e)
    {
        string CustName = tb_NAME.Text;
        string NRIC = tb_NRIC.Text;
        string Hp = tb_HP.Text;
        string Email = tb_EMAIL.Text;

        string gender = null;
        if (rbl_Gender.SelectedIndex > -1) {
            gender = rbl_Gender.SelectedItem.Text;
        }

        string notifications = null;
        if (cbl_Notifications.SelectedIndex > -1) {

            if (cbl_Notifications.Items[0].Selected) {
                notifications = notifications + cbl_Notifications.Items[0].Text + ";";
            }

            if (cbl_Notifications.Items[1].Selected)
            {
                notifications = notifications + cbl_Notifications.Items[1].Text + ";";
            }
        }

        string birthdayMonth = null;
        if (ddl_BirthdayMonth.SelectedIndex > -1) {
            birthdayMonth = ddl_BirthdayMonth.SelectedItem.Text;
        }

        Customer cust = new Customer(CustName, NRIC, Hp, Email, gender, notifications, birthdayMonth);

        Session["Registration"] = cust;

        Response.Redirect("ThankYou_Form.aspx");
    }
}
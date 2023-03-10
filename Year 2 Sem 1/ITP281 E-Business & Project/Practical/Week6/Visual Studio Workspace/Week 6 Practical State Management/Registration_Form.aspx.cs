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
        //Query Management
  //    string queryString = "?CustName=" + tb_NAME.Text + "&NRIC=" + tb_NRIC.Text + "&Hp=" + tb_HP.Text + "&Email=" + tb_EMAIL.Text;
  
  //    Response.Redirect("ThankYou_Form.aspx" + queryString);


        //Session
        Session["CustName"] = tb_NAME.Text;
        Session["NRIC"] = tb_NRIC.Text;
        Session["Hp"] = tb_HP.Text;
        Session["Email"] = tb_EMAIL.Text;
   


        //If rbl_Gender is selected, SelectedIndex > -1
        string gender = null;
        if (rbl_Gender.SelectedIndex > -1)
        {
            gender = rbl_Gender.SelectedItem.Text;
            Session["Gender"] = gender;
        }

        string notifications = null;
        if (cbl_Notifications.SelectedIndex > -1)
        {
            //Or use a for loop instead of If   

            if (cbl_Notifications.Items[0].Selected)
                notifications = notifications + cbl_Notifications.Items[0].Text + ":";

            if (cbl_Notifications.Items[1].Selected)
                notifications = notifications + cbl_Notifications.Items[1].Text + ":";
        }
        Session["Notifications"] = notifications;

        string birthdayMonth = null;
        if (ddl_BirthdayMonth.SelectedIndex > -1)
        {
            birthdayMonth = ddl_BirthdayMonth.SelectedItem.Text;
        }
        Session["BirthdayMonth"] = birthdayMonth;




        Response.Redirect("ThankYou_Form.aspx");
    }
}
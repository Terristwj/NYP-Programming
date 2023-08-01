using BitzAndBytez.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzAndBytez
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            if (tb_username.Text.Trim() != "" && tb_password.Text.Trim() != "")
            {
                if (Account.userVerified(tb_username.Text.Trim(), tb_password.Text.Trim()))
                {
                    Account retrievedAcc = null;
                    if (Account.staffIsVerified(tb_username.Text.Trim()))
                    {
                        retrievedAcc = Account.getStaffAccount(tb_username.Text.Trim());
                        Session["user"] = retrievedAcc;
                        Session["userID"] = retrievedAcc.Id;
                        //Response.Redirect("Staff_HomePage.aspx");
                        Response.Redirect("Staff_Dashboard.aspx");
                    }
                    else
                    {
                        retrievedAcc = Account.getAccount(tb_username.Text.Trim());
                        Session["user"] = retrievedAcc;
                        Session["userID"] = retrievedAcc.Id;
                        //Response.Redirect("ProductCatalog.aspx");
                        Response.Redirect("Services.aspx");
                    }
                }
            }

        }
    }
}
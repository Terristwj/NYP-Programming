using NYP.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NYP
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            BLL_Accounts accounts = new BLL_Accounts();
            Boolean accountCheck = accounts.checkAccount(tb_AdminNo.Text, tb_Name.Text);

            if (accountCheck == true)
            {
                string userID = accounts.getUserID(tb_AdminNo.Text);
                string queryString = "?login=true" + "&userID=" + userID;
                Response.Redirect("~/Account.aspx" + queryString);
            }
            else
            {
                Response.Write("<script>alert('Incorrect Login')</script>");
            }
        }
    }
}
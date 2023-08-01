using BitzAndBytez.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzAndBytez
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_signUp_Click(object sender, EventArgs e)
        {

            string username = tb_username.Text;
            string password = tb_password.Text;
            string cpassword = tb_cPassword.Text;
            string email = tb_email.Text;

            Account.addUser(username, email, password);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + password + "')", true);
            //if (username != null && password != null && cpassword != null && password == cpassword)
            {

            }
        }
    }
}
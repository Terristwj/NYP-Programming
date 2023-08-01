using BitzBytez.codes.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzBytez
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

            if (username != null && email != null && password != null && cpassword != null)
                if (password == cpassword)
                {
                    Account account = new Account();
                    if (!account.emailTaken(email))
                    {
                        Account.addUser(username, email, password);
                        Response.Redirect("Login.aspx");
                    }
                    else
                        lb_error.Text = "Email is taken";
                }
                else
                    lb_error.Text = "Passwords do not match";
            else
                lb_error.Text = "Please fill every field";
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
﻿using BitzAndBytez.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzAndBytez
{
    public partial class Cust_ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Change_Click(object sender, EventArgs e)
        {
            Account user = Session["user"] as Account;
            string db_password = user.getPassword(user.Email);

            if (db_password.Equals(tb_curPassword.Text))
            {
                if (!tb_curPassword.Text.Equals(tb_newPassword.Text))
                {
                    if (tb_newPassword.Text.Equals(tb_conPassword.Text))
                    {
                        user.updatePassword(user.Email, tb_newPassword.Text);
                        lb_error.Text = "";
                        lb_success.Text = "Successfully Changed Password";
                    }
                    else
                    {
                        lb_error.Text = "New password does not match";
                    }
                }
                else
                {
                    lb_error.Text = "New password is the same";
                }
            }
            else
            {
                lb_error.Text = "Wrong Password";
            }
        }
    }
}
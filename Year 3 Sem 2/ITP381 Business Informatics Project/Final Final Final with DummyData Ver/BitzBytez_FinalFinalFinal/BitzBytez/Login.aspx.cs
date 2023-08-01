using BitzBytez.codes.DAL;
using BitzBytez.codes.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzBytez
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
                        Response.Redirect("Staff_Dashboard.aspx");
                    } else
                    {
                        retrievedAcc = Account.getAccount(tb_username.Text.Trim());
                        Session["user"] = retrievedAcc;
                        Session["userID"] = retrievedAcc.Id;
                        //Response.Redirect("Cust_Notification.aspx");

                        if (CartDA.checkForPendingCart(retrievedAcc.Id) == 0)
                        {
                            CartDA.addNewCart(retrievedAcc.Id);
                        } else
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "showError", "alert('Oops something's wrong with your cart!');", true);
                        }

                        Response.Redirect("Cust_Notification.aspx");
                    }
                } else
                {
                    lb_error.Text = "Username or password is invalid.";
                }
            } else
            {
                lb_error.Text = "Username or password is invalid.";
            }
            
        }

        protected void btn_staff_Click(object sender, EventArgs e)
        {
            tb_username.Text = "paul_manager@bitzbytez.com";
            tb_password.Text = "aaa";
        }

        protected void btn_customer_Click(object sender, EventArgs e)
        {
            tb_username.Text = "kh@gmail.com";
            tb_password.Text = "aaa";
        }
    }
}
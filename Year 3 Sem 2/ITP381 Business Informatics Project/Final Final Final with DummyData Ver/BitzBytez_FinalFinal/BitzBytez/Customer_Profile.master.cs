using BitzBytez.codes.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzBytez
{
    public partial class Customer_Profile : System.Web.UI.MasterPage
    {
        Account user = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = Session["user"] as Account;

            lb_name.Text = user.Username;
        }

        protected void btn_viewBookings_Click(object sender, EventArgs e)
        {
            string queryString = "?service=PCBuilding";
            Response.Redirect("UpcomingBookings.aspx" + queryString);
        }

        protected void btn_LogOut_Click(object sender, EventArgs e)
        {
            Session.Remove("user");
            Response.Redirect("Login.aspx");
        }

        protected void btn_changePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cust_ChangePassword.aspx");
        }

        protected void btn_warrantyTracker_Click(object sender, EventArgs e)
        {
            Response.Redirect("WarrantyTracker.aspx");
        }

        protected void btn_addShippingAddress_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddShippingAddress.aspx");
        }
    }
}
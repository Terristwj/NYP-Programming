using BitzBytez.codes.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzBytez
{
    public partial class CustomerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Account user = Session["user"] as Account;
                username.InnerHtml = user.Username;
            }
        }

        protected void btn_warrantyTracker_Click(object sender, EventArgs e)
        {
            Response.Redirect("WarrantyTracker.aspx");
        }

        protected void btn_LogOut_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Session["userID"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzAndBytez
{
    public partial class CustomerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
    }
}
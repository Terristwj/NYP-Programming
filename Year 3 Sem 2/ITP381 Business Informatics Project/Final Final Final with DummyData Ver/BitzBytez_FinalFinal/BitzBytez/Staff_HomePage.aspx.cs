using BitzBytez.codes.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzBytez
{
    public partial class Staff_HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Account user = Session["user"] as Account;

            if (user != null)
            {
                if (user.Role == "manager")
                {
                    div_Manager.Visible = true;
                    div_CSO.Visible = false;
                }
                else if (user.Role == "cso")
                {
                    div_Manager.Visible = false;
                    div_CSO.Visible = true;
                }
            }
            
        }

        protected void btn_AddProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("Staff_AddProduct.aspx");
        }

        protected void btn_CSRequests_Click(object sender, EventArgs e)
        {
            Response.Redirect("Staff_ChatSupportRequests.aspx");
        }

        protected void btn_AddBuiltPCInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Staff_AddBuiltPCInfo.aspx");
        }

        protected void btn_AddWarrantyInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Staff_AddWarrantyInfo.aspx");
        }
    }
}
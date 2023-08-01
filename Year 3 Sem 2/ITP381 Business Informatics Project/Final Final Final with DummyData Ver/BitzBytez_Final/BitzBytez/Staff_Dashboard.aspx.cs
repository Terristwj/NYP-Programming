using BitzBytez.codes.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzBytez
{
    public partial class Staff_Dashboard : System.Web.UI.Page
    {
        Account user = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = Session["user"] as Account;

            lb_staffName.Text = user.Username;
            lb_accountType.Text = user.Role;

            Session["newProduct"] = null;
            Session["configList"] = null;
            Session["prodcc"] = null;
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session.Remove("user");
            Response.Redirect("Login.aspx");
        }

        protected void btn_manageStaff_Click(object sender, EventArgs e)
        {
            Response.Redirect("Staff_ManageStaff.aspx");
        }

        protected void btn_viewUsers_Click(object sender, EventArgs e)
        {
            Response.Redirect("Staff_ViewUsers.aspx");
        }


        protected void btn_manageServices_Click(object sender, EventArgs e)
        {
            Response.Redirect("Staff_ManageServices_General.aspx");
        }

        protected void btn_serviceTransactions_Click(object sender, EventArgs e)
        {
            string queryString = "?type=appointments&service=PCBuilding";
            Response.Redirect("Staff_ServiceTransactions_Appointments.aspx" + queryString);
        }

        protected void btn_manageSiteConent_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_ManageCompanyInfo.aspx");
        }

        protected void btn_postInfo_Click(object sender, EventArgs e)
        {
            Response.Write("<script>");
            Response.Write("window.open('https://discordapp.com/channels/668469579474927626/668930316416712734' ,'_blank')");
            Response.Write("</script>");
        }

        protected void btn_CSRequests_Click(object sender, EventArgs e)
        {
            Response.Redirect("Staff_ChatSupportRequests.aspx");
        }

        protected void btn_AddProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("Staff_AddProduct.aspx");
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
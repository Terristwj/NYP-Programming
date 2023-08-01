using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzBytez
{
    public partial class Staff_ManageServices : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_general_Click(object sender, EventArgs e)
        {
            Response.Redirect("Staff_ManageServices_General.aspx");
        }

        protected void btn_PCBuild_Click(object sender, EventArgs e)
        {
            string queryString = "?service=PCBuild";
            Response.Redirect("Staff_ManageServices_Template.aspx" + queryString);
        }

        protected void btn_PCRepair_Click(object sender, EventArgs e)
        {
            string queryString = "?service=PCRepair";
            Response.Redirect("Staff_ManageServices_Template.aspx" + queryString);
        }

        protected void btn_PCLesson_Click(object sender, EventArgs e)
        {
            string queryString = "?service=PCLesson";
            Response.Redirect("Staff_ManageServices_Template.aspx" + queryString);
        }

        protected void btn_onsiteDiag_Click(object sender, EventArgs e)
        {
            string queryString = "?service=OnsiteDiag";
            Response.Redirect("Staff_ManageServices_Template.aspx" + queryString);
        }


    }
}
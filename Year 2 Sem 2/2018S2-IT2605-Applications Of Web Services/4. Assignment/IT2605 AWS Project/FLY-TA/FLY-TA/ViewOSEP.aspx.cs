using FLY_TA.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLY_TA
{
    public partial class ViewOSEP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOSEPList();
            }
        }

        protected void btn_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Account.aspx");
        }

        private void BindOSEPList()
        {
            BLL_OSEPs OSEPs = new BLL_OSEPs();
            DataSet OSEPList = OSEPs.BindOSEPList();

            gv_OSEP_List.DataSource = OSEPList;
            gv_OSEP_List.DataBind();
        }

        protected void gv_OSEP_List_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedOSEPId = Convert.ToInt32(gv_OSEP_List.SelectedValue);
            BindOSEPList();
            BindRegistration_gv(selectedOSEPId);
        }

        private void BindRegistration_gv(int OSEP_ID)
        {
            BLL_RegistrationList Registration_List = new BLL_RegistrationList();
            DataSet ds;
            ds = Registration_List.GetRegistrationList(OSEP_ID);
            gv_Registration_List.DataSource = ds;
            gv_Registration_List.DataBind();
        }
    }
}
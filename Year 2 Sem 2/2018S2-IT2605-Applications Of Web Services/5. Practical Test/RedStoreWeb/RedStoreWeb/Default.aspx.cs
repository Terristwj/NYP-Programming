using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RedStoreWeb.BLL;

namespace RedStoreWeb
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                bindGV();
            }
        }

        private void bindGV()
        {
            BLL_WsSales sales = new BLL_WsSales();
            DataSet ds = sales.getAllSales();

            GV_AllSales.DataSource = ds;
            GV_AllSales.DataBind();
        }

        protected void GV_AllSales_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindDV(GV_AllSales.SelectedValue.ToString());
        }

        private void bindDV(string value)
        {
            BLL_WsSales sales = new BLL_WsSales();
            DataSet ds = sales.getSalesByStaff(value);

            DV_StaffSales.DataSource = ds;
            DV_StaffSales.DataBind();
        }
    }
}
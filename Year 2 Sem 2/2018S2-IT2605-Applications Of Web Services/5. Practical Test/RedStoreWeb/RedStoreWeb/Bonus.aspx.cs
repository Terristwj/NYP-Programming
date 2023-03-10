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
    public partial class Bonus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string storeID = TextBox1.Text;
            string budgetRate = TextBox2.Text;

            bindGV(storeID, budgetRate);
        }

        private void bindGV(string storeID, string budgetRate)
        {
            BLL_WsSales sales = new BLL_WsSales();
            Boolean storeIDExist = sales.checkStoreId(storeID);

            DataSet ds = sales.getSalesByStoreID(storeID, budgetRate);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            if (storeIDExist == true)
            {
                Label1.Text = "";
            }
            else
            {
                Label1.Text = "Store Id not found!";
            }
        }
    }
}
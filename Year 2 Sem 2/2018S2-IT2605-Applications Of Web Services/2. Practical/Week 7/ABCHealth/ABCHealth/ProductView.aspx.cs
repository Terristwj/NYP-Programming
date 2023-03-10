using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BusinessLogicLayer;
using DataAccessLayer;

namespace ABCHealth
{
    public partial class ProductView : System.Web.UI.Page
    {
        ProductBLL prodBLL = new ProductBLL(); 

        protected void Page_Load(object sender, EventArgs e)
        {
            List<Product> prodAll = new List<Product>();

            prodAll = prodBLL.getAllProduct();

            gvProduct.DataSource = prodAll;
            gvProduct.DataBind();
        }

        protected void gvProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the currently selected row.
            GridViewRow row = gvProduct.SelectedRow;

            // Get Product ID from the selected row, which is the 
            // first row, i.e. index 0.
            string prodID = row.Cells[0].Text;

            // Redirect to next page, with the Product Id added to the URL,
            // e.g. ProductDetails.aspx?ProdID=1
            Response.Redirect("ProductDetails.aspx?ProdID=" + prodID);
        }




    }
}
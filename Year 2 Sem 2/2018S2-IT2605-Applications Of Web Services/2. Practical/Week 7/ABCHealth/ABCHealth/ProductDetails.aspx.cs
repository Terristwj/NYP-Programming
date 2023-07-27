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
    public partial class ProductDetails : System.Web.UI.Page
    {
        ProductBLL prodBLL = new ProductBLL();

        // Create a product object
        Product prod = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Get Product ID from querystring
            string prodID = Request.QueryString["ProdID"].ToString();

            // Convert Product Id to Decimal
            decimal dProdID = decimal.Parse(prodID);


            // Call getProdDetail() method 
            prod = prodBLL.getProdDetail(dProdID);

            // Display product details on web form
            lbl_ProdName.Text = prod.Product_Name;
            lbl_ProdDesc.Text = prod.Product_Desc;
            lbl_Price.Text = prod.Unit_Price.ToString("c");
            img_Product.ImageUrl = "~\\Images\\" + prod.Product_Image;

            // Store the value in invisible fields
            lbl_Price.Text = prod.Unit_Price.ToString();
            lbl_ProdID.Text = prodID.ToString();

        }

        protected void Btn_Add_Click(object sender, EventArgs e)
        {
            //ShoppingCart.Instance.AddItem(iProductID);

            int iProductID = Convert.ToInt32(lbl_ProdID.Text.ToString());
            //ShoppingCart.ShoppingCart.Instance.AddItem(iProductID);
            ShoppingCart.ShoppingCart.Instance.AddItem(iProductID, prod);
        }

        protected void btn_productlist_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductView.aspx");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductDetails : System.Web.UI.Page
{
    Product prod = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        //*** Set some dummy data until the next practical when we connected to a DB.***
        string prodID = "V001";
        string prodName = "Live Well Super Calcium";
        string prodDesc = "Contains 100 capsules of natural source of calcium";
        decimal prodPrice = 40.0M;
        string prodImage = "Vitamin.png";
        int prodStock = 10;
        prod = new Product(prodID, prodName, prodDesc, prodPrice, prodImage, prodStock);
        // *** End Dummy Data
        // **** Display the Dummy Data on the form ****
        lbl_ProdID.Text = prod.Product_ID.ToString();
        lbl_ProdName.Text = prod.Product_Name.ToString();
        lbl_ProdDesc.Text = prod.Product_Desc.ToString();
        img_Product.ImageUrl = "~\\Images\\" + prod.Product_Image;
        lbl_Price.Text = prod.Unit_Price.ToString("C");
        // **** End Display the Dummy Data on the form ****
    }

    protected void Btn_Add_Click(object sender, EventArgs e)
    {
        string iProductID = prod.Product_ID.ToString();
        ShoppingCart.Instance.AddItem(iProductID, prod);
    }
}
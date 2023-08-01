using BitzBytez.codes.DAL;
using BitzBytez.codes.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzBytez
{
    public partial class ProductCatalog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string category = "";
            List<Product> prods = new List<Product>();

            if (Request.QueryString["category"] != null)
            {
                category = Request.QueryString["category"].ToString();
                category = System.Text.RegularExpressions.Regex.Replace(category, "((?<=[a-z])[A-Z]|[A-Z](?=[a-z]))", " $1").Trim();

                prods = ProductDA.getProductsBasedOnCategory(category);
            }
            else {
                prods = ProductDA.getAllProducts();
            }

            populate_productList(prods);

        }

        protected void searchForProducts(object sender, EventArgs e)
        { 
            List<Product> prods = new List<Product>();

            if (tb_Search.Text != null)
            {
                string terms = tb_Search.Text;
                prods = ProductDA.searchForProducts(terms);
                //ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('" + prods.Count + "');", true);
            }
            
            populate_productList(prods);
        }

        private void populate_productList(List<Product> prods)
        {
            string innerhtml = "";
            foreach (Product p in prods)
            {

                string name_ = "";
                if (p.Name.Length > 60)
                {
                    name_ = p.Name.Substring(0, 60) + "...";
                }
                else
                {
                    name_ = p.Name;
                }

                innerhtml += 

                "<div style=\"padding: 10px; border-bottom: 1px black solid;\">" +
                    "<div class=\"row productListing\" style=\"margin-left:0px;\" onclick=\"location.href='ProductDetails.aspx?productID=" + p.Id + "';\">" +
                          "<div class=\"col-md-3\" style=\"border: 0px black solid\">" +
                        "<img src=\"img/" + ProductDA.getProductImages(p.Id)[0] + "\" style=\"max-height: 100%; max-width: 100%\"/>" +
                    "</div>" +
                    "<div class=\"col-md-9\" style=\"padding: 10px; padding-bottom: 0px; padding-top: 0px; border: 0px black solid; position:relative;\">" +
                        "<div class=\"productTitle\">" +
                            name_ +
                        "</div>" +
                        "<div class=\"productRating\">" +
                            "4.6 <i class=\"fas fa-star\" style=\"color: orange\"></i><a href=\"#\"><span class=\"productReviews\" style=\"font-size: 11px;\"> (5054 votes)</span></a>" +
                        "</div>" +
                        "<div style=\"position:absolute; bottom:0px;\" class=\"productPrice\">FROM SGD " +
                            ProductDA.getLowestProductPrice(p.Id).ToString("N2") +
                        "</div>" +
                    "</div>" +
                    "</div>" +
                "</div>";
            }

            id_productDiv.InnerHtml = innerhtml;

        }
    }
}
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
    public partial class ProductDetails : System.Web.UI.Page
    {
        Account user = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["user"] != null)
            {
                user = Session["user"] as Account;
            }
            if (Request.QueryString["productID"] != null)
            {
                int id = int.Parse(Request.QueryString["productID"].ToString());
                Product p = ProductDA.getProduct(id);
                //ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('" + ProductDA.getQuery() + "')", true);
                List<string> imgs = ProductDA.getProductImages(id);
                if (imgs.Count > 0)
                {
                    string str = "";
                    for (int i = 0; i < imgs.Count; i++)
                    {
                        if (i == 0)
                        {
                            str += "<div class=\"carousel-item active\">" +
                                                    "<img class=\"d-block img_\" style=\"margin: auto;\" src=\"img/" + imgs[i] + "\"/>" +
                                                "</div>";
                        } else
                        {
                            str += "<div class=\"carousel-item\">" +
                                                        "<img class=\"d-block img_\" style=\"margin: auto;\" src=\"img/" + imgs[i] + "\"/>" +
                                                    "</div>";
                        }
                    }
                    //ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('" + str + "')", true);
                    id_img_div.InnerHtml = str;
                }

                id_productTitle.InnerHtml = p.Name;
                id_productPrice.InnerHtml = "SGD " + p.BasePrice;
                id_productDesc_unorderedList.InnerHtml = p.Desc;
                populateCategoryOptions(p.Id);
            }

        }

        protected void addToCart(object sender, EventArgs e)
        {
            ProductConfigCombo combo = Session["selectedCombo"] as ProductConfigCombo;

            int qty = int.Parse(tb_Qty.Text);
            int cartID = 0;

            if (CartDA.checkForPendingCart(user.Id) > 0)
            {
                cartID = CartDA.getPendingCartID(user.Id);
            } else
            {
                cartID = CartDA.addNewCart(user.Id);
            }

            //ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('" + user.Id + " " + combo.ComboID + " " + qty + " " + ProductDA.getProductImages(combo.ProdID)[0] + "')", true);

            if (cartID > 0)
            {
                if (CartDA.getItemStockLevel(combo.ComboID) >= qty)
                {
                    if (CartDA.addItemToCart(cartID, combo.ComboID, qty, ProductDA.getProductImages(combo.ProdID)[0]) > 0)
                    {
                        Response.Redirect("Cart.aspx");
                    } else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('The system encountered an issue adding the item into your cart. Please contact the administrator.')", true);
                    }
                } else
                {
                    ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('We are unable to add the item into your cart due to insufficient stock.')", true);
                }
                
            } else
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('There's an issue with your cart and hence, we couldn't add the item to your cart. Please contact the administrator.')", true);
            }
            
        }

        private void populateCategoryOptions(int productID)
        {
            List<string> categories = ProductDA.getCategories(productID);
            string innerhtml = "";
            string margin = "padding-top:15px;";

            for (int i = 0; i < categories.Count; i++) {

                List<ProductConfiguration> configs = ProductDA.getConfigurationsFromCategory(categories[i], productID);

                if (configs[0].DisplayType.ToLower() == "color")
                {
                    string highlightFirstOption = "";

                    if (i != 0)
                    {
                        margin = "";
                    }

                    innerhtml += "<div class=\"section configCat\" style=\"padding-bottom: 10px; " + margin + "\">" +
                                "<h6 class=\"title-attr\"><small>" + categories[i] + "</small></h6>" +
                                "<div>";

                   
                    for (int a = 0; a < configs.Count; a++)
                    {
                        if (a == 0)
                        {
                            highlightFirstOption = "highlightBorder selected";
                        }
                        else
                        {
                            highlightFirstOption = "";
                        }

                        innerhtml += "<div class=\"attr option" + (i+1) + " " + highlightFirstOption + "\" id=\"" + configs[a].ConfigID + "\" style=\"width: 25px; background: " + configs[a].Config + ";\" onclick=\"changeCSS('" + configs[a].ConfigID + "', 'attr option" + (i + 1) + "', 'highlightBorder')\"></div>"; 
                    }

                    innerhtml += "</div>" +
                            "</div>";

                } else if (configs[0].DisplayType.ToLower() == "text") 
                {
                    string highlightFirstOption = "";

                    if (i != 0)
                    {
                        margin = "";
                    }

                    innerhtml += "<div class=\"section configCat\"  style=\"padding-bottom: 10px; " + margin + "\">" +
                                        "<h6 class=\"title-attr\" style=\"\"><small>" + categories[i] + "</small></h6>" +
                                    "<div>";

                    for (int a = 0; a < configs.Count; a++)
                    {
                        if (a == 0)
                        {
                            highlightFirstOption = "highlightOption selected";
                        }
                        else
                        {
                            highlightFirstOption = "";
                        }

                        innerhtml += "<div class=\"attr option" + (i + 1) + " " + highlightFirstOption + "\" id=\"" + configs[a].ConfigID + "\" onclick=\"changeCSS('" + configs[a].ConfigID + "', 'attr option" + (i + 1) + "', 'highlightOption')\">" + configs[a].Config + "</div>";
                    }

                    innerhtml += "</div>" +
                            "</div>";

                }
            }

            id_configurationSection.InnerHtml = innerhtml;
        }

        private List<int> getConfigurationCombo()
        {
            string results = "";
            List<int> configcombo = new List<int>();
            string rawdata = id_AllConfigs.Text;

            List<int> nos = new List<int>();

            for (int i = 0; i < rawdata.Length; i++)
            {
                if (rawdata[i] == '.')
                {
                    nos.Add(i);
                }
            }

            for (int i = 0; i < nos.Count(); i++)
            {
                if (i == 0)
                {
                    results += rawdata.Substring(0, nos[i]) + " ";
                    configcombo.Add(int.Parse(rawdata.Substring(0, nos[i])));
                }
                else
                {
                    results += rawdata.Substring(nos[i - 1] + 1, nos[i] - nos[i - 1] - 1) + " ";
                    configcombo.Add(int.Parse(rawdata.Substring(nos[i - 1] + 1, nos[i] - nos[i - 1] - 1)));
                }
            }
            string dc = "";
            foreach (int i in configcombo)
            {
                dc += i;
            }

            //ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Results: " + results + "(" + dc + ") Query:" + ProductDA.getQuery() + "');", true);
            //ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('" + ProductDA.getConfigComboInfo(configcombo).Price + "');", true);

            return configcombo;
        }

        protected void btn_getPrice_Click(object sender, EventArgs e)
        {
            ProductConfigCombo combo = null;
            combo = ProductDA.getConfigComboInfo(getConfigurationCombo());
            if (combo != null)
            {
                Session["selectedCombo"] = combo;
                id_productPrice.Style.Add("color", "black");
                id_productPrice.InnerHtml = "SGD " + combo.Price.ToString();
            } else
            {
                id_productPrice.Style.Add("color", "red");
                id_productPrice.InnerHtml = "Unavailable";
            }

        }


    }
}
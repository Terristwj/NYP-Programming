using BitzBytez.codes.DAL;
using BitzBytez.codes.Entities;
using BitzBytez.codes.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzBytez
{
    public partial class Cart : System.Web.UI.Page
    {
        Account user = null;
        int cartID = 0;
        List<CartItem> cartItems = new List<CartItem>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                user = Session["user"] as Account;

                //if (!IsPostBack)
                {
                    if (CartDA.checkForPendingCart(user.Id) > 0)
                    {
                        //test.InnerHtml = "user ID in cart page: " + user.Id + " ";
                        cartID = CartDA.getPendingCartID(user.Id);
                        //test.InnerHtml += "cart ID: " + cartID + " ";
                        cartItems = CartDA.getCartItemDetails(cartID);
                        //test.InnerHtml += "no of cart items in cart page: " + cartItems.Count + " ";
                        populateCartDiv(cartItems);
                    }
                }
            }

            if (!IsPostBack)
            {
                populateAddressDDL();
            }
        }

        private void populateCartDiv(List<CartItem> items)
        {
            string innerhtml = "";
            string inStockOrNot = "In Stock";

            if (items.Count > 0)
            {
                div_subtotalNcheckOut.Visible = true;
                id_cartItemDiv.Visible = true;
                div_cartEmpty.Visible = false;
                div_shipping.Visible = true;
                for (int i = 0; i < items.Count; i++)
                {
                    if (items[i].StockLevel == 0)
                    {
                        inStockOrNot = "Out of Stock";
                    }
                    innerhtml += "<li class=\"items odd\">" +

                                        "<div class=\"infoWrap\">" +
                                        "<div class=\"cartSection\">" +
                                            "<img src=\"img/" + items[i].ThumbnailURL + "\" alt=\"\" class=\"itemImg\"/>" +
                                            "<p class=\"itemNumber\">ITEM-" + items[i].ComboID + "</p>" +
                                            "<h3>" + items[i].ItemName + "</h3>" +

                                            "<p>" +
                                                //"<input id=\"tb_Qty_id" + items[i].CartItemID + "\" onkeypress=\"removeInvalidInput('tb_Qty_id" + items[i].CartItemID + "', " + items[i].CartItemID + ")\" onkeyup=\"removeInvalidInput('tb_Qty_id" + items[i].CartItemID + "', " + items[i].CartItemID + ")\" onkkeydown=\"removeInvalidInput('tb_Qty_id" + items[i].CartItemID + "', " + items[i].CartItemID + ")\" type=\"text\" class=\"qty\" placeholder=\"Quantity\" value=\"" + items[i].Quantity + "\"/>" +
                                                "<input id=\"tb_Qty_id" + items[i].CartItemID + "\" onkeyup=\"removeInvalidInput('tb_Qty_id" + items[i].CartItemID + "', " + items[i].CartItemID + ")\" type=\"text\" class=\"qty\" placeholder=\"Quantity\" value=\"" + items[i].Quantity + "\"/>" +
                                                "x " + items[i].Price.ToString("N2") + "</p>" +
                                            "<p class=\"stockStatus\">" + inStockOrNot + "</p>" +
                                        "</div>" +

                                        "<div class=\"prodTotal cartSection\">" +
                                            "<p>$" + (double.Parse(items[i].Quantity.ToString()) * double.Parse(items[i].Price.ToString())).ToString("N2") + "</p>" +
                                        "</div>" +
                                        "<div class=\"cartSection removeWrap\">" +
                                            "<a href=\"#\" onclick=\"removeItem('" + items[i].CartItemID + "')\" class=\"remove\">x</a>" +
                                        "</div>" +
                                    "</div>" +
                                "</li>";
                }

                id_cartItemDiv.InnerHtml = innerhtml;
                fillPriceSummary(items);
            } else
            {
                div_subtotalNcheckOut.Visible = false;
                id_cartItemDiv.Visible = false;
                div_cartEmpty.Visible = true;
                div_shipping.Visible = false;
            }

        }

        private void fillPriceSummary(List<CartItem> items)
        {
            double subtotal = 0;
            double shipping = 5.00;
            double gst = 0;
            double gstPercent = 0.07;
            double subtotalPercent = 1 - gstPercent;

            foreach (CartItem item in items)
            {
                subtotal += subtotalPercent * item.Price * item.Quantity;
                gst += gstPercent * item.Price * item.Quantity;
            }

            id_subtotal.InnerHtml = "$" + subtotal.ToString("N2");
            id_GST.InnerHtml = "$" + gst.ToString("N2");

            id_total.InnerHtml = "$" + (subtotal + gst + shipping).ToString("N2");
            id_shippingCost.InnerHtml = "$" + shipping.ToString("N2");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            List<int> info = Utilities.ID_Splitter(id_affectedCartItemID_TB.Text);

            if (info[1] == 0)
            {
                if (CartDA.removeItemFromCart(info[0]) == 1)
                {
                    List<CartItem> cartItems = CartDA.getCartItemDetails(cartID);
                    populateCartDiv(cartItems);
                }
            }
            else
            {
                if (CartDA.updateCartItemQuantity(info[0], info[1]) == 1)
                {
                    List<CartItem> cartItems = CartDA.getCartItemDetails(cartID);
                    //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('cartID, cartItems:" + cartID + " " + cartItems.Count + ".');", true);
                    populateCartDiv(cartItems);
                }
            }
        }

        protected void id_checkOutBtn_Click(object sender, EventArgs e)
        {
            if (cartItems.Count > 0)
            {
                if (Convert.ToInt16(Session["selectedSAdd"]) > 0)
                {
                    Session["cartID"] = cartID;
                    string queryString = "?prev=cart";
                    Response.Redirect("Payment.aspx" + queryString);
                } else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please select a shipping address.');", true);
                }

            }
        }

        private void populateAddressDDL()
        {
            List<ShippingAddress> addresses = ShippingAddressDA.getAllAddresses(user.Id);
            //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + addresses.Count + "');", true);
            ddl_shippingAddresses.Items.Clear();
            ddl_shippingAddresses.Items.Insert(0, "");
            for (int i = 0; i < addresses.Count; i++)
            {
                ddl_shippingAddresses.Items.Insert(i + 1, addresses[i].FullName);
            }
        }

        protected void ddl_shippingAddresses_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<ShippingAddress> addresses = ShippingAddressDA.getAllAddresses(user.Id);

            int selectedIndex = ddl_shippingAddresses.SelectedIndex;

            ShippingAddress add = addresses[selectedIndex - 1];

            div_selectedAddress.InnerHtml = "<span style=\"font-weight:bold;\">Address selected: </span><br>" + add.AddressLine1 + " " + add.AddressLine2 + " " + add.City + " " + add.StateProvinceRegion + " " + add.Country + " " + add.PostalCode;

            Session["selectedSAdd"] = add.Id;
        }
    }
}
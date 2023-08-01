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
    public partial class PurchaseHistory : System.Web.UI.Page
    {
        int userID = 0;
        double shipping = 5;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                userID = Convert.ToInt16(Session["userID"]);
                
            }

            if (!IsPostBack)
            {
                populateDDLs();
            }
        }

        private void populateDDLs()
        {
            List<string> dates = CartDA.getPaidDates(userID);

            ddl_date.Items.Clear();
            ddl_date.Items.Insert(0, "");
            for (int i = 0; i < dates.Count; i++)
            {
                ddl_date.Items.Insert(i + 1, dates[i]);
            }

            //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + dates.Count + "');", true);
        }

        protected void ddl_date_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<int> cartIDs = new List<int>();
            cartIDs = CartDA.getPaidCartIDs(userID, ddl_date.SelectedValue);

            ddl_orderID.Items.Clear();
            ddl_orderID.Items.Insert(0, "");
            for (int i = 0; i < cartIDs.Count; i++)
            {
                ddl_orderID.Items.Insert(i + 1, cartIDs[i].ToString());
            }
        }

        protected void ddl_orderID_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<CartItem> items = CartDA.getCartItemDetails(int.Parse(ddl_orderID.SelectedValue));

            double totalAmt = 0;
            tbody_orderItems.InnerHtml = "";
            foreach (CartItem item in items)
            {
                tbody_orderItems.InnerHtml +=
                    "<tr>" +
                        "<td class=\"text-left\">" + item.ItemName + "</td>" +
                        "<td class=\"text-center\">" + item.Quantity + "</td>" +
                        "<td class=\"text-center\">$" + (item.Price * item.Quantity).ToString("N2") + "</td>" +
                    "</tr>";

                totalAmt += item.Price * item.Quantity;
            }

            tbody_orderItems.InnerHtml +=
                "<tr>" +
                        "<td class=\"text-center\" colspan=\"2\" style=\"font-size: 14px; font-style: italic; padding: 10px; font-weight: bold;\">Subtotal</td>" +
                        "<td class=\"text-center pricing\" style=\"border-top: 2px dashed #C1C3D1;\">$" + (totalAmt * 0.93).ToString("N2") + "</td>" +
                    "</tr>" +
                "<tr>" +
                        "<td class=\"text-center\" colspan=\"2\" style=\"font-size: 14px; font-style: italic; padding: 10px; font-weight: bold;\">Shipping</td>" +
                        "<td class=\"text-center pricing\">$" + shipping.ToString("N2") + "</td>" +
                    "</tr>" +
                "<tr>" +
                        "<td class=\"text-center\" colspan=\"2\" style=\"font-size: 14px; font-style: italic; padding: 10px; font-weight: bold;\">GST</td>" +
                        "<td class=\"text-center pricing\">$" + (totalAmt * 0.07).ToString("N2") + "</td>" +
                    "</tr>" +
                "<tr>" +
                        "<td class=\"text-center\" colspan=\"2\"></td>" +
                        "<td class=\"text-center\" style=\"font-weight: bold; border-top: 2px dashed #C1C3D1; font-size:20px;\">$" + (totalAmt + shipping).ToString("N2") + "</td>" +
                    "</tr>";
        }
    }
}
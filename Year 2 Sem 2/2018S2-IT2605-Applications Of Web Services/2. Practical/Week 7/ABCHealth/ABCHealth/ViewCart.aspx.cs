using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;
using DataAccessLayer;
using ABCHealth.ShoppingCart;


namespace ABCHealth
{
    public partial class ViewCart : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack) 
            {
                LoadCart();
            }
        }


        protected void LoadCart()
        {          
            gvCartView.DataSource = ShoppingCart.ShoppingCart.Instance.Items;
            gvCartView.DataBind();

            decimal total = 0.0m;
            foreach (ShoppingCartItem item in ShoppingCart.ShoppingCart.Instance.Items)
            {
                total = total + item.TotalPrice; 
            }

            lbl_TotalPrice.Text = total.ToString();
        }

 
        protected void gvCartView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                lb_error.Text = "Message : " + e.CommandArgument.ToString();
                
                //int productId = Convert.ToInt32("3");
                int productId = Convert.ToInt32(e.CommandArgument);
                ShoppingCart.ShoppingCart.Instance.RemoveItem(productId);
                LoadCart();
            }
        }

        protected void gvCartView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //empty
            //required if your total amt in inside the GridView
        }

        protected void btn_clear_Click(object sender, EventArgs e)
        {
            ShoppingCart.ShoppingCart.Instance.Items.Clear();
            LoadCart();
        }

        //After clicking on the Update function, the Quantity in the textbox needs to be updated back to the ShoppingCart
        protected void btn_update_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvCartView.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    try
                    {
                        int productId = Convert.ToInt32(gvCartView.DataKeys[row.RowIndex].Value);

                        int quantity = int.Parse(((TextBox)row.Cells[2].FindControl("tb_Quantity")).Text);
                        ShoppingCart.ShoppingCart.Instance.SetItemQuantity(productId, quantity);
                    }
                    catch (FormatException e1) {
                        lb_error.Text = e1.Message.ToString();
                    }
                }
            }
            LoadCart();
        }

        protected void btn_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductView.aspx");
        }

        protected void btn_Order_Click(object sender, EventArgs e)
        {
            if (ShoppingCart.ShoppingCart.Instance.Items.Count > 0)
            {
                ShoppingCart.ShoppingCart.Instance.CheckStock();
            }
            lb_error.Text = "Thank you for your patronised!";
        }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCart();
        }
    }

    protected void gv_CartView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            lbl_Error.Text = "Message : " + e.CommandArgument.ToString();
            string productId = e.CommandArgument.ToString();
            ShoppingCart.Instance.RemoveItem(productId);
            LoadCart();
        }
    }

    protected void LoadCart()
    {
        //bind the Items inside the Session/ShoppingCart Instance with the Datagrid
        gv_CartView.DataSource = ShoppingCart.Instance.Items;
        gv_CartView.DataBind();
        decimal total = 0.0m;
        foreach (ShoppingCartItem item in ShoppingCart.Instance.Items)
        {
            total = total + item.TotalPrice;
        }
        lbl_TotalPrice.Text = total.ToString();
    }

    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProductDetails.aspx");
    }

    protected void btn_clear_Click(object sender, EventArgs e)
    {
        ShoppingCart.Instance.Items.Clear();
        LoadCart();
    }

    protected void btn_update_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gv_CartView.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                try
                {
                    string productId = gv_CartView.DataKeys[row.RowIndex].Value.ToString();
                    //row.Cells[2] means that the quantity textbox must be in column 3.
                    int quantity = int.Parse(((TextBox)row.Cells[2].FindControl("tb_Quantity")).Text);
                    ShoppingCart.Instance.SetItemQuantity(productId, quantity);
                }
                catch (FormatException e1)
                {
                    lbl_Error.Text = e1.Message.ToString();
                }
            }
        }
        LoadCart();
    }
}
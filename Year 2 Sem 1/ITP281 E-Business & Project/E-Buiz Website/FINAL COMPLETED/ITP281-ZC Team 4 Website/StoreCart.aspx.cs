using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StoreCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        string command = "SELECT * FROM ShoppingItem si";
        command += " INNER JOIN Products p ON si.Product_ID = p.Product_ID";
        command += " WHERE userID = '" + Request.QueryString["userID"] + "'";

        SqlCommand cmd = new SqlCommand(command, conn);
        SqlDataReader dr = cmd.ExecuteReader();

        if (Request.QueryString["login"].Equals("false"))
        {
            string queryString = "?login=false";
            Response.Redirect("~/StoreErrorPage.aspx" + queryString);
        }
        else if (Request.QueryString["staffID"] != null)
        {
            string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
            Response.Redirect("~/StoreErrorPage.aspx" + queryString);
        }
        else if (!dr.HasRows)
        {
            string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
            Response.Redirect("~/StoreErrorPage.aspx" + queryString);
        }

        if (!IsPostBack)
        {
            ViewGridView();
            cb_UseWallet.Checked = false;

            if (lb_Wallet.Text.Equals("$0.00"))
            {
                cb_UseWallet.Enabled = false;
            }
        }
    }

    protected void ViewGridView()
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        string command = "SELECT * FROM ShoppingItem si";
        command += " INNER JOIN Products p ON si.Product_ID = p.Product_ID";
        command += " WHERE userID = '" + Request.QueryString["userID"] + "'";

        SqlCommand cmd = new SqlCommand(command, conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gv_Products.DataSource = ds;
        gv_Products.DataBind();

        command = "SELECT sum(Unit_Price*Quantity) TotalPrice FROM ShoppingItem si";
        command += " INNER JOIN Products p ON si.Product_ID = p.Product_ID";
        command += " WHERE userID = '" + Request.QueryString["userID"] + "'";

        cmd = new SqlCommand(command, conn);
        SqlDataReader dr = cmd.ExecuteReader();
        string totalPrice = null;

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            totalPrice = Convert.ToDouble(dr["TotalPrice"].ToString()).ToString("0.00");
        }
        dr.Close();

        lb_Price.Text = "$"+ totalPrice;

        command = "SELECT wallet FROM userAccounts WHERE userID = '" + Request.QueryString["userID"] + "'";

        cmd = new SqlCommand(command, conn);
        dr = cmd.ExecuteReader();
        string wallet = null;

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            wallet = Convert.ToDouble(dr["wallet"].ToString()).ToString("0.00");
        }
        dr.Close();
        conn.Close();

        lb_Wallet.Text = "$" + wallet;
        
    }

    protected void gv_Products_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            string[] arg = new string[2];
            arg = e.CommandArgument.ToString().Split(';');

            string userID_ProductID = arg[0];

            string rowIndex = arg[1];
            TextBox tb = (TextBox)gv_Products.Rows[Convert.ToInt32(rowIndex)].FindControl("tb_Qty");
            string quantity = tb.Text;

            //Save quantity into DB
            SqlCommand cmd = new SqlCommand("UPDATE ShoppingItem SET Quantity = '" + quantity + "' WHERE userID_ProductID='" + userID_ProductID + "' ", conn);
            int updated = cmd.ExecuteNonQuery();
            conn.Close();

            //Refresh webpage
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
            
        }
        if (e.CommandName == "Delete")
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            SqlCommand cmd = new SqlCommand("DELETE FROM ShoppingItem WHERE userID_ProductID = '" + e.CommandArgument + "' ", conn);
            int updated = cmd.ExecuteNonQuery();
            conn.Close();

            //Refresh webpage
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }

    protected void btn_Reset_Click(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        SqlCommand cmd = new SqlCommand("DELETE FROM ShoppingItem WHERE userID = '" + Request.QueryString["userID"] + "' ", conn);
        int updated = cmd.ExecuteNonQuery();
        conn.Close();

        //Refresh webpage
        Page.Response.Redirect(Page.Request.Url.ToString(), true);
    }

    protected void btn_CheckOut_Click(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        conn.Open();

        SqlDataReader dr;
        Boolean itemOutOfStock = false;
        List<string> outStockProducts = new List<string>();
        List<string> outStockValue = new List<string>();

        foreach (GridViewRow row in gv_Products.Rows)
        {
            Label productName = (Label)row.FindControl("Label1");
            string productNameStr = productName.Text;

            SqlCommand com = new SqlCommand("SELECT * FROM Products WHERE Name = '" + productNameStr + "'", conn);
            dr = com.ExecuteReader();
            
            string stock = "";

            if (dr.Read())    //// Call Read before accessing data.
            {
                stock = dr["Stock"].ToString();
            }
            dr.Close();

            TextBox quantity = (TextBox)row.FindControl("tb_Qty");
            string quantityStr = quantity.Text;

            if (Convert.ToInt32(quantityStr) > Convert.ToInt32(stock))
            {
                itemOutOfStock = true;
                outStockProducts.Add(productNameStr);
                outStockValue.Add(stock);
            }
        }

        if (itemOutOfStock == true)
        {
            if (outStockProducts.Count > 1)
            {
                string items = "";
                for (int i = 0; i < outStockProducts.Count; i++)
                {
                    items += "\\n" + (string)outStockProducts[i] + ". Current Stock: " + (string)outStockValue[i];
                }
                Response.Write("<script>alert('Multiple Items Out Of Stock. \\nItems are: " + items + ".')</script>");
            }
            else
            {
                Response.Write("<script>alert('Item Out Of Stock. \\nItem is " + (string)outStockProducts[0] + ". Current Stock: " + (string)outStockValue[0] + "')</script>");
            }
        }
        else
        {
            SqlCommand cmd = new SqlCommand("select * from userAccounts where userID='" + Request.QueryString["userID"] + "' ", conn);
            dr = cmd.ExecuteReader();
            string username = null;
            string password = null;

            // ^Put in values and then dr.Read()

            if (dr.Read())    //// Call Read before accessing data.
            {
                username = dr["username"].ToString();
                password = dr["password"].ToString();
            }
            dr.Close();
            conn.Close();

            if (tb_CheckOutUsername.Text.Equals(username) && tb_CheckOutPassword.Text.Equals(password))
            {
                string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];

                string wallet = lb_Wallet.Text.Substring(1, lb_Wallet.Text.Length - 1);
                string price = lb_Price.Text.Substring(1, lb_Price.Text.Length - 1);

                if (cb_UseWallet.Checked)
                {
                    queryString += "&wallet=Checked";

                    if (Convert.ToDouble(wallet) >= Convert.ToDouble(price))
                    {
                        Response.Redirect("~/StorePayment.aspx" + queryString);
                    }
                    else
                    {
                        Response.Redirect("~/StoreCreditCard.aspx" + queryString);
                    }
                }
                else
                {
                    queryString += "&wallet=Unchecked";
                    Response.Redirect("~/StoreCreditCard.aspx" + queryString);
                }
            }
            else
            {
                Response.Write("<script>alert('Incorrect')</script>");
            }
        }
    }
}
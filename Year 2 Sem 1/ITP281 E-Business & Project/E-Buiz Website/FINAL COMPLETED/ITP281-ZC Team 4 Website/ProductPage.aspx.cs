using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from Products where Product_ID='" + Request.QueryString["product"] + "' ", conn);
        SqlDataReader dr = cmd.ExecuteReader();
        string imageUrl = null;
        string name = null;
        string stock = null;
        double price = 0;
        string desc = null;

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            name = dr["Name"].ToString();
            stock = dr["Stock"].ToString();
            price = Convert.ToDouble(dr["Unit_Price"].ToString());
            desc = dr["Description"].ToString();
            imageUrl = dr["ImageUrl"].ToString();
        }
        dr.Close();
        conn.Close();

        if (!IsPostBack)
        {
            lb_Name.Text = name;
            img_Product.ImageUrl = "~/CSS and Images/ProductsImages/" + Request.QueryString["product"] + "/" + imageUrl;

            lb_Stock.Text = "Stock: " + stock;
            lb_Price.Text = "Price: $" + price.ToString("0.00"); ;

            tb_Desc.Text = "Description: " + desc;
            tb_Qty.Text = "1";
        }

        Page.Title = name;

        if (Request.QueryString["login"].Equals("false") || Request.QueryString["staffID"] != null)
        {
            tb_Qty.Enabled = false;
            tb_Qty.Text = "";
            tb_Qty.Style.Add("cursor", "not-allowed");

            btn_Add.Enabled = false;
            btn_Add.Style.Add("cursor","not-allowed");
        }
    }

    protected void btn_Back_Click(object sender, EventArgs e)
    {
        string queryString = "";
        if (Request.QueryString["login"] == "false")
        {
            queryString = "?login=false";
        }
        else if (Request.QueryString["userID"] != null)
        {
            queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        }
        else if (Request.QueryString["staffID"] != null)
        {
            queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        }

        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        conn.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Products where Product_ID='" + Request.QueryString["product"] + "' ", conn);
        SqlDataReader dr = cmd.ExecuteReader();
        string Category = null;

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            Category = dr["Category"].ToString();
        }
        dr.Close();
        conn.Close();

        string btn_BackUrl = "";

        if (Category.Equals("Products"))
            btn_BackUrl = "~/StoreProducts.aspx";
        else if (Category.Equals("Food"))
            btn_BackUrl = "~/StoreFood.aspx";
        else if (Category.Equals("Medicine"))
            btn_BackUrl = "~/StoreMedicine.aspx";
        else if (Category.Equals("Sponsor Products"))
            btn_BackUrl = "~/StoreSponsorProducts.aspx";

        Response.Redirect(btn_BackUrl + queryString);
    }

    protected void btn_Add_Click(object sender, EventArgs e)
    {
        string a = tb_Qty.Text;
        if (tb_Qty.Text.Length > 1 && tb_Qty.Text.Substring(0, 1).Equals("0"))
        {
            Response.Write("<script>alert('Invalid Qauntity. Cannot start with 0.')</script>");
        }
        else
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();


            SqlCommand cmd = new SqlCommand("SELECT Stock FROM Products WHERE Product_ID='" + Request.QueryString["product"] + "' ", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            int stock = 0;

            // ^Put in values and then dr.Read()

            if (dr.Read())    //// Call Read before accessing data.
            {
                stock = Convert.ToInt32(dr["Stock"].ToString());
            }
            dr.Close();

            if (stock > 0)
            {
                if (Convert.ToInt32(tb_Qty.Text) <= stock)
                {
                    cmd = new SqlCommand("SELECT userID_ProductID FROM ShoppingItem WHERE userID_ProductID='" + Request.QueryString["userID"] + "_" + Request.QueryString["product"] + "' ", conn);
                    dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        dr.Close();

                        cmd = new SqlCommand("SELECT Quantity FROM ShoppingItem WHERE userID_ProductID='" + Request.QueryString["userID"] + "_" + Request.QueryString["product"] + "' ", conn);
                        dr = cmd.ExecuteReader();
                        int quantity = 0;

                        if (dr.Read())
                        {
                            quantity = Convert.ToInt32(dr["Quantity"].ToString());
                        }
                        dr.Close();

                        int newQuantity = quantity + Convert.ToInt32(tb_Qty.Text);

                        //Save into DB
                        cmd = new SqlCommand("UPDATE ShoppingItem SET Quantity = '" + newQuantity + "' WHERE userID_ProductID='" + Request.QueryString["userID"] + "_" + Request.QueryString["product"] + "' ", conn);
                        int updated = cmd.ExecuteNonQuery();
                    }
                    else
                    {
                        dr.Close();

                        string ins = "INSERT INTO [ShoppingItem](userID_ProductID, userID, Product_ID, Quantity) VALUES(@userID_ProductID, @userID, @Product_ID, @Quantity)";
                        SqlCommand com = new SqlCommand(ins, conn);

                        com.Parameters.AddWithValue("@userID_ProductID", Request.QueryString["userID"] + "_" + Request.QueryString["product"]);
                        com.Parameters.AddWithValue("@userID", Request.QueryString["userID"]);
                        com.Parameters.AddWithValue("@Product_ID", Request.QueryString["product"]);
                        com.Parameters.AddWithValue("@Quantity", tb_Qty.Text);


                        com.ExecuteNonQuery();

                    }

                    Response.Write("<script>alert('Item Added')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Not Enough Stock')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Item Out Of Stock')</script>");
            }
            
            conn.Close();
        }
    }
}
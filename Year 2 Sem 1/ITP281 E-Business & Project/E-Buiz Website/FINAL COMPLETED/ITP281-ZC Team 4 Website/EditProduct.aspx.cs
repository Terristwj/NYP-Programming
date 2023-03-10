using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from Products where Product_ID='" + Request.QueryString["product"] + "' ", conn);
        SqlDataReader dr = cmd.ExecuteReader();
        string productID = null;
        string category = null;
        string imageUrl = null;
        string name = null;
        string stock = null;
        double price = 0;
        string desc = null;
        string creatorName = null;
        string dateCreated = null;

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            productID = dr["Product_ID"].ToString();
            category = dr["Category"].ToString();
            name = dr["Name"].ToString();
            stock = dr["Stock"].ToString();
            price = Convert.ToDouble(dr["Unit_Price"].ToString());
            desc = dr["Description"].ToString();
            imageUrl = dr["ImageUrl"].ToString();
            creatorName = dr["CreatorName"].ToString();
            dateCreated = dr["DateCreated"].ToString();
        }
        dr.Close();

        cmd = new SqlCommand("SELECT * FROM staffAccount WHERE staffID='" + Request.QueryString["staffID"] + "' ", conn);
        dr = cmd.ExecuteReader();
        string position = null;

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            position = dr["position"].ToString();
        }
        dr.Close();

        if (position.Equals("Junior"))
        {
            btn_Update.Enabled = false;
            btn_Update.Style.Add("cursor", "not-allowed");
            btn_Update.ToolTip = "Junior No Access";
        }

        conn.Close();

        if (!IsPostBack)   //MUST USE !IsPostBack IF NOT ERROR IN UPDATE
        {
            tb_ProductID.Text = Request.QueryString["product"];
            if (category.Equals("Products"))
            {
                ddl_Category.SelectedIndex = 0;
            }
            if (category.Equals("Food"))
            {
                ddl_Category.SelectedIndex = 1;
            }
            if(category.Equals("Medicine"))
            {
                ddl_Category.SelectedIndex = 2;
            }
            if(category.Equals("Sponsor Products"))
            {
                ddl_Category.SelectedIndex = 3;
            }

            tb_Name.Text = name;

            img_Product.ImageUrl = "~/CSS and Images/ProductsImages/" + productID + "/" + imageUrl;

            tb_Stock.Text = stock;
            tb_Price.Text = price.ToString("0.00");

            tb_Desc.Text = desc;

            tb_StaffName.Text = creatorName;
            tb_DateCreated.Text = dateCreated;
        }
    }

    protected void btn_Update_Click(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        SqlCommand cmd2 = new SqlCommand("SELECT Name FROM Products WHERE Name='" + tb_Name.Text + "' AND Product_ID<>'" + Request.QueryString["product"] + "'", conn);
        SqlDataReader dr2 = cmd2.ExecuteReader();

        if (dr2.HasRows)
        {
            conn.Close();
            Response.Write("<script>alert('Product Name is taken')</script>");
            dr2.Close();
        }
        else
        {
            dr2.Close();
            SqlCommand cmd = new SqlCommand("Select * from Products where Product_ID='" + Request.QueryString["product"] + "' ", conn);
            SqlDataReader dr = cmd.ExecuteReader();

            string Category = "";
            string Name = "";
            string Stock = "";
            double Unit_Price = 0;
            string price = "";
            string Description = "";

            string currentProductImage = "";

            // ^Put in values and then dr.Read()

            if (dr.Read())    //// Call Read before accessing data.
            {
                Category = dr["Category"].ToString();
                Name = dr["Name"].ToString();
                Stock = dr["Stock"].ToString();
                Unit_Price = Convert.ToDouble(dr["Unit_Price"].ToString());
                Description = dr["Description"].ToString();

                currentProductImage = dr["imageUrl"].ToString();
            }
            dr.Close();

            price = Unit_Price.ToString("0.00");

            if (fu_ProductImg.HasFile
                && Path.GetExtension(fu_ProductImg.FileName).ToLower() != ".jpg"
                && Path.GetExtension(fu_ProductImg.FileName).ToLower() != ".png"
                && Path.GetExtension(fu_ProductImg.FileName).ToLower() != ".gif"
                && Path.GetExtension(fu_ProductImg.FileName).ToLower() != ".jpeg")
            {
                conn.Close();
                Response.Write("<script>alert('This is not an image file')</script>");
            }
            else   //After checking the images validation, proceed to each section.
            {
                if (tb_Stock.Text.Length > 1 && tb_Stock.Text.Substring(0, 1).Equals("0"))
                {
                    Response.Write("<script>alert('Invalid Stock. Cannot start with 0.')</script>");
                }
                else
                {
                    if (!ddl_Category.SelectedValue.Equals(Category))
                    {
                        //Save category into DB
                        cmd = new SqlCommand("Update Products Set Category = '" + ddl_Category.SelectedValue + "' Where Product_ID='" + Request.QueryString["product"] + "' ", conn);
                        int updated = cmd.ExecuteNonQuery();
                    }

                    if (!tb_Name.Text.Equals(Name))
                    {
                        //Save name into DB
                        cmd = new SqlCommand("Update Products Set Name = '" + tb_Name.Text + "' Where Product_ID='" + Request.QueryString["product"] + "' ", conn);
                        int updated = cmd.ExecuteNonQuery();
                    }

                    if (!tb_Stock.Text.Equals(Stock))
                    {
                        //Save stock into DB
                        cmd = new SqlCommand("Update Products Set Stock = '" + tb_Stock.Text + "' Where Product_ID='" + Request.QueryString["product"] + "' ", conn);
                        int updated = cmd.ExecuteNonQuery();
                    }

                    if (!tb_Price.Text.Equals(price))
                    {
                        //Save unit price code into DB
                        cmd = new SqlCommand("Update Products Set Unit_Price = '" + tb_Price.Text + "' Where Product_ID='" + Request.QueryString["product"] + "' ", conn);
                        int updated = cmd.ExecuteNonQuery();
                    }

                    if (!tb_Desc.Text.Equals(Description))
                    {
                        //Save description into DB
                        cmd = new SqlCommand("Update Products Set Description = '" + tb_Desc.Text + "' Where Product_ID='" + Request.QueryString["product"] + "' ", conn);
                        int updated = cmd.ExecuteNonQuery();
                    }

                    if (fu_ProductImg.HasFile)
                    {
                        //Delete old image
                        string productImage = "CSS and Images\\ProductsImages\\" + Request.QueryString["product"] + "\\" + currentProductImage;
                        string fullPath = Server.MapPath("") + "\\" + productImage;
                        File.Delete(fullPath);

                        //Add image into DB
                        cmd = new SqlCommand("Update Products Set ImageUrl = '" + fu_ProductImg.FileName + "' Where Product_ID='" + Request.QueryString["product"] + "' ", conn);
                        int updated = cmd.ExecuteNonQuery();

                        //Change image
                        productImage = "CSS and Images\\ProductsImages\\" + Request.QueryString["product"] + "\\" + fu_ProductImg.FileName;
                        fullPath = Server.MapPath("") + "\\" + productImage;
                        fu_ProductImg.SaveAs(fullPath);
                    }

                    conn.Close();

                    if (!fu_ProductImg.HasFile && tb_Name.Text.Equals(Name)
                        && tb_Stock.Text.Equals(Stock) && tb_Price.Text.Equals(price)
                        && tb_Desc.Text.Equals(Description) && ddl_Category.SelectedValue.Equals(Category))
                    {
                        Response.Write("<script>alert('No changes made')</script>");
                    }

                    else //Changes made
                    {
                        //Refresh webpage
                        Page.Response.Redirect(Page.Request.Url.ToString(), true);
                    }
                }
            }
        }
    }

    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        Response.Redirect("~/EditStore.aspx" + queryString);
    }
}
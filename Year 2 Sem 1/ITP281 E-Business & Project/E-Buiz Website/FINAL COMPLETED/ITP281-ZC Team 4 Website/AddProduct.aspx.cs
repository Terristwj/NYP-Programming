using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Add_Click(object sender, EventArgs e)
    {
        if (tb_Name.Text != "" && tb_Stock.Text != "" && tb_Price.Text != "" && fu_ProductImg.HasFile)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            SqlCommand cmd2 = new SqlCommand("SELECT Name from Products where Name='" + tb_Name.Text + "' ", conn);
            SqlDataReader dr2 = cmd2.ExecuteReader();

            if (dr2.HasRows)
            {
                Response.Write("<script>alert('Product Name is taken')</script>");
                dr2.Close();
            }
            else
            {
                dr2.Close();
                if (fu_ProductImg.HasFile
                    && Path.GetExtension(fu_ProductImg.FileName).ToLower() != ".jpg"
                    && Path.GetExtension(fu_ProductImg.FileName).ToLower() != ".png"
                    && Path.GetExtension(fu_ProductImg.FileName).ToLower() != ".gif"
                    && Path.GetExtension(fu_ProductImg.FileName).ToLower() != ".jpeg")
                {
                    conn.Close();
                    Response.Write("<script>alert('This is not an image file')</script>");
                }
                else if (tb_Stock.Text.Length > 1 && tb_Stock.Text.Substring(0, 1).Equals("0"))
                {
                    conn.Close();
                    Response.Write("<script>alert('Invalid Stock. Cannot start with 0.')</script>");
                }
                else   //After checking the images validation and stock, proceed to each section.
                {
                    DateTime DateCreated = DateTime.Now;
                    string DateCreatedStr = DateCreated.ToString("dd MMMM yyyy");

                    SqlCommand cmd = new SqlCommand("SELECT name FROM staffAccount WHERE staffID = '" + Request.QueryString["staffID"] + "'", conn);
                    SqlDataReader dr = cmd.ExecuteReader();

                    string staffName = "name";

                    if (dr.Read())    //// Call Read before accessing data.
                    {
                        staffName = dr["name"].ToString();
                    }
                    dr.Close();

                    string ins = "Insert into [Products](Category, Name, Description, Unit_Price, ImageUrl, Stock, CreatorName, DateCreated) values(@Category, @Name, @Description, @Unit_Price, @ImageUrl, @Stock, @CreatorName, @DateCreated)";
                    SqlCommand com = new SqlCommand(ins, conn);

                    com.Parameters.AddWithValue("@Category", ddl_Category.SelectedValue);
                    com.Parameters.AddWithValue("@Name", tb_Name.Text);
                    com.Parameters.AddWithValue("@Description", tb_Desc.Text);
                    com.Parameters.AddWithValue("@Unit_Price", tb_Price.Text);
                    com.Parameters.AddWithValue("@ImageUrl", "");
                    com.Parameters.AddWithValue("@Stock", tb_Stock.Text);

                    com.Parameters.AddWithValue("@CreatorName", staffName);
                    com.Parameters.AddWithValue("@DateCreated", DateCreatedStr);


                    com.ExecuteNonQuery();


                    cmd = new SqlCommand("SELECT Product_ID FROM Products WHERE Name='" + tb_Name.Text + "' ", conn);
                    dr = cmd.ExecuteReader();

                    string Product_ID = "";

                    // ^Put in values and then dr.Read()

                    if (dr.Read())    //// Call Read before accessing data.
                    {
                        Product_ID = dr["Product_ID"].ToString();
                    }

                    //Creates folder for the product images
                    string productFolder = Product_ID;
                    string path = Server.MapPath("~/CSS and Images/ProductsImages/" + productFolder);
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }
                    dr.Close();


                    if (fu_ProductImg.HasFile)
                    {
                        //Add image into DB
                        cmd = new SqlCommand("UPDATE Products SET ImageUrl = '" + fu_ProductImg.FileName + "' WHERE Product_ID='" + Product_ID + "' ", conn);
                        int updated = cmd.ExecuteNonQuery();

                        //Change image
                        string productImage = "CSS and Images\\ProductsImages\\" + productFolder + "\\" + fu_ProductImg.FileName;
                        string fullPath = Server.MapPath("") + "\\" + productImage;
                        fu_ProductImg.SaveAs(fullPath);
                    }
                    conn.Close();

                }
            }
        }
        else if (!fu_ProductImg.HasFile)
        {
            Response.Write("<script>alert('Please insert an image file')</script>");
        }
    }

    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        Response.Redirect("~/EditStore.aspx" + queryString);
    }
}
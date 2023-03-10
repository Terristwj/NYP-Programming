using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditStore : System.Web.UI.Page
{
    static string command = "SELECT * FROM Products";
    static string rewriteCommand = "SELECT * FROM Products";
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        conn.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM staffAccount WHERE staffID='" + Request.QueryString["staffID"] + "' ", conn);
        SqlDataReader dr = cmd.ExecuteReader();
        string position = null;

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            position = dr["position"].ToString();
        }
        dr.Close();
        conn.Close();

        if (position.Equals("Junior"))
        {
            btn_Add.Enabled = false;
            btn_Add.Style.Add("cursor", "not-allowed");
            btn_Add.ToolTip = "Junior No Access";
        }

        if (Request.QueryString["delete"] != null)
        {
            Response.Write("<script>alert('Failed.\\nJunior Account No Access.')</script>");
        }

        if (!IsPostBack)
        {
            ViewGridView("None", "None");
        }
    }

    protected void ViewGridView(string condition, string condition_requirement)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        try
        {
            if (condition.Equals("Search")) // Search Bar
            {
                rewriteCommand = command + " " + condition_requirement;
                SqlCommand cmd = new SqlCommand(rewriteCommand, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                gv_Products.DataSource = ds;
                gv_Products.DataBind();
                ddl_Sort.SelectedIndex = 0;
            }
            else // Drop Down List
            {
                if (condition.Equals("None"))
                {
                    rewriteCommand = command;
                    SqlCommand cmd = new SqlCommand(command, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    gv_Products.DataSource = ds;
                    gv_Products.DataBind();
                    ddl_Sort.SelectedIndex = 0;
                    tb_Search.Text = "";
                }
                else if (condition.Equals("WHERE"))
                {
                    rewriteCommand = command + " " + condition_requirement;
                    SqlCommand cmd = new SqlCommand(rewriteCommand, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    gv_Products.DataSource = ds;
                    gv_Products.DataBind();
                    ddl_Sort.SelectedIndex = 0;
                    tb_Search.Text = "";
                }
                else if (condition.Equals("ORDERBY"))
                {
                    SqlCommand cmd = new SqlCommand(rewriteCommand + " " + condition_requirement, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    gv_Products.DataSource = ds;
                    gv_Products.DataBind();
                }
            }
        }
        finally
        {
            conn.Close();
        }
    }

    protected void btn_Search_Click(object sender, EventArgs e)
    {
        string value = tb_Search.Text;
        string condition_Requirement = "WHERE Name LIKE '%" + value + "%'";
        ViewGridView("Search", condition_Requirement);
    }

    protected void btn_SortOnly_Click(object sender, EventArgs e)
    {
        string value = ddl_SortOnly.SelectedValue;
        if (value.Equals("None"))
        {
            ViewGridView("None", "None");
        }
        else if (value.Equals("Category - Products"))
        {
            ViewGridView("WHERE", "WHERE Category = 'Products'");
        }
        else if (value.Equals("Category - Food"))
        {
            ViewGridView("WHERE", "WHERE Category = 'Food'");
        }
        else if (value.Equals("Category - Medicine"))
        {
            ViewGridView("WHERE", "WHERE Category = 'Medicine'");
        }
        else if (value.Equals("Category - Sponsor Products"))
        {
            ViewGridView("WHERE", "WHERE Category = 'Sponsor Products'");
        }
    }

    protected void btn_Sort_Click(object sender, EventArgs e)
    {
        string value = ddl_Sort.SelectedValue;
        if (value.Equals("Product ID"))
        {
            ViewGridView("ORDERBY", "ORDER BY Product_ID ASC");
        }
        else if (value.Equals("Category"))
        {
            ViewGridView("ORDERBY", "ORDER BY Category ASC");
        }
        else if (value.Equals("Name"))
        {
            ViewGridView("ORDERBY", "ORDER BY Name ASC");
        }
        else if (value.Equals("High Price"))
        {
            ViewGridView("ORDERBY", "ORDER BY Unit_Price DESC");
        }
        else if (value.Equals("Low Price"))
        {
            ViewGridView("ORDERBY", "ORDER BY Unit_Price ASC");
        }
        else if (value.Equals("High Stock"))
        {
            ViewGridView("ORDERBY", "ORDER BY Stock DESC");
        }
        else if (value.Equals("Low Stock"))
        {
            ViewGridView("ORDERBY", "ORDER BY Stock ASC");
        }
    }

    protected void gv_Products_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        conn.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM staffAccount WHERE staffID='" + Request.QueryString["staffID"] + "' ", conn);
        SqlDataReader dr = cmd.ExecuteReader();
        string position = null;

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            position = dr["position"].ToString();
        }

        dr.Close();

        if (position.Equals("Junior"))
        {
            if (e.CommandName == "Delete")
            {
                conn.Close();
                
                Page.Response.Redirect(Page.Request.Url.ToString() + "&delete=fail", true);
            }
        }
        else
        {
            if (e.CommandName == "Delete")
            {
                connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
                conn = new SqlConnection(connStr);
                conn.Open();

                cmd = new SqlCommand("Select ImageUrl from Products where Product_ID='" + e.CommandArgument + "' ", conn);
                dr = cmd.ExecuteReader();

                string currentImageUrl = "";
                // ^Put in values and then dr.Read()

                if (dr.Read())    //// Call Read before accessing data.
                {
                    currentImageUrl = dr["ImageUrl"].ToString();
                }

                dr.Close();

                //Delete image of item
                string productImage = "CSS and Images\\ProductsImages\\" + e.CommandArgument + "\\" + currentImageUrl;
                string fullPath = Server.MapPath("") + "\\" + productImage;
                File.Delete(fullPath);

                //Delete folder of item
                Directory.Delete(Server.MapPath("") + "\\CSS and Images\\ProductsImages\\" + e.CommandArgument);

                //Delete from database
                cmd = new SqlCommand("DELETE FROM Products WHERE Product_ID = '" + e.CommandArgument + "' ", conn);
                int updated = cmd.ExecuteNonQuery();

                conn.Close();

                //Refresh webpage
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }
    }

    protected void btn_Add_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        Response.Redirect("~/AddProduct.aspx" + queryString);
    }

    protected void btn_Back_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        Response.Redirect("~/StaffProfilePage.aspx" + queryString);
    }
}
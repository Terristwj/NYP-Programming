using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StoreProducts : System.Web.UI.Page
{
    static string command = "SELECT * FROM Products WHERE Category = 'Products'";
    static string rewriteCommand = "SELECT * FROM Products WHERE Category = 'Products'";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewDataList("None", "None");
        }
    }

    protected void ViewDataList(string condition, string condition_requirement)
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
                dl_Products.DataSource = ds;
                dl_Products.DataBind();
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
                    dl_Products.DataSource = ds;
                    dl_Products.DataBind();
                    ddl_Sort.SelectedIndex = 0;
                    tb_Search.Text = "";
                }
                else if (condition.Equals("ORDERBY"))
                {
                    SqlCommand cmd = new SqlCommand(rewriteCommand + " " + condition_requirement, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    dl_Products.DataSource = ds;
                    dl_Products.DataBind();
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
        string condition_Requirement = "AND Name LIKE '%" + value + "%'";
        ViewDataList("Search", condition_Requirement);
    }
    protected void btn_DDL_Click(object sender, EventArgs e)
    {
        string value = ddl_Sort.SelectedValue;
        if (value.Equals("Product ID"))
        {
            ViewDataList("ORDERBY", "ORDER BY Product_ID ASC");
        }
        else if (value.Equals("Category"))
        {
            ViewDataList("ORDERBY", "ORDER BY Category ASC");
        }
        else if (value.Equals("Name"))
        {
            ViewDataList("ORDERBY", "ORDER BY Name ASC");
        }
        else if (value.Equals("High Price"))
        {
            ViewDataList("ORDERBY", "ORDER BY Unit_Price DESC");
        }
        else if (value.Equals("Low Price"))
        {
            ViewDataList("ORDERBY", "ORDER BY Unit_Price ASC");
        }
        else if (value.Equals("High Stock"))
        {
            ViewDataList("ORDERBY", "ORDER BY Stock DESC");
        }
        else if (value.Equals("Low Stock"))
        {
            ViewDataList("ORDERBY", "ORDER BY Stock ASC");
        }
    }

    protected void dl_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Select")
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

            string productName = ((Label)dl_Products.Items[e.Item.ItemIndex].FindControl("lb_Name")).Text;

            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT Product_ID from Products where Name='" + productName + "' ", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            string productID = null;

            // ^Put in values and then dr.Read()

            if (dr.Read())    //// Call Read before accessing data.
            {
                productID = dr["Product_ID"].ToString();
            }
            dr.Close();
            conn.Close();
            
            queryString += "&product=" + productID;
            Response.Redirect("~/ProductPage.aspx" + queryString);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProfilePageTransactionsStore : System.Web.UI.Page
{
    static string command = "";
    static string rewriteCommand = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        command = "SELECT * FROM StoreOrders WHERE userID = '" + Request.QueryString["userID"] + "'";
        rewriteCommand = "SELECT * FROM StoreOrders WHERE userID = '" + Request.QueryString["userID"] + "'";
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
                tb_SearchDateOfOrder.Text = "";
                tb_SearchDeliveryDate.Text = "";
            }
            else if (condition.Equals("None"))
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
            else if (condition.Equals("SearchDateOfOrder"))
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
                tb_SearchDeliveryDate.Text = "";
            }
            else if (condition.Equals("SearchDeliveryDate"))
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
                tb_SearchDateOfOrder.Text = "";
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
        finally
        {
            conn.Close();
        }
    }

    protected void btn_Search_Click(object sender, EventArgs e)
    {
        string value = tb_Search.Text;
        string condition_Requirement = "";
        if (value.Equals(""))
        {

        }
        else
        {
            condition_Requirement = "AND Order_ID = '" + value + "'";
        }
        ViewGridView("Search", condition_Requirement);
    }

    protected void btn_SearchDateOfOrder_Click(object sender, EventArgs e)
    {
        string value = tb_SearchDateOfOrder.Text;

        string condition_Requirement = "";

        if (value.Equals(""))
        {

        }
        else
        {
            condition_Requirement = "AND dateOfOrder LIKE '" + value + "%'";
        }
        ViewGridView("SearchDateOfOrder", condition_Requirement);
    }

    protected void btn_SearchDeliveryDate_Click(object sender, EventArgs e)
    {
        string value = tb_SearchDeliveryDate.Text;

        string condition_Requirement = "";

        if (value.Equals(""))
        {

        }
        else
        {
            condition_Requirement = "AND deliveryDate LIKE '" + value + "%'";
        }
        ViewGridView("SearchDeliveryDate", condition_Requirement);
    }

    protected void btn_Sort_Click(object sender, EventArgs e)
    {
        string value = ddl_Sort.SelectedValue;
        if (value.Equals("Order ID ASC"))
        {
            ViewGridView("ORDERBY", "ORDER BY Order_ID ASC");
        }
        else if (value.Equals("Order ID DESC"))
        {
            ViewGridView("ORDERBY", "ORDER BY Order_ID DESC");
        }
        else if (value.Equals("Total Price ASC"))
        {
            ViewGridView("ORDERBY", "ORDER BY totalPrice ASC");
        }
        else if (value.Equals("Total Price DESC"))
        {
            ViewGridView("ORDERBY", "ORDER BY totalPrice DESC");
        }
        else if (value.Equals("Wallet ASC"))
        {
            ViewGridView("ORDERBY", "ORDER BY walletAmount ASC");
        }
        else if (value.Equals("Wallet DESC"))
        {
            ViewGridView("ORDERBY", "ORDER BY walletAmount DESC");
        }
        else if (value.Equals("Net Price ASC"))
        {
            ViewGridView("ORDERBY", "ORDER BY netPrice ASC");
        }
        else if (value.Equals("Net Price DESC"))
        {
            ViewGridView("ORDERBY", "ORDER BY netPrice DESC");
        }
        else if (value.Equals("Order Date ASC"))
        {
            ViewGridView("ORDERBY", "ORDER BY dateOfOrder ASC");
        }
        else if (value.Equals("Order Date DESC"))
        {
            ViewGridView("ORDERBY", "ORDER BY dateOfOrder DESC");
        }
        else if (value.Equals("Deliv Date ASC"))
        {
            ViewGridView("ORDERBY", "ORDER BY deliveryAddress ASC");
        }
        else if (value.Equals("Deliv Date DESC"))
        {
            ViewGridView("ORDERBY", "ORDER BY deliveryAddress DESC");
        }
    }

    protected void btn_Back_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        Response.Redirect("~/EditParticulars.aspx" + queryString);
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProfilePageTransactionsWallet : System.Web.UI.Page
{
    static string command = "";
    static string rewriteCommand = "";
    static string rewriteCommand2 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        command = "SELECT * FROM EWalletTransactions WHERE userID = '" + Request.QueryString["userID"] + "'";
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
                SqlCommand cmd = new SqlCommand("", conn);

                if (ddl_Filter.SelectedIndex != 0)
                {
                    rewriteCommand2 = rewriteCommand + " " + condition_requirement;
                    cmd = new SqlCommand(rewriteCommand2, conn);
                }
                else
                {
                    rewriteCommand = command + " " + condition_requirement;
                    cmd = new SqlCommand(rewriteCommand, conn);
                }
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                gv_Products.DataSource = ds;
                gv_Products.DataBind();
                ddl_Sort.SelectedIndex = 0;
                tb_SearchDate.Text = "";
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
                ddl_Filter.SelectedIndex = 0;
            }
            else if (condition.Equals("SearchDate"))
            {
                SqlCommand cmd = new SqlCommand("", conn);

                if (ddl_Filter.SelectedIndex != 0)
                {
                    rewriteCommand2 = rewriteCommand + " " + condition_requirement;
                    cmd = new SqlCommand(rewriteCommand2, conn);
                }
                else
                {
                    rewriteCommand = command + " " + condition_requirement;
                    cmd = new SqlCommand(rewriteCommand, conn);
                }
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                gv_Products.DataSource = ds;
                gv_Products.DataBind();
                ddl_Sort.SelectedIndex = 0;
                tb_Search.Text = "";
            }
            else if (condition.Equals("FILTER"))
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
                tb_SearchDate.Text = "";
            }
            else if (condition.Equals("ORDERBY"))
            {
                SqlCommand cmd = new SqlCommand("", conn);
                if (tb_SearchDate.Text.Equals("") && tb_Search.Text.Equals(""))
                {
                    cmd = new SqlCommand(rewriteCommand + " " + condition_requirement, conn);
                }
                else
                {
                    cmd = new SqlCommand(rewriteCommand + " " + condition_requirement, conn);
                }
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
            int result;
            if (int.TryParse(tb_Search.Text, out result))
            {
                condition_Requirement = "AND WalletTransaction_ID = '" + value + "'";
            }
            else
            {
                condition_Requirement = "AND WalletTransaction_ID = '-1'";
            }
        }
        ViewGridView("Search", condition_Requirement);
    }

    protected void btn_SearchDate_Click(object sender, EventArgs e)
    {
        string value = tb_SearchDate.Text;

        string condition_Requirement = "";

        if (value.Equals(""))
        {

        }
        else
        {
            condition_Requirement = "AND DateOfChange LIKE '" + value + "%'";
        }
        ViewGridView("SearchDate", condition_Requirement);
    }

    protected void btn_Filter_Click(object sender, EventArgs e)
    {
        string value = ddl_Filter.SelectedValue;
        if (value.Equals("None"))
        {
            ViewGridView("None", "None");
        }
        else if (value.Equals("Amount Add"))
        {
            ViewGridView("FILTER", " AND AmountAdded IS NOT NULL");
        }
        else if (value.Equals("Amount Deduct"))
        {
            ViewGridView("FILTER", " AND AmountDepleted IS NOT NULL");
        }
    }

    protected void btn_Sort_Click(object sender, EventArgs e)
    {
        string value = ddl_Sort.SelectedValue;
        if (value.Equals("Transact ID ASC"))
        {
            ViewGridView("ORDERBY", "ORDER BY WalletTransaction_ID ASC");
        }
        else if (value.Equals("Transact ID DESC"))
        {
            ViewGridView("ORDERBY", "ORDER BY WalletTransaction_ID DESC");
        }
        else if (value.Equals("Added ASC"))
        {
            ViewGridView("ORDERBY", "ORDER BY AmountAdded ASC");
        }
        else if (value.Equals("Added DESC"))
        {
            ViewGridView("ORDERBY", "ORDER BY AmountAdded DESC");
        }
        else if (value.Equals("Deducted ASC"))
        {
            ViewGridView("ORDERBY", "ORDER BY AmountDepleted ASC");
        }
        else if (value.Equals("Deducted DESC"))
        {
            ViewGridView("ORDERBY", "ORDER BY AmountDepleted DESC");
        }
        else if (value.Equals("Date ASC"))
        {
            ViewGridView("ORDERBY", "ORDER BY DateOfChange ASC");
        }
        else if (value.Equals("Date DESC"))
        {
            ViewGridView("ORDERBY", "ORDER BY DateOfChange DESC");
        }
        else if (value.Equals("Final Wallet ASC"))
        {
            ViewGridView("ORDERBY", "ORDER BY finalWallet ASC");
        }
        else if (value.Equals("Final Wallet DESC"))
        {
            ViewGridView("ORDERBY", "ORDER BY finalWallet DESC");
        }
    }

    protected void btn_Back_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        Response.Redirect("~/EditParticulars.aspx" + queryString);
    }
}
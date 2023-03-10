using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewStaff : System.Web.UI.Page
{
    static string command = "";
    static string rewriteCommand = "";
    static string rewriteCommand2 = "";
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

        command = "SELECT * FROM staffAccount WHERE username IS NOT NULL";

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

                if (ddl_Position.SelectedIndex != 0)
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
                ddl_Position.SelectedIndex = 0;
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
            }
            else if (condition.Equals("ORDERBY"))
            {
                SqlCommand cmd = new SqlCommand("", conn);
                if (tb_Search.Text.Equals(""))
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
            condition_Requirement = "AND name LIKE '" + value + "%'";
        }
        ViewGridView("Search", condition_Requirement);
    }

    protected void btn_FilterPosition_Click(object sender, EventArgs e)
    {
        string value = ddl_Position.SelectedValue;
        if (value.Equals("None"))
        {
            ViewGridView("None", "None");
        }
        else if (value.Equals("Senior"))
        {
            ViewGridView("FILTER", " AND position = 'Senior'");
        }
        else if (value.Equals("Junior"))
        {
            ViewGridView("FILTER", " AND position = 'Junior'");
        }
    }

    protected void btn_Sort_Click(object sender, EventArgs e)
    {
        string value = ddl_Sort.SelectedValue;
        if (value.Equals("Staff ID ASC"))
        {
            ViewGridView("ORDERBY", "ORDER BY staffID ASC");
        }
        else if (value.Equals("Staff ID DESC"))
        {
            ViewGridView("ORDERBY", "ORDER BY staffID DESC");
        }
        else if (value.Equals("Name A-Z"))
        {
            ViewGridView("ORDERBY", "ORDER BY name DESC");
        }
        else if (value.Equals("Name Z-A"))
        {
            ViewGridView("ORDERBY", "ORDER BY name ASC");
        }
    }

    protected void btn_Back_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        Response.Redirect("~/StaffProfilePage.aspx" + queryString);
    }

    protected void btn_Add_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        Response.Redirect("~/AddStaff.aspx" + queryString);
    }
}
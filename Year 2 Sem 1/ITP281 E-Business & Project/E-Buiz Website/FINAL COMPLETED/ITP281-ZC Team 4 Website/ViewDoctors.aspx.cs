using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewDoctors : System.Web.UI.Page
{
    static string command = "";
    static string rewriteCommand = "";
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

        command = "SELECT * FROM Doctor WHERE username IS NOT NULL";

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
                rewriteCommand = command + " " + condition_requirement;
                cmd = new SqlCommand(rewriteCommand, conn);
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

    protected void btn_SearchID_Click(object sender, EventArgs e)
    {
        string value = tb_SearchID.Text;

        string condition_Requirement = "";

        if (value.Equals(""))
        {

        }
        else
        {
            tb_Search.Text = "";
            condition_Requirement = "AND Doctor_ID = '" + value + "'";
        }
        ViewGridView("Search", condition_Requirement);
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
            tb_SearchID.Text = "";
            condition_Requirement = "AND name LIKE '" + value + "%'";
        }
        ViewGridView("Search", condition_Requirement);
    }

    protected void btn_Sort_Click(object sender, EventArgs e)
    {
        string value = ddl_Sort.SelectedValue;
        if (value.Equals("Doctor ID ASC"))
        {
            ViewGridView("ORDERBY", "ORDER BY Doctor_ID ASC");
        }
        else if (value.Equals("Doctor ID DESC"))
        {
            ViewGridView("ORDERBY", "ORDER BY Doctor_ID DESC");
        }
        else if (value.Equals("Name A-Z"))
        {
            ViewGridView("ORDERBY", "ORDER BY name DESC");
        }
        else if (value.Equals("Name Z-A"))
        {
            ViewGridView("ORDERBY", "ORDER BY name ASC");
        }
        else if (value.Equals("Consults ASC"))
        {
            ViewGridView("ORDERBY", "ORDER BY consultsGiven ASC");
        }
        else if (value.Equals("Consults DESC"))
        {
            ViewGridView("ORDERBY", "ORDER BY consultsGiven DESC");
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
        Response.Redirect("~/AddDoctor.aspx" + queryString);
    }
}
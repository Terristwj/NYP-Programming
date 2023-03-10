using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DoctorProfileConsults : System.Web.UI.Page
{
    static string command = "";
    static string rewriteCommand = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        command = "SELECT * FROM Booking WHERE Doctor_ID='" + Request.QueryString["doctorID"] + "'";
        command += " AND status = 'Completed'";

        if (!IsPostBack)
        {
            ViewGridView("None", "None");
        }

        if (Request.QueryString["delete"] != null)
        {
            Response.Write("<script>alert('Failed.\\nBooking already accepted.')</script>");
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
                tb_SearchDate.Text = "";
                tb_SearchTime.Text = "";
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
        tb_SearchDate.Text = "";
        tb_SearchTime.Text = "";

        string condition_Requirement = "";

        if (value.Equals(""))
        {

        }
        else
        {
            condition_Requirement = "AND bookingID = '" + value + "'";
        }
        ViewGridView("Search", condition_Requirement);
    }

    protected void btn_SearchDate_Click(object sender, EventArgs e)
    {
        string value = tb_SearchDate.Text;
        tb_Search.Text = "";
        tb_SearchTime.Text = "";

        string condition_Requirement = "";

        if (value.Equals(""))
        {

        }
        else
        {
            condition_Requirement = "AND date LIKE '" + value + "%'";
        }
        ViewGridView("Search", condition_Requirement);
    }

    protected void btn_SearchTime_Click(object sender, EventArgs e)
    {
        string value = tb_SearchTime.Text;
        tb_Search.Text = "";
        tb_SearchDate.Text = "";

        string condition_Requirement = "";

        if (value.Equals(""))
        {

        }
        else
        {
            condition_Requirement = "AND timePeriod LIKE '" + value + "%'";
        }
        ViewGridView("Search", condition_Requirement);
    }

    protected void btn_Sort_Click(object sender, EventArgs e)
    {
        string value = ddl_Sort.SelectedValue;
        if (value.Equals("Booking ID"))
        {
            ViewGridView("ORDERBY", "ORDER BY bookingID DESC");
        }
        else if (value.Equals("Date"))
        {
            ViewGridView("ORDERBY", "ORDER BY date DESC");
        }
        else if (value.Equals("Time"))
        {
            ViewGridView("ORDERBY", "ORDER BY timePeriod DESC");
        }
    }

    protected void gv_Products_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            string queryString = "?login=true" + "&doctorID=" + Request.QueryString["doctorID"] + "&bookingID=" + e.CommandArgument;
            Response.Redirect("~/PreservedDoctorChatRoom.aspx" + queryString);
        }
    }

    protected void btn_Back_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&doctorID=" + Request.QueryString["doctorID"];
        Response.Redirect("~/DoctorProfilePage.aspx" + queryString);
    }

    protected void btn_Create_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&doctorID=" + Request.QueryString["doctorID"];
        Response.Redirect("~/CreateBooking.aspx" + queryString);
    }
}
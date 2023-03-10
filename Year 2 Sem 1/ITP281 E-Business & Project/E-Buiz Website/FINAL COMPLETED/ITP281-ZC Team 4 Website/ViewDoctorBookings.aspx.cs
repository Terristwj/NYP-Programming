using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewDoctorBookings : System.Web.UI.Page
{
    static string command = "";
    static string rewriteCommand = "";
    static string rewriteCommand2 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        command = "SELECT *, ua.name accName, d.name dName FROM Booking b";
        command += " LEFT JOIN Doctor d ON d.Doctor_ID = b.Doctor_ID";
        command += " LEFT JOIN userAccounts ua ON ua.userID = b.userID";
        command += " WHERE status != 'Completed'";

        if (!IsPostBack)
        {
            ViewGridView("None", "None");
        }

        if (Request.QueryString["delete"] != null)
        {
            if (Request.QueryString["delete"].Equals("fail"))
            {
                Response.Write("<script>alert('Failed.\\nBooking already accepted.')</script>");
            }
            else
            {
                Response.Write("<script>alert('Failed.\\nJunior Account No Access.')</script>");
            }
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

                if (ddl_Status.SelectedIndex != 0)
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
                tb_SearchDate.Text = "";
                tb_SearchTime.Text = "";
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

    protected void btn_Filter_Click(object sender, EventArgs e)
    {
        string value = ddl_Status.SelectedValue;
        if (value.Equals("None"))
        {
            ViewGridView("None", "None");
        }
        else if (value.Equals("Accepted"))
        {
            ViewGridView("FILTER", " AND status = 'Accepted'");
        }
        else if (value.Equals("Null"))
        {
            ViewGridView("FILTER", " AND status = 'Null'");
        }
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

                string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"] + "&delete=failed2";
                Page.Response.Redirect("~/ViewDoctorBookings.aspx" + queryString, true);
            }
        }
        else
        {
            if (e.CommandName == "Delete")
            {
                connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
                conn = new SqlConnection(connStr);
                conn.Open();

                cmd = new SqlCommand("Select * from Booking where bookingID ='" + e.CommandArgument + "' ", conn);
                dr = cmd.ExecuteReader();

                string status = "";
                // ^Put in values and then dr.Read()

                if (dr.Read())    //// Call Read before accessing data.
                {
                    status = dr["status"].ToString();
                }

                dr.Close();

                string queryString = "";

                if (status.Equals("Accepted"))
                {
                    conn.Close();
                    queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
                    Page.Response.Redirect("~/ViewDoctorBookings.aspx" + queryString + "&delete=fail", true);
                }
                else
                {
                    //Delete from database
                    cmd = new SqlCommand("DELETE FROM Booking WHERE bookingID = '" + e.CommandArgument + "' ", conn);
                    int updated = cmd.ExecuteNonQuery();

                    conn.Close();

                    //Refresh webpage
                    queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
                    Page.Response.Redirect("~/ViewDoctorBookings.aspx" + queryString, true);
                }
            }
        }
    }

    protected void btn_Back_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        Response.Redirect("~/StaffProfilePage.aspx" + queryString);
    }
}
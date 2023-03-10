using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewChatRooms : System.Web.UI.Page
{
    static string command = "";
    static string rewriteCommand = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        command = "SELECT * FROM chatRoom";
        command += " WHERE chatRoomID IS NOT NULL";

        if (!IsPostBack)
        {
            ViewGridView("None", "None");
        }

        if (Request.QueryString["delete"] != null)
        {
            Response.Write("<script>alert('Room " + Session["roomID"] + " Deleted')</script>");
            Session.Remove("roomID");
        }

        if (Request.QueryString["deletefail"] != null)
        {
            Response.Write("<script>alert('Failed.\\nJunior Account No Access.')</script>");
            Session.Remove("roomID");
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

    protected void btn_SearchTitle_Click(object sender, EventArgs e)
    {
        string value = tb_SearchTitle.Text;
        tb_Search.Text = "";
        tb_RoomSize.Text = "";
        string condition_Requirement = "";

        if (value.Equals(""))
        {

        }
        else
        {
            condition_Requirement = "AND roomTitle LIKE '%" + value + "%'";
        }
        ViewGridView("Search", condition_Requirement);
    }


    protected void btn_Search_Click(object sender, EventArgs e)
    {
        string value = tb_Search.Text;
        tb_SearchTitle.Text = "";
        tb_RoomSize.Text = "";
        string condition_Requirement = "";

        if (value.Equals(""))
        {

        }
        else
        {
            condition_Requirement = "AND chatRoomID = '" + value + "'";
        }
        ViewGridView("Search", condition_Requirement);
    }

    protected void btn_SearchSize_Click(object sender, EventArgs e)
    {
        string value = tb_RoomSize.Text;
        tb_SearchTitle.Text = "";
        tb_Search.Text = "";
        string condition_Requirement = "";

        if (value.Equals(""))
        {

        }
        else
        {
            condition_Requirement = "AND roomSize = '" + value + "'";
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

                Page.Response.Redirect(Page.Request.Url.ToString() + "&deletefail=fail", true);
            }
        }
        else
        {
            if (e.CommandName == "Delete")
            {
                connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
                conn = new SqlConnection(connStr);
                conn.Open();


                //Delete from database
                cmd = new SqlCommand("DELETE FROM chatRoomMessages WHERE chatRoomID = '" + e.CommandArgument + "' ", conn);
                int updated = cmd.ExecuteNonQuery();

                cmd = new SqlCommand("DELETE FROM chatRoom WHERE chatRoomID = '" + e.CommandArgument + "' ", conn);
                updated = cmd.ExecuteNonQuery();


                conn.Close();

                Session.Add("roomID", e.CommandArgument);

                //Refresh webpage
                Page.Response.Redirect(Page.Request.Url.ToString() + "&delete=1", true);
            }
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
        Response.Redirect("~/AddChatRoom.aspx" + queryString);
    }

    protected void btn_RefreshPage_Click(object sender, EventArgs e)
    {
        ViewGridView("None", "None");
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Forum : System.Web.UI.Page
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

        if (Request.QueryString["failed"] != null)
        {
            Response.Write("<script>alert('Room " + Session["roomID"] + " Is Full.')</script>");
            Session.Remove("roomID");
        }

        if (Request.QueryString["staff"] != null)
        {
            Response.Write("<script>alert('Staff Cannot Enter!')</script>");
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
        if (e.CommandName == "Join")
        {
            if (Request.QueryString["login"].Equals("false"))
            {
                
            }
            else
            {
                if (Request.QueryString["staffID"] != null)
                {
                    //Refresh webpage
                    Page.Response.Redirect(Page.Request.Url.ToString() + "&staff=1", true);
                }
                else
                {
                    string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
                    SqlConnection conn = new SqlConnection(connStr);
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT currentSize, roomSize from ChatRoom WHERE chatRoomID='" + e.CommandArgument + "' ", conn);
                    SqlDataReader dr = cmd.ExecuteReader();
                    int currentSize = 0;
                    int roomSize = 0;
                    if (dr.Read())    //// Call Read before accessing data.
                    {
                        currentSize = Convert.ToInt32(dr["currentSize"].ToString());
                        roomSize = Convert.ToInt32(dr["roomSize"].ToString());
                    }
                    dr.Close();

                    currentSize += 1;

                    if (currentSize > roomSize)
                    {
                        conn.Close();

                        Session.Add("roomID", e.CommandArgument);

                        //Refresh webpage
                        Page.Response.Redirect(Page.Request.Url.ToString() + "&failed=1", true);
                    }
                    else
                    {
                        //Save into DB
                        cmd = new SqlCommand("Update ChatRoom Set currentSize = '" + currentSize + "' Where chatRoomID='" + e.CommandArgument + "' ", conn);
                        int updated = cmd.ExecuteNonQuery();


                        string ins = "Insert into [chatRoomUsers](chatRoomID, userType, userID) values(@chatRoomID, @userType, @userID)";
                        SqlCommand com = new SqlCommand(ins, conn);

                        com.Parameters.AddWithValue("@chatRoomID", e.CommandArgument);
                        com.Parameters.AddWithValue("@userType", "User");
                        com.Parameters.AddWithValue("@userID", Request.QueryString["userID"]);

                        com.ExecuteNonQuery();
                        conn.Close();

                        string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"] + "&roomID=" + e.CommandArgument;
                        Response.Redirect("~/ForumChatRoom.aspx" + queryString);
                    }
                }
            }
        }
    }

    protected void btn_RefreshPage_Click(object sender, EventArgs e)
    {
        //Refresh webpage
        Page.Response.Redirect(Page.Request.Url.ToString(), true);
    }
}
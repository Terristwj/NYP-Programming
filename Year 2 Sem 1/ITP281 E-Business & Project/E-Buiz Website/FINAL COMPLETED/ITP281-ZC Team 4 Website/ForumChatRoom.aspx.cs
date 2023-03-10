using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForumChatRoom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadChatbox();
        LoadUsers();
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        LoadUsers();
    }
    public void LoadUsers()
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        string command = "SELECT *, ua.name UName, sa.name DName FROM chatRoom cr";
        command += " INNER JOIN chatRoomUsers cru ON cru.chatRoomID = cr.chatRoomID";
        command += " LEFT JOIN userAccounts ua ON ua.userID = cru.userID";
        command += " LEFT JOIN staffAccount sa ON sa.staffID = cru.staffID";
        command += " WHERE cr.chatRoomID = '" + Request.QueryString["roomID"] + "'";
        SqlCommand cmd = new SqlCommand(command, conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        dl_RoomUsers.DataSource = ds;
        dl_RoomUsers.DataBind();
        conn.Close();
    }

    protected void Timer2_Tick(object sender, EventArgs e)
    {
        LoadChatbox();
    }
    public void LoadChatbox()
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        
        string command = "SELECT *, ua.name UName, sa.name DName FROM chatRoom cr";
        command += " INNER JOIN chatRoomMessages crm ON crm.chatRoomID = cr.chatRoomID";
        command += " LEFT JOIN userAccounts ua ON ua.userID = crm.userID";
        command += " LEFT JOIN staffAccount sa ON sa.staffID = crm.staffID";
        command += " WHERE cr.chatRoomID = '" + Request.QueryString["roomID"] + "'";
        SqlCommand cmd = new SqlCommand(command, conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gv_Message.DataSource = ds;
        gv_Message.DataBind();
        conn.Close();
    }

    protected void btn_Send_Click(object sender, EventArgs e)
    {
        if (!tb_Message.Equals(""))
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            string ins = "Insert into [chatRoomMessages](chatRoomID, userID, message) values(@chatRoomID, @userID, @message)";
            SqlCommand com = new SqlCommand(ins, conn);

            com.Parameters.AddWithValue("@chatRoomID", Request.QueryString["roomID"]);
            com.Parameters.AddWithValue("@userID", Request.QueryString["userID"]);
            com.Parameters.AddWithValue("@message", tb_Message.Text);


            com.ExecuteNonQuery();

            conn.Close();

            tb_Message.Text = null;
        }
    }

    protected void btn_Exit_Click(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();


        SqlCommand cmd = new SqlCommand("SELECT currentSize, roomSize from ChatRoom WHERE chatRoomID='" + Request.QueryString["roomID"] + "' ", conn);
        SqlDataReader dr = cmd.ExecuteReader();
        int currentSize = 0;
        int roomSize = 0;
        if (dr.Read())    //// Call Read before accessing data.
        {
            currentSize = Convert.ToInt32(dr["currentSize"].ToString());
            roomSize = Convert.ToInt32(dr["roomSize"].ToString());
        }
        dr.Close();

        currentSize -= 1;

        //Save into DB
        cmd = new SqlCommand("Update ChatRoom Set currentSize = '" + currentSize + "' Where chatRoomID='" + Request.QueryString["roomID"] + "' ", conn);
        int updated = cmd.ExecuteNonQuery();


        string ins = "Insert into [chatRoomUsers](chatRoomID, userType, userID) values(@chatRoomID, @userType, @userID)";
        SqlCommand com = new SqlCommand(ins, conn);

        com.Parameters.AddWithValue("@chatRoomID", Request.QueryString["roomID"]);
        com.Parameters.AddWithValue("@userType", "User");
        com.Parameters.AddWithValue("@userID", Request.QueryString["userID"]);

        com.ExecuteNonQuery();

        string del = "DELETE FROM chatRoomUsers WHERE userID = '" + Request.QueryString["userID"] + "'";
        cmd = new SqlCommand(del, conn);
        updated = cmd.ExecuteNonQuery();

        conn.Close();
        string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        Response.Redirect("~/Forum.aspx" + queryString);
    }
}
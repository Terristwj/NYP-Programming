using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DoctorRoom : System.Web.UI.Page
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

        string command = "SELECT *, ua.name UName, d.name DName FROM DoctorRoom dr";
        command += " INNER JOIN DoctorRoomUsers dru ON dru.roomID = dr.roomID";
        command += " LEFT JOIN userAccounts ua ON ua.userID = dru.userID";
        command += " LEFT JOIN Doctor d ON d.Doctor_ID = dru.Doctor_ID";
        command += " WHERE bookingID = '" + Request.QueryString["bookingID"] + "'";
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

        string command = "SELECT *, ua.name UName, d.name DName FROM DoctorRoom dr";
        command += " INNER JOIN DoctorRoomMessages drm ON drm.roomID = dr.roomID";
        command += " LEFT JOIN userAccounts ua ON ua.userID = drm.userID";
        command += " LEFT JOIN Doctor d ON d.Doctor_ID = drm.Doctor_ID";
        command += " WHERE bookingID = '" + Request.QueryString["bookingID"] + "'";
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

            SqlCommand cmd = new SqlCommand("SELECT * from DoctorRoom WHERE bookingID='" + Request.QueryString["bookingID"] + "' ", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            string roomID = null;
            if (dr.Read())    //// Call Read before accessing data.
            {
                roomID = dr["roomID"].ToString();
            }
            dr.Close();


            string ins = "Insert into [DoctorRoomMessages](roomID, userID, message) values(@roomID, @userID, @message)";
            SqlCommand com = new SqlCommand(ins, conn);

            com.Parameters.AddWithValue("@roomID", roomID);
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

        string del = "DELETE FROM DoctorRoomUsers WHERE userID = '" + Request.QueryString["userID"]+ "'";
        SqlCommand cmd = new SqlCommand(del, conn);
        int updated = cmd.ExecuteNonQuery();

        conn.Close();
        string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        Response.Redirect("~/DoctorRoomView.aspx" + queryString);
    }
}
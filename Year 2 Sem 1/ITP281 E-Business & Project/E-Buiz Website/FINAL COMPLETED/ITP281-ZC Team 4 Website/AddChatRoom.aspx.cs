using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddChatRoom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Create_Click(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();


        string ins = "Insert into [chatRoom](roomSize, roomTitle) values(@roomSize, @roomTitle)";
        SqlCommand com = new SqlCommand(ins, conn);

        com.Parameters.AddWithValue("@roomSize", Convert.ToInt32(ddl_RoomSize.SelectedValue));
        com.Parameters.AddWithValue("@roomTitle", tb_Title.Text);

        com.ExecuteNonQuery();

        SqlCommand cmd = new SqlCommand("SELECT MAX(chatRoomID) chatRoomID FROM chatRoom", conn);
        SqlDataReader dr = cmd.ExecuteReader();
        int chatRoomID = 0;

        if (dr.Read())
        {
            chatRoomID = Convert.ToInt32(dr["chatRoomID"].ToString());
        }

        dr.Close();

        Response.Write("<script>alert('Successfully Created')</script>");

        conn.Close();
    }

    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        Response.Redirect("~/ViewChatRooms.aspx" + queryString);
    }
}
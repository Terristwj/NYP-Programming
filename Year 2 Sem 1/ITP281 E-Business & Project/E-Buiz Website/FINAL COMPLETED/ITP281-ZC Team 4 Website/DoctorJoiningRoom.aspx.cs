using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DoctorJoiningRoom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Join_Click(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        conn.Open();
        string command = "SELECT roomPassword, bookingID FROM DoctorRoom dr";
        command += " INNER JOIN DoctorRoomUsers dru ON dru.roomID = dr.roomID";
        command += " WHERE dr.roomID = '" + Request.QueryString["roomID"] + "'";

        SqlCommand cmd = new SqlCommand(command, conn);
        SqlDataReader dr = cmd.ExecuteReader();

        string roomPassword = "";
        string bookingID = "";

        if (dr.Read())
        {
            roomPassword = dr["roomPassword"].ToString();
            bookingID = dr["bookingID"].ToString();
        }
        dr.Close();

        if (roomPassword.Equals(tb_Password.Text))
        {
            command = "SELECT * FROM DoctorRoomUsers";
            command += " WHERE roomID = '" + Request.QueryString["roomID"] + "'";
            command += " AND userType = 'User'";

            cmd = new SqlCommand(command, conn);
            dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                dr.Close();
                conn.Close();
                Response.Write("<script>alert('Room Full')</script>");
            }
            else
            {
                dr.Close();
                string ins = "Insert into [DoctorRoomUsers](roomID, userType, userID) values(@roomID, @userType, @userID)";
                cmd = new SqlCommand(ins, conn);

                cmd.Parameters.AddWithValue("@roomID", Convert.ToInt32(Request.QueryString["roomID"]));
                cmd.Parameters.AddWithValue("@userType", "User");
                cmd.Parameters.AddWithValue("@userID", Request.QueryString["userID"]);
                cmd.ExecuteNonQuery();

                conn.Close();
                string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"] + "&bookingID=" + bookingID;
                Response.Redirect("~/DoctorRoom.aspx" + queryString);
            }
        }
        else
        {
            conn.Close();
            Response.Write("<script>alert('Password Incorrect')</script>");
        }
    }

    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        Response.Redirect("~/DoctorRoomView.aspx" + queryString);
    }
}
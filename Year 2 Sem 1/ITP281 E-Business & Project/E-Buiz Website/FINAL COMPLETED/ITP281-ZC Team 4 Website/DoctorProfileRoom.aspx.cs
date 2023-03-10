using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DoctorProfileRoom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        string command = "SELECT * FROM Booking b";
        command += " INNER JOIN userAccounts ua ON ua.userID = b.userID";
        command += " WHERE bookingID = '" + Request.QueryString["bookingID"]+ "'";

        SqlCommand cmd = new SqlCommand(command, conn);
        SqlDataReader dr = cmd.ExecuteReader();
        string name = null;
        string timePeriod = null;

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            name = dr["name"].ToString();
            timePeriod = dr["timePeriod"].ToString();
        }

        dr.Close();
        conn.Close();

        lb_NameUser.Text = name;
        lb_TimeSlot.Text = timePeriod;

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


            string ins = "Insert into [DoctorRoomMessages](roomID, Doctor_ID, message) values(@roomID, @Doctor_ID, @message)";
            SqlCommand com = new SqlCommand(ins, conn);

            com.Parameters.AddWithValue("@roomID", roomID);
            com.Parameters.AddWithValue("@Doctor_ID", Request.QueryString["doctorID"]);
            com.Parameters.AddWithValue("@message", tb_Message.Text);


            com.ExecuteNonQuery();

            conn.Close();

            tb_Message.Text = null;
        }
    }

    protected void btn_Finish_Click(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        /*  UPDATE THE ROOM STATUS  */

        SqlCommand cmd = new SqlCommand("UPDATE booking SET status = 'Completed' WHERE bookingID='" + Request.QueryString["bookingID"] + "' ", conn);
        int updated = cmd.ExecuteNonQuery();

        cmd = new SqlCommand("DELETE DoctorRoomUsers WHERE Doctor_ID='" + Request.QueryString["doctorID"] + "' ", conn);
        int delete = cmd.ExecuteNonQuery();

        cmd = new SqlCommand("UPDATE DoctorRoom SET cleared = 'Cleared' WHERE bookingID='" + Request.QueryString["bookingID"] + "' ", conn);
        int update = cmd.ExecuteNonQuery();



        /*  UPDATE THE DOCTOR STATUS*/


        cmd = new SqlCommand("SELECT consultsGiven from Doctor WHERE Doctor_ID='" + Request.QueryString["doctorID"] + "' ", conn);
        SqlDataReader dr = cmd.ExecuteReader();
        int consultsGiven = 0;
        int value = 0;
        if (dr.Read())    //// Call Read before accessing data.
        {
            consultsGiven = Convert.ToInt32(dr["consultsGiven"].ToString());
        }
        dr.Close();

        value = consultsGiven + 1;
        cmd = new SqlCommand("UPDATE Doctor SET consultsGiven = '" + value + "' WHERE Doctor_ID='" + Request.QueryString["doctorID"] + "' ", conn);
        int update1 = cmd.ExecuteNonQuery();


        /*   UPDATE THE USER STATUS AND TRANSACTIONS*/

        string command = "SELECT userID FROM Booking ";
        command += " WHERE bookingID = '" + Request.QueryString["bookingID"] + "'";

        cmd = new SqlCommand(command, conn);
        dr = cmd.ExecuteReader();
        string userID = null;

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            userID = dr["userID"].ToString();
        }

        dr.Close();

        cmd = new SqlCommand("SELECT wallet from userAccounts WHERE userID='" + userID + "' ", conn);
        dr = cmd.ExecuteReader();
        double wallet = 0;
        double value2 = 0;
        if (dr.Read())    //// Call Read before accessing data.
        {
            wallet = Convert.ToDouble(dr["wallet"].ToString());
        }
        dr.Close();

        value2 = wallet - 30.00;
        cmd = new SqlCommand("UPDATE userAccounts SET wallet = '" + value2 + "' WHERE userID='" + userID + "' ", conn);
        int update2 = cmd.ExecuteNonQuery();


        double newWallet = value2;

        string ins = "INSERT INTO [EWalletTransactions](AmountDepleted, DateOfChange, userID, finalWallet) VALUES(@AmountDepleted, @DateOfChange, @userID, @finalWallet)";
        cmd = new SqlCommand(ins, conn);

        cmd.Parameters.AddWithValue("@AmountDepleted", 30.00);
        cmd.Parameters.AddWithValue("@DateOfChange", DateTime.Now.ToString());
        cmd.Parameters.AddWithValue("@userID", userID);
        cmd.Parameters.AddWithValue("@finalWallet", newWallet);

        cmd.ExecuteNonQuery();

        conn.Close();


        string queryString = "?login=true" + "&doctorID=" + Request.QueryString["doctorID"];
        Response.Redirect("~/DoctorProfilePage.aspx" + queryString);
    }
}
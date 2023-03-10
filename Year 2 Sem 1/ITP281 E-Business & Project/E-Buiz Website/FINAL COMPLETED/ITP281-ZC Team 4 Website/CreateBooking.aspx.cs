using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateBooking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Create_Click(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        SqlCommand cmd = new SqlCommand("SELECT * FROM Booking WHERE date='" + tb_Date.Text + "' AND timePeriod='" + ddl_Time.SelectedValue + "' AND Doctor_ID = '" + Request.QueryString["doctorID"] +"'", conn);
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            dr.Close();
            Response.Write("<script>alert('Cannot Create Duplicate Slots')</script>");
            conn.Close();
        }
        else
        {
            dr.Close();
            string ins = "Insert into [Booking](Doctor_ID, date, timePeriod, roomPassword) values(@Doctor_ID, @date, @timePeriod, @roomPassword)";
            SqlCommand com = new SqlCommand(ins, conn);

            com.Parameters.AddWithValue("@Doctor_ID", Convert.ToInt32(Request.QueryString["doctorID"]));
            com.Parameters.AddWithValue("@date", tb_Date.Text);
            com.Parameters.AddWithValue("@timePeriod", ddl_Time.SelectedValue);
            com.Parameters.AddWithValue("@roomPassword", tb_Password.Text);
            com.ExecuteNonQuery();

            conn.Close();
            Response.Write("<script>alert('Successfully Created')</script>");

        }
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        tb_Date.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
    }

    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&doctorID=" + Request.QueryString["doctorID"];
        Response.Redirect("~/DoctorProfileBookings.aspx" + queryString);
    }
}
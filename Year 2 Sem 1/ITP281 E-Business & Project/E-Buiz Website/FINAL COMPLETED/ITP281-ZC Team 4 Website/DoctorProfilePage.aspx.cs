using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DoctorProfilePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        conn.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Doctor WHERE Doctor_ID='" + Request.QueryString["doctorID"] + "' ", conn);
        SqlDataReader dr = cmd.ExecuteReader();
        string name = null;
        string consultsGiven = null;

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            name = dr["name"].ToString();
            consultsGiven = dr["consultsGiven"].ToString();
        }

        dr.Close();
        conn.Close();

        tb_name.Text = name;
        tb_ID.Text = (Convert.ToInt32(Request.QueryString["doctorID"]).ToString("D5"));
        tb_Consults.Text = consultsGiven;
    }

    protected void btn_SignOut_Click(object sender, EventArgs e)
    {
        string queryString = "?login=false";
        Response.Redirect("~/Login.aspx" + queryString);
    }

    protected void btn_CreateRoom_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&doctorID=" + Request.QueryString["doctorID"];
        Response.Redirect("~/DoctorProfileCreateRoom.aspx" + queryString);
    }
    protected void btn_ViewBooking_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&doctorID=" + Request.QueryString["doctorID"];
        Response.Redirect("~/DoctorProfileBookings.aspx" + queryString);
    }
    protected void btn_ViewConsults_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&doctorID=" + Request.QueryString["doctorID"];
        Response.Redirect("~/DoctorProfileConsults.aspx" + queryString);
    }
}
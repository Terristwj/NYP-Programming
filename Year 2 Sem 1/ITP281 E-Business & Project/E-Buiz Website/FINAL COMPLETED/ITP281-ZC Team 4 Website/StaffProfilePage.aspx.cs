using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StaffProfilePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        conn.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM staffAccount WHERE staffID='" + Request.QueryString["staffID"] + "' ", conn);
        SqlDataReader dr = cmd.ExecuteReader();
        string name = null;
        string position = null;

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            name = dr["name"].ToString();
            position = dr["position"].ToString();
        }

        dr.Close();
        conn.Close();

        tb_name.Text = name;
        tb_ID.Text = (Convert.ToInt32(Request.QueryString["staffID"]).ToString("D5"));
        tb_Position.Text = position;
    }

    protected void btn_SignOut_Click(object sender, EventArgs e)
    {
        string queryString = "?login=false";
        Response.Redirect("~/Login.aspx" + queryString);
    }

    protected void btn_EditItem_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        Response.Redirect("~/EditStore.aspx" + queryString);
    }
    protected void btn_ViewUsers_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        Response.Redirect("~/ViewUsers.aspx" + queryString);
    }

    protected void btn_ViewStaff_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        Response.Redirect("~/ViewStaff.aspx" + queryString);
    }

    protected void btn_ViewDoctors_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        Response.Redirect("~/ViewDoctors.aspx" + queryString);
    }

    protected void btn_ViewWalletTransactions_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        Response.Redirect("~/ViewWalletTransactions.aspx" + queryString);
    }

    protected void btn_ViewStoreTransactions_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        Response.Redirect("~/ViewStoreTransactions.aspx" + queryString);
    }
    
    protected void btn_ViewDoctorTransactions_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        Response.Redirect("~/ViewDoctorTransactions.aspx" + queryString);
    }

    protected void btn_ViewDoctorBookings_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        Response.Redirect("~/ViewDoctorBookings.aspx" + queryString);
    }

    protected void btn_ViewChatRooms_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        Response.Redirect("~/ViewChatRooms.aspx" + queryString);
    }
}
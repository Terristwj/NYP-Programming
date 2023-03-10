using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Doctor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Book_Click(object sender, EventArgs e)
    {
        string queryString = "";
        if (Request.QueryString["userID"] != null)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM userAccounts WHERE userID='" + Request.QueryString["userID"] + "' ", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            double wallet = 0;

            // ^Put in values and then dr.Read()

            if (dr.Read())    //// Call Read before accessing data.
            {
                wallet = Convert.ToDouble(dr["wallet"].ToString());
            }
            dr.Close();
            conn.Close();

            if (wallet < 30.00)
            {
                queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
                Response.Redirect("~/DoctorNotLogin.aspx" + queryString);
            }
            else
            {
                queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
                Response.Redirect("~/DoctorBookingView.aspx" + queryString);
            }
        }
        else if (Request.QueryString["staffID"] != null)
        {
            queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
            Response.Redirect("~/DoctorNotLogin.aspx" + queryString);
        }
        else
        {
            queryString = "?login=false";
            Response.Redirect("~/DoctorNotLogin.aspx" + queryString);
        }
    }

    protected void btn_Rooms_Click(object sender, EventArgs e)
    {
        string queryString = "";
        if (Request.QueryString["userID"] != null)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM userAccounts WHERE userID='" + Request.QueryString["userID"] + "' ", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            double wallet = 0;

            // ^Put in values and then dr.Read()

            if (dr.Read())    //// Call Read before accessing data.
            {
                wallet = Convert.ToDouble(dr["wallet"].ToString());
            }
            dr.Close();
            conn.Close();

            if (wallet < 30.00)
            {
                queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
                Response.Redirect("~/DoctorNotLogin.aspx" + queryString);
            }
            else
            {
                queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
                Response.Redirect("~/DoctorRoomView.aspx" + queryString);
            }
        }
        else if (Request.QueryString["staffID"] != null)
        {
            queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
            Response.Redirect("~/DoctorNotLogin.aspx" + queryString);
        }
        else
        {
            queryString = "?login=false";
            Response.Redirect("~/DoctorNotLogin.aspx" + queryString);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddStaff : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Create_Click(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        Boolean validAccount = true;

        SqlCommand cmd = new SqlCommand("SELECT * from staffAccount WHERE username='" + tb_Username.Text + "'", conn);
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            Response.Write("<script>alert('Username is taken.')</script>");
            validAccount = false;
        }

        dr.Close();

        cmd = new SqlCommand("SELECT * from staffAccount WHERE name='" + tb_Name.Text + "'", conn);
        dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            Response.Write("<script>alert('Name is taken.')</script>");
            validAccount = false;
        }

        dr.Close();

        cmd = new SqlCommand("SELECT * from userAccounts WHERE username='" + tb_Username.Text + "'", conn);
        dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            Response.Write("<script>alert('Username is taken.')</script>");
            validAccount = false;
        }

        dr.Close();

        cmd = new SqlCommand("SELECT * from Doctor WHERE username='" + tb_Username.Text + "'", conn);
        dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            Response.Write("<script>alert('Username is taken.')</script>");
            validAccount = false;
        }

        dr.Close();

        if (validAccount == true)
        {
            string ins = "Insert into [staffAccount](username, password, name, position) values(@username, @password, @name, @position)";
            SqlCommand com = new SqlCommand(ins, conn);

            com.Parameters.AddWithValue("@username", tb_Username.Text);
            com.Parameters.AddWithValue("@password", tb_Password.Text);
            com.Parameters.AddWithValue("@name", tb_Name.Text);
            com.Parameters.AddWithValue("@position", ddl_Position.SelectedValue);

            com.ExecuteNonQuery();

            Response.Write("<script>alert('Successfully Created')</script>");
        }
        conn.Close();
    }

    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        Response.Redirect("~/ViewStaff.aspx" + queryString);
    }
}
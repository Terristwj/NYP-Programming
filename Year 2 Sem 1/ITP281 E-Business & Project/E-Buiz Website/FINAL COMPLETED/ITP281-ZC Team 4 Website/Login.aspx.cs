using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["login"] == "true")
        {
            if (Request.QueryString["userID"] != null)
            {
                string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
                Response.Redirect("~/ProfilePage.aspx" + queryString);
            }
            else if (Request.QueryString["staffID"] != null)
            {
                string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
                Response.Redirect("~/StaffProfilePage.aspx" + queryString);
            }
        }

        if (IsPostBack) //The web page is loaded by itself
        {
            
        }
    }

    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from userAccounts where username='"+TxtUsername.Text+"' and password='"+TxtPassword.Text+"' ", conn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            cmd.ExecuteNonQuery();
            conn.Close();
            if (dt.Rows[0][0].ToString() == "1")
            {
                conn.Open();
                cmd = new SqlCommand("select userID from userAccounts where username='"+TxtUsername.Text+"' ", conn);
                SqlDataReader dr = cmd.ExecuteReader();
                string userID = null;

                if (dr.Read())    //// Call Read before accessing data.
                {
                    userID = dr["userID"].ToString();
                }

                string queryString = "?login=true" + "&userID=" + userID;

                dr.Close();
                conn.Close();
                Response.Redirect("~/ProfilePage.aspx" + queryString);
            }
            else
            {
                conn.Open();
                cmd = new SqlCommand("select count(*) from staffAccount where username='" + TxtUsername.Text + "' and password='" + TxtPassword.Text + "' ", conn);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                cmd.ExecuteNonQuery();
                conn.Close();
                if (dt.Rows[0][0].ToString() == "1")
                {
                    conn.Open();
                    cmd = new SqlCommand("select staffID from staffAccount where username='" + TxtUsername.Text + "' ", conn);
                    SqlDataReader dr = cmd.ExecuteReader();
                    string staffID = null;

                    if (dr.Read())    //// Call Read before accessing data.
                    {
                        staffID = dr["staffID"].ToString();
                    }

                    
                    string queryString = "?login=true" + "&staffID=" + staffID;

                    dr.Close();
                    conn.Close();
                    Response.Redirect("~/StaffProfilePage.aspx" + queryString);
                }
                else
                {
                    conn.Open();
                    cmd = new SqlCommand("select count(*) from Doctor where username='" + TxtUsername.Text + "' and password='" + TxtPassword.Text + "' ", conn);
                    sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    if (dt.Rows[0][0].ToString() == "1")
                    {
                        conn.Open();
                        cmd = new SqlCommand("select Doctor_ID from Doctor where username='" + TxtUsername.Text + "' ", conn);
                        SqlDataReader dr = cmd.ExecuteReader();
                        string doctorID = null;

                        if (dr.Read())    //// Call Read before accessing data.
                        {
                            doctorID = dr["Doctor_ID"].ToString();
                        }
                        dr.Close();

                        //Save last login into DB
                        string CurrentTime = DateTime.Now.ToString();
                        cmd = new SqlCommand("Update Doctor Set lastLogin = '" + CurrentTime + "' Where Doctor_ID='" + doctorID + "' ", conn);
                        int updated = cmd.ExecuteNonQuery();


                        string queryString = "?login=true" + "&doctorID=" + doctorID;
                        
                        conn.Close();
                        Response.Redirect("~/DoctorProfilePage.aspx" + queryString);
                    }
                    else
                    {
                        Response.Write("<script>alert('Incorrect Login')</script>");
                    }
                }
            }
        } catch(Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (RegisTxtUsername.Text != "" && RegisTxtPassword.Text !=""  && RegisTxtName.Text != "" && RegisTxtEmail.Text != "" && RegisTxtAddr.Text != "" && RegisTxtZC.Text != "" && RegisTxtPN.Text != "")
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            SqlCommand cmd = new SqlCommand("select username from userAccounts where username='" + RegisTxtUsername.Text + "' ", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            Boolean usernameTaken = false;

            if (dr.HasRows)
            {
                Response.Write("<script>alert('Username is taken')</script>");
                usernameTaken = true;
                dr.Close();
            }
            else
            {
                dr.Close();

                cmd = new SqlCommand("select username from staffAccount where username='" + RegisTxtUsername.Text + "' ", conn);
                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    Response.Write("<script>alert('Username is taken')</script>");
                    usernameTaken = true;
                    dr.Close();
                }
                else
                {
                    dr.Close();

                    cmd = new SqlCommand("select username from Doctor where username='" + RegisTxtUsername.Text + "' ", conn);
                    dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        Response.Write("<script>alert('Username is taken')</script>");
                        usernameTaken = true;
                        dr.Close();
                    }
                    else
                    {
                        dr.Close();

                        DateTime dateJoined = DateTime.Now;
                        string dateJoinedStr = dateJoined.ToString("dddd dd MMMM yyyy");

                        cmd = new SqlCommand("select * from AboutMeText", conn);
                        dr = cmd.ExecuteReader();

                        string start = "";
                        string middle = "";
                        string end = "";

                        if (dr.Read())    //// Call Read before accessing data.
                        {
                            start = dr["Start"].ToString();
                            middle = dr["Middle"].ToString();
                            end = dr["End"].ToString();
                        }
                        dr.Close();

                        string aboutDesc = start + RegisTxtName.Text + middle + dateJoinedStr + end;

                        //string ins = "Insert into [userAccounts](username, password, email) values('"+RegisTxtUsername.Text+"', '"+RegisTxtPassword.Text+"', '"+RegisTxtEmail.Text+"')";
                        string ins = "Insert into [userAccounts](username, password, name, email, address, zipCode, phoneNumber, dateJoined, aboutDesc) values(@username, @password, @name, @email, @address, @zipCode, @phoneNumber, @dateJoined, @aboutDesc)";
                        SqlCommand com = new SqlCommand(ins, conn);

                        com.Parameters.AddWithValue("@username", RegisTxtUsername.Text);
                        com.Parameters.AddWithValue("@password", RegisTxtPassword.Text);
                        com.Parameters.AddWithValue("@name", RegisTxtName.Text);
                        com.Parameters.AddWithValue("@email", RegisTxtEmail.Text);
                        com.Parameters.AddWithValue("@address", RegisTxtAddr.Text);
                        com.Parameters.AddWithValue("@zipCode", RegisTxtZC.Text);
                        com.Parameters.AddWithValue("@phoneNumber", RegisTxtPN.Text);
                        com.Parameters.AddWithValue("@dateJoined", dateJoinedStr);

                        com.Parameters.AddWithValue("@aboutDesc", aboutDesc);


                        com.ExecuteNonQuery();
                    }
                }
            }
            conn.Close();

            if (usernameTaken == false)
            {
                conn.Open();
                cmd = new SqlCommand("select userID from userAccounts where username='" + RegisTxtUsername.Text + "' ", conn);
                dr = cmd.ExecuteReader();
                string userID = "";

                if (dr.Read())    //// Call Read before accessing data.
                {
                    userID = dr["userID"].ToString();
                }

                dr.Close();
                conn.Close();

                string queryString = "?login=true" + "&userID=" + userID;
                Response.Redirect("~/ProfilePage.aspx" + queryString);
            }
        }
        else
        {
            Response.Write("<script>alert('Please fill in all feilds')</script>");
        }
    }
}
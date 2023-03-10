using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewProfilePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        conn.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM userAccounts WHERE userID='" + Request.QueryString["viewedProfile"] + "' ", conn);
        SqlDataReader dr = cmd.ExecuteReader();
        string name = null;
        string background = null;
        string profileImg = null;
        string username = null;
        string dateJoined = null;
        string aboutDesc = null;

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            name = dr["name"].ToString();
            background = dr["backgroundUrl"].ToString();
            profileImg = dr["profileUrl"].ToString();
            username = dr["username"].ToString();
            dateJoined = dr["dateJoined"].ToString();
            aboutDesc = dr["aboutDesc"].ToString();
        }

        LblName.Text = name;

        if (background != "DefaultProfileBackground.jpg")
            ImgProfileBackground.ImageUrl = "~/CSS and Images/Users/" + username + "/Background/" + background;
        else
            ImgProfileBackground.ImageUrl = "~/CSS and Images/Images and fonts/" + background;

        if (profileImg != "DefaultProfileImage.png")
            Image1.ImageUrl = "~/CSS and Images/Users/" + username + "/Avatar/" + profileImg;
        else
            Image1.ImageUrl = "~/CSS and Images/Images and fonts/" + profileImg;


        tb_AboutMe.Text = aboutDesc;

        lb_Membership_Status.Text = "Normal Member";
        lb_Membership_DateJoined.Text = "Date Joined: " + dateJoined;

        dr.Close();
        conn.Close();
    }

    protected void btn_Back_Click(object sender, EventArgs e)
    {
        string queryString = "";
        if (Request.QueryString["userID"] != null)
        {
            queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
            Response.Redirect("~/ProfileSearchUser.aspx" + queryString);
        }
        else if (Request.QueryString["staffID"] != null)
        {
            queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
            Response.Redirect("~/ViewUsers.aspx" + queryString);
        }
    }
}
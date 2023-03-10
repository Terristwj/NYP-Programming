using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProfilePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from userAccounts where userID='" + Request.QueryString["userID"] + "' ", conn);
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

    protected void BtnEditBackground_Click(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        string image = "";
        string fullPath = "";
        string currentBackground = "";

        SqlCommand cmd = new SqlCommand("Select backgroundUrl, username from userAccounts where userID='" + Request.QueryString["userID"] + "' ", conn);
        SqlDataReader dr = cmd.ExecuteReader();

        string username = "";

        if (dr.Read())    //// Call Read before accessing data.
        {
            username = dr["username"].ToString();
            currentBackground = dr["backgroundUrl"].ToString();
        }

        //Creates folder for first time users
        string userFolder = username;
        string path = Server.MapPath("~/CSS and Images/Users/" + userFolder + "/Background");
        if (!Directory.Exists(path))
        {
            Directory.CreateDirectory(path);
        }
        dr.Close();

        if (Path.GetExtension(FileUpload.FileName).ToLower() != ".jpg"
            && Path.GetExtension(FileUpload.FileName).ToLower() != ".png"
            && Path.GetExtension(FileUpload.FileName).ToLower() != ".gif"
            && Path.GetExtension(FileUpload.FileName).ToLower() != ".jpeg")
        {
            Response.Write("<script>alert('This is not an image file')</script>");
        }
        else
        {
            //Fist time change
            if (currentBackground != "DefaultProfileBackground.jpg")
            {
                //Delete image
                image = "CSS and Images\\Users\\" + username + "\\Background\\" + currentBackground;
                fullPath = Server.MapPath("") + "\\" + image;
                File.Delete(fullPath);
            }

            //Add image into DB
            cmd = new SqlCommand("Update userAccounts Set backgroundUrl = '" + FileUpload.FileName + "' Where userID='" + Request.QueryString["userID"] + "' ", conn);
            int updated = cmd.ExecuteNonQuery();

            //Change image
            image = "CSS and Images\\Users\\" + username + "\\Background\\" + FileUpload.FileName;
            fullPath = Server.MapPath("") + "\\" + image;
            FileUpload.SaveAs(fullPath);

            conn.Close();

            //Refresh webpage
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }

    protected void BtnEditAcc_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        Response.Redirect("~/EditParticulars.aspx" + queryString);
    }

    protected void BtnSignOut_Click(object sender, EventArgs e)
    {
        string queryString = "?login=false";
        Response.Redirect("~/Login.aspx" + queryString);
    }

    protected void btn_Search_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        Response.Redirect("~/ProfileSearchUser.aspx" + queryString);
    }
}
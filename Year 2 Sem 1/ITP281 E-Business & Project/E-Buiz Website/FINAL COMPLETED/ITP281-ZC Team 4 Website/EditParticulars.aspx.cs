using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditParticulars : System.Web.UI.Page
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
        string password = null;
        string email = null;
        string address = null;
        string zipCode = null;
        string phoneNumber = null;
        string aboutDesc = null;

        string dateJoined = null;

        double wallet = 0;

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            name = dr["name"].ToString();
            background = dr["backgroundUrl"].ToString();
            profileImg = dr["profileUrl"].ToString();
            username = dr["username"].ToString();
            password = dr["password"].ToString();
            email = dr["email"].ToString();
            address = dr["address"].ToString();
            zipCode = dr["zipCode"].ToString();
            phoneNumber = dr["phoneNumber"].ToString();
            aboutDesc = dr["aboutDesc"].ToString();

            dateJoined = dr["dateJoined"].ToString();

            wallet = Double.Parse(dr["wallet"].ToString());
        }

        // Below is the set of information to be loaded
        if (!IsPostBack)   //MUST USE !IsPostBack IF NOT ERROR IN UPDATE
        {
            tb_name.Text = name;
            tb_Email.Text = email;
            tb_Address.Text = address;
            tb_ZipCode.Text = zipCode;
            tb_PhoneNo.Text = phoneNumber;
            tb_AboutMe.Text = aboutDesc;
            lb_Wallet.Text = "$" + Math.Round(wallet, 2).ToString("0.00");
        }

        if (profileImg != "DefaultProfileImage.png")
        {
            Image1.ImageUrl = "~/CSS and Images/Users/" + username + "/Avatar/" + profileImg;
            Image2.ImageUrl = "~/CSS and Images/Users/" + username + "/Avatar/" + profileImg;
            Image3.ImageUrl = "~/CSS and Images/Users/" + username + "/Avatar/" + profileImg;
        }
        else
        {
            Image1.ImageUrl = "~/CSS and Images/Images and fonts/" + profileImg;
            Image2.ImageUrl = "~/CSS and Images/Images and fonts/" + profileImg;
            Image3.ImageUrl = "~/CSS and Images/Images and fonts/" + profileImg;
        }


        if (background != "DefaultProfileBackground.jpg")
            Img_Background.ImageUrl = "~/CSS and Images/Users/" + username + "/Background/" + background;
        else
            Img_Background.ImageUrl = "~/CSS and Images/Images and fonts/" + background;


        dr.Close();
        conn.Close();
    }

    protected void btn_update_Click(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        string avatarImage = "";
        string backgroundImage = "";
        string fullPath = "";

        Boolean passwordIsWrong = false;
        Boolean newPasswordIsEmpty = false;
        Boolean passwordEqualNewPassword = false;

        conn.Open();
        SqlCommand cmd = new SqlCommand("Select * from userAccounts where userID='" + Request.QueryString["userID"] + "' ", conn);
        SqlDataReader dr = cmd.ExecuteReader();

        string username = "";
        string name = "";
        string currentAvatarImage = "";
        string currentBackgroundImage = "";

        string email = "";
        string address = "";
        string zipCode = "";
        string phoneNumber = "";

        string password = "";

        string aboutDesc = "";
        string dateJoined = "";

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            username = dr["username"].ToString();
            name = dr["name"].ToString();
            currentAvatarImage = dr["profileUrl"].ToString();
            currentBackgroundImage = dr["backgroundUrl"].ToString();

            email = dr["email"].ToString();
            address = dr["address"].ToString();
            zipCode = dr["zipCode"].ToString();
            phoneNumber = dr["phoneNumber"].ToString();

            password = dr["password"].ToString();

            aboutDesc = dr["aboutDesc"].ToString();
            dateJoined = dr["dateJoined"].ToString();
        }

        //Creates folder for first time users
        string userFolder = username;
        string path = Server.MapPath("~/CSS and Images/Users/" + userFolder + "/Avatar");
        if (!Directory.Exists(path))
        {
            Directory.CreateDirectory(path);
        }
        path = Server.MapPath("~/CSS and Images/Users/" + userFolder + "/Background");
        if (!Directory.Exists(path))
        {
            Directory.CreateDirectory(path);
        }
        dr.Close();

        if (fu_profileimage.HasFile 
            && Path.GetExtension(fu_profileimage.FileName).ToLower() != ".jpg"
            && Path.GetExtension(fu_profileimage.FileName).ToLower() != ".png"
            && Path.GetExtension(fu_profileimage.FileName).ToLower() != ".gif"
            && Path.GetExtension(fu_profileimage.FileName).ToLower() != ".jpeg")
        {
            conn.Close();
            Response.Write("<script>alert('This is not an image file')</script>");
        }
        else if (fu_backgroundimage.HasFile
            && Path.GetExtension(fu_backgroundimage.FileName).ToLower() != ".jpg"
            && Path.GetExtension(fu_backgroundimage.FileName).ToLower() != ".png"
            && Path.GetExtension(fu_backgroundimage.FileName).ToLower() != ".gif"
            && Path.GetExtension(fu_backgroundimage.FileName).ToLower() != ".jpeg")
        {
            conn.Close();
            Response.Write("<script>alert('This is not an image file')</script>");
        }
        else   //After checking the images validation, proceed to each section.
        {
            if (!tb_name.Text.Equals(name))
            {
                //Save name into DB
                cmd = new SqlCommand("Update userAccounts Set name = '" + tb_name.Text + "' Where userID='" + Request.QueryString["userID"] + "' ", conn);
                int updated = cmd.ExecuteNonQuery();
            }

            if (!tb_Email.Text.Equals(email))
            {
                //Save email into DB
                cmd = new SqlCommand("Update userAccounts Set email = '" + tb_Email.Text + "' Where userID='" + Request.QueryString["userID"] + "' ", conn);
                int updated = cmd.ExecuteNonQuery();
            }

            if (!tb_ZipCode.Text.Equals(zipCode))
            {
                //Save zip code into DB
                cmd = new SqlCommand("Update userAccounts Set email = '" + tb_ZipCode.Text + "' Where userID='" + Request.QueryString["userID"] + "' ", conn);
                int updated = cmd.ExecuteNonQuery();
            }

            if (!tb_Address.Text.Equals(address))
            {
                //Save address into DB
                cmd = new SqlCommand("Update userAccounts Set address = '" + tb_Address.Text + "' Where userID='" + Request.QueryString["userID"] + "' ", conn);
                int updated = cmd.ExecuteNonQuery();
            }

            if (!tb_PhoneNo.Text.Equals(phoneNumber))
            {
                //Save phone number into DB
                cmd = new SqlCommand("Update userAccounts Set phoneNumber = '" + tb_PhoneNo.Text + "' Where userID='" + Request.QueryString["userID"] + "' ", conn);
                int updated = cmd.ExecuteNonQuery();
            }

            if (tb_Password.Text.Length != 0)   //Check password
            {
                if (tb_NewPassword.Text.Length != 0)    //Check new password
                {
                    if (!tb_Password.Text.Equals(tb_NewPassword.Text))   //Check if new password = current password
                    {
                        if (tb_Password.Text.Equals(password))              //Check if password is correct
                        {
                            //Save password into DB
                            cmd = new SqlCommand("Update userAccounts Set password = '" + tb_NewPassword.Text + "' Where userID='" + Request.QueryString["userID"] + "' ", conn);
                            int updated = cmd.ExecuteNonQuery();
                        }
                        else                                                //If password is wrong
                        {
                            passwordIsWrong = true;
                        }
                    }
                    else                                                    //If new password = current password
                    {
                        passwordEqualNewPassword = true;
                    }
                }
                else
                {
                    newPasswordIsEmpty = true;
                }
            }

            
            if (!tb_AboutMe.Text.Equals(aboutDesc))
            {
                if (!tb_AboutMe.Text.Equals(""))
                {
                    //Save about me text into DB
                    cmd = new SqlCommand("Update userAccounts Set aboutDesc = '" + tb_AboutMe.Text + "' Where userID='" + Request.QueryString["userID"] + "' ", conn);
                    int updated = cmd.ExecuteNonQuery();
                }
                else    //If user keys in nothing, we auto generate them with default
                {
                    SqlCommand cmd2 = new SqlCommand("select * from AboutMeText", conn);
                    dr = cmd2.ExecuteReader();

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

                    aboutDesc = start + tb_name.Text + middle + dateJoined + end;

                    cmd = new SqlCommand("Update userAccounts Set aboutDesc = '" + aboutDesc + "' Where userID='" + Request.QueryString["userID"] + "' ", conn);
                    int updated = cmd.ExecuteNonQuery();
                }
            }

            if (fu_profileimage.HasFile)
            {
                //Not fist time change
                if (currentAvatarImage != "DefaultProfileImage.png")
                {
                    //Delete image
                    avatarImage = "CSS and Images\\Users\\" + username + "\\Avatar\\" + currentAvatarImage;
                    fullPath = Server.MapPath("") + "\\" + avatarImage;
                    File.Delete(fullPath);
                }

                //Add image into DB
                cmd = new SqlCommand("Update userAccounts Set profileUrl = '" + fu_profileimage.FileName + "' Where userID='" + Request.QueryString["userID"] + "' ", conn);
                int updated = cmd.ExecuteNonQuery();

                //Change image
                avatarImage = "CSS and Images\\Users\\" + username + "\\Avatar\\" + fu_profileimage.FileName;
                fullPath = Server.MapPath("") + "\\" + avatarImage;
                fu_profileimage.SaveAs(fullPath);
            }

            if (fu_backgroundimage.HasFile)
            {
                //Fist time change
                if (currentBackgroundImage != "DefaultProfileBackground.jpg")
                {
                    //Delete image
                    backgroundImage = "CSS and Images\\Users\\" + username + "\\Background\\" + currentBackgroundImage;
                    fullPath = Server.MapPath("") + "\\" + backgroundImage;
                    File.Delete(fullPath);
                }

                //Add image into DB
                cmd = new SqlCommand("Update userAccounts Set backgroundUrl = '" + fu_backgroundimage.FileName + "' Where userID='" + Request.QueryString["userID"] + "' ", conn);
                int updated = cmd.ExecuteNonQuery();

                //Change image
                backgroundImage = "CSS and Images\\Users\\" + username + "\\Background\\" + fu_backgroundimage.FileName;
                fullPath = Server.MapPath("") + "\\" +backgroundImage;
                fu_backgroundimage.SaveAs(fullPath);
            }

            conn.Close();

            if (!fu_profileimage.HasFile && !fu_backgroundimage.HasFile && tb_name.Text.Equals(name)
                && tb_Email.Text.Equals(email) && tb_Address.Text.Equals(address) && tb_ZipCode.Text.Equals(zipCode)
                && tb_PhoneNo.Text.Equals(phoneNumber) && tb_Password.Text.Length == 0 && tb_AboutMe.Text.Equals(aboutDesc))
            {
                Response.Write("<script>alert('No changes made')</script>");
            }

            else if (passwordIsWrong == true || newPasswordIsEmpty == true)
            {
                Response.Write("<script>alert('Password Change Failed')</script>");
            }

            else if (passwordEqualNewPassword == true)
            {
                Response.Write("<script>alert('Password Is The Same')</script>");
            }
            else //Changes made
            {
                //Refresh webpage
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }
    }

    protected void btn_back_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        Response.Redirect("~/ProfilePage.aspx" + queryString);
    }

    protected void btn_AddFunds_Click(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from userAccounts where userID='" + Request.QueryString["userID"] + "' ", conn);
        SqlDataReader dr = cmd.ExecuteReader();
        string username = null;
        string password = null;

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            username = dr["username"].ToString();
            password = dr["password"].ToString();
        }
        dr.Close();
        conn.Close();

        if (tb_AddFundsUsername.Text.Equals(username) && tb_AddFundsPassword.Text.Equals(password))
        {
            string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
            Response.Redirect("~/AddFunds.aspx" + queryString);
        }
        else
        {
            Response.Write("<script>alert('Incorrect')</script>");
        }
    }
    
    protected void btn_ViewTransactions_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        Response.Redirect("~/ProfilePageTransactions.aspx" + queryString);
    }
}
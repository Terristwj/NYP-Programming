using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string queryString;
        if (Request.QueryString["login"] != null)   //If login query string exists
        {
            if (Request.QueryString["login"] == "false")
            {
                queryString = "?login=false";
                btnHomeImage.HRef = "HomePage.aspx" + queryString;

                btnHome1.HRef = "HomePage.aspx" + queryString;
                btnDoctor1.HRef = "Doctor.aspx" + queryString;
                btnStore1.HRef = "Store.aspx" + queryString;
                btnProfile1.HRef = "Login.aspx" + queryString;
                btnForum1.HRef = "Forum.aspx" + queryString;
                btnDonate1.HRef = "Donate.aspx" + queryString;
                btnContacts1.HRef = "Contacts.aspx" + queryString;

                btnHome2.HRef = "HomePage.aspx" + queryString;
                btnDoctor2.HRef = "Doctor.aspx" + queryString;
                btnStore2.HRef = "Store.aspx" + queryString;
                btnProfile2.HRef = "Login.aspx" + queryString;
                btnForum2.HRef = "Forum.aspx" + queryString;
                btnDonate2.HRef = "Donate.aspx" + queryString;
                btnContacts2.HRef = "Contacts.aspx" + queryString;
            }
            else //Request.QueryString["login"] == "true"
            {
                if (Request.QueryString["userID"] != null)
                {
                    if (Request.QueryString["roomID"] != null || Request.QueryString["bookingID"] != null)
                    {
                        btnHomeImage.Attributes.Remove("href");
                        btnHomeImage.Style.Add("cursor", "not-allowed");
                        btnHomeImage.Title = "Exit Room First";
                        ImageLogo.Style.Add("cursor", "not-allowed");

                        btnLogin.Style.Add("cursor", "not-allowed");
                        btnLogin.ToolTip = "Exit Room First";
                        btnLogin.Enabled = false;

                        btnHome1.Attributes.Remove("href");
                        p1.Style.Add("cursor", "not-allowed");
                        p1.Attributes.Add("title", "Exit Room First");

                        btnDoctor1.Attributes.Remove("href");
                        p2.Style.Add("cursor", "not-allowed");
                        p2.Attributes.Add("title", "Exit Room First");

                        btnStore1.Attributes.Remove("href");
                        p3.Style.Add("cursor", "not-allowed");
                        p3.Attributes.Add("title", "Exit Room First");

                        btnProfile1.Attributes.Remove("href");
                        p4.Style.Add("cursor", "not-allowed");
                        p4.Attributes.Add("title", "Exit Room First");

                        btnForum1.Attributes.Remove("href");
                        p5.Style.Add("cursor", "not-allowed");
                        p5.Attributes.Add("title", "Exit Room First");

                        btnDonate1.Attributes.Remove("href");
                        p6.Style.Add("cursor", "not-allowed");
                        p6.Attributes.Add("title", "Exit Room First");

                        btnContacts1.Attributes.Remove("href");
                        p7.Style.Add("cursor", "not-allowed");
                        p7.Attributes.Add("title", "Exit Room First");


                        btnHome2.Attributes.Remove("href");
                        p8.Style.Add("cursor", "not-allowed");
                        p8.Attributes.Add("title", "Exit Room First");

                        btnDoctor2.Attributes.Remove("href");
                        p9.Style.Add("cursor", "not-allowed");
                        p9.Attributes.Add("title", "Exit Room First");

                        btnStore2.Attributes.Remove("href");
                        p10.Style.Add("cursor", "not-allowed");
                        p10.Attributes.Add("title", "Exit Room First");

                        btnProfile2.Attributes.Remove("href");
                        p11.Style.Add("cursor", "not-allowed");
                        p11.Attributes.Add("title", "Exit Room First");

                        btnForum2.Attributes.Remove("href");
                        p12.Style.Add("cursor", "not-allowed");
                        p12.Attributes.Add("title", "Exit Room First");

                        btnDonate2.Attributes.Remove("href");
                        p13.Style.Add("cursor", "not-allowed");
                        p13.Attributes.Add("title", "Exit Room First");

                        btnContacts2.Attributes.Remove("href");
                        p14.Style.Add("cursor", "not-allowed");
                        p14.Attributes.Add("title", "Exit Room First");
                    }
                    else
                    {
                        queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
                        btnHomeImage.HRef = "HomePage.aspx" + queryString;

                        btnHome1.HRef = "HomePage.aspx" + queryString;
                        btnDoctor1.HRef = "Doctor.aspx" + queryString;
                        btnStore1.HRef = "Store.aspx" + queryString;
                        btnProfile1.HRef = "Login.aspx" + queryString;
                        btnForum1.HRef = "Forum.aspx" + queryString;
                        btnDonate1.HRef = "Donate.aspx" + queryString;
                        btnContacts1.HRef = "Contacts.aspx" + queryString;

                        btnHome2.HRef = "HomePage.aspx" + queryString;
                        btnDoctor2.HRef = "Doctor.aspx" + queryString;
                        btnStore2.HRef = "Store.aspx" + queryString;
                        btnProfile2.HRef = "Login.aspx" + queryString;
                        btnForum2.HRef = "Forum.aspx" + queryString;
                        btnDonate2.HRef = "Donate.aspx" + queryString;
                        btnContacts2.HRef = "Contacts.aspx" + queryString;
                    }
                }
                else if (Request.QueryString["staffID"] != null)
                {
                    queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
                    btnHomeImage.HRef = "HomePage.aspx" + queryString;

                    btnHome1.HRef = "HomePage.aspx" + queryString;
                    btnDoctor1.HRef = "Doctor.aspx" + queryString;
                    btnStore1.HRef = "Store.aspx" + queryString;
                    btnProfile1.HRef = "Login.aspx" + queryString;
                    btnForum1.HRef = "Forum.aspx" + queryString;
                    btnDonate1.HRef = "Donate.aspx" + queryString;
                    btnContacts1.HRef = "Contacts.aspx" + queryString;

                    btnHome2.HRef = "HomePage.aspx" + queryString;
                    btnDoctor2.HRef = "Doctor.aspx" + queryString;
                    btnStore2.HRef = "Store.aspx" + queryString;
                    btnProfile2.HRef = "Login.aspx" + queryString;
                    btnForum2.HRef = "Forum.aspx" + queryString;
                    btnDonate2.HRef = "Donate.aspx" + queryString;
                    btnContacts2.HRef = "Contacts.aspx" + queryString;
                }
                else if (Request.QueryString["doctorID"] != null)
                {
                    btnHomeImage.Attributes.Remove("href");
                    btnHomeImage.Style.Add("cursor","not-allowed");
                    btnHomeImage.Title = "No Access";
                    ImageLogo.Style.Add("cursor", "not-allowed");

                    btnLogin.Style.Add("cursor", "not-allowed");
                    btnLogin.ToolTip = "No Access";
                    btnLogin.Enabled = false;

                    btnHome1.Attributes.Remove("href");
                    p1.Style.Add("cursor", "not-allowed");
                    p1.Attributes.Add("title", "No Access");

                    btnDoctor1.Attributes.Remove("href");
                    p2.Style.Add("cursor", "not-allowed");
                    p2.Attributes.Add("title", "No Access");

                    btnStore1.Attributes.Remove("href");
                    p3.Style.Add("cursor", "not-allowed");
                    p3.Attributes.Add("title", "No Access");

                    btnProfile1.Attributes.Remove("href");
                    p4.Style.Add("cursor", "not-allowed");
                    p4.Attributes.Add("title", "No Access");

                    btnForum1.Attributes.Remove("href");
                    p5.Style.Add("cursor", "not-allowed");
                    p5.Attributes.Add("title", "No Access");

                    btnDonate1.Attributes.Remove("href");
                    p6.Style.Add("cursor", "not-allowed");
                    p6.Attributes.Add("title", "No Access");

                    btnContacts1.Attributes.Remove("href");
                    p7.Style.Add("cursor", "not-allowed");
                    p7.Attributes.Add("title", "No Access");


                    btnHome2.Attributes.Remove("href");
                    p8.Style.Add("cursor", "not-allowed");
                    p8.Attributes.Add("title", "No Access");

                    btnDoctor2.Attributes.Remove("href");
                    p9.Style.Add("cursor", "not-allowed");
                    p9.Attributes.Add("title", "No Access");

                    btnStore2.Attributes.Remove("href");
                    p10.Style.Add("cursor", "not-allowed");
                    p10.Attributes.Add("title", "No Access");

                    btnProfile2.Attributes.Remove("href");
                    p11.Style.Add("cursor", "not-allowed");
                    p11.Attributes.Add("title", "No Access");

                    btnForum2.Attributes.Remove("href");
                    p12.Style.Add("cursor", "not-allowed");
                    p12.Attributes.Add("title", "No Access");

                    btnDonate2.Attributes.Remove("href");
                    p13.Style.Add("cursor", "not-allowed");
                    p13.Attributes.Add("title", "No Access");

                    btnContacts2.Attributes.Remove("href");
                    p14.Style.Add("cursor", "not-allowed");
                    p14.Attributes.Add("title", "No Access");

                }
            }
        }
        else //The purpose is for first time start up website.
        {
            queryString = "?login=false";
            btnHomeImage.HRef = "HomePage.aspx" + queryString;

            btnHome1.HRef = "HomePage.aspx" + queryString;
            btnDoctor1.HRef = "Doctor.aspx" + queryString;
            btnStore1.HRef = "Store.aspx" + queryString;
            btnProfile1.HRef = "Login.aspx" + queryString;
            btnForum1.HRef = "Forum.aspx" + queryString;
            btnDonate1.HRef = "Donate.aspx" + queryString;
            btnContacts1.HRef = "Contacts.aspx" + queryString;

            btnHome2.HRef = "HomePage.aspx" + queryString;
            btnDoctor2.HRef = "Doctor.aspx" + queryString;
            btnStore2.HRef = "Store.aspx" + queryString;
            btnProfile2.HRef = "Login.aspx" + queryString;
            btnForum2.HRef = "Forum.aspx" + queryString;
            btnDonate2.HRef = "Donate.aspx" + queryString;
            btnContacts2.HRef = "Contacts.aspx" + queryString;
        }
            

        if (Request.QueryString["userID"] != null)
        {
            //If query string exists

            string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();
            SqlCommand cmd = new SqlCommand("select name, userID from userAccounts where userID='" + Request.QueryString["userID"] + "' ", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            string name = null;

            if (dr.Read())    //// Call Read before accessing data.
            {
                name = dr["name"].ToString();
            }

            btnLogin.Text = name;

            dr.Close();
            conn.Close();
        }
        else if (Request.QueryString["staffID"] != null)
        {
            //If query string exists

            string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();
            SqlCommand cmd = new SqlCommand("select name, staffID from staffAccount where staffID='" + Request.QueryString["staffID"] + "' ", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            string name = null;

            if (dr.Read())    //// Call Read before accessing data.
            {
                name = dr["name"].ToString();
            }

            btnLogin.Text = name;

            dr.Close();
            conn.Close();
        }
        else if (Request.QueryString["doctorID"] != null)
        {
            //If query string exists

            string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();
            SqlCommand cmd = new SqlCommand("select name, Doctor_ID from Doctor where Doctor_ID='" + Request.QueryString["doctorID"] + "' ", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            string name = null;

            if (dr.Read())    //// Call Read before accessing data.
            {
                name = dr["name"].ToString();
            }

            btnLogin.Text = name;

            dr.Close();
            conn.Close();
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string queryString;
        if (Request.QueryString["login"] != null)
        {
            //If login query string exists
            if (Request.QueryString["login"] == "false")
            {
                queryString = "?login=false";
                Response.Redirect("Login.aspx" + queryString);
            }
            else //Request.QueryString["login"] == "true"
            {
                if (Request.QueryString["userID"] != null)
                {
                    queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
                    Response.Redirect("ProfilePage.aspx" + queryString);
                }
                else if (Request.QueryString["staffID"] != null)
                {
                    queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
                    Response.Redirect("StaffProfilePage.aspx" + queryString);
                }
            }
        }
        else //The purpose is for first time start up website.
        {
            queryString = "?login=false";
            Response.Redirect("Login.aspx" + queryString);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for userAccount
/// </summary>
public class userAccount
{
    string connStr = ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
    private string userID = null;
    private string username = "";
    private string password = "";
    private string email = "";

    public userAccount()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public userAccount(string userID, string username, string password, string email)
    {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.email = email;
    }


    public userAccount getUserAccount(string userID)
    {
        userAccount acc = null;
        string user_username, user_password, user_email;

        string queryString = "SELECT * FROM userAccounts WHERE userID = @UserID";
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand(queryString, conn);
        cmd.Parameters.AddWithValue("@UserID", userID);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            user_username = dr["username"].ToString();
            user_password = dr["password"].ToString();
            user_email = dr["email"].ToString();

            acc = new userAccount(userID, user_username, user_password, user_email);
        }
        else
        {
            acc = null;
        }

        conn.Close();
        dr.Close();
        dr.Dispose();
        return acc;
    }
}
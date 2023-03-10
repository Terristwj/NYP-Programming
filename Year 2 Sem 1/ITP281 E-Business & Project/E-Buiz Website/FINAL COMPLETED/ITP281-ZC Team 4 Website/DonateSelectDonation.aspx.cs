using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DonateSelectDonation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Donate_Click(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from userAccounts where userID='" + Request.QueryString["userID"] + "' ", conn);
        SqlDataReader dr = cmd.ExecuteReader();
        string username = null;
        string password = null;
        double wallet = 0;

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            username = dr["username"].ToString();
            password = dr["password"].ToString();
            wallet = Double.Parse(dr["wallet"].ToString());
        }
        dr.Close();

        if (tb_Username.Text.Equals(username) && tb_Password.Text.Equals(password))
        {
            if (wallet < Convert.ToDouble(ddl_Donate.SelectedValue))
                Response.Write("<script>alert('Insufficient Funds.')</script>");
            else
            {
                double total = wallet - Convert.ToDouble(ddl_Donate.SelectedValue);

                //Update wallet into DB
                cmd = new SqlCommand("UPDATE userAccounts SET wallet = '" + total + "' Where userID='" + Request.QueryString["userID"] + "' ", conn);
                int updated = cmd.ExecuteNonQuery();

                //Insert wallet transaction

                string ins = "INSERT INTO [EWalletTransactions](AmountDepleted, DateOfChange, userID, finalWallet) VALUES(@AmountDepleted, @DateOfChange, @userID, @finalWallet)";
                cmd = new SqlCommand(ins, conn);

                cmd.Parameters.AddWithValue("@AmountDepleted", Convert.ToDouble(ddl_Donate.SelectedValue));
                cmd.Parameters.AddWithValue("@DateOfChange", DateTime.Now.ToString());
                cmd.Parameters.AddWithValue("@userID", Request.QueryString["userID"]);
                cmd.Parameters.AddWithValue("@finalWallet", total);

                cmd.ExecuteNonQuery();



                cmd = new SqlCommand("SELECT * FROM Donations", conn);
                dr = cmd.ExecuteReader();
                int totalCollected = 0;

                // ^Put in values and then dr.Read()

                if (dr.Read())    //// Call Read before accessing data.
                {
                    totalCollected = Convert.ToInt32(dr["totalCollected"].ToString());
                }
                dr.Close();

                totalCollected += Convert.ToInt32(Convert.ToDouble(ddl_Donate.SelectedValue));

                //Update Total Donation
                cmd = new SqlCommand("UPDATE Donations SET totalCollected = '" + totalCollected + "'", conn);
                updated = cmd.ExecuteNonQuery();

                Response.Write("<script>alert('Thank You For Donating.')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Incorrect Verification')</script>");
        }
        conn.Close();
    }

    protected void btn_Back_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        Response.Redirect("~/Donate.aspx" + queryString);
    }
}
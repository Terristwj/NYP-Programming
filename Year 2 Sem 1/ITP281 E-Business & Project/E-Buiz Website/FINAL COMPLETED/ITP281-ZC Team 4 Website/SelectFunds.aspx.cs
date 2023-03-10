using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SelectFunds : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Below is the set of credit card information to be loaded
        if (!IsPostBack)
        {
            lb_cardNumber.Text = Session["cardNumber"].ToString();


            if (lb_cardNumber.Text.Substring(0, 1).Equals("5"))
            {
                img_Card.ImageUrl = "~/CSS and Images/Images and fonts/MasterCard.jpg";
            }
            else if (lb_cardNumber.Text.Substring(0, 1).Equals("4"))
            {
                img_Card.ImageUrl = "~/CSS and Images/Images and fonts/VisaCard.png";
            }

            else if (lb_cardNumber.Text.Substring(0, 1).Equals("3"))
            {
                img_Card.ImageUrl = "~/CSS and Images/Images and fonts/American Express.jpg";
            }

            else if (lb_cardNumber.Text.Substring(0, 4).Equals("6011") || lb_cardNumber.Text.Substring(0, 3).Equals("644") || lb_cardNumber.Text.Substring(0, 2).Equals("65"))
            {
                img_Card.ImageUrl = "~/CSS and Images/Images and fonts/Discover.jpg";
            }

            Session.Remove("cardNumber");
        }
    }

    protected void btn_Add_Click(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        conn.Open();
        SqlCommand cmd = new SqlCommand("SELECT wallet FROM userAccounts WHERE userID='" + Request.QueryString["userID"] + "' ", conn);
        SqlDataReader dr = cmd.ExecuteReader();

        double wallet = 0;

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            wallet = Convert.ToDouble(dr["wallet"].ToString());
        }
        //Response.Write(wallet);

        dr.Close();

        double total = wallet + Convert.ToDouble(ddl_Amount.SelectedValue);

        //Update wallet into DB
        cmd = new SqlCommand("UPDATE userAccounts SET wallet = '" + total + "' Where userID='" + Request.QueryString["userID"] + "' ", conn);
        int updated = cmd.ExecuteNonQuery();

        //Insert wallet transaction

        string ins = "INSERT INTO [EWalletTransactions](AmountAdded, DateOfChange, userID, finalWallet) VALUES(@AmountAdded, @DateOfChange, @userID, @finalWallet)";
        cmd = new SqlCommand(ins, conn);

        cmd.Parameters.AddWithValue("@AmountAdded", Convert.ToDouble(ddl_Amount.SelectedValue));
        cmd.Parameters.AddWithValue("@DateOfChange", DateTime.Now.ToString());
        cmd.Parameters.AddWithValue("@userID", Request.QueryString["userID"]);
        cmd.Parameters.AddWithValue("@finalWallet", total);

        cmd.ExecuteNonQuery();

        conn.Close();

        string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        Response.Redirect("~/EditParticulars.aspx" + queryString);
    }

    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        Response.Redirect("~/AddFunds.aspx" + queryString);
    }
}
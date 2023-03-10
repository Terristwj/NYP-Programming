using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StoreCreditCard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        conn.Open();

        // Below is the set of credit card information to be loaded
        if (!IsPostBack)   //MUST USE !IsPostBack IF NOT ERROR IN ADDing
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM creditCard WHERE userID='" + Request.QueryString["userID"] + "'", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                dl_CreditCard.DataSource = ds;
                dl_CreditCard.DataBind();
            }
            finally
            {
                conn.Close();
            }
        }
    }

    protected void btn_AddCard_Click(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        Boolean furtherValidated1 = false; // For card type + card number combination
        Boolean furtherValidated2 = false; // For expires, MM <= 12
        Boolean furtherValidated3 = false; // Max 4 credit cards
        Boolean furtherValidated4 = true; // Credit card number is already listed

        // We further check if the card is real

        // Check the card number to card type
        if (ddl_CardType.SelectedItem.Value.Equals("MasterCard") && tb_CardNumber.Text.Substring(0, 1).Equals("5") && tb_CardNumber.Text.Length == 16 + 3)
        {
            furtherValidated1 = true;
        }

        if (ddl_CardType.SelectedItem.Value.Equals("Visa") && tb_CardNumber.Text.Substring(0, 1).Equals("4") && tb_CardNumber.Text.Length == 16 + 3)
        {
            furtherValidated1 = true;
        }

        if (ddl_CardType.SelectedItem.Value.Equals("American Express") && tb_CardNumber.Text.Substring(0, 1).Equals("3") && tb_CardNumber.Text.Length == 15 + 3)
        {
            furtherValidated1 = true;
        }

        if (ddl_CardType.SelectedItem.Value.Equals("Discover") && (tb_CardNumber.Text.Substring(0, 4).Equals("6011") || tb_CardNumber.Text.Substring(0, 3).Equals("644") || tb_CardNumber.Text.Substring(0, 2).Equals("65")) && tb_CardNumber.Text.Length == 16 + 3)
        {
            furtherValidated1 = true;
        }


        // Check the expires for validity
        if (Convert.ToInt32(tb_Expires.Text.Substring(0, 1)) == 1 && Convert.ToInt32(tb_Expires.Text.Substring(1, 1)) <= 2)
        {
            furtherValidated2 = true;
        }

        if (Convert.ToInt32(tb_Expires.Text.Substring(0, 1)) == 0)
        {
            furtherValidated2 = true;
        }


        conn.Open();
        SqlCommand com = new SqlCommand("SELECT count(*) FROM creditCard WHERE userID='" + Request.QueryString["userID"] + "' ", conn);
        SqlDataReader dr = com.ExecuteReader();
        int numberOfCCards = 0;

        if (dr.Read())    //// Call Read before accessing data.
        {
            numberOfCCards = Convert.ToInt32(dr.GetInt32(0).ToString());
        }

        if (numberOfCCards < 4)
        {
            furtherValidated3 = true;
        }

        dr.Close();
        conn.Close();


        conn.Open();
        com = new SqlCommand("SELECT * FROM creditCard WHERE cardNumber_userID='" + tb_CardNumber.Text + " " + Request.QueryString["userID"] + "'", conn);
        dr = com.ExecuteReader();

        if (dr.HasRows)    //// Call Read before accessing data.
        {
            furtherValidated4 = false;
        }

        dr.Close();
        conn.Close();


        if (furtherValidated1 == true && furtherValidated2 == true && furtherValidated3 == true && furtherValidated4 == true)
        {
            string userID = Request.QueryString["userID"];
            conn.Open();

            string ins = "INSERT INTO [creditCard](userID, cardNumber, cardType, expires, country, firstName, lastName, cardImageUrl, cardNumber_userID) VALUES(@userID, @cardNumber, @cardType, @expires, @country, @firstName, @lastName, @cardImageUrl, @cardNumber_userID)";
            com = new SqlCommand(ins, conn);

            com.Parameters.AddWithValue("@userID", userID);
            com.Parameters.AddWithValue("@cardNumber", tb_CardNumber.Text);
            com.Parameters.AddWithValue("@cardType", ddl_CardType.SelectedValue);
            com.Parameters.AddWithValue("@expires", tb_Expires.Text);
            com.Parameters.AddWithValue("@country", ddl_Country.SelectedValue);
            com.Parameters.AddWithValue("@firstName", tb_FName.Text);
            com.Parameters.AddWithValue("@lastName", tb_LName.Text);

            string cardImageUrl = "";
            if (ddl_CardType.SelectedValue.Equals("MasterCard"))
            {
                cardImageUrl = "~/CSS and Images/Images and fonts/MasterCard.jpg";
            }
            else if (ddl_CardType.SelectedValue.Equals("Visa"))
            {
                cardImageUrl = "~/CSS and Images/Images and fonts/VisaCard.png";
            }

            else if (ddl_CardType.SelectedValue.Equals("American Express"))
            {
                cardImageUrl = "~/CSS and Images/Images and fonts/American Express.jpg";
            }

            else if (ddl_CardType.SelectedValue.Equals("Discover"))
            {
                cardImageUrl = "~/CSS and Images/Images and fonts/Discover.jpg";
            }

            com.Parameters.AddWithValue("@cardImageUrl", cardImageUrl);
            com.Parameters.AddWithValue("@cardNumber_userID", tb_CardNumber.Text + " " + userID);

            com.ExecuteNonQuery();
            conn.Close();

            //Refresh webpage
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
        else if (furtherValidated1 == true && furtherValidated2 == true && furtherValidated3 == false)
        {
            Response.Write("<script>alert('Max credit card limit')</script>");
        }
        else if (furtherValidated1 == true && furtherValidated2 == true && furtherValidated3 == true && furtherValidated4 == false)
        {
            Response.Write("<script>alert('Credit card already listed')</script>");
        }
        else
        {
            Response.Write("<script>alert('An input is invalid')</script>");
        }
    }

    protected void btn_Back_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        Response.Redirect("~/StoreCart.aspx" + queryString);
    }

    protected void dl_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            string cardNumber = ((Label)dl_CreditCard.Items[e.Item.ItemIndex].FindControl("lb_cardNumberDL")).Text;
            //Response.Write(cardNumber);

            string delete = "DELETE creditCard WHERE cardNumber_userID = @cardNumber_userID";
            SqlCommand com = new SqlCommand(delete, conn);
            com.Parameters.AddWithValue("@cardNumber_userID", cardNumber + " " + Request.QueryString["userID"]);

            conn.Open();
            com.ExecuteNonQuery();
            conn.Close();

            //Refresh webpage
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        if (e.CommandName == "select")
        {
            Session["cardNumber"] = ((Label)dl_CreditCard.Items[e.Item.ItemIndex].FindControl("lb_cardNumberDL")).Text;
            string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"] + "&wallet=" + Request.QueryString["wallet"];
            Response.Redirect("~/StorePayment.aspx" + queryString);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StorePayment : System.Web.UI.Page
{
    static double newWallet = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewGridView();
        }
    }

    protected void ViewGridView()
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        string command = "SELECT * FROM ShoppingItem si";
        command += " INNER JOIN Products p ON si.Product_ID = p.Product_ID";
        command += " WHERE userID = '" + Request.QueryString["userID"] + "'";

        SqlCommand cmd = new SqlCommand(command, conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gv_Products.DataSource = ds;
        gv_Products.DataBind();

        if (Session["cardNumber"] != null)
        {
            lb_CardNumber.Text = Session["cardNumber"].ToString();

            if (lb_CardNumber.Text.Substring(0, 1).Equals("5"))
            {
                img_Card.ImageUrl = "~/CSS and Images/Images and fonts/MasterCard.jpg";
            }
            else if (lb_CardNumber.Text.Substring(0, 1).Equals("4"))
            {
                img_Card.ImageUrl = "~/CSS and Images/Images and fonts/VisaCard.png";
            }

            else if (lb_CardNumber.Text.Substring(0, 1).Equals("3"))
            {
                img_Card.ImageUrl = "~/CSS and Images/Images and fonts/American Express.jpg";
            }

            else if (lb_CardNumber.Text.Substring(0, 4).Equals("6011") || lb_CardNumber.Text.Substring(0, 3).Equals("644") || lb_CardNumber.Text.Substring(0, 2).Equals("65"))
            {
                img_Card.ImageUrl = "~/CSS and Images/Images and fonts/Discover.jpg";
            }

            Pnl_CreditCardNone.Style.Add("display", "none");
        }
        else
        {
            Pnl_CreditCard.Style.Add("display", "none");
        }


        command = "SELECT sum(Unit_Price*Quantity) TotalPrice FROM ShoppingItem si";
        command += " INNER JOIN Products p ON si.Product_ID = p.Product_ID";
        command += " WHERE userID = '" + Request.QueryString["userID"] + "'";

        cmd = new SqlCommand(command, conn);
        SqlDataReader dr = cmd.ExecuteReader();
        string totalPrice = null;

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            totalPrice = Convert.ToDouble(dr["TotalPrice"].ToString()).ToString("0.00");
        }
        dr.Close();

        lb_TotalPrice.Text = "$" + totalPrice;


        
        string wallet = "0";

        lb_Wallet.Text = "$" + wallet;
        if (Request.QueryString["wallet"].Equals("Checked"))
        {
            cb_Wallet.Checked = true;

            command = "SELECT wallet FROM userAccounts WHERE userID = '" + Request.QueryString["userID"] + "'";

            cmd = new SqlCommand(command, conn);
            dr = cmd.ExecuteReader();

            if (dr.Read())    //// Call Read before accessing data.
            {
                wallet = Convert.ToDouble(dr["wallet"].ToString()).ToString("0.00");
            }
            lb_Wallet.Text = "$" + wallet;
            dr.Close();
        }

        conn.Close();


        string netPrice = "";

        if (Convert.ToDouble(totalPrice) > Convert.ToDouble(wallet))
        {
            netPrice = (Math.Round(Convert.ToDouble(totalPrice) - Convert.ToDouble(wallet), 2)).ToString("0.00");
        }
        else if (Convert.ToDouble(totalPrice) <= Convert.ToDouble(wallet))
        {
            //Auto checked
            netPrice = "0.00";
            newWallet = Math.Round(Convert.ToDouble(wallet) - Convert.ToDouble(totalPrice), 2);
        }

        lb_NetPrice.Text = "$" + netPrice;

        Random rand = new Random((int)DateTime.Now.Ticks);
        int numIterations = 0;
        numIterations = rand.Next(3, 10);

        lb_DeliveryDate.Text = DateTime.Now.AddDays(numIterations).ToShortDateString() + " 12.00pm - 1.00pm";
    }

    protected void btn_Confirm_Click(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        string userID = Request.QueryString["userID"];
        conn.Open();

        string ins = "INSERT INTO [StoreOrders](userID, totalPrice, walletAmount, netPrice, dateOfOrder, deliveryDate, deliveryAddress) VALUES(@userID, @totalPrice, @walletAmount, @netPrice, @dateOfOrder, @deliveryDate, @deliveryAddress)";
        SqlCommand com = new SqlCommand(ins, conn);

        string currentDateTime = DateTime.Now.ToString();

        com.Parameters.AddWithValue("@userID", userID);
        com.Parameters.AddWithValue("@totalPrice", Convert.ToDouble(lb_TotalPrice.Text.Substring(1, lb_TotalPrice.Text.Length - 1)));
        com.Parameters.AddWithValue("@walletAmount", Convert.ToDouble(lb_Wallet.Text.Substring(1, lb_Wallet.Text.Length - 1)));
        com.Parameters.AddWithValue("@netPrice", Convert.ToDouble(lb_NetPrice.Text.Substring(1, lb_NetPrice.Text.Length - 1)));
        com.Parameters.AddWithValue("@dateOfOrder", currentDateTime);
        com.Parameters.AddWithValue("@deliveryDate", lb_DeliveryDate.Text);
        com.Parameters.AddWithValue("@deliveryAddress", tb_Address.Text);
        
        com.ExecuteNonQuery();


        string command = "SELECT Order_ID FROM StoreOrders";
        command += " WHERE userID = '" + userID + "'";
        command += " AND dateOfOrder = '" + currentDateTime + "'";

        SqlCommand cmd = new SqlCommand(command, conn);
        SqlDataReader dr = cmd.ExecuteReader();

        string Order_ID = "";

        if (dr.Read())    //// Call Read before accessing data.
        {
            Order_ID = dr["Order_ID"].ToString();
        }
        dr.Close();

        foreach (GridViewRow row in gv_Products.Rows)
        {
            Label productName = (Label)row.FindControl("Label1");
            string productNameStr = productName.Text;

            com = new SqlCommand("SELECT * FROM Products WHERE Name = '" + productNameStr + "'", conn);
            dr = com.ExecuteReader();

            string Product_ID = "";
            string stock = "";

            if (dr.Read())    //// Call Read before accessing data.
            {
                stock = dr["Stock"].ToString();
                Product_ID = dr["Product_ID"].ToString();
            }
            dr.Close();

            Label quantity = (Label)row.FindControl("lb_Qty");
            string quantityStr = quantity.Text;


            ins = "INSERT INTO [StoreOrdersItems](Order_ID_Product_ID, Order_ID, Product_ID, Quantity) VALUES(@Order_ID_Product_ID, @Order_ID, @Product_ID, @Quantity)";
            com = new SqlCommand(ins, conn);

            com.Parameters.AddWithValue("@Order_ID_Product_ID", Order_ID + " " + Product_ID);
            com.Parameters.AddWithValue("@Order_ID", Order_ID);
            com.Parameters.AddWithValue("@Product_ID", Product_ID);
            com.Parameters.AddWithValue("@Quantity", quantityStr);

            com.ExecuteNonQuery();

            string newStock = (Convert.ToInt32(stock) - Convert.ToInt32(quantityStr)).ToString();

            //Save new quantity of products into DB
            cmd = new SqlCommand("UPDATE Products SET Stock = '" + newStock + "' Where Product_ID='" + Product_ID + "' ", conn);
            int updated = cmd.ExecuteNonQuery();


            ins = "INSERT INTO [EWalletTransactions](AmountDepleted, DateOfChange, userID, finalWallet) VALUES(@AmountDepleted, @DateOfChange, @userID, @finalWallet)";
            cmd = new SqlCommand(ins, conn);

            cmd.Parameters.AddWithValue("@AmountDepleted", Convert.ToDouble(lb_Wallet.Text.Substring(1, lb_Wallet.Text.Length - 1)) - newWallet);
            cmd.Parameters.AddWithValue("@DateOfChange", DateTime.Now.ToString());
            cmd.Parameters.AddWithValue("@userID", Request.QueryString["userID"]);
            cmd.Parameters.AddWithValue("@finalWallet", newWallet);

            cmd.ExecuteNonQuery();

        }

        if (cb_Wallet.Checked)
        {
            //Save wallet into DB
            cmd = new SqlCommand("UPDATE userAccounts Set wallet = '" + newWallet + "' Where userID='" + Request.QueryString["userID"] + "' ", conn);
            int updated = cmd.ExecuteNonQuery();


            ins = "INSERT INTO [EWalletTransactions](AmountDepleted, DateOfChange, userID, finalWallet) VALUES(@AmountDepleted, @DateOfChange, @userID, @finalWallet)";
            cmd = new SqlCommand(ins, conn);

            cmd.Parameters.AddWithValue("@AmountDepleted", Convert.ToDouble(lb_Wallet.Text.Substring(1, lb_Wallet.Text.Length - 1)) - newWallet);
            cmd.Parameters.AddWithValue("@DateOfChange", DateTime.Now.ToString());
            cmd.Parameters.AddWithValue("@userID", Request.QueryString["userID"]);
            cmd.Parameters.AddWithValue("@finalWallet", newWallet);

            cmd.ExecuteNonQuery();
        }


        conn.Close();

        string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        Response.Redirect("~/StorePaymentComplete.aspx" + queryString);
    }

    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        Session.Remove("cardNumber");

        string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        Response.Redirect("~/StoreCart.aspx" + queryString);
    }
}
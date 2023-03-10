using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewStoreReceipt : System.Web.UI.Page
{
    static double newWallet = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lb_OrderID.Text = Request.QueryString["orderID"];
            ViewGridView();
        }
    }

    protected void ViewGridView()
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        string command = "SELECT * FROM StoreOrdersItems soi";
        command += " INNER JOIN Products p ON soi.Product_ID = p.Product_ID";
        command += " INNER JOIN StoreOrders so ON so.Order_ID = soi.Order_ID";
        command += " WHERE soi.Order_ID = '" + Request.QueryString["orderID"] + "'";

        SqlCommand cmd = new SqlCommand(command, conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gv_Products.DataSource = ds;
        gv_Products.DataBind();


        cmd = new SqlCommand(command, conn);
        SqlDataReader dr = cmd.ExecuteReader();

        string totalPrice = "";
        string wallet = "";
        string netPrice = "";
        string deliveryDate = "";
        string delieveryAddress = "";
        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            totalPrice = Convert.ToDouble(dr["TotalPrice"].ToString()).ToString("0.00");
            wallet = Convert.ToDouble(dr["walletAmount"].ToString()).ToString("0.00");
            netPrice = Convert.ToDouble(dr["netPrice"].ToString()).ToString("0.00");
            deliveryDate = dr["deliveryDate"].ToString();
            delieveryAddress = dr["deliveryAddress"].ToString();
        }
        dr.Close();

        lb_TotalPrice.Text = "$" + totalPrice;
        lb_Wallet.Text = "$" + wallet;
        lb_NetPrice.Text = "$" + netPrice;
        lb_DeliveryDate.Text = deliveryDate;
        tb_Address.Text = delieveryAddress;

        if (!wallet.Equals("0.00"))
        {
            cb_Wallet.Checked = true;
        }
    }

    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        Session.Remove("cardNumber");

        if (Request.QueryString["userID"] != null)
        {
            string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
            Response.Redirect("~/ProfilePageTransactionsStore.aspx" + queryString);
        }
        else if (Request.QueryString["staffID"] != null)
        {
            string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
            Response.Redirect("~/ViewStoreTransactions.aspx" + queryString);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Donate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from Donations", conn);
        SqlDataReader dr = cmd.ExecuteReader();
        int totalCollected = 0;

        // ^Put in values and then dr.Read()

        if (dr.Read())    //// Call Read before accessing data.
        {
            totalCollected = Convert.ToInt32(dr["totalCollected"].ToString());
        }
        dr.Close();
        conn.Close();

        lb_Donate.Text = "$"+totalCollected+".00";

        if (Request.QueryString["userID"] != null)
        {

        }
        else
        {
            btn_Donate.Enabled = false;
            btn_Donate.Style.Add("cursor", "not-allowed");
            if (Request.QueryString["staffID"] != null)
                btn_Donate.ToolTip = "Staff Cannot Click!";
            else
                btn_Donate.ToolTip = "Please Login First";
        }
    }

    protected void btn_Donate_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        Response.Redirect("~/DonateSelectDonation.aspx" + queryString);
    }
}
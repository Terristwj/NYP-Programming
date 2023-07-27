using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Ex2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            bindGridView();
        }
    }

    private void bindGridView()
    {
        //get connection string from web.config
        string strConnectionString =
            ConfigurationManager.ConnectionStrings["DVDShopConnectionString"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);

        string strCommandText = "SELECT ProductID, Title, Price, Image1FileName FROM Product";

        SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
        myConnect.Open();
        SqlDataReader reader = cmd.ExecuteReader();

        DataTable dt = new DataTable();
        dt.Load(reader);  //** ONLY DATA TABLE CAN USE PAGING

        grdMovie.DataSource = dt;
        grdMovie.DataBind();

        reader.Close();
        myConnect.Close();
    }

    protected void grdMovie_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        int newPageIndex = e.NewPageIndex;
        grdMovie.PageIndex = newPageIndex;
        bindGridView();
    }

    protected void grdMovie_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Get Selected Row
        int selectedRow = grdMovie.SelectedIndex;

        //Get productID for the row
        int productID = Convert.ToInt32(grdMovie.DataKeys[selectedRow].Value);

        //Add into DetailsView
        bindDetailsView(productID);
    }

    private void bindDetailsView(int productID)
    {
        //get connection string from web.config
        string strConnectionString =
            ConfigurationManager.ConnectionStrings["DVDShopConnectionString"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);

        string strCommandText = "SELECT ProductID, Title, Price, Cast, DateReleased, Director, Description FROM Product WHERE ProductID=@ID";
        SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
        cmd.Parameters.AddWithValue("@ID", productID);

        myConnect.Open();
        SqlDataReader reader = cmd.ExecuteReader();

        DetailsViewMovie.DataSource = reader;
        DetailsViewMovie.DataBind();

        reader.Close();
        myConnect.Close();

    }
}
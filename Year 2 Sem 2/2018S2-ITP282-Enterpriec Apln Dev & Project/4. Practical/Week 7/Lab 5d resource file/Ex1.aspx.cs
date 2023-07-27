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
            bindDDL();
        }
    }

    private void bindDDL()
    {
        //get connection string from web.config
        string strConnectionString = ConfigurationManager.ConnectionStrings["DVDShopConnectionString"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);

        string strCommandText = "SELECT Name,CategoryID from Category ";

        try
        {
            SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
            myConnect.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            ddlCatInsert.DataSource = dt;
            ddlCatInsert.DataTextField = "Name";
            ddlCatInsert.DataValueField = "CategoryID";
            ddlCatInsert.DataBind();

            reader.Close();
        }
        catch (SqlException ex)
        {
            lblResult.Text = "Error:" + ex.Message.ToString();
        }
        finally
        {
            myConnect.Close();
        }
    }


    private void bindGridView()
    {
        //get connection string from web.config
        string strConnectionString = ConfigurationManager.ConnectionStrings["DVDShopConnectionString"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);

        string strCommandText = "SELECT ProductID, Title, Price, Image1FileName from Product ";

        try
        {
            SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
            myConnect.Open();
          
            SqlDataReader reader = cmd.ExecuteReader();
             DataTable dt = new DataTable();
            dt.Load(reader);
            grdMovie.DataSource = dt;
            grdMovie.DataBind();
       
            reader.Close();
        }
        catch (SqlException ex)
        {
            lblResult.Text = "Error:" + ex.Message.ToString();
        }
        finally
        {
            myConnect.Close();
        }
    }




    protected void grdMovie_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdMovie.EditIndex = e.NewEditIndex;
        bindGridView();
    }

    protected void grdMovie_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int selectedRow = e.RowIndex;
        int productID = (int)grdMovie.DataKeys[selectedRow].Value;

        GridViewRow row = (GridViewRow)grdMovie.Rows[selectedRow];
        TextBox price = (TextBox)row.FindControl("txtPrice");

        string strPrice = price.Text;
        double dblPrice = 0;

        if (Double.TryParse(strPrice, out dblPrice))
        {
            updateGridViewRecord(productID, dblPrice);
        }
        else
        {
            lblResult.Text = "Invalid price";
        }
    }

    private void updateGridViewRecord(int productID, double dblPrice)
    {
        string strConnectionString = ConfigurationManager.ConnectionStrings["DVDShopConnectionString"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);

        string strCommandText = "UPDATE Product SET Price=@price WHERE ProductID=@productID";
        SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
        cmd.Parameters.AddWithValue("@productID", productID);
        cmd.Parameters.AddWithValue("@price", dblPrice);

        myConnect.Open();
        int result = cmd.ExecuteNonQuery();

        if (result > 0)
            lblResult.Text = "Record updated";
        else
            lblResult.Text = "Update fail";

        myConnect.Close();

        grdMovie.EditIndex = -1;
        bindGridView();
    }

    protected void grdMovie_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdMovie.EditIndex = -1;
        bindGridView();
    }

    protected void grdMovie_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int selectedRow = e.RowIndex;
        int productID = (int)grdMovie.DataKeys[selectedRow].Value;
        deleteGridViewRecord(productID);
    }

    private void deleteGridViewRecord(int productID)
    {
        string strConnectionString = ConfigurationManager.ConnectionStrings["DVDShopConnectionString"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);

        string strCommandText = "DELETE Product WHERE ProductID=@productID";
        SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
        cmd.Parameters.AddWithValue("@productID", productID);

        myConnect.Open();
        int result = cmd.ExecuteNonQuery();

        if (result > 0)
            lblResult.Text = "Record deleted";
        else
            lblResult.Text = "Update fail";

        myConnect.Close();
        bindGridView();
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        int catID = Convert.ToInt32(ddlCatInsert.SelectedValue.ToString());
        string title = txtTitle.Text;
        double price = Convert.ToDouble(txtPrice.Text);
        string fileName = "";

        if (ImageFileUpload.HasFile)
        {
            fileName = ImageFileUpload.FileName;
            string filePath = "~/ProductImages/" + ImageFileUpload.FileName;
            ImageFileUpload.SaveAs(Server.MapPath(filePath));
        }

        insertProductRecord(catID, title, price, fileName);

        btnAdd.Enabled = true;
        pnlPopUp.Visible = false;
    }

    private void insertProductRecord(int catID, string title, double dblPrice, string filename)
    {
        string strConnectionString = ConfigurationManager.ConnectionStrings["DVDShopConnectionString"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);

        string strCommandText = "INSERT Product(catID, title, price, Image1FileName) ";
        strCommandText += " Values(@catID, @title, @price, @imageFileName)";

        SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
        cmd.Parameters.AddWithValue("@catID", catID);
        cmd.Parameters.AddWithValue("@title", title);
        cmd.Parameters.AddWithValue("@price", dblPrice);
        cmd.Parameters.AddWithValue("@imageFileName", filename);

        myConnect.Open();
        int result = cmd.ExecuteNonQuery();

        if (result > 0)
        {
            lblResult.Text = "Record inserted";
        }
        else
        {
            lblResult.Text = "Update fail";
        }

        myConnect.Close();
        grdMovie.EditIndex = -1;
        bindGridView();
    }

    protected void btnAdd_Command(object sender, CommandEventArgs e)
    {
        pnlPopUp.Visible = true;
        btnAdd.Enabled = false;
    }
}
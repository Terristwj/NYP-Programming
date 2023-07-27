using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Ex4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            if (Page.IsPostBack == false)
            {
                bindGridView();
            }
        }
       
    }

    private void bindGridView()
    {
        //get connection string from web.config
        string strConnectionString =
            ConfigurationManager.ConnectionStrings["EmployeeConnectionString"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);

        string strCommandText = "SELECT EmployeeID, Name FROM Employees";

        SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
        myConnect.Open();
        SqlDataReader reader = cmd.ExecuteReader();

        DataTable dt = new DataTable();
        dt.Load(reader);  //** ONLY DATA TABLE CAN USE PAGING

        grdEmployee.DataSource = dt;
        grdEmployee.DataBind();

        reader.Close();
        myConnect.Close();
    }


    protected void grdEmployee_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        int newPageIndex = e.NewPageIndex;
        grdEmployee.PageIndex = newPageIndex;
        bindGridView();
    }

    protected void grdEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Get Selected Row
        int selectedRow = grdEmployee.SelectedIndex;

        //Get productID for the row
        int employeeID = Convert.ToInt32(grdEmployee.DataKeys[selectedRow].Value);

        //Add into DetailsView
        bindDetailsView(employeeID);
    }


    private void bindDetailsView(int employeeID)
    {
        //get connection string from web.config
        string strConnectionString =
            ConfigurationManager.ConnectionStrings["EmployeeConnectionString"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);

        string strCommandText = "SELECT Photo, EmployeeID, Name, Username, Extension FROM Employees WHERE EmployeeID=@ID";
        SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
        cmd.Parameters.AddWithValue("@ID", employeeID);

        myConnect.Open();
        SqlDataReader reader = cmd.ExecuteReader();

        ViewEmployeeDetails.DataSource = reader;
        ViewEmployeeDetails.DataBind();

        reader.Close();
        myConnect.Close();

    }
}

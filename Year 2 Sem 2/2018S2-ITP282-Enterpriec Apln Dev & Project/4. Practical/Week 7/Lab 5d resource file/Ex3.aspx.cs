using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Ex3 : System.Web.UI.Page
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
        string strConnectionString = ConfigurationManager.ConnectionStrings["EmployeeConnectionString"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);

        string strCommandText = "SELECT Department, DepartmentID from Departments ";

        try
        {
            SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
            myConnect.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            ddlDeptInsert.DataSource = dt;
            ddlDeptInsert.DataTextField = "Department";
            ddlDeptInsert.DataValueField = "DepartmentID";
            ddlDeptInsert.DataBind();

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
        string strConnectionString = ConfigurationManager.ConnectionStrings["EmployeeConnectionString"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);

        string strCommandText = "SELECT EmployeeID, Name, Extension, Photo from Employees ";

        try
        {
            SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
            myConnect.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            grdEmployee.DataSource = dt;
            grdEmployee.DataBind();

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




    protected void grdEmployee_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdEmployee.EditIndex = e.NewEditIndex;
        bindGridView();
    }

    protected void grdEmployee_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int selectedRow = e.RowIndex;
        int employeeID = (int)grdEmployee.DataKeys[selectedRow].Value;

        GridViewRow row = (GridViewRow)grdEmployee.Rows[selectedRow];
        TextBox extension = (TextBox)row.FindControl("txtExtension");

        string strExtension = extension.Text;
        double dblExtension = 0;

        if (Double.TryParse(strExtension, out dblExtension))
        {
            updateGridViewRecord(employeeID, dblExtension);
        }
        else
        {
            lblResult.Text = "Invalid price";
        }
    }

    private void updateGridViewRecord(int employeeID, double dblExtension)
    {
        string strConnectionString = ConfigurationManager.ConnectionStrings["EmployeeConnectionString"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);

        string strCommandText = "UPDATE Employees SET Extension=@extension WHERE EmployeeID=@employeeID";
        SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
        cmd.Parameters.AddWithValue("@employeeID", employeeID);
        cmd.Parameters.AddWithValue("@extension", dblExtension);

        myConnect.Open();
        int result = cmd.ExecuteNonQuery();

        if (result > 0)
            lblResult.Text = "Record updated";
        else
            lblResult.Text = "Update fail";

        myConnect.Close();

        grdEmployee.EditIndex = -1;
        bindGridView();
    }

    protected void grdEmployee_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdEmployee.EditIndex = -1;
        bindGridView();
    }

    protected void grdEmployee_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int selectedRow = e.RowIndex;
        int employeeID = (int)grdEmployee.DataKeys[selectedRow].Value;
        deleteGridViewRecord(employeeID);
    }

    private void deleteGridViewRecord(int employeeID)
    {
        string strConnectionString = ConfigurationManager.ConnectionStrings["EmployeeConnectionString"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);

        string strCommandText = "DELETE Employees WHERE EmployeeID=@employeeID";
        SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
        cmd.Parameters.AddWithValue("@employeeID", employeeID);

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
        int deptID = Convert.ToInt32(ddlDeptInsert.SelectedValue.ToString());
        string name = txtName.Text;
        string username = txtUserName.Text;
        double extension = Convert.ToDouble(txtExtension.Text);
        string fileName = "";

        if (ImagePhotoUpload.HasFile)
        {
            fileName = ImagePhotoUpload.FileName;
            string filePath = "~/EmployeePhotos/" + ImagePhotoUpload.FileName;
            ImagePhotoUpload.SaveAs(Server.MapPath(filePath));
        }

        insertEmployeeRecord(deptID, name, username, extension, fileName);

        btnAdd.Enabled = true;
        pnlPopUp.Visible = false;
    }

    private void insertEmployeeRecord(int deptID, string name, string username, double extension, string filename)
    {
        string strConnectionString = ConfigurationManager.ConnectionStrings["EmployeeConnectionString"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);

        string strCommandText = "INSERT Employees(DepartmentID, name, username, extension, Photo) ";
        strCommandText += " Values(@deptID, @name, @username, @extension, @imageFileName)";

        SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
        cmd.Parameters.AddWithValue("@deptID", deptID);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.Parameters.AddWithValue("@extension", extension);
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
        grdEmployee.EditIndex = -1;
        bindGridView();
    }

    protected void btnAdd_Click(object sender, CommandEventArgs e)
    {
        pnlPopUp.Visible = true;
        btnAdd.Enabled = false;
    }
}
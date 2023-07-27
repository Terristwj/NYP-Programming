using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class Ex3 : System.Web.UI.Page
{

  
    protected void btnRetrieve_Click(object sender, EventArgs e)
    {
        // retrieve connection info from web.config
        string strConnectionString =
        ConfigurationManager.ConnectionStrings["EmployeeDB"].ConnectionString;

        //create connection
        SqlConnection myConnect = new SqlConnection(strConnectionString);

        //create command
        string strCommandText = "SELECT EmployeeID, Name, Extension";
        strCommandText += " FROM Employees WHERE Name LIKE @name";

        SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
        cmd.Parameters.Add("@name", SqlDbType.NVarChar, 50);
        cmd.Parameters["@name"].Value = txtName.Text + "%";

        myConnect.Open();
        SqlDataReader reader = cmd.ExecuteReader();

        // Access data
        txtExt.Text = "";

        if (!txtName.Text.Equals(""))
        {
            if (reader.Read())
            {
                txtName.Text = reader["Name"].ToString();
                txtExt.Text = reader["Extension"].ToString();
            }
            reader.Close();
        }
        myConnect.Close();
    }



    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        decimal decPrice = 0;

        if (decimal.TryParse(txtExt.Text, out decPrice) == false)
        {
            lblErr.Text = "invalid input";
        }
        else
        {
            // retrieve connection info from web.config
            string strConnectionString =
            ConfigurationManager.ConnectionStrings["EmployeeDB"].ConnectionString;

            //create connection
            SqlConnection myConnect = new SqlConnection(strConnectionString);

            //create command
            string strCommandText = "UPDATE Employees SET Extension=@extension";
            strCommandText += " WHERE Name=@name";


            try
            {
                SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
                cmd.Parameters.Add("@name", SqlDbType.NVarChar, 50);
                cmd.Parameters["@name"].Value = txtName.Text;

                cmd.Parameters.Add("@extension", SqlDbType.Int);
                cmd.Parameters["@extension"].Value = Convert.ToInt32(txtExt.Text);

                myConnect.Open();
                int result = cmd.ExecuteNonQuery();
                lblErr.Text = "";
                if (result > 0)
                {
                    lblErr.Text = "Update Successful";
                }
                else
                {
                    lblErr.Text = "Update Fail";
                }
            }
            catch (Exception ex)
            {
                lblErr.Text = ex.Message.ToString();
            }
            finally
            {
                myConnect.Close();
            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}

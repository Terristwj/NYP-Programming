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

public partial class Ex1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRetrieve_Click(object sender, EventArgs e)
    {
        int intCatID = 0;
     
        if (int.TryParse(txtCatID.Text, out intCatID) == false)
        {
            lblResult.Text = "invalid Input";
        }
        else
        {
            // retrieve connection info from web.config
            string strConnectionString =
            ConfigurationManager.ConnectionStrings["DVDShopConnectionString"].ConnectionString;

            //create connection
            SqlConnection myConnect = new SqlConnection(strConnectionString);

            //create command
            string strCommandText = "SELECT CategoryID, Name from Category";
            strCommandText += " Where CategoryID=@catID";

            try
            {
                SqlCommand cmd = new SqlCommand(strCommandText, myConnect);

                cmd.Parameters.Add("@catID", SqlDbType.Int);
                cmd.Parameters["@catID"].Value = Convert.ToInt32(txtCatID.Text);

                //open connection and retrieve data by calling ExecuteReader
                myConnect.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                // Access data
                lblResult.Text = "";
                txtName.Text = "";

                if (reader.Read())
                {
                    txtName.Text = reader["Name"].ToString();
                }
                else
                {
                    lblResult.Text = "No record found";
                }

                //close reader  & connection
                reader.Close();
            }
            catch (Exception ex)
            {
                lblResult.Text = ex.Message.ToString();
            }
            finally
            {
                myConnect.Close();
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int intCatID = 0;

        if (int.TryParse(txtCatID.Text, out intCatID) == false)
        {
            lblResult.Text = "invalid Input";
        }
        else
        {
            // retrieve connection info from web.config
            string strConnectionString =
            ConfigurationManager.ConnectionStrings["DVDShopConnectionString"].ConnectionString;

            //create connection
            SqlConnection myConnect = new SqlConnection(strConnectionString);

            string strCommandText = "UPDATE Category SET Name=@name WHERE CategoryID=@catID";

            try
            {
                SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
                cmd.Parameters.Add("@catID", SqlDbType.Int);
                cmd.Parameters["@catID"].Value = Convert.ToInt32(txtCatID.Text);

                cmd.Parameters.Add("@name", SqlDbType.NVarChar, 50);
                cmd.Parameters["@name"].Value = txtName.Text;
                lblResult.Text = "";

                myConnect.Open();
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    lblResult.Text = "Update Successful";
                }
                else
                {
                    lblResult.Text = "Update fail";
                }
            }
            catch (Exception ex)
            {
                lblResult.Text = ex.Message.ToString();
            }
            finally
            {
                myConnect.Close();
            }
        }
    }
}

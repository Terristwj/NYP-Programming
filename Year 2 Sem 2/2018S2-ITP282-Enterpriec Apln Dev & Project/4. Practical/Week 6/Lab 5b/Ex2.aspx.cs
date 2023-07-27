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

public partial class Ex2 : System.Web.UI.Page
{

  
    protected void btnRetrieve_Click(object sender, EventArgs e)
    {
        // retrieve connection info from web.config
        string strConnectionString =
        ConfigurationManager.ConnectionStrings["DVDShopConnectionString"].ConnectionString;

        //create connection
        SqlConnection myConnect = new SqlConnection(strConnectionString);

        //create command
        string strCommandText = "SELECT ProductID, Title, Price, Description";
        strCommandText += " FROM Product WHERE Title LIKE @title";

        SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
        cmd.Parameters.Add("@title", SqlDbType.NVarChar, 50);
        cmd.Parameters["@title"].Value = txtTitle.Text + "%";

        myConnect.Open();
        SqlDataReader reader = cmd.ExecuteReader();

        txtPrice.Text = "";
        txtDescription.Text = "";
        lblErr.Text = "";

        if (txtTitle.Text.Equals(""))
        {

        }
        else
        {
            if (reader.Read())
            {
                txtTitle.Text = reader["title"].ToString();
                txtPrice.Text = reader["Price"].ToString();
                txtDescription.Text = reader["Description"].ToString();
            }
            else
            {
                if (!txtTitle.Text.Equals(""))
                    lblErr.Text = "Movie does not exist";
            }

            //close reader  & connection
            reader.Close();
        }
        myConnect.Close();
    }



    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        decimal decPrice = 0;

        if (decimal.TryParse(txtPrice.Text, out decPrice) == false)
        {
            lblErr.Text = "invalid input";
        }
        else
        {
            // retrieve connection info from web.config
            string strConnectionString =
            ConfigurationManager.ConnectionStrings["DVDShopConnectionString"].ConnectionString;

            //create connection
            SqlConnection myConnect = new SqlConnection(strConnectionString);

            //create command
            string strCommandText = "UPDATE Product SET price=@price, description=@desc ";
            strCommandText += " WHERE title=@title";

            try
            {

                SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
                cmd.Parameters.Add("@title", SqlDbType.NVarChar, 50);
                cmd.Parameters["@title"].Value = txtTitle.Text;

                cmd.Parameters.Add("@price", SqlDbType.Money);
                cmd.Parameters["@price"].Value = Convert.ToDecimal(txtPrice.Text);

                cmd.Parameters.Add("@desc", SqlDbType.NVarChar, 500);
                cmd.Parameters["@desc"].Value = txtDescription.Text;

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

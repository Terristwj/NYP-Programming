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
        // page is loaded for very 1st time
        // bind all 3 controls
        if (Page.IsPostBack == false)
        {

            bindListBox();
            bindRadioButtonList();
            bindCheckBoxList();
          
        }
    }

    private void bindListBox()
    {

        ddlCategory.DataSource = getReader();
        // Name will be displayed in the dropdownlist control
        ddlCategory.DataTextField = "Name";
        // when an item is selected in dropdownlist
        // CategoryID will be returned in ddlCategory.SelectedValue
        ddlCategory.DataValueField = "CategoryID";
        ddlCategory.DataBind();

    }
    private SqlDataReader getReader()
    {
        //get connection string from web.config
        string strConnectionString =
            ConfigurationManager.ConnectionStrings["DVDShopConnectionString"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);

        string strCommandText = "SELECT CategoryID, Name  from Category";

        SqlCommand cmd = new SqlCommand(strCommandText, myConnect);
        myConnect.Open();
        // CommandBehavior.CloseConnection will automatically close connection
        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return reader;
    }

   
    


    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblResult.Text= "Category ID:" + ddlCategory.SelectedValue.ToString()  +"<br/>" ;
        lblResult.Text += "Name:" + ddlCategory.SelectedItem.Text;
    }


    private void bindCheckBoxList()
    {
        chkCategory.DataSource = getReader();
        // Name will be displayed in the dropdownlist control
        chkCategory.DataTextField = "Name";
        // when an item is selected in dropdownlist
        // CategoryID will be returned in ddlCategory.SelectedValue
        chkCategory.DataValueField = "CategoryID";
        chkCategory.DataBind();
    }
    private void bindRadioButtonList()
    {
        rdoCategory.DataSource = getReader();
        // Name will be displayed in the dropdownlist control
        rdoCategory.DataTextField = "Name";
        // when an item is selected in dropdownlist
        // CategoryID will be returned in ddlCategory.SelectedValue
        rdoCategory.DataValueField = "CategoryID";
        rdoCategory.DataBind();
    }


 
 
    protected void rdoCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblResult.Text = "Category ID:" + rdoCategory.SelectedValue.ToString() + "<br/>";
        lblResult.Text += "Name:" + rdoCategory.SelectedItem.Text;
    }

    protected void chkCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblResult.Text = "";
        for (int i = 0; i < chkCategory.Items.Count; i++)
        {
            if(chkCategory.Items[i].Selected == true)
            {
                lblResult.Text += "Category ID:" + chkCategory.Items[i].Value.ToString() + "<br/>";
                lblResult.Text += "Name:" + chkCategory.Items[i].Text + "<br/>";
            }
        }
    }
}
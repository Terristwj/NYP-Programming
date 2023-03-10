using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StoreErrorPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["login"].Equals("false"))
        {
            lb_Error.Text = "Please Login First";
            btn_ToLogin.Enabled = true;
            btn_ToLogin.Style.Add("cursor","pointer");
        }

        if (Request.QueryString["login"].Equals("true") && Request.QueryString["staffID"]!=null)
        {
            lb_Error.Text = "Staff can't be here!";
            btn_ToLogin.Enabled = true;
            btn_ToLogin.Style.Add("cursor", "pointer");
        }

        if (Request.QueryString["login"].Equals("true") && Request.QueryString["userID"] != null)
        {
            lb_Error.Text = "Cart Is Empty";
            btn_ToLogin.Enabled = true;
            btn_ToLogin.Style.Add("cursor", "pointer");
        }
    }

    protected void btn_ToLogin_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["login"].Equals("false"))
        {
            string queryString = "?login=false";
            Response.Redirect("~/Login.aspx" + queryString);
        }

        if (Request.QueryString["login"].Equals("true") && Request.QueryString["staffID"] != null)
        {
            string queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
            Response.Redirect("~/Store.aspx" + queryString);
        }

        if (Request.QueryString["login"].Equals("true") && Request.QueryString["userID"] != null)
        {
            string queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
            Response.Redirect("~/Store.aspx" + queryString);
        }
    }
}
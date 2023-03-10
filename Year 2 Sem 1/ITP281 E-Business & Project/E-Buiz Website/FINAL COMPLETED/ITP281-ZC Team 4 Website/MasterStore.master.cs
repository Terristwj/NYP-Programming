using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterStore : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Produts_Click(object sender, EventArgs e)
    {
        string queryString = "";
        if (Request.QueryString["login"] == "false")
        {
            queryString = "?login=false";
        }
        else if (Request.QueryString["userID"] != null)
        {
            queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        }
        else if (Request.QueryString["staffID"] != null)
        {
            queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        }

        Response.Redirect("~/StoreProducts.aspx" + queryString);
    }

    protected void btn_Food_Click(object sender, EventArgs e)
    {
        string queryString = "";
        if (Request.QueryString["login"] == "false")
        {
            queryString = "?login=false";
        }
        else if (Request.QueryString["userID"] != null)
        {
            queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        }
        else if (Request.QueryString["staffID"] != null)
        {
            queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        }

        Response.Redirect("~/StoreFood.aspx" + queryString);
    }

    protected void btn_Medicine_Click(object sender, EventArgs e)
    {
        string queryString = "";
        if (Request.QueryString["login"] == "false")
        {
            queryString = "?login=false";
        }
        else if (Request.QueryString["userID"] != null)
        {
            queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        }
        else if (Request.QueryString["staffID"] != null)
        {
            queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        }

        Response.Redirect("~/StoreMedicine.aspx" + queryString);
    }

    protected void btn_SponsorProducts_Click(object sender, EventArgs e)
    {
        string queryString = "";
        if (Request.QueryString["login"] == "false")
        {
            queryString = "?login=false";
        }
        else if (Request.QueryString["userID"] != null)
        {
            queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        }
        else if (Request.QueryString["staffID"] != null)
        {
            queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        }

        Response.Redirect("~/StoreSponsorProducts.aspx" + queryString);
    }

    protected void btn_Cart_Click(object sender, EventArgs e)
    {
        string queryString = "";
        if (Request.QueryString["login"] == "false")
        {
            queryString = "?login=false";
        }
        else if (Request.QueryString["userID"] != null)
        {
            queryString = "?login=true" + "&userID=" + Request.QueryString["userID"];
        }
        else if (Request.QueryString["staffID"] != null)
        {
            queryString = "?login=true" + "&staffID=" + Request.QueryString["staffID"];
        }

        Response.Redirect("~/StoreCart.aspx" + queryString);
    }
}

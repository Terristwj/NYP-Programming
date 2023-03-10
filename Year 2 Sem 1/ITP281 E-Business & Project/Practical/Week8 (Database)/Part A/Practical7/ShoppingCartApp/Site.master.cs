using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void IB_Cart_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ViewCart.aspx");
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABCHealth
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void HeadLoginView_ViewChanged(object sender, EventArgs e)
        {

        }

        protected void IB_Cart_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ViewCart.aspx");
        }

    }
}

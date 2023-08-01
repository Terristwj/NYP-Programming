using BitzBytez.codes.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzBytez
{
    public partial class ChatSupport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                string username = Session["UserName"].ToString();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + username + "')", true);
            }
            
        }
    }
}
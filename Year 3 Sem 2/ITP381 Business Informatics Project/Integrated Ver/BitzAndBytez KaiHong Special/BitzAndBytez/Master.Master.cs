using BitzAndBytez.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzAndBytez
{
    public partial class Master : System.Web.UI.MasterPage
    {
        Account user = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                user = Session["user"] as Account;

                if (user.Type == "customer")
                {
                    preLogin.Visible = false;
                    staffLogin_cso.Visible = false;
                    postLogin.Visible = true;
                }
                else if (user.Type == "staff" && user.Role == "cso")
                {
                    preLogin.Visible = false;
                    postLogin.Visible = false;
                    staffLogin_cso.Visible = true;
                }

            }
            else
            {
                preLogin.Visible = true;
                postLogin.Visible = false;
                staffLogin_cso.Visible = false;
            }

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzBytez
{
    public partial class Staff_ServiceTransactions : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string type = Request.QueryString["type"].ToString();
            if (type.Equals("appointments"))
            {
                btn_appointments.Style.Add("background", "#138496");
            }
            else if (type.Equals("transactions"))
            {
                btn_transactions.Style.Add("background", "#138496");
            }
        }

        protected void btn_appointments_Click(object sender, EventArgs e)
        {
            string queryString = "?type=appointments&service=PCBuilding";
            Response.Redirect("Staff_ServiceTransactions_Appointments.aspx" + queryString);
        }

        protected void btn_transactions_Click(object sender, EventArgs e)
        {
            string queryString = "?type=transactions&service=PCBuilding";
            Response.Redirect("Staff_ServiceTransactions_Transactions.aspx" + queryString);
        }
    }
}
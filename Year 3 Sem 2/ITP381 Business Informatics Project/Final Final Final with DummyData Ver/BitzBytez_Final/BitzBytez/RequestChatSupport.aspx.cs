using BitzBytez.codes.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzBytez
{
    public partial class RequestChatSupport : System.Web.UI.Page
    {
        private int userID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            userID = Convert.ToInt32(Session["userID"]);
            if (!IsPostBack)
            {
                populateSalutationDDL();
            }
        }

        private void populateSalutationDDL()
        {
            //ddl_Sal.Items.Insert(0, "");
            //ddl_Sal.Items.Insert(1, "Mr. ");
            //ddl_Sal.Items.Insert(2, "Ms. ");
            //ddl_Sal.Items.Insert(3, "Mrs. ");
            //ddl_Sal.Items.Insert(4, "Madam ");
            //ddl_Sal.Items.Insert(5, "Dr. ");
        }

        protected void btn_Request_Click(object sender, EventArgs e)
        {
            //if (tb_Name.Text.Trim() != "" && tb_issueDesc.Text.Trim() != "" && ddl_Sal.SelectedValue != "")
            //{
            //    int result = ChatDA.createCSRequest(userID, tb_Name.Text.Trim(), ddl_Sal.SelectedValue, tb_issueDesc.Text.Trim());

            //    if (result > 0)
            //    {
                    
            //    }
            //}
        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {

        }
    }
}
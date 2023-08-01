using BitzBytez.codes.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace BitzBytez
{
    public partial class Staff_ViewUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)  //this IF statement is what prevents re-binding on PostBack, and prevents the onItemCommand
            {
                // Load datalist staffList
                loadUsers();
            }
        }
        private void loadUsers()
        {
            // Set datalist settings
            Account accounts = new Account();
            SqlDataAdapter da = accounts.getDataForUsers();
            DataSet ds = new DataSet();
            da.Fill(ds);

            gv_userList.DataSource = ds;
            gv_userList.DataBind();

            tb_nameEmail.Text = "";
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            // Load datalist appointments
            loadUsers();
        }

        protected void btn_nameEmail_Click(object sender, EventArgs e)
        {
            // Set datalist settings
            Account accounts = new Account();
            SqlDataAdapter da = accounts.getDataForUsersByNameOrEmail(tb_nameEmail.Text);
            DataSet ds = new DataSet();
            da.Fill(ds);

            gv_userList.DataSource = ds;
            gv_userList.DataBind();
        }
    }
}
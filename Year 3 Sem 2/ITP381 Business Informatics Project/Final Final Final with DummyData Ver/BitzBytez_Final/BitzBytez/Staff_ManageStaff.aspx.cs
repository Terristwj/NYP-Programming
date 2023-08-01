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
    public partial class Staff_ManageStaff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)  //this IF statement is what prevents re-binding on PostBack, and prevents the onItemCommand
            {
                // Load datalist staffList
                loadStaff();
            }
        }
        private void loadStaff()
        {
            // Set datalist settings
            Account accounts = new Account();
            SqlDataAdapter da = accounts.getDataForStaff();
            DataSet ds = new DataSet();
            da.Fill(ds);

            gv_staffList.DataSource = ds;
            gv_staffList.DataBind();

            ddl_role.SelectedIndex = 0;
            tb_name.Text = "";
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            // Load datalist appointments
            loadStaff();
        }

        protected void ddl_role_SelectedIndexChanged(object sender, EventArgs e)
        {
            //System.Diagnostics.Debug.WriteLine(ddl_status.SelectedValue.ToString());

            // Set datalist settings
            Account accounts = new Account();
            SqlDataAdapter da = new SqlDataAdapter();

            if (togBtn.Checked)
            {
                System.Diagnostics.Debug.WriteLine(1);
                // AND
                da = accounts.getDataForStaffByNameOrEmailAndRole(tb_name.Text, ddl_role.SelectedValue);
            }
            else
            {
                System.Diagnostics.Debug.WriteLine(2);
                // OR
                da = accounts.getDataForStaffByRole(ddl_role.SelectedValue);
            }

            DataSet ds = new DataSet();
            da.Fill(ds);

            gv_staffList.DataSource = ds;
            gv_staffList.DataBind();
        }

        protected void btn_name_Click(object sender, EventArgs e)
        {
            // Set datalist settings
            Account accounts = new Account();
            SqlDataAdapter da = new SqlDataAdapter();

            if (togBtn.Checked)
            {
                System.Diagnostics.Debug.WriteLine(3);
                // AND
                da = accounts.getDataForStaffByNameOrEmailAndRole(tb_name.Text, ddl_role.SelectedValue);
            }
            else
            {
                System.Diagnostics.Debug.WriteLine(4);
                // OR
                da = accounts.getDataForStaffByNameOrEmail(tb_name.Text);
            }

            DataSet ds = new DataSet();
            da.Fill(ds);

            gv_staffList.DataSource = ds;
            gv_staffList.DataBind();
        }

        protected void gv_staffList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                // Get selected row
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow gvRow = gv_staffList.Rows[index];

                // Get column values of selected row
                string email = gvRow.Cells[2].Text;

                // Create a session
                Account retrievedAcc = Account.getStaffAccount(email.Trim());
                Session["selectedStaff"] = retrievedAcc;

                //Response.Redirect("Staff_HomePage.aspx");
                Response.Redirect("Staff_ManageStaff_AddStaff.aspx");




                //// Update
                //ServiceAppointments serviceAppointments = new ServiceAppointments();
                //serviceAppointments.updateStatus(serviceName, date, timeStart, cust_email, "Revoked");

                //// Reset datalist settings
                //loadAppointments();
            }
        }

        protected void btn_addStaff_Click(object sender, EventArgs e)
        {
            if (Session["selectedStaff"] != null)
                Session.Remove("selectedStaff");
            Response.Redirect("Staff_ManageStaff_AddStaff.aspx");
        }
    }
}
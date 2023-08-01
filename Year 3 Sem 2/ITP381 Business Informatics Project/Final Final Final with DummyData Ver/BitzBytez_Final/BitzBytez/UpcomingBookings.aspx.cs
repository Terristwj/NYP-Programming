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
    public partial class UpcomingBookings : System.Web.UI.Page
    {
        //Default values
        string serviceName;
        Account user;

        protected void Page_Load(object sender, EventArgs e)
        {
            string service = Request.QueryString["service"];
            if (service.Equals("PCBuilding"))
                serviceName = "PC Building Service";
            else if (service.Equals("PCRepair"))
                serviceName = "PC Repair Service";
            else if (service.Equals("PCLesson"))
                serviceName = "PC Building Lesson";
            else if (service.Equals("OnsiteDiag"))
                serviceName = "Onsite Diagnosis";

            user = Session["user"] as Account;

            loadPageButtons();

            if (!IsPostBack)  //this IF statement is what prevents re-binding on PostBack, and prevents the onItemCommand
            {
                // Load datalist appointments
                loadAppointments();
            }
        }
        private void loadPageButtons()
        {
            if (serviceName.Equals("PC Building Service"))
            {
                btn_PCBuild.Enabled = false;
                btn_PCBuild.CssClass = "btn_pageSelected";
            }
            else if (serviceName.Equals("PC Repair Service"))
            {
                btn_PCRepair.Enabled = false;
                btn_PCRepair.CssClass = "btn_pageSelected";
            }
            else if (serviceName.Equals("PC Building Lesson"))
            {
                btn_PCLesson.Enabled = false;
                btn_PCLesson.CssClass = "btn_pageSelected";
            }
            else if (serviceName.Equals("Onsite Diagnosis"))
            {
                btn_onsiteDiag.Enabled = false;
                btn_onsiteDiag.CssClass = "btn_pageSelected";
            }
        }
        private void loadAppointments()
        {
            // Set datalist settings
            ServiceAppointments serviceAppointments = new ServiceAppointments();
            SqlDataAdapter da = serviceAppointments.getDataSetBySearch(serviceName, user.Email);
            DataSet ds = new DataSet();
            da.Fill(ds);

            if (rb_list.Checked)
            {
                dl_appointments.CssClass = "";
                gv_appointments.CssClass = "displayNone";
            }
            else if (rb_grid.Checked)
            {
                dl_appointments.CssClass = "displayNone";
                gv_appointments.CssClass = "";
            }

            dl_appointments.DataSource = ds;
            dl_appointments.DataBind();
            gv_appointments.DataSource = ds;
            gv_appointments.DataBind();

            ddl_month.SelectedIndex = 0;
            tb_date.Text = "";
        }

        protected void btn_PCBuild_Click(object sender, EventArgs e)
        {
            string queryString = "?service=PCBuilding";
            Response.Redirect("UpcomingBookings.aspx" + queryString);
        }

        protected void btn_PCRepair_Click(object sender, EventArgs e)
        {
            string queryString = "?service=PCRepair";
            Response.Redirect("UpcomingBookings.aspx" + queryString);
        }

        protected void btn_PCLesson_Click(object sender, EventArgs e)
        {
            string queryString = "?service=PCLesson";
            Response.Redirect("UpcomingBookings.aspx" + queryString);
        }

        protected void btn_onsiteDiag_Click(object sender, EventArgs e)
        {
            string queryString = "?service=OnsiteDiag";
            Response.Redirect("UpcomingBookings.aspx" + queryString);
        }

        protected void dl_appointments_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Revoke")
            {
                // serviceName, date, time, cust_email
                string date = ((Label)dl_appointments.Items[e.Item.ItemIndex].FindControl("lb_date")).Text;
                string timeStart = ((Label)dl_appointments.Items[e.Item.ItemIndex].FindControl("lb_timeStart")).Text;
                string cust_email = user.Email;
                ServiceAppointments serviceAppointments = new ServiceAppointments();

                serviceAppointments.updateStatus(serviceName, date, timeStart, cust_email, "Revoked");

                // Reset datalist settings
                loadAppointments();
            }
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            // Load datalist appointments
            loadAppointments();
        }

        protected void ddl_month_SelectedIndexChanged(object sender, EventArgs e)
        {
            //System.Diagnostics.Debug.WriteLine(ddl_month.SelectedValue.ToString());

            // Set datalist settings
            ServiceAppointments serviceAppointments = new ServiceAppointments();
            SqlDataAdapter da = serviceAppointments.getDataSetByDoubleSearch(serviceName, ddl_month.SelectedValue.ToString(), user.Email);
            DataSet ds = new DataSet();
            da.Fill(ds);

            dl_appointments.DataSource = ds;
            dl_appointments.DataBind();
            gv_appointments.DataSource = ds;
            gv_appointments.DataBind();

            tb_date.Text = "";
        }

        protected void btn_date_Click(object sender, EventArgs e)
        {
            // Set datalist settings
            ServiceAppointments serviceAppointments = new ServiceAppointments();
            SqlDataAdapter da = serviceAppointments.getDataSetByDoubleSearch(serviceName, tb_date.Text, user.Email);
            DataSet ds = new DataSet();
            da.Fill(ds);

            dl_appointments.DataSource = ds;
            dl_appointments.DataBind();
            gv_appointments.DataSource = ds;
            gv_appointments.DataBind();

            ddl_month.SelectedIndex = 0;
        }

        protected void rb_CheckedChanged(object sender, EventArgs e)
        {
            if (rb_grid.Checked)
            {
                rb_grid.CssClass = "radioButtonActive";
                rb_list.CssClass = "radioButton";
            }
            else if (rb_list.Checked)
            {
                rb_grid.CssClass = "radioButton";
                rb_list.CssClass = "radioButtonActive";
            }
            loadAppointments();
        }

        protected void gv_appointments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Revoke")
            {
                // Get selected row
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow gvRow = gv_appointments.Rows[index];

                // Get column values of selected row
                string serviceName = gvRow.Cells[3].Text;
                string date = gvRow.Cells[0].Text;
                string timeStart = gvRow.Cells[1].Text;
                string cust_email = user.Email;

                // Update
                ServiceAppointments serviceAppointments = new ServiceAppointments();
                serviceAppointments.updateStatus(serviceName, date, timeStart, cust_email, "Revoked");

                // Reset datalist settings
                loadAppointments();
            }
        }
    }
}
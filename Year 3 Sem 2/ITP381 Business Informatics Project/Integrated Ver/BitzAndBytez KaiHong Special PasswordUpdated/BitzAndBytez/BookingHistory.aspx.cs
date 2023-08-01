using BitzAndBytez.classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzAndBytez
{
    public partial class BookingHistory : System.Web.UI.Page
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
            SqlDataAdapter da = serviceAppointments.getDataSetBySearchCustWithStatus(serviceName, user.Email);
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

            ddl_status.SelectedIndex = 0;
            tb_date.Text = "";
        }

        protected void btn_PCBuild_Click(object sender, EventArgs e)
        {
            string queryString = "?service=PCBuilding";
            Response.Redirect("BookingHistory.aspx" + queryString);
        }

        protected void btn_PCRepair_Click(object sender, EventArgs e)
        {
            string queryString = "?service=PCRepair";
            Response.Redirect("BookingHistory.aspx" + queryString);
        }

        protected void btn_PCLesson_Click(object sender, EventArgs e)
        {
            string queryString = "?service=PCLesson";
            Response.Redirect("BookingHistory.aspx" + queryString);
        }

        protected void btn_onsiteDiag_Click(object sender, EventArgs e)
        {
            string queryString = "?service=OnsiteDiag";
            Response.Redirect("BookingHistory.aspx" + queryString);
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            // Load datalist appointments
            loadAppointments();
        }

        protected void ddl_status_SelectedIndexChanged(object sender, EventArgs e)
        {
            //System.Diagnostics.Debug.WriteLine(ddl_status.SelectedValue.ToString());

            // Set datalist settings
            ServiceAppointments serviceAppointments = new ServiceAppointments();
            SqlDataAdapter da = new SqlDataAdapter();

            if (togBtn.Checked)
            {
                // AND
                da = serviceAppointments.getDataSetByCustAndStatusAndDate(serviceName, user.Email, ddl_status.SelectedValue.ToString(), tb_date.Text);
            }
            else
            {
                // OR
                da = serviceAppointments.getDataSetByCustAndStatus(serviceName, user.Email, ddl_status.SelectedValue.ToString());
            }

            DataSet ds = new DataSet();
            da.Fill(ds);

            dl_appointments.DataSource = ds;
            dl_appointments.DataBind();
            gv_appointments.DataSource = ds;
            gv_appointments.DataBind();
        }

        protected void btn_date_Click(object sender, EventArgs e)
        {
            // Set datalist settings
            ServiceAppointments serviceAppointments = new ServiceAppointments();
            SqlDataAdapter da = new SqlDataAdapter();

            if (togBtn.Checked)
            {
                // AND
                da = serviceAppointments.getDataSetByCustAndStatusAndDate(serviceName, user.Email, ddl_status.SelectedValue.ToString(), tb_date.Text);
            }
            else
            {
                // OR
                da = serviceAppointments.getDataSetByDoubleSearchWithStatus(serviceName, tb_date.Text, user.Email);
            }

            DataSet ds = new DataSet();
            da.Fill(ds);

            dl_appointments.DataSource = ds;
            dl_appointments.DataBind();
            gv_appointments.DataSource = ds;
            gv_appointments.DataBind();
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
    }
}
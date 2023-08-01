using BitzAndBytez.classes;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzAndBytez
{
    public partial class Staff_ServiceTransactions_Appointments : System.Web.UI.Page
    {
        //Default values
        string serviceName;

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

            lb_pageTitle.Text = serviceName;

            if (!IsPostBack)  //this IF statement is what prevents re-binding on PostBack, and prevents the onItemCommand
            {
                // Load datalist appointments
                loadAppointments();
            }
        }
        private void loadAppointments()
        {
            // Set datalist settings
            ServiceAppointments serviceAppointments = new ServiceAppointments();
            SqlDataAdapter da = serviceAppointments.getDataSet(serviceName);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dl_appointments.DataSource = ds;
            dl_appointments.DataBind();

            ddl_month.SelectedIndex = 0;
            tb_custEmail.Text = "";
        }

        protected void btn_PCBuild_Click(object sender, EventArgs e)
        {
            string queryString = "?type=appointments&service=PCBuilding";
            Response.Redirect("Staff_ServiceTransactions_Appointments.aspx" + queryString);
        }

        protected void btn_PCRepair_Click(object sender, EventArgs e)
        {
            string queryString = "?type=appointments&service=PCRepair";
            Response.Redirect("Staff_ServiceTransactions_Appointments.aspx" + queryString);
        }

        protected void btn_PCLesson_Click(object sender, EventArgs e)
        {
            string queryString = "?type=appointments&service=PCLesson";
            Response.Redirect("Staff_ServiceTransactions_Appointments.aspx" + queryString);
        }

        protected void btn_onsiteDiag_Click(object sender, EventArgs e)
        {
            string queryString = "?type=appointments&service=OnsiteDiag";
            Response.Redirect("Staff_ServiceTransactions_Appointments.aspx" + queryString);
        }

        protected void dl_appointments_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Deliver" || e.CommandName == "Cancel")
            {
                // serviceName, date, time, cust_email
                string date = ((Label)dl_appointments.Items[e.Item.ItemIndex].FindControl("lb_date")).Text;
                string timeStart = ((Label)dl_appointments.Items[e.Item.ItemIndex].FindControl("lb_timeStart")).Text;
                string cust_email = ((Label)dl_appointments.Items[e.Item.ItemIndex].FindControl("lb_custEmail")).Text;
                ServiceAppointments serviceAppointments = new ServiceAppointments();

                // Update
                if (e.CommandName == "Deliver")
                {
                    serviceAppointments.updateStatus(serviceName, date, timeStart, cust_email, "Delivered");
                    
                }
                else if (e.CommandName == "Cancel")
                {
                    serviceAppointments.updateStatus(serviceName, date, timeStart, cust_email, "Cancelled");
                }

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
            System.Diagnostics.Debug.WriteLine(ddl_month.SelectedValue.ToString());

            // Set datalist settings
            ServiceAppointments serviceAppointments = new ServiceAppointments();
            SqlDataAdapter da = serviceAppointments.getDataSetBySearch(serviceName, ddl_month.SelectedValue.ToString());
            DataSet ds = new DataSet();
            da.Fill(ds);
            dl_appointments.DataSource = ds;
            dl_appointments.DataBind();

            tb_custEmail.Text = "";
        }

        protected void btn_custEmail_Click(object sender, EventArgs e)
        {
            // Set datalist settings
            ServiceAppointments serviceAppointments = new ServiceAppointments();
            SqlDataAdapter da = serviceAppointments.getDataSetBySearch(serviceName, tb_custEmail.Text);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dl_appointments.DataSource = ds;
            dl_appointments.DataBind();

            ddl_month.SelectedIndex = 0;
        }
    }
}
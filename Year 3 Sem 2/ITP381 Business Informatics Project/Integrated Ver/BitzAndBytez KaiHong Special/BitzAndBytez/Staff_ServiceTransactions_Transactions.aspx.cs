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
    public partial class Staff_ServiceTransactions_Transactions : System.Web.UI.Page
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
                // Load the buttons
                loadButtons();

                // Load datalist appointments
                loadAppointments();
            }
        }
        private void loadAppointments()
        {
            // Set datalist settings
            ServiceAppointments serviceAppointments = new ServiceAppointments();
            SqlDataAdapter da = serviceAppointments.getDataSetWithStatus(serviceName);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dl_appointments.DataSource = ds;
            dl_appointments.DataBind();

            tb_date.Text = "";
            tb_custEmail.Text = "";
        }

        protected void btn_PCBuild_Click(object sender, EventArgs e)
        {
            string queryString = "?type=transactions&service=PCBuilding";
            Response.Redirect("Staff_ServiceTransactions_Transactions.aspx" + queryString);
        }

        protected void btn_PCRepair_Click(object sender, EventArgs e)
        {
            string queryString = "?type=transactions&service=PCRepair";
            Response.Redirect("Staff_ServiceTransactions_Transactions.aspx" + queryString);
        }

        protected void btn_PCLesson_Click(object sender, EventArgs e)
        {
            string queryString = "?type=transactions&service=PCLesson";
            Response.Redirect("Staff_ServiceTransactions_Transactions.aspx" + queryString);
        }

        protected void btn_onsiteDiag_Click(object sender, EventArgs e)
        {
            string queryString = "?type=transactions&service=OnsiteDiag";
            Response.Redirect("Staff_ServiceTransactions_Transactions.aspx" + queryString);
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            // Load datalist appointments
            loadAppointments();
        }
        protected void btn_date_Click(object sender, EventArgs e)
        {
            // Set datalist settings
            ServiceAppointments serviceAppointments = new ServiceAppointments();
            SqlDataAdapter da = serviceAppointments.getDataSetBySearchDateWithStatus(serviceName, tb_date.Text);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dl_appointments.DataSource = ds;
            dl_appointments.DataBind();
        }

        protected void btn_custEmail_Click(object sender, EventArgs e)
        {

            // Set datalist settings
            ServiceAppointments serviceAppointments = new ServiceAppointments();
            SqlDataAdapter da;

            Boolean isChecked = togBtn.Checked;
            // AND condition
            if (isChecked)
                da = serviceAppointments.getDataSetByDoubleSearchWithStatus(serviceName, tb_date.Text, tb_custEmail.Text);
            // OR condition
            else
                da = serviceAppointments.getDataSetBySearchCustWithStatus(serviceName, tb_custEmail.Text);

            DataSet ds = new DataSet();
            da.Fill(ds);
            dl_appointments.DataSource = ds;
            dl_appointments.DataBind();
        }

        protected void togBtn_CheckedChanged(object sender, EventArgs e)
        {
            loadButtons();
        }

        private void loadButtons()
        {
            Boolean isChecked = togBtn.Checked;
            if (isChecked)
            {
                btn_date.Enabled = false;
                btn_date.CssClass = "btn_dateDisabled";
            }
            else
            {
                btn_date.Enabled = true;
                btn_date.CssClass = "btn_date";
            }
        }
    }
}
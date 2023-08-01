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
    public partial class Staff_ManageServices_Template : System.Web.UI.Page
    {
        // This page uses session["day"] instead of creating a variable, 
        // because AJAX will auto reset the value

        //Default values
        string serviceName;

        // Store list of unavailable dates
        string dayOfWeek;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["service"].ToString().Equals("PCBuild"))
                serviceName = "PC Building Service";
            else if (Request.QueryString["service"].ToString().Equals("PCRepair"))
                serviceName = "PC Repair Service";
            else if (Request.QueryString["service"].ToString().Equals("PCLesson"))
                serviceName = "PC Building Lesson";
            else if (Request.QueryString["service"].ToString().Equals("OnsiteDiag"))
                serviceName = "Onsite Diagnosis";

            lb_pageTitle.Text = serviceName;

            if (!IsPostBack)  //this IF statement is what prevents re-binding on PostBack, and prevents the onItemCommand
            {
                // Set datalist_day settings
                loadDaysOfTheWeek();

                // Set datalist settings
                loadTimeslots();
                
                // Load price
                loadPrice();

                // Load staff
                loadStaff();
            }
        }
        private void loadDaysOfTheWeek()
        {
            // Set datalist settings
            DaysOfTheWeek daysOfTheWeek = new DaysOfTheWeek();
            SqlDataAdapter da = daysOfTheWeek.getDataSet();
            DataSet ds = new DataSet();
            da.Fill(ds);
            dl_daysOfTheWeek.DataSource = ds;
            dl_daysOfTheWeek.DataBind();

            selectMonday_startUp();
        }
        private void selectMonday_startUp()
        {
            Boolean firstItem = true;
            foreach (DataListItem item in dl_daysOfTheWeek.Items)
            {
                if (firstItem)
                {
                    ((Button)item.FindControl("btn_day")).Style.Add("color", "white");
                    ((Button)item.FindControl("btn_day")).Style.Add("background", "#888888");

                    Session["day"] = "Monday";
                    firstItem = false;
                }
            }
        }

        private void loadTimeslots()
        {
            // Set datalist settings
            ServiceTime serviceTime = new ServiceTime();
            SqlDataAdapter da = serviceTime.getDataSetByServiceNameAndDay(serviceName, Session["day"].ToString());
            DataSet ds = new DataSet();
            da.Fill(ds);
            dl_timeSlot.DataSource = ds;
            dl_timeSlot.DataBind();
        }

        protected void btn_addDay_Click(object sender, EventArgs e)
        {
            if (tb_timeSlot.Text.Equals(""))
            {
                // Empty fields
                lb_error.Text = "Please fill in the field";
            }
            else
            {
                // Validate if correct data
                ServiceTime serviceTime = new ServiceTime();
                if (serviceTime.validateStartTime(tb_timeSlot.Text))
                {
                    // Success
                    lb_error.Text = "";
                    string end_time = serviceTime.calculateEndTime(tb_timeSlot.Text);

                    // Add selected item
                    serviceTime.addTimeslot(serviceName, Session["day"].ToString(), tb_timeSlot.Text, end_time);

                    // Reset tb_Text
                    tb_timeSlot.Text = "";

                    // Reset datalist settings
                    loadTimeslots();
                }
                else
                {
                    // Empty fields
                    lb_error.Text = "Please enter the correct format: ####";
                }
            }
        }

        protected void dl_daysOfTheWeek_ItemsCommand(object source, DataListCommandEventArgs e)
        {
            //System.Diagnostics.Debug.WriteLine("aaa");
            if (e.CommandName == "Select")
            {
                foreach (DataListItem item in dl_daysOfTheWeek.Items)
                {
                    //System.Diagnostics.Debug.WriteLine("bbb");

                    // Default value
                    ((Button)item.FindControl("btn_day")).Style.Add("color", "black");
                    ((Button)item.FindControl("btn_day")).Style.Add("background", "#f0f0f0");
                }
                //System.Diagnostics.Debug.WriteLine("ccc");
                ((Button)dl_daysOfTheWeek.Items[e.Item.ItemIndex].FindControl("btn_day")).Style.Add("color", "white");
                ((Button)dl_daysOfTheWeek.Items[e.Item.ItemIndex].FindControl("btn_day")).Style.Add("background", "#888888");

                // Retrieve day
                string dayShort = ((Button)dl_daysOfTheWeek.Items[e.Item.ItemIndex].FindControl("btn_day")).Text;

                DaysOfTheWeek DaysOfTheWeek = new DaysOfTheWeek();
                string strDay = DaysOfTheWeek.getDay(dayShort);
                Session["day"] = strDay;
                
                // Reset datalist settings
                loadTimeslots();
            }
        }

        protected void dl_timeSlot_ItemsCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                string start_time = ((Label)dl_timeSlot.Items[e.Item.ItemIndex].FindControl("lb_startTime")).Text;
                ServiceTime serviceTime = new ServiceTime();

                // Delete selected item
                serviceTime.deleteTimeslot(serviceName, Session["day"].ToString(), start_time);

                // Reset datalist settings
                loadTimeslots();
            }
        }

        private void loadPrice()
        {
            Service service = new Service();
            tb_price.Text = service.getPrice(serviceName);
        }

        protected void btn_updatePrice_Click(object sender, EventArgs e)
        {
            Service service = new Service();
            string price_current = service.getPrice(serviceName);
            string price_new = tb_price.Text;

            // Reset values
            lb_errorPrice.Text = "";
            lb_successPrice.Text = "";

            // Validate
            if (!price_new.Equals(""))
            {
                try
                {
                    // If this line has error, go to catch
                    double priceCheck = Convert.ToDouble(price_new);
                    if (!price_current.Equals(price_new))
                    {
                        service.updatePrice(serviceName, price_new);
                        lb_successPrice.Text = "Update successful";
                        loadPrice();
                    }
                    else
                    {
                        lb_errorPrice.Text = "Entered price is the same";
                    }
                }
                catch
                {
                    lb_errorPrice.Text = "Please key in a proper number";
                }
            }
            else
                lb_errorPrice.Text = "Please fill in the field";
        }

        private void loadStaff()
        {
            Service service = new Service();

            // Reset dropdownlist
            ddl_Staff.Items.Clear();

            // Get the list of staff
            ArrayList staffList = service.getStaffList();

            // Populate
            foreach (string staffName in staffList)
            {
                ddl_Staff.Items.Add(new ListItem(staffName, staffName));
            }

            // Find current staff incharge
            string currentStaff = service.getStaff(serviceName);

            // Find the index of staff incharge
            int indexOfDDL = ddl_Staff.Items.IndexOf(ddl_Staff.Items.FindByValue(currentStaff));

            // Select the index of staff incharge
            ddl_Staff.SelectedIndex = indexOfDDL;
        }

        protected void btn_updateStaff_Click(object sender, EventArgs e)
        {
            Service service = new Service();
            string staff_current = service.getStaff(serviceName);
            string staff_new = ddl_Staff.SelectedItem.Text;

            // Reset values
            lb_errorStaff.Text = "";
            lb_successStaff.Text = "";

            // Validate
            if (!staff_current.Equals(staff_new))
            {
                service.updateStaff(serviceName, staff_new);
                lb_successStaff.Text = "Update successful";
                loadStaff();
            }
            else
            {
                lb_errorStaff.Text = "Selected staff is the same";
            }
        }
    }
}
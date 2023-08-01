using BitzBytez.codes.Entities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzBytez
{
    public partial class ServicesRegister : System.Web.UI.Page
    {
        // Store list of unavailable dates
        Hashtable HolidayList;
        string dayOfWeek;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] as Account == null)
            {
                Response.Redirect("Login.aspx");
            }

            this.HolidayList = Getholiday();
            // Set calendar settings
            Calendar1.FirstDayOfWeek = FirstDayOfWeek.Sunday;
            Calendar1.NextPrevFormat = NextPrevFormat.ShortMonth;
            Calendar1.TitleFormat = TitleFormat.Month;
            Calendar1.DayStyle.Height = new Unit(50);
            Calendar1.DayStyle.Width = new Unit(150);
            Calendar1.DayStyle.HorizontalAlign = HorizontalAlign.Center;
            Calendar1.DayStyle.VerticalAlign = VerticalAlign.Middle;
            Calendar1.OtherMonthDayStyle.BackColor = System.Drawing.Color.AliceBlue;

            // For AJAX tools
            if (!Page.IsPostBack)
            {
                // Set default values
                string service;
                if (Request.QueryString["service"] == null)
                {
                    // If they user somehow entered the webpage by url
                    service = "PCBuilding";
                }
                else
                {
                    // If they user entered the webpage by Services page
                    service = Request.QueryString["service"];
                }

                if (service.Equals("PCBuilding"))
                {
                    ddl_service.SelectedValue = "PC Building Service";
                }
                else if (service.Equals("PCRepair"))
                {
                    ddl_service.SelectedValue = "PC Repair Service";
                }
                else if (service.Equals("PCLesson"))
                {
                    ddl_service.SelectedValue = "PC Building Lesson";
                }
                else if (service.Equals("OnsiteDiag"))
                {
                    ddl_service.SelectedValue = "Onsite Diagnosis";
                }

                Service serviceObj = new Service();
                tb_price.Text = "$" + serviceObj.getPrice(ddl_service.SelectedValue);
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            string day = Calendar1.SelectedDate.Day.ToString();
            string month = Calendar1.SelectedDate.Month.ToString();
            month = getFullMonth(month);
            string year = Calendar1.SelectedDate.Year.ToString();

            string date = day + " " + month + " " + year;
            tb_date.Text = date;

            this.dayOfWeek = Calendar1.SelectedDate.DayOfWeek.ToString();

            string serviceName = ddl_service.SelectedValue.ToString();
            ServiceTime serviceTime = new ServiceTime();

            // Reset dropdownlist and repopulate
            ddl_time.Items.Clear();
            ArrayList startTimes = serviceTime.getStartTimes(serviceName, dayOfWeek);
            foreach (string startTime in startTimes)
            {
                ddl_time.Items.Add(new ListItem(startTime, startTime));
            }
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (HolidayList[e.Day.Date.ToShortDateString()] != null)
            {
                Literal literal1 = new Literal();
                literal1.Text = "<br/>";
                e.Cell.Controls.Add(literal1);
                Label label1 = new Label();
                label1.Text = (string)HolidayList[e.Day.Date.ToShortDateString()];
                label1.Font.Size = new FontUnit(FontSize.Smaller);
                label1.ForeColor = System.Drawing.Color.Red;
                e.Cell.Controls.Add(label1);
            }
        }

        protected void ddl_service_SelectedIndexChanged(object sender, EventArgs e)
        {
            string service = ddl_service.SelectedValue.ToString();

            // Do not remove this code, there will be error
            tb_price.Text = service;

            Service serviceObj = new Service();
            tb_price.Text = "$" + serviceObj.getPrice(service);
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            // Validations
            if (tb_date.Text.Equals(""))
            {
                // When date is empty
                lb_error.Text = "Please select a date";
            }
            else
            {
                DateTime selectedDate = Calendar1.SelectedDate;
                DateTime todayDate = (DateTime.Today).AddDays(3);

                if (selectedDate <= todayDate)
                {
                    // When date is invalid
                    lb_error.Text = "Date must be at least 3 days advanced";
                }
                else
                {
                    string strSelectedDate = selectedDate.ToString().Split(' ')[0];
                    ServiceHolidays serviceHolidays = new ServiceHolidays();
                    if (serviceHolidays.isHoliday(strSelectedDate))
                    {
                        // When date is holiday
                        lb_error.Text = "The selected day is a holiday";
                    }
                    else
                    {
                        // Get each field data
                        string serviceName = ddl_service.SelectedValue;
                        string date = tb_date.Text;
                        string price = tb_price.Text.Remove(0, 1);
                        string start_time = ddl_time.SelectedValue;
                        string duration = tb_duration.Text;
                        string additionalInfo = tb_additionalInfo.Text;

                        Account user = Session["user"] as Account;
                        string custEmail = user.Email;

                        Service service = new Service();
                        string staffIncharge = service.getStaff(serviceName);

                        // Convert DD-MMM-YY to DD/MM/YYYY
                        string originalDateFormat = Calendar1.SelectedDate.ToString();
                        originalDateFormat = originalDateFormat.Split(' ')[0];
                        originalDateFormat = serviceHolidays.convertDate_KaiHong_Terris(originalDateFormat);

                        // Must be DD/MM/YYYY, that is why tb_date.Text cannot be used
                        int orderData = serviceHolidays.calculateOrderData(originalDateFormat);


                        // Create a session object for payment
                        ServiceAppointments serviceAppointments = new ServiceAppointments(serviceName, date, price, start_time, duration, additionalInfo, custEmail, staffIncharge, orderData);
                        Session["serviceAppointments"] = serviceAppointments;

                        // Go to payment
                        //lb_error.Text = "Success - Testing Purpose";
                        string queryString = "?prev=service";
                        Response.Redirect("Payment.aspx" + queryString);

                        //// After payment, add into database
                        //ServiceAppointments serviceAppointments = new ServiceAppointments();
                        //serviceAppointments.addAppointment(serviceName, date, price, start_time, duration, additionalInfo, custEmail, staffIncharge, orderData);
                    }
                }
            }
        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Services.aspx");
        }

        // Utility functions
        private Hashtable Getholiday()
        {
            ServiceHolidays serviceHolidays = new ServiceHolidays();
            ArrayList holidays = serviceHolidays.getHolidays();

            Hashtable holiday = new Hashtable();
            foreach (string[] holidaySet in holidays)
            {
                string newHolidateFormat = serviceHolidays.convertDate_Terris_KaiHong(holidaySet[1]);
                //System.Diagnostics.Debug.WriteLine(newHolidateFormat);

                holiday[newHolidateFormat] = holidaySet[0];


                // Original
                //holiday[holidaySet[1]] = holidaySet[0];


                // Debugger
                //string sample = holidaySet[0] + ": " + holidaySet[1];
                //System.Diagnostics.Debug.WriteLine(sample);
            }

            // Original hardcode
            //holiday["1/1/2020"] = "New Year's Day";
            //holiday["25/1/2020"] = "Chinese New Year";
            //holiday["26/1/2020"] = "Chinese New Year";
            //holiday["27/1/2020"] = "Chinese New Year";
            //holiday["10/4/2020"] = "Good Friday";
            //holiday["1/5/2020"] = "Labour Day";
            //holiday["7/5/2020"] = "Vesak Day";
            //holiday["24/5/2020"] = "Hari Raya Puasa";
            //holiday["25/5/2020"] = "Hari Raya Puasa";
            //holiday["31/7/2020"] = "Hari Raya Haji";
            //holiday["9/8/2020"] = "National Day";
            //holiday["10/8/2020"] = "National Day";
            //holiday["14/11/2020"] = "Deepavali";
            //holiday["25/12/2020"] = "Christmas Day";

            return holiday;
        }
        private string getFullMonth(string month)
        {
            string strMonth;
            if (month.Equals("1"))
                strMonth = "January";
            else if (month.Equals("2"))
                strMonth = "February";
            else if (month.Equals("3"))
                strMonth = "March";
            else if (month.Equals("4"))
                strMonth = "April";
            else if (month.Equals("5"))
                strMonth = "May";
            else if (month.Equals("6"))
                strMonth = "June";
            else if (month.Equals("7"))
                strMonth = "July";
            else if (month.Equals("8"))
                strMonth = "August";
            else if (month.Equals("9"))
                strMonth = "September";
            else if (month.Equals("10"))
                strMonth = "October";
            else if (month.Equals("11"))
                strMonth = "November";
            else
                strMonth = "December";

            return strMonth;
        }
    }
}
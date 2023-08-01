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
    public partial class Staff_ManageServices_General : System.Web.UI.Page
    {
        // Store list of unavailable dates
        string dayOfWeek;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Set calendar settings
            Calendar1.FirstDayOfWeek = FirstDayOfWeek.Sunday;
            Calendar1.DayStyle.HorizontalAlign = HorizontalAlign.Center;
            Calendar1.DayStyle.VerticalAlign = VerticalAlign.Middle;
            Calendar1.OtherMonthDayStyle.BackColor = System.Drawing.Color.AliceBlue;

            if (!IsPostBack)  //this IF statement is what prevents re-binding on PostBack, and prevents the onItemCommand
            {
                // Set datalist settings
                loadHolidays();
            }
        }

        private void loadHolidays()
        {
            // Set datalist settings
            ServiceHolidays serviceHoliday = new ServiceHolidays();
            SqlDataAdapter da = serviceHoliday.getDataSet();
            DataSet ds = new DataSet();
            da.Fill(ds);
            dl_holidays.DataSource = ds;
            dl_holidays.DataBind();
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            string day = Calendar1.SelectedDate.Day.ToString();
            string month = Calendar1.SelectedDate.Month.ToString();
            string year = Calendar1.SelectedDate.Year.ToString();

            string date = day + "/" + month + "/" + year;
            tb_date.Text = date;

            this.dayOfWeek = Calendar1.SelectedDate.DayOfWeek.ToString();
        }

        protected void btn_addDay_Click(object sender, EventArgs e)
        {
            if (tb_occasion.Text.Equals("") || tb_date.Text.Equals("")){
                // Empty fields
                lb_error.Text = "Please fill in the fields";
            }
            else
            {
                // Success
                lb_error.Text = "";

                ServiceHolidays serviceHolidays = new ServiceHolidays();
                int orderData = serviceHolidays.calculateOrderData(tb_date.Text);

                // Add selected item
                serviceHolidays.addHoliday(tb_occasion.Text, tb_date.Text, orderData);

                // Reset textboxes
                tb_occasion.Text = "";
                tb_date.Text = "";

                // Reset datalist settings
                loadHolidays();
            }
        }

        protected void dl_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                string name = ((Label)dl_holidays.Items[e.Item.ItemIndex].FindControl("lb_name")).Text;
                string date = ((Label)dl_holidays.Items[e.Item.ItemIndex].FindControl("lb_date")).Text;
                date = date.Split(' ')[1];
                ServiceHolidays serviceHolidays = new ServiceHolidays();
                int orderData = serviceHolidays.calculateOrderData(date);

                // Delete selected item
                serviceHolidays.deleteHoliday(name, date, orderData);
                
                // Reset datalist settings
                loadHolidays();
            }
        }

    }
}
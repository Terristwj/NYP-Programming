using FLY_TA.BLL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLY_TA
{
    public partial class CreateOSEP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Account.aspx");
        }

        protected void btn_Create_Click(object sender, EventArgs e)
        {
            if (tb_Title.Text.Equals("") || tb_Description.Text.Equals("") || tb_DurationEnd.Text.Equals("") || tb_DurationStart.Text.Equals("") || tb_Quota.Text.Equals("") || tb_Fee.Text.Equals(""))
            {
                Response.Write("<script>alert('Please fill in all fields')</script>");
            }
            else
            {
                BLL_OSEPs OSEP = new BLL_OSEPs();
                OSEP.insertOSEP(tb_Title.Text, tb_Description.Text, getDuration(), ddl_AccommodationType.SelectedValue, Convert.ToInt32(tb_Quota.Text), Convert.ToInt32(tb_Fee.Text));

                Response.Write("<script>alert('OSEP Creation Successful')</script>");
            }
        }

        private string getDuration()
        {
            string startDay = tb_DurationStart.Text.Substring(8, 2);
            if (Convert.ToInt32(startDay.Substring(0, 1)) == 0)
            {
                startDay = startDay.Substring(1, 1);
            }

            string startMonth = tb_DurationStart.Text.Substring(5, 2);
            if (Convert.ToInt32(startMonth.Substring(0, 1)) == 0)
            {
                startMonth = startMonth.Substring(1, 1);
            }
            if (Convert.ToInt32(startMonth) == 1)
                startMonth = "January";
            else if (Convert.ToInt32(startMonth) == 2)
                startMonth = "February";
            else if (Convert.ToInt32(startMonth) == 3)
                startMonth = "March";
            else if (Convert.ToInt32(startMonth) == 4)
                startMonth = "April";
            else if (Convert.ToInt32(startMonth) == 5)
                startMonth = "May";
            else if (Convert.ToInt32(startMonth) == 6)
                startMonth = "June";
            else if (Convert.ToInt32(startMonth) == 7)
                startMonth = "July";
            else if (Convert.ToInt32(startMonth) == 8)
                startMonth = "August";
            else if (Convert.ToInt32(startMonth) == 9)
                startMonth = "September";
            else if (Convert.ToInt32(startMonth) == 10)
                startMonth = "October";
            else if (Convert.ToInt32(startMonth) == 11)
                startMonth = "November";
            else if (Convert.ToInt32(startMonth) == 12)
                startMonth = "December";

            string startYear = tb_DurationStart.Text.Substring(0, 4);

            string startDate = startDay + " " + startMonth + " " + startYear;

            string endDay = tb_DurationEnd.Text.Substring(8, 2);
            if (Convert.ToInt32(endDay.Substring(0, 1)) == 0)
            {
                endDay = endDay.Substring(1, 1);
            }

            string endMonth = tb_DurationEnd.Text.Substring(5, 2);
            if (Convert.ToInt32(endMonth.Substring(0, 1)) == 0)
            {
                endMonth = endMonth.Substring(1, 1);
            }
            if (Convert.ToInt32(endMonth) == 1)
                endMonth = "January";
            else if (Convert.ToInt32(endMonth) == 2)
                endMonth = "February";
            else if (Convert.ToInt32(endMonth) == 3)
                endMonth = "March";
            else if (Convert.ToInt32(endMonth) == 4)
                endMonth = "April";
            else if (Convert.ToInt32(endMonth) == 5)
                endMonth = "May";
            else if (Convert.ToInt32(endMonth) == 6)
                endMonth = "June";
            else if (Convert.ToInt32(endMonth) == 7)
                endMonth = "July";
            else if (Convert.ToInt32(endMonth) == 8)
                endMonth = "August";
            else if (Convert.ToInt32(endMonth) == 9)
                endMonth = "September";
            else if (Convert.ToInt32(endMonth) == 10)
                endMonth = "October";
            else if (Convert.ToInt32(endMonth) == 11)
                endMonth = "November";
            else if (Convert.ToInt32(endMonth) == 12)
                endMonth = "December";

            string endYear = tb_DurationEnd.Text.Substring(0, 4);

            string endDate = endDay + " " + endMonth + " " + endYear;

            string Duration = startDate + " - " + endDate;
            return Duration;
        }
    }
}
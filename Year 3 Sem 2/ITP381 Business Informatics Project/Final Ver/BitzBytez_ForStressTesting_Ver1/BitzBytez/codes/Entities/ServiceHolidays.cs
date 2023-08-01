using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace BitzBytez.codes.Entities
{
    public class ServiceHolidays
    {
        public ArrayList getHolidays()
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT name, date FROM ServiceHolidays";
            SqlCommand cmd = new SqlCommand(strSelect, con);
            SqlDataReader myReader = cmd.ExecuteReader();

            ArrayList holidays = new ArrayList();
            while (myReader.Read())
            {
                string name = myReader.GetValue(0).ToString();
                string date = myReader.GetValue(1).ToString();
                string[] holiday = { name, date };

                holidays.Add(holiday);
            }

            myReader.Close();
            con.Close();

            return holidays;
        }

        public Boolean isHoliday(string date)
        {
            Boolean isHoliday = false;

            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT name FROM ServiceHolidays WHERE date=@date";
            SqlCommand cmd = new SqlCommand(strSelect, con);
            cmd.Parameters.AddWithValue("@date", date);
            SqlDataReader myReader = cmd.ExecuteReader();

            ArrayList holidays = new ArrayList();

            if (myReader.HasRows)
            {
                isHoliday = true;
            }

            myReader.Close();
            con.Close();

            return isHoliday;
        }

        public SqlDataAdapter getDataSet()
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT * FROM ServiceHolidays ORDER BY orderData ASC";
            SqlCommand cmd = new SqlCommand(strSelect, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            return da;
        }

        public void addHoliday(string occasion, string date, int orderData)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strInsert = "INSERT INTO ServiceHolidays(name, date, orderData)";
            strInsert += " VALUES(@name, @date, @orderData)";
            SqlCommand cmd = new SqlCommand(strInsert, con);

            cmd.Parameters.AddWithValue("@name", occasion);
            cmd.Parameters.AddWithValue("@date", date);
            cmd.Parameters.AddWithValue("@orderData", orderData);

            int result = cmd.ExecuteNonQuery();
            con.Close();
        }

        // Converts DD/MM/YYYY into YYYYMMDD
        public int calculateOrderData(string date)
        {
            int orderData;

            string strDate = date.ToString().Split('/')[0];
            string strMonth = date.ToString().Split('/')[1];
            string strYear = date.ToString().Split('/')[2];

            if (strDate.Length == 1)
                strDate = "0" + strDate;
            if (strMonth.Length == 1)
                strMonth = "0" + strMonth;

            string strOrderData = strYear + strMonth + strDate;
            orderData = Convert.ToInt32(strOrderData);

            return orderData;
        }

        public void deleteHoliday(string occasion, string date, int orderData)
        {
            //System.Diagnostics.Debug.WriteLine(occasion);
            //System.Diagnostics.Debug.WriteLine(date);
            //System.Diagnostics.Debug.WriteLine(orderData);

            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();

            string strInsert = "DELETE FROM ServiceHolidays WHERE name=@name AND date=@date AND orderData=@orderData";
            SqlCommand cmd = new SqlCommand(strInsert, con);

            cmd.Parameters.AddWithValue("@name", occasion);
            cmd.Parameters.AddWithValue("@date", date);
            cmd.Parameters.AddWithValue("@orderData", orderData);

            int result = cmd.ExecuteNonQuery();
            con.Close();
        }

        // Converts from DD/MM/YYYY to DD-MMM-YY
        public string convertDate_Terris_KaiHong(string date)
        {
            string strDate = date.ToString().Split('/')[0];
            string strMonth = date.ToString().Split('/')[1];
            string strYear = date.ToString().Split('/')[2];

            // Convert Eg. 1 to 01
            if (strDate.Length == 1)
                strDate = "0" + strDate;

            // Convert MM to MMM
            strMonth = KaiHongSpecial1(strMonth);

            // Convert Eg. 2020 to 20
            strYear = strYear.Substring(2, strYear.Length - 2);


            string dateTimeStr = strDate + "-" + strMonth + "-" + strYear;

            return dateTimeStr;
        }

        // Convert MM to MMM
        private string KaiHongSpecial1(string month)
        {
            string strMonth;
            if (month.Equals("1"))
                strMonth = "Jan";
            else if (month.Equals("2"))
                strMonth = "Feb";
            else if (month.Equals("3"))
                strMonth = "Mar";
            else if (month.Equals("4"))
                strMonth = "Apr";
            else if (month.Equals("5"))
                strMonth = "May";
            else if (month.Equals("6"))
                strMonth = "Jun";
            else if (month.Equals("7"))
                strMonth = "Jul";
            else if (month.Equals("8"))
                strMonth = "Aug";
            else if (month.Equals("9"))
                strMonth = "Sep";
            else if (month.Equals("10"))
                strMonth = "Oct";
            else if (month.Equals("11"))
                strMonth = "Nov";
            else
                strMonth = "Dec";

            return strMonth;
        }


        // Convert DD-MMM-YY to DD/MM/YYYY
        public string convertDate_KaiHong_Terris(string date)
        {
            string strDate = date.ToString().Split('-')[0];
            string strMonth = date.ToString().Split('-')[1];
            string strYear = date.ToString().Split('-')[2];

            // Convert Eg. 01 to 1
            if (strDate.Substring(0, 1).Equals("0"))
                strDate = strDate.Substring(1, strDate.Length - 1);

            // Convert MMM to MM
            strMonth = KaiHongSpecial2(strMonth);

            // Convert Eg. 20 to 2020
            strYear = "20" + strYear;


            string dateTimeStr = strDate + "/" + strMonth + "/" + strYear;

            return dateTimeStr;
        }

        // Convert MM to MMM
        private string KaiHongSpecial2(string month)
        {
            string strMonth;
            if (month.Equals("Jan"))
                strMonth = "1";
            else if (month.Equals("Feb"))
                strMonth = "2";
            else if (month.Equals("Mar"))
                strMonth = "3";
            else if (month.Equals("Apr"))
                strMonth = "4";
            else if (month.Equals("May"))
                strMonth = "5";
            else if (month.Equals("Jun"))
                strMonth = "6";
            else if (month.Equals("Jul"))
                strMonth = "7";
            else if (month.Equals("Aug"))
                strMonth = "8";
            else if (month.Equals("Sep"))
                strMonth = "9";
            else if (month.Equals("Oct"))
                strMonth = "10";
            else if (month.Equals("Nov"))
                strMonth = "11";
            else
                strMonth = "12";

            return strMonth;
        }

    }
}
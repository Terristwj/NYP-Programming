using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace BitzAndBytez.classes
{
    public class ServiceHolidays
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
        
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
    }
}
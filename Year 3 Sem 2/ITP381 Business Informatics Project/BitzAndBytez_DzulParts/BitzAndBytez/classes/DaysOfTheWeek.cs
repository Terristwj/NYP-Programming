using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BitzAndBytez.classes
{
    public class DaysOfTheWeek
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

        public SqlDataAdapter getDataSet()
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT * FROM DayaOfTheWeek ORDER BY orderData ASC";
            SqlCommand cmd = new SqlCommand(strSelect, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            return da;
        }

        public string getDay(string dayShort)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT day FROM DayaOfTheWeek WHERE dayShort = @dayShort";
            SqlCommand cmd = new SqlCommand(strSelect, con);
            cmd.Parameters.AddWithValue("@dayShort", dayShort);
            SqlDataReader myReader = cmd.ExecuteReader();

            string day = "";
            if (myReader.Read())
            {
                day = myReader["day"].ToString();
            }

            myReader.Close();
            con.Close();

            return day;
        }
    }
}
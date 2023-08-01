using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BitzAndBytez.classes
{
    public class ServiceTime
    {
        public ArrayList getStartTimes(string serviceName, string day)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT start_time FROM ServiceTime WHERE serviceName = @serviceName AND day = @day";
            SqlCommand cmd = new SqlCommand(strSelect, con);
            cmd.Parameters.AddWithValue("@serviceName", serviceName);
            cmd.Parameters.AddWithValue("@day", day);
            SqlDataReader myReader = cmd.ExecuteReader();

            ArrayList startTimes = new ArrayList();
            while (myReader.Read())
            {
                string startTime = myReader.GetValue(0).ToString();
                startTimes.Add(startTime);
            }

            myReader.Close();
            con.Close();

            return startTimes;
        }

        public Boolean validateStartTime(string startTime)
        {
            if (startTime.Equals("0000") || startTime.Equals("0100") || startTime.Equals("0200"))
                return true;
            else if (startTime.Equals("0300") || startTime.Equals("0400") || startTime.Equals("0500"))
                return true;
            else if (startTime.Equals("0600") || startTime.Equals("0700") || startTime.Equals("0800"))
                return true;
            else if (startTime.Equals("0900") || startTime.Equals("1000") || startTime.Equals("1100"))
                return true;
            else if (startTime.Equals("1200") || startTime.Equals("1300") || startTime.Equals("1400"))
                return true;
            else if (startTime.Equals("1500") || startTime.Equals("1600") || startTime.Equals("1700"))
                return true;
            else if (startTime.Equals("1800") || startTime.Equals("1900") || startTime.Equals("2000"))
                return true;
            else if (startTime.Equals("2100") || startTime.Equals("2200") || startTime.Equals("2300"))
                return true;
            else if (startTime.Equals("2400"))
                return true;
            else
                return false;
        }

        public string calculateEndTime(string startTime)
        {
            string endTime = "";

            if (startTime.Equals("0000"))
                endTime = "0100";
            else if (startTime.Equals("0100"))
                endTime = "0200";
            else if (startTime.Equals("0200"))
                endTime = "0300";
            else if (startTime.Equals("0300"))
                endTime = "0400";
            else if (startTime.Equals("0400"))
                endTime = "0500";
            else if (startTime.Equals("0500"))
                endTime = "0600";
            else if (startTime.Equals("0600"))
                endTime = "0700";
            else if (startTime.Equals("0700"))
                endTime = "0800";
            else if (startTime.Equals("0800"))
                endTime = "0900";
            else if (startTime.Equals("0900"))
                endTime = "1000";
            else if (startTime.Equals("1000"))
                endTime = "1100";
            else if (startTime.Equals("1100"))
                endTime = "1200";
            else if (startTime.Equals("1200"))
                endTime = "1300";
            else if (startTime.Equals("1300"))
                endTime = "1400";
            else if (startTime.Equals("1400"))
                endTime = "1500";
            else if (startTime.Equals("1500"))
                endTime = "1600";
            else if (startTime.Equals("1600"))
                endTime = "1700";
            else if (startTime.Equals("1700"))
                endTime = "1800";
            else if (startTime.Equals("1800"))
                endTime = "1900";
            else if (startTime.Equals("1900"))
                endTime = "2000";
            else if (startTime.Equals("2000"))
                endTime = "2100";
            else if (startTime.Equals("2100"))
                endTime = "2200";
            else if (startTime.Equals("2200"))
                endTime = "2300";
            else if (startTime.Equals("2300"))
                endTime = "2400";
            else if (startTime.Equals("2400"))
                endTime = "0000";

            return endTime;
        }

        public void addTimeslot(string serviceName, string day, string start_time, string end_time)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strInsert = "INSERT INTO ServiceTime(serviceName, day, start_time, end_time)";
            strInsert += " VALUES(@serviceName, @day, @start_time, @end_time)";
            SqlCommand cmd = new SqlCommand(strInsert, con);

            //System.Diagnostics.Debug.WriteLine(serviceName);
            //System.Diagnostics.Debug.WriteLine(day);
            //System.Diagnostics.Debug.WriteLine(start_time);
            //System.Diagnostics.Debug.WriteLine(end_time);

            cmd.Parameters.AddWithValue("@serviceName", serviceName);
            cmd.Parameters.AddWithValue("@day", day);
            cmd.Parameters.AddWithValue("@start_time", start_time);
            cmd.Parameters.AddWithValue("@end_time", end_time);

            int result = cmd.ExecuteNonQuery();
            con.Close();
        }

        public SqlDataAdapter getDataSetByServiceNameAndDay(string serviceName, string day)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT * FROM ServiceTime WHERE serviceName=@serviceName AND day=@day ORDER BY start_time ASC";
            SqlCommand cmd = new SqlCommand(strSelect, con);

            cmd.Parameters.AddWithValue("@serviceName", serviceName);
            cmd.Parameters.AddWithValue("@day", day);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            return da;
        }

        public void deleteTimeslot(string serviceName, string day, string start_time)
        {
            //System.Diagnostics.Debug.WriteLine(occasion);
            //System.Diagnostics.Debug.WriteLine(date);
            //System.Diagnostics.Debug.WriteLine(orderData);

            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();

            string strInsert = "DELETE FROM ServiceTime WHERE serviceName=@serviceName AND day=@day AND start_time=@start_time";
            SqlCommand cmd = new SqlCommand(strInsert, con);

            cmd.Parameters.AddWithValue("@serviceName", serviceName);
            cmd.Parameters.AddWithValue("@day", day);
            cmd.Parameters.AddWithValue("@start_time", start_time);

            int result = cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}
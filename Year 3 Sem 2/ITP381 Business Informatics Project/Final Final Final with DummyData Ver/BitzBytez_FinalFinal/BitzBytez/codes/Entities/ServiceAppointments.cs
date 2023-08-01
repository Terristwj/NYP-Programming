using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BitzBytez.codes.Entities
{
    public class ServiceAppointments
    {
        //
        // TODO: Add constructor logic here
        //
        private string serviceName, date, price, start_time, duration, additionalInfo, custEmail, staffIncharge;
        private int orderData;

        // Default Constructor
        public ServiceAppointments()
        {

        }

        // Constructor
        public ServiceAppointments(string serviceName, string date, string price, string start_time, string duration, string additionalInfo, string custEmail, string staffIncharge, int orderData)
        {
            this.serviceName = serviceName;
            this.date = date;
            this.price = price;
            this.start_time = start_time;
            this.duration = duration;
            this.additionalInfo = additionalInfo;
            this.custEmail = custEmail;
            this.staffIncharge = staffIncharge;
            this.orderData = orderData;
        }

        // Get
        public string ServiceName()
        {
            return serviceName;
        }
        public string Date()
        {
            return date;
        }
        public string Price()
        {
            return price;
        }
        public string Start_time()
        {
            return start_time;
        }
        public string Duration()
        {
            return duration;
        }
        public string AdditionalInfo()
        {
            return additionalInfo;
        }
        public string CustEmail()
        {
            return custEmail;
        }
        public string StaffIncharge()
        {
            return staffIncharge;
        }
        public int OrderData()
        {
            return orderData;
        }







        // Database related

        public SqlDataAdapter getDataSet(string serviceName)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT * FROM ServiceAppointments WHERE serviceName=@serviceName AND status IS NULL ORDER BY orderData ASC";
            SqlCommand cmd = new SqlCommand(strSelect, con);

            cmd.Parameters.AddWithValue("@serviceName", serviceName);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            return da;
        }
        public SqlDataAdapter getDataSetWithStatus(string serviceName)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT * FROM ServiceAppointments WHERE serviceName=@serviceName AND status IS NOT NULL ORDER BY orderData ASC";
            SqlCommand cmd = new SqlCommand(strSelect, con);

            cmd.Parameters.AddWithValue("@serviceName", serviceName);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            return da;
        }
        public SqlDataAdapter getDataSetBySearch(string serviceName, string value)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT * FROM ServiceAppointments WHERE serviceName=@serviceName AND status IS NULL AND (date LIKE @date OR cust_email LIKE @cust_email) ORDER BY orderData ASC";
            SqlCommand cmd = new SqlCommand(strSelect, con);

            cmd.Parameters.AddWithValue("@serviceName", serviceName);
            cmd.Parameters.AddWithValue("@date", "%" + value + "%");
            cmd.Parameters.AddWithValue("@cust_email", value);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            return da;
        }
        public SqlDataAdapter getDataSetBySearchDateWithStatus(string serviceName, string value)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT * FROM ServiceAppointments WHERE serviceName=@serviceName AND status IS NOT NULL AND date LIKE @date ORDER BY orderData ASC";
            SqlCommand cmd = new SqlCommand(strSelect, con);

            cmd.Parameters.AddWithValue("@serviceName", serviceName);
            cmd.Parameters.AddWithValue("@date", "%" + value + "%");

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            return da;
        }
        public SqlDataAdapter getDataSetBySearchCustWithStatus(string serviceName, string value)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT * FROM ServiceAppointments WHERE serviceName=@serviceName AND status IS NOT NULL AND cust_email LIKE @cust_email ORDER BY orderData ASC";
            SqlCommand cmd = new SqlCommand(strSelect, con);

            cmd.Parameters.AddWithValue("@serviceName", serviceName);
            cmd.Parameters.AddWithValue("@cust_email", value);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            return da;
        }
        public SqlDataAdapter getDataSetByDoubleSearchWithStatus(string serviceName, string date, string cust_email)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT * FROM ServiceAppointments WHERE serviceName=@serviceName AND status IS NOT NULL AND date LIKE @date AND cust_email LIKE @cust_email ORDER BY orderData ASC";
            SqlCommand cmd = new SqlCommand(strSelect, con);

            cmd.Parameters.AddWithValue("@serviceName", serviceName);
            cmd.Parameters.AddWithValue("@date", "%" + date + "%");
            cmd.Parameters.AddWithValue("@cust_email", cust_email);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            return da;
        }
        public SqlDataAdapter getDataSetByDoubleSearch(string serviceName, string date, string cust_email)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT * FROM ServiceAppointments WHERE serviceName=@serviceName AND status IS NULL AND date LIKE @date AND cust_email LIKE @cust_email ORDER BY orderData ASC";
            SqlCommand cmd = new SqlCommand(strSelect, con);

            cmd.Parameters.AddWithValue("@serviceName", serviceName);
            cmd.Parameters.AddWithValue("@date", "%" + date + "%");
            cmd.Parameters.AddWithValue("@cust_email", cust_email);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            return da;
        }
        public SqlDataAdapter getDataSetByCustAndStatus(string serviceName, string cust_email, string status)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT * FROM ServiceAppointments WHERE serviceName=@serviceName AND cust_email LIKE @cust_email AND status=@status ORDER BY orderData ASC";
            SqlCommand cmd = new SqlCommand(strSelect, con);

            cmd.Parameters.AddWithValue("@serviceName", serviceName);
            cmd.Parameters.AddWithValue("@cust_email", cust_email);
            cmd.Parameters.AddWithValue("@status", status);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            return da;
        }

        public SqlDataAdapter getDataSetByCustAndStatusAndDate(string serviceName, string cust_email, string status, string date)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT * FROM ServiceAppointments WHERE serviceName=@serviceName AND cust_email LIKE @cust_email AND status=@status AND date LIKE @date ORDER BY orderData ASC";
            SqlCommand cmd = new SqlCommand(strSelect, con);

            cmd.Parameters.AddWithValue("@serviceName", serviceName);
            cmd.Parameters.AddWithValue("@cust_email", cust_email);
            cmd.Parameters.AddWithValue("@status", status);
            cmd.Parameters.AddWithValue("@date", "%" + date + "%");

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            return da;
        }

        public void addAppointment(string serviceName, string date, string price, string start_time, string duration, string additionalInfo, string cust_email, string staff_incharge, int orderData)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strInsert = "INSERT INTO ServiceAppointments(serviceName, date, price, start_time, duration, additionalInfo, cust_email, staff_incharge, orderData)";
            strInsert += " VALUES(@serviceName, @date, @price, @start_time, @duration, @additionalInfo, @cust_email, @staff_incharge, @orderData)";
            SqlCommand cmd = new SqlCommand(strInsert, con);

            cmd.Parameters.AddWithValue("@serviceName", serviceName);
            cmd.Parameters.AddWithValue("@date", date);
            cmd.Parameters.AddWithValue("@price", price);
            cmd.Parameters.AddWithValue("@start_time", start_time);
            cmd.Parameters.AddWithValue("@duration", duration);
            cmd.Parameters.AddWithValue("@additionalInfo", additionalInfo);
            cmd.Parameters.AddWithValue("@cust_email", cust_email);
            cmd.Parameters.AddWithValue("@staff_incharge", staff_incharge);
            cmd.Parameters.AddWithValue("@orderData", orderData);

            int result = cmd.ExecuteNonQuery();
            con.Close();
        }

        public void updateStatus(string serviceName, string date, string start_time, string cust_email, string status)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strInsert = "UPDATE ServiceAppointments SET status=@status WHERE serviceName=@serviceName AND date=@date AND start_time=@start_time AND cust_email=@cust_email";
            SqlCommand cmd = new SqlCommand(strInsert, con);

            //System.Diagnostics.Debug.WriteLine(name);
            //System.Diagnostics.Debug.WriteLine(price);

            cmd.Parameters.AddWithValue("@status", status);
            cmd.Parameters.AddWithValue("@serviceName", serviceName);
            cmd.Parameters.AddWithValue("@date", date);
            cmd.Parameters.AddWithValue("@start_time", start_time);
            cmd.Parameters.AddWithValue("@cust_email", cust_email);

            int result = cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}
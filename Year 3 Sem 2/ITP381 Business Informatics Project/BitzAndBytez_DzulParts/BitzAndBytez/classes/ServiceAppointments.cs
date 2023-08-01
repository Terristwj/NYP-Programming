﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BitzAndBytez.classes
{
    public class ServiceAppointments
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
        
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
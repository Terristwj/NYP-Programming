using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BitzAndBytez.classes
{
    public class Service
    {
        public string getPrice(string name)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT price FROM Service WHERE name = @name";
            SqlCommand cmd = new SqlCommand(strSelect, con);
            cmd.Parameters.AddWithValue("@name", name);
            SqlDataReader myReader = cmd.ExecuteReader();

            string price = "";
            while (myReader.Read())
            {
                price = myReader.GetValue(0).ToString();
            }

            myReader.Close();
            con.Close();

            return price;
        }

        public void updatePrice(string name, string price)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strInsert = "UPDATE Service SET price=@price WHERE name=@name";
            SqlCommand cmd = new SqlCommand(strInsert, con);

            //System.Diagnostics.Debug.WriteLine(name);
            //System.Diagnostics.Debug.WriteLine(price);

            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@price", price);

            int result = cmd.ExecuteNonQuery();
            con.Close();
        }

        public ArrayList getStaffList()
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT username FROM Account WHERE type=@type ORDER BY username ASC";
            SqlCommand cmd = new SqlCommand(strSelect, con);

            cmd.Parameters.AddWithValue("@type", "staff");

            SqlDataReader myReader = cmd.ExecuteReader();

            ArrayList staffList = new ArrayList();
            while (myReader.Read())
            {
                string staffName = myReader.GetValue(0).ToString();
                staffList.Add(staffName);
            }

            myReader.Close();
            con.Close();

            return staffList;
        }

        public string getStaff(string serviceName)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT staffIncharge FROM Service WHERE name = @serviceName";
            SqlCommand cmd = new SqlCommand(strSelect, con);
            cmd.Parameters.AddWithValue("@serviceName", serviceName);
            SqlDataReader myReader = cmd.ExecuteReader();

            string staffIncharge = "";
            while (myReader.Read())
            {
                staffIncharge = myReader.GetValue(0).ToString();
            }

            myReader.Close();
            con.Close();

            return staffIncharge;
        }

        public void updateStaff(string name, string staffName)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strInsert = "UPDATE Service SET staffIncharge=@staffName WHERE name=@name";
            SqlCommand cmd = new SqlCommand(strInsert, con);

            //System.Diagnostics.Debug.WriteLine(name);
            //System.Diagnostics.Debug.WriteLine(staffName);

            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@staffName", staffName);

            int result = cmd.ExecuteNonQuery();
            con.Close();
        }


    }
}
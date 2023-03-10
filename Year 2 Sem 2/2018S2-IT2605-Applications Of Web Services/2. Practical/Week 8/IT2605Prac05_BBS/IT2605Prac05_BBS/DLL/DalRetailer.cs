using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace IT2605Prac05_BBS.DLL
{
    public class DalRetailer
    {   
        private String errMsg;
        DalDbConn dbConn = new DalDbConn();

        public Boolean isValidUser(String userid, String userpw)
        {
            StringBuilder sql;
            SqlDataAdapter da;
            DataSet retailer_ds = new DataSet();

            SqlConnection conn = dbConn.GetConnection();

            sql = new StringBuilder();
            sql.AppendLine("SELECT userId, userPW ");
            sql.AppendLine("FROM retailer");
            sql.AppendLine("WHERE userId = @paraid");
            sql.AppendLine("AND userPW = @parapw");
            try
            {
                da = new SqlDataAdapter(sql.ToString(), conn);
                da.SelectCommand.Parameters.AddWithValue("@paraid", userid);
                da.SelectCommand.Parameters.AddWithValue("@parapw", userpw);

                da.Fill(retailer_ds);
            }
            catch (Exception ex)
            {
                errMsg = ex.Message;
            }
            finally
            {
                conn.Close();
            }
            // complete the code to return false for the method
            // if no record matched the user id and password in the table. 

            if (retailer_ds.Tables[0].Rows.Count == 0)
                return false;
            else
                return true;
        }
        public Boolean isAppUser(String userid)
        {
            StringBuilder sql;
            SqlDataAdapter da;
            DataSet retailerds = new DataSet();
            SqlConnection conn = dbConn.GetConnection();

            // Complete ccode to formulate SQL command to retrieve record
            // where User role equal to 'appuser' for the particular user id 

            sql = new StringBuilder();
            sql.AppendLine("SELECT * ");
            sql.AppendLine("FROM retailer");
            sql.AppendLine("WHERE userId = @paraid");
            sql.AppendLine("AND userRole = 'appuser'");

            try
            {
                da = new SqlDataAdapter(sql.ToString(), conn);
                da.SelectCommand.Parameters.AddWithValue("@paraid", userid);
                da.Fill(retailerds);
            }
            catch (Exception ex)
            {
                errMsg = ex.Message;
            }
            finally
            {
                conn.Close();
            }
            if (retailerds.Tables[0].Rows.Count == 0)
                return false;
            else
                return true;
        }
    }
}
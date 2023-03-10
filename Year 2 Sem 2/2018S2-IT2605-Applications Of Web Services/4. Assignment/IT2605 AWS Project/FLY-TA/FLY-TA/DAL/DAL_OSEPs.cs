using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace FLY_TA.DAL
{
    public class DAL_OSEPs
    {
        private string errMsg;
        DAL_DbConnection dbConn = new DAL_DbConnection();

        public DataSet GetAll()
        {
            StringBuilder sql;
            SqlDataAdapter da;
            DataSet OSEPsData;

            SqlConnection conn = dbConn.GetConnection();
            OSEPsData = new DataSet();
            sql = new StringBuilder();
            sql.AppendLine("SELECT * FROM OSEP");

            try
            {
                da = new SqlDataAdapter(sql.ToString(), conn);
                da.Fill(OSEPsData);
            }
            catch (Exception ex)
            {
                errMsg = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            return OSEPsData;
        }

        public DataSet GetOSEPDetails(int OSEP_ID)
        {
            StringBuilder sql;
            SqlDataAdapter da;
            DataSet OSEPData;

            SqlConnection conn = dbConn.GetConnection();
            OSEPData = new DataSet();
            sql = new StringBuilder();
            sql.AppendLine("SELECT * FROM OSEP WHERE Id = @paraId");

            try
            {
                da = new SqlDataAdapter(sql.ToString(), conn);
                da.SelectCommand.Parameters.AddWithValue("paraId", OSEP_ID);
                da.Fill(OSEPData);
            }
            catch (Exception ex)
            {
                errMsg = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            return OSEPData;
        }

        public int UpdateOSEP(int OSEP_ID, int noRegistered)
        {
            StringBuilder sql;
            SqlCommand sqlCmd;
            int result;
            result = 0;
            
            SqlConnection conn = dbConn.GetConnection();
            sql = new StringBuilder();
            sql.AppendLine("UPDATE OSEP SET No_Of_Registered = @noRegistered WHERE Id = @Id");
            sqlCmd = new SqlCommand(sql.ToString(), conn);
            sqlCmd.Parameters.AddWithValue("@Id", OSEP_ID);
            sqlCmd.Parameters.AddWithValue("@noRegistered", noRegistered);
            try
            {
                conn.Open();
                result = sqlCmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                errMsg = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            return result;
        }
    }
}
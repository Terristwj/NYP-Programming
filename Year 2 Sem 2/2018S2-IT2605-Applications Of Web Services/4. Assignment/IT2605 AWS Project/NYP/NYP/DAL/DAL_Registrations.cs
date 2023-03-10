using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace NYP.DAL
{
    public class DAL_Registrations
    {
        private string errMsg;
        DAL_DbConnection dbConn = new DAL_DbConnection();

        public DataSet GetAll(int OSEP_ID)
        {
            StringBuilder sql;
            SqlDataAdapter da;
            DataSet RegistrationsData;

            SqlConnection conn = dbConn.GetConnection();
            RegistrationsData = new DataSet();
            sql = new StringBuilder();
            sql.AppendLine("SELECT * FROM Registration WHERE OSEP_ID=" + OSEP_ID);

            try
            {
                da = new SqlDataAdapter(sql.ToString(), conn);
                da.Fill(RegistrationsData);
            }
            catch (Exception ex)
            {
                errMsg = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            return RegistrationsData;
        }
    }
}
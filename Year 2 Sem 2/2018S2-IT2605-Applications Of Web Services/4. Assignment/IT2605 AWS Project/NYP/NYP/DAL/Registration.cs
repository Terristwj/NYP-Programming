using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Web;

namespace NYP.DAL
{
    public class Registration
    {
        private string errMsg;
        DAL_DbConnection dbConn = new DAL_DbConnection();

        [DataMember]
        public int Registration_ID { get; set; }

        [DataMember]
        public string name { get; set; }

        [DataMember]
        public string adminNo { get; set; }

        [DataMember]
        public string course { get; set; }

        [DataMember]
        public string contactNo { get; set; }

        [DataMember]
        public string pemGroup { get; set; }

        [DataMember]
        public string emergency_Person { get; set; }

        [DataMember]
        public string emergency_Contact { get; set; }

        [DataMember]
        public string OSEP_ID { get; set; }

        public DataSet getAll()
        {
            StringBuilder sql;
            SqlDataAdapter da;
            DataSet RegistrationsData;

            SqlConnection conn = dbConn.GetConnection();
            RegistrationsData = new DataSet();
            sql = new StringBuilder();
            sql.AppendLine("SELECT * FROM Registration");

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

        public DataSet getAccountID(string adminNo)
        {
            StringBuilder sql;
            SqlDataAdapter da;
            DataSet RegistrationData;

            SqlConnection conn = dbConn.GetConnection();
            RegistrationData = new DataSet();
            sql = new StringBuilder();
            sql.AppendLine("SELECT Id FROM Registration WHERE Admin_No=@adminNo");

            try
            {
                da = new SqlDataAdapter(sql.ToString(), conn);
                da.SelectCommand.Parameters.AddWithValue("@adminNo", adminNo);
                da.Fill(RegistrationData);
            }
            catch (Exception ex)
            {
                errMsg = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            return RegistrationData;
        }

        public DataSet getAccountName(string userID)
        {
            StringBuilder sql;
            SqlDataAdapter da;
            DataSet RegistrationData;

            SqlConnection conn = dbConn.GetConnection();
            RegistrationData = new DataSet();
            sql = new StringBuilder();
            sql.AppendLine("SELECT Name FROM Registration WHERE Id=@Id");

            try
            {
                da = new SqlDataAdapter(sql.ToString(), conn);
                da.SelectCommand.Parameters.AddWithValue("@Id", userID);
                da.Fill(RegistrationData);
            }
            catch (Exception ex)
            {
                errMsg = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            return RegistrationData;
        }

        public DataSet getOSEP(string userID)
        {
            StringBuilder sql;
            SqlDataAdapter da;
            DataSet RegistrationData;

            SqlConnection conn = dbConn.GetConnection();
            RegistrationData = new DataSet();
            sql = new StringBuilder();
            sql.AppendLine("SELECT OSEP_ID FROM Registration WHERE Id=@Id");

            try
            {
                da = new SqlDataAdapter(sql.ToString(), conn);
                da.SelectCommand.Parameters.AddWithValue("@Id", userID);
                da.Fill(RegistrationData);
            }
            catch (Exception ex)
            {
                errMsg = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            return RegistrationData;
        }

        public void updateOSEP(int OSEP_ID, int userID)
        {
            StringBuilder sql;
            SqlConnection conn = dbConn.GetConnection();
            sql = new StringBuilder();

            try
            {
                if (OSEP_ID == -1)
                {
                    sql.AppendLine("UPDATE Registration SET OSEP_ID = null WHERE Id = @Id ");
                    SqlCommand cmd = new SqlCommand(sql.ToString(), conn);
                    cmd.Parameters.AddWithValue("@Id", userID);

                    conn.Open();
                    int updated = cmd.ExecuteNonQuery();
                }
                else
                {
                    sql.AppendLine("UPDATE Registration SET OSEP_ID = @OSEP_ID WHERE Id = @Id ");
                    SqlCommand cmd = new SqlCommand(sql.ToString(), conn);
                    cmd.Parameters.AddWithValue("@OSEP_ID", OSEP_ID);
                    cmd.Parameters.AddWithValue("@Id", userID);

                    conn.Open();
                    int updated = cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                errMsg = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
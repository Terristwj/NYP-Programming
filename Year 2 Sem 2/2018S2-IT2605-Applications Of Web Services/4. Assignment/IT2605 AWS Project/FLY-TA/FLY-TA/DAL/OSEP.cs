using FLY_TA.DAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;
using System.Data;

namespace FLY_TA
{
    public class OSEP /*OSEP = OverSeas Exchange Program*/
    {
        [DataMember]
        public int OSEP_ID { get; set; }

        [DataMember]
        public string  OSEP_Title { get; set; }

        [DataMember]
        public string Description { get; set; }

        [DataMember]
        public string Duration { get; set; }

        [DataMember]
        public string Accommodation_Type { get; set; }

        [DataMember]
        public int Quota { get; set; }

        [DataMember]
        public int No_Of_Registered { get; set; }

        [DataMember]
        public int Fees { get; set; }

        public void insertOSEP(string title, string description, string duration, string accommodationType, int quota, int fee)
        {
            DAL_DbConnection dbConn = new DAL_DbConnection();
            SqlConnection conn = dbConn.GetConnection();
            conn.Open();

            string ins = "INSERT INTO [OSEP](Title, Description, Duration, Accommodation_Type, Quota, No_Of_Registered, Fees) VALUES(@Title, @Description, @Duration, @Accommodation_Type, @Quota, @No_Of_Registered, @Fees)";
            SqlCommand com = new SqlCommand(ins, conn);

            com.Parameters.AddWithValue("@Title", title);
            com.Parameters.AddWithValue("@Description", description);

            com.Parameters.AddWithValue("@Duration", duration);

            com.Parameters.AddWithValue("@Accommodation_Type", accommodationType);
            com.Parameters.AddWithValue("@Quota", quota);
            com.Parameters.AddWithValue("@No_Of_Registered", 0);
            com.Parameters.AddWithValue("@Fees", fee);

            com.ExecuteNonQuery();
            conn.Close();
        }

        public DataSet BindOSEPList()
        {
            DAL_DbConnection dbConn = new DAL_DbConnection();
            SqlConnection conn = dbConn.GetConnection();
            conn.Open();
            string query = "SELECT Id, Title, Duration, Accommodation_Type, Quota, No_Of_Registered, Fees FROM OSEP";
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "OSEP");
            conn.Close();
            return ds;
        }
    }
}
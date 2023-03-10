using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace NYP.DAL
{
    public class DAL_DbConnection
    {
        public SqlConnection GetConnection()
        {
            SqlConnection dbConn;
            String connString = ConfigurationManager.ConnectionStrings["NYPConnection"].ConnectionString;

            dbConn = new SqlConnection(connString);
            return dbConn;
        }
    }
}
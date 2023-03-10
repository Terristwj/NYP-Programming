using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Text;


namespace RedStoreService.DAL
{
    public class DalSales
    {
        private String errMsg;
        DalDbConn dbConn = new DalDbConn();

        public DataSet GetAllSales()
        {
            StringBuilder sql;
            SqlDataAdapter da;
            DataSet salesData;

            SqlConnection conn = dbConn.GetConnection();
            salesData = new DataSet();
            sql = new StringBuilder();
            sql.AppendLine("SELECT * FROM Sales ");
        
            try
            {
                da = new SqlDataAdapter(sql.ToString(), conn);
                da.Fill(salesData);
            }
            catch (Exception ex)
            {
                errMsg = ex.Message;
            }

            return salesData;
        }

        public DataSet GetSalesByStaff(string StaffId)
        {
            StringBuilder sql;
            SqlDataAdapter da;
            DataSet salesData;

            SqlConnection conn = dbConn.GetConnection();
            salesData = new DataSet();
            sql = new StringBuilder();
            sql.AppendLine("SELECT StaffId, StaffName, StoreLoc, YTDSales FROM Sales sa INNER JOIN Store st ON sa.StoreId=st.StoreId WHERE StaffId=@StaffId ");

            try
            {
                da = new SqlDataAdapter(sql.ToString(), conn);
                da.SelectCommand.Parameters.AddWithValue("@StaffId", StaffId);
                da.Fill(salesData);
            }
            catch (Exception ex)
            {
                errMsg = ex.Message;
            }

            return salesData;
        }

    }
}
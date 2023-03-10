using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace IT2605Prac05_BBS.DAL
{
    public class DalOrders
    {
        private String errMsg;
        DalDbConn dbConn = new DalDbConn();
       
        public int CreateOrder(String customerid, List<Order> obj )
        {
            StringBuilder sql;
            SqlCommand sqlCmd;
            int result = 0;
            int newOrderId = 0;
            // create order header
            SqlConnection conn = dbConn.GetConnection();
            sql = new StringBuilder();
            sql.AppendLine("insert into orders (orderDate,custId,orderStatus)");

            sql.AppendLine("VALUES (@paraordate, @paraordcust, @paraordstatus)");
            sql.AppendLine("SELECT CAST(scope_identity() AS int)");
            sql.AppendLine(" ");
            sqlCmd = new SqlCommand(sql.ToString(), conn);
            sqlCmd.Parameters.AddWithValue("@paraordate", DateTime.Now);
            sqlCmd.Parameters.AddWithValue("@paraordcust", customerid);
            sqlCmd.Parameters.AddWithValue("@paraordstatus", "PO");
           try
           {
               conn.Open();
               newOrderId = (Int32)sqlCmd.ExecuteScalar();  // ExecuteScalar return 1st column of the record
                
               StringBuilder sqlItem ;
             
               
               foreach (Order objitem in obj)
               {
                   sqlItem = new StringBuilder();
                   sqlItem.AppendLine("insert into orderItem (orderId, isbn, orderQty)");
                   sqlItem.AppendLine("VALUES (@paraordId, @paraisbn, @paraordqty)");
                   sqlItem.AppendLine(" ");
                   sqlCmd = new SqlCommand(sqlItem.ToString(), conn);
                   sqlCmd.Parameters.AddWithValue("@paraordId", newOrderId);
                   sqlCmd.Parameters.AddWithValue("@paraisbn", objitem.ordBookisbn);
                   sqlCmd.Parameters.AddWithValue("@paraordqty", objitem.ordBookQty);
                   result = sqlCmd.ExecuteNonQuery();  // ExecuteNonQuery return number of rows affected
                 
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
           return result;
        }
       
   }

}
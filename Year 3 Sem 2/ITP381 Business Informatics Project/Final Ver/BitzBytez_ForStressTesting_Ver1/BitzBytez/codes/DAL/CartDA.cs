using BitzBytez.codes.Entities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BitzBytez.codes.DAL
{
    public class CartDA
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

        public static List<CartItem> getCartItemDetails(int cartID)
        {
            List<CartItem> items = new List<CartItem>();

            string queryStr = "SELECT ci.cartItemID, pcc.comboID, ci.quantity, ci.photoURL, CONCAT(p.prodName, ' - ', pc1.config, ' ', pc2.config, ' ', pc3.config, ' ', pc4.config) as itemName, " +
                                "pcc.price, pcc.quantity as qtyLeft FROM Cart c " +

                                "INNER JOIN CartItem ci ON c.cartID = ci.cartID " +

                                "INNER JOIN ProductConfigCombo pcc ON pcc.comboID = ci.comboID " +

                                "INNER JOIN Product p ON pcc.prodID = p.prodID " +

                                "LEFT JOIN ProductConfiguration pc1 ON pc1.configID = pcc.config1 " +

                                "LEFT JOIN ProductConfiguration pc2 on pc2.configID = pcc.config2 " +

                                "LEFT JOIN ProductConfiguration pc3 on pc3.configID = pcc.config3 " +

                                "LEFT JOIN ProductConfiguration pc4 on pc4.configID = pcc.config4 " +

                                "WHERE ci.cartID = @cid; ";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@cid", cartID);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                items.Add(new CartItem(int.Parse(dr["cartItemID"].ToString()), int.Parse(dr["comboID"].ToString()), int.Parse(dr["qtyLeft"].ToString()), dr["photoURL"].ToString(), dr["itemName"].ToString(), double.Parse(dr["price"].ToString()), int.Parse(dr["quantity"].ToString())));
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return items;
        }

        public static int updateCartItemQuantity(int cartItemID, int qty)
        {
            String queryStr = "UPDATE CartItem SET quantity = @q WHERE cartItemID = @cid";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@q", qty);
            cmd.Parameters.AddWithValue("@cid", cartItemID);

            conn.Open();
            int result = cmd.ExecuteNonQuery();
            conn.Close();

            return result;
        }

        public static int addItemToCart(int cartID, int comboID, int qty, string url)
        {
            if (!itemIsAdded(cartID, comboID))
            {
                String queryStr = "INSERT INTO CartItem (cartID, comboID, quantity, photoURL) VALUES (@cid, @comboid, @qty, @url)";

                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand(queryStr, conn);
                cmd.Parameters.AddWithValue("@cid", cartID);
                cmd.Parameters.AddWithValue("@comboid", comboID);
                cmd.Parameters.AddWithValue("@qty", qty);
                cmd.Parameters.AddWithValue("@url", url);

                conn.Open();
                int result = cmd.ExecuteNonQuery();
                conn.Close();

                return result;

            }
            else
            {
                String queryStr = "UPDATE CartItem SET quantity = quantity + @q WHERE comboID = @cid AND cartID = @cartID";

                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand(queryStr, conn);
                cmd.Parameters.AddWithValue("@q", qty);
                cmd.Parameters.AddWithValue("@cid", comboID);
                cmd.Parameters.AddWithValue("@cartID", cartID);

                conn.Open();
                int result = cmd.ExecuteNonQuery();
                conn.Close();

                return result;

            }
        }

        public static Boolean itemIsAdded(int cartID, int comboID)
        {
            String queryStr = "SELECT COUNT(*) FROM CartItem WHERE cartID = @cid AND comboID = @comboid";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@cid", cartID);
            cmd.Parameters.AddWithValue("@comboid", comboID);

            conn.Open();
            int result = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();

            if (result > 0)
            {
                return true;
            }

            return false;
        }

        public static int removeItemFromCart(int cartItemID)
        {
            String queryStr = "DELETE FROM CartItem WHERE cartItemID = @cid;";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@cid", cartItemID);

            conn.Open();
            int result = cmd.ExecuteNonQuery();
            conn.Close();

            return result;
        }

        public static int addNewCart(int accountID)
        {
            String queryStr = "INSERT INTO Cart (accountID, status) VALUES (@aid, 'pending'); SELECT SCOPE_IDENTITY()";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@aid", accountID);

            conn.Open();
            int result = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();

            return result;
        }

        public static int checkForPendingCart(int accountID)
        {
            String queryStr = "SELECT COUNT(*) FROM Cart WHERE accountID = @aid AND status = 'pending'";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@aid", accountID);

            conn.Open();
            int result = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();

            return result;
        }

        public static int updateCartStatus(int cartID, string status)
        {
            String queryStr = "UPDATE Cart SET status = @stat WHERE cartID = @cid";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@cid", cartID);
            cmd.Parameters.AddWithValue("@stat", status);

            conn.Open();
            int result = cmd.ExecuteNonQuery();
            conn.Close();

            return result;
        }

        public static int getPendingCartID(int accountID)
        {
            String queryStr = "SELECT cartID FROM Cart WHERE accountID = @aid AND status = 'pending'";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@aid", accountID);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            int id = 0;

            if (dr.Read())
            {
                id = int.Parse(dr["cartID"].ToString());
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return id;
        }

        public static List<int> getPaidCartIDs(int accountID, string date)
        {
            List<int> ids = new List<int>();

            String queryStr = "SELECT cartID FROM Cart WHERE status = 'paid' AND accountID = @aid AND datePaid = '" + date + "'";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@aid", accountID);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                ids.Add(int.Parse(dr["cartID"].ToString()));
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return ids;
        }

        public static int getItemStockLevel(int pccID)
        {
            String queryStr = "SELECT quantity FROM ProductConfigCombo WHERE comboID = @id";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@id", pccID);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            int stockLevel = 0;

            if (dr.Read())
            {
                stockLevel = int.Parse(dr["quantity"].ToString());
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return stockLevel;
        }

        public static List<string> getPaidDates(int accountID)
        {
            String queryStr = "SELECT datePaid FROM Cart WHERE accountID = @aid AND status = 'paid'";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@aid", accountID);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            List<string> paidDates = new List<string>();

            while (dr.Read())
            {
                paidDates.Add(DateTime.Parse(dr["datePaid"].ToString()).ToShortDateString());
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return paidDates;
        }

        public static List<int> getPaidCarts(int accountID, string date)
        {
            String queryStr = "SELECT cartID FROM Cart WHERE accountID = @aid AND status = 'paid' AND datePaid = '" + date + "'";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@aid", accountID);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            List<int> cartIDs = new List<int>();

            while (dr.Read())
            {
                cartIDs.Add(int.Parse(dr["cartID"].ToString()));
            }

            conn.Close();
            dr.Close();
            dr.Dispose();
            
            return cartIDs;
        }
    }
}
using BitzBytez.codes.Entities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BitzBytez.codes.DAL
{
    public class ShippingAddressDA
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

        public static List<ShippingAddress> getAllAddresses(int customerID)
        {
            List<ShippingAddress> addresses = new List<ShippingAddress>();
            string queryStr = "SELECT * FROM ShippingAddress WHERE customerID = @cid;";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@cid", customerID);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                ShippingAddress address =
                    new ShippingAddress(
                            int.Parse(dr["id"].ToString()),
                            int.Parse(dr["customerID"].ToString()),

                            int.Parse(dr["postalCode"].ToString()),
                            dr["addressLine1"].ToString(),
                            null,
                            dr["country"].ToString(),
                            dr["fullName"].ToString(),
                            null,
                            null
                        );

                if (dr["addressLine2"] != null)
                {
                    address.AddressLine2 = dr["addressLine2"].ToString();
                }

                if (dr["stateProvinceRegion"] != null)
                {
                    address.StateProvinceRegion = dr["stateProvinceRegion"].ToString();
                }

                if (dr["city"] != null)
                {
                    address.City = dr["city"].ToString();
                }

                addresses.Add(address);
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return addresses;
        }


        public static int addShippingAddress(int customerID, ShippingAddress a)
        {
            string queryStr = "INSERT INTO ShippingAddress (customerID, fullName, addressLine1, addressLine2, city, stateProvinceRegion, postalCode, country) VALUES (@cid, @f, @a1, @a2, @city, @srp, @pc, @country);";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            
            cmd.Parameters.AddWithValue("@cid", customerID);
            cmd.Parameters.AddWithValue("@f", a.FullName);
            cmd.Parameters.AddWithValue("@a1", a.AddressLine1);

            if (a.AddressLine2 != null)
            {
                cmd.Parameters.AddWithValue("@a2", a.AddressLine2);
            } else
            {
                cmd.Parameters.AddWithValue("@a2", DBNull.Value);
            }
            
            if (a.City != null)
            {
                cmd.Parameters.AddWithValue("@city", null);
            } else
            {
                cmd.Parameters.AddWithValue("@city", DBNull.Value);
            }
            
            if (a.StateProvinceRegion != null)
            {
                cmd.Parameters.AddWithValue("@srp", a.StateProvinceRegion);
            } else
            {
                cmd.Parameters.AddWithValue("@srp", DBNull.Value);
            }
            
            cmd.Parameters.AddWithValue("@pc", a.PostalCode);
            cmd.Parameters.AddWithValue("@country", a.Country);
            conn.Open();

            int newId = cmd.ExecuteNonQuery();

            conn.Close();

            return newId;
        }

        public static ShippingAddress getShippingAddressFromOrder(int cartID)
        {
            ShippingAddress address = null;
            string queryStr = "SELECT * FROM ShippingAddress WHERE id in (SELECT shippingAddress FROM Cart WHERE cartID = @cid);";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@cid", cartID);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                address =
                    new ShippingAddress(
                            int.Parse(dr["id"].ToString()),
                            int.Parse(dr["customerID"].ToString()),

                            int.Parse(dr["postalCode"].ToString()),
                            dr["addressLine1"].ToString(),
                            null,
                            dr["country"].ToString(),
                            dr["fullName"].ToString(),
                            null,
                            null
                        );

                if (dr["addressLine2"] != null)
                {
                    address.AddressLine2 = dr["addressLine2"].ToString();
                }

                if (dr["stateProvinceRegion"] != null)
                {
                    address.StateProvinceRegion = dr["stateProvinceRegion"].ToString();
                }

                if (dr["city"] != null)
                {
                    address.City = dr["city"].ToString();
                }

                
            }

            conn.Close();
            dr.Close();
            dr.Dispose();
            
            return address;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace BitzAndBytez.classes
{
    public class Account
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
        private static string hash = "f0xle@rn";
        private int id;
        private string email, username, type, role;

        public Account(int id, string email, string username, string type)
        {
            this.Id = id;
            this.Email = email;
            this.Username = username;
            this.Type = type;
        }

        public string Username
        {
            get
            {
                return username;
            }

            set
            {
                username = value;
            }
        }

        public string Email
        {
            get
            {
                return email;
            }

            set
            {
                email = value;
            }
        }

        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        public string Type
        {
            get
            {
                return type;
            }

            set
            {
                type = value;
            }
        }

        public string Role
        {
            get
            {
                return role;
            }

            set
            {
                role = value;
            }
        }

        public static int addUser(string username, string email, string password)
        {
            string ePassword = encryptPassword(password);
            SqlConnection con = new SqlConnection(connStr);

            string cmdtxt = "INSERT INTO Account(email, username, password, type) VALUES (@e, @u, @p, 'customer')";

            SqlCommand cmd = new SqlCommand(cmdtxt, con);
            cmd.Parameters.AddWithValue("@e", email);
            cmd.Parameters.AddWithValue("@u", username);
            cmd.Parameters.AddWithValue("@p", ePassword);

            con.Open();

            int result = cmd.ExecuteNonQuery();

            con.Close();

            return result;
        }

        private static string encryptPassword(string password)
        {
            byte[] data = UTF8Encoding.UTF8.GetBytes(password);
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                byte[] keys = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash));
                using (TripleDESCryptoServiceProvider tripDes = new TripleDESCryptoServiceProvider() { Key = keys, Mode = CipherMode.ECB, Padding = PaddingMode.PKCS7 })
                {
                    ICryptoTransform transform = tripDes.CreateEncryptor();
                    byte[] results = transform.TransformFinalBlock(data, 0, data.Length);
                    return Convert.ToBase64String(results, 0, results.Length);
                }
            }

        }

        public static string decryptPassword(string epassword)
        {
            byte[] data = Convert.FromBase64String(epassword);
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                byte[] keys = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash));
                using (TripleDESCryptoServiceProvider tripDes = new TripleDESCryptoServiceProvider() { Key = keys, Mode = CipherMode.ECB, Padding = PaddingMode.PKCS7 })
                {
                    ICryptoTransform transform = tripDes.CreateDecryptor();
                    byte[] results = transform.TransformFinalBlock(data, 0, data.Length);
                    return UTF8Encoding.UTF8.GetString(results);
                }
            }
        }

        public static Account getAccount(string email)
        {
            Account account = null;

            string queryStr = "SELECT * FROM Account WHERE email = @e";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@e", email);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                account = new Account(int.Parse(dr["id"].ToString()), dr["email"].ToString(), dr["username"].ToString(), dr["type"].ToString());
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return account;
        }

        public static Account getStaffAccount(string email)
        {
            Account account = null;

            string queryStr = "SELECT * FROM Account WHERE email = @e";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@e", email);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                account = new Account(int.Parse(dr["id"].ToString()), dr["email"].ToString(), dr["username"].ToString(), dr["type"].ToString());
                account.Role = dr["role"].ToString();
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return account;
        }

        public static Boolean staffIsVerified(string email)
        {

            string queryStr = "SELECT COUNT(*) FROM Account WHERE email = @e and type LIKE 'staff'; SELECT SCOPE_IDENTITY();";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@e", email);
            conn.Open();

            int result = Convert.ToInt32(cmd.ExecuteScalar());

            conn.Close();

            if (result > 0)
            {
                return true;
            }

            return false;
        }

        public static Boolean userVerified(string email, string password)
        {
            string queryStr = "SELECT password FROM Account WHERE email = @e";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@e", email);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            string retrievedPassword = "";

            if (dr.Read())
            {
                retrievedPassword = dr["password"].ToString();
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            if (retrievedPassword == encryptPassword(password))
            {
                return true;
            }

            return false;
        }

    }
}
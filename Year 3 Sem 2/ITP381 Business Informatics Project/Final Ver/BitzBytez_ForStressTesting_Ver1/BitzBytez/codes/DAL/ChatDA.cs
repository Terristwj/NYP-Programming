 using BitzBytez.codes.Entities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BitzBytez.codes.DAL
{
    public class ChatDA
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

        public static int createConvo(int accountID, int officerID)
        {
            string queryStr = "INSERT INTO Conversation (senderID, officerID) VALUES (@s, @o); SELECT SCOPE_IDENTITY()";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@s", accountID);
            cmd.Parameters.AddWithValue("@o", officerID);
            conn.Open();

            int result = Convert.ToInt32(cmd.ExecuteScalar());

            conn.Close();

            return result;
        }

        public static int insertMessage(int convoID, int senderID, int recipientID, string msg)
        {
            string queryStr = "INSERT INTO Message (convoID, senderID, content, dateTimeCreated) VALUES (@cid, @s, @c, @dtc);";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@cid", convoID);
            cmd.Parameters.AddWithValue("@s", senderID);
            cmd.Parameters.AddWithValue("@r", recipientID);
            cmd.Parameters.AddWithValue("@c", msg);

            string dtc = String.Format("{0:F}", DateTime.Now.ToString());
            cmd.Parameters.AddWithValue("@dtc", dtc);

            conn.Open();

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        public static List<Message> getMessages(int convoID)
        {
            List<Message> msgs = new List<Message>();

            string queryStr = "SELECT * FROM Message WHERE convoID = @id;";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@id", convoID);
            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                msgs.Add(new Message(int.Parse(dr["msgID"].ToString()), int.Parse(dr["convoID"].ToString()), int.Parse(dr["senderID"].ToString()), 0, dr["content"].ToString(), dr["dateTimeCreated"].ToString()));
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            conn.Close();

            return msgs;
        }

        public static int getNoOfMessages(int convoID)
        {
            string queryStr = "SELECT COUNT(*) FROM Message WHERE convoID = @id;";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@id", convoID);
            conn.Open();

            int count = Convert.ToInt32(cmd.ExecuteScalar());

            conn.Close();

            return count;
        }

        public static int getConvoID(string ID)
        {
            return 0;
        }

        public static int createCSRequest(int requestorID, string reqName, string salutation, string issueDesc)
        {
            string queryStr = "INSERT INTO ChatSupportRequest (requestorID, requestorName, salutation, issueDescription, status, dateTimeCreated) VALUES (@rid, @r, @s, @i, 'pending', @dtc); SELECT SCOPE_IDENTITY()";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@rid", requestorID);
            cmd.Parameters.AddWithValue("@r", reqName);
            cmd.Parameters.AddWithValue("@s", salutation);
            cmd.Parameters.AddWithValue("@i", issueDesc);

            string dtc = String.Format("{0:F}", DateTime.Now.ToString());
            
            cmd.Parameters.AddWithValue("@dtc", dtc);
            conn.Open();

            int id = Convert.ToInt32(cmd.ExecuteScalar());

            conn.Close();

            return id;
        }

        public static List<ChatSupportRequest> getAllCSRequests()
        {
            List<ChatSupportRequest> reqs = new List<ChatSupportRequest>();

            string queryStr = "SELECT * FROM ChatSupportRequest ORDER BY id DESC";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                int convoID = 0;
                if (dr["convoID"] != DBNull.Value)
                {
                    convoID = int.Parse(dr["convoID"].ToString());
                }

                reqs.Add(new ChatSupportRequest
                    (
                    int.Parse(dr["id"].ToString()),
                    int.Parse(dr["requestorID"].ToString()),
                    dr["requestorName"].ToString(),
                    dr["salutation"].ToString(),
                    dr["issueDescription"].ToString(),
                    convoID,
                    dr["status"].ToString(),
                    dr["dateTimeCreated"].ToString()
                    )
                );
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            conn.Close();

            return reqs;
        }

        public static int getNoOfCSRequests()
        {
            int count = 0;

            string queryStr = "SELECT COUNT(*) FROM ChatSupportRequest";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            conn.Open();

            count = Convert.ToInt32(cmd.ExecuteScalar());

            conn.Close();
            
            return count;
        }

        public static int updateCSRequest(int convoID, string status, int CSRequestID)
        {
            string queryStr = "UPDATE ChatSupportRequest SET convoID = @c, status = @s WHERE id = @id;";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@c", convoID);
            cmd.Parameters.AddWithValue("@s", status);
            cmd.Parameters.AddWithValue("@id", CSRequestID);
            conn.Open();

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        public static ChatSupportRequest getCSRequestDetails(int reqID)
        {
            ChatSupportRequest req = null;

            string queryStr = "SELECT * FROM ChatSupportRequest WHERE id = @ID";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@ID", reqID);
            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                int convoID = 0;
                if (dr["convoID"] != DBNull.Value)
                {
                    convoID = int.Parse(dr["convoID"].ToString());
                }
                req = new ChatSupportRequest(
                    int.Parse(dr["id"].ToString()),
                    int.Parse(dr["requestorID"].ToString()),
                    dr["requestorName"].ToString(),
                    dr["salutation"].ToString(),
                    dr["issueDescription"].ToString(),
                    convoID,
                    dr["status"].ToString(),
                    dr["dateTimeCreated"].ToString()
                    );
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            conn.Close();

            return req;
        }
    }
}
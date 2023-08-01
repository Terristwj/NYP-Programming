using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BitzAndBytez.classes
{
    public class CreditCard
    {
        public SqlDataAdapter getDataSet(string custEmail)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strSelect = "SELECT * FROM CreditCard WHERE custEmail=@custEmail";
            SqlCommand cmd = new SqlCommand(strSelect, con);

            cmd.Parameters.AddWithValue("@custEmail", custEmail);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            return da;
        }

        public void deleteCreditCard(string cardNumber, string custEmail)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string delete = "DELETE CreditCard WHERE cardNumber=@cardNumber AND custEmail=@custEmail";
            SqlCommand cmd = new SqlCommand(delete, con);

            cmd.Parameters.AddWithValue("@cardNumber", cardNumber);
            cmd.Parameters.AddWithValue("@custEmail", custEmail);

            int result = cmd.ExecuteNonQuery();
            con.Close();
        }

        public void addCreditCard(string cardNumber, string cardType, string expires, string country, string firstName, string lastName, string cardImageUrl, string custEmail)
        {
            string conn = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string strInsert = "INSERT INTO CreditCard(cardNumber, cardType, expires, country, firstName, lastName, cardImageUrl, custEmail)";
            strInsert += " VALUES(@cardNumber, @cardType, @expires, @country, @firstName, @lastName, @cardImageUrl, @custEmail)";
            SqlCommand cmd = new SqlCommand(strInsert, con);

            cmd.Parameters.AddWithValue("@cardNumber", cardNumber);
            cmd.Parameters.AddWithValue("@cardType", cardType);
            cmd.Parameters.AddWithValue("@expires", expires);
            cmd.Parameters.AddWithValue("@country", country);
            cmd.Parameters.AddWithValue("@firstName", firstName);
            cmd.Parameters.AddWithValue("@lastName", lastName);
            cmd.Parameters.AddWithValue("@cardImageUrl", cardImageUrl);
            cmd.Parameters.AddWithValue("@custEmail", custEmail);

            int result = cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}
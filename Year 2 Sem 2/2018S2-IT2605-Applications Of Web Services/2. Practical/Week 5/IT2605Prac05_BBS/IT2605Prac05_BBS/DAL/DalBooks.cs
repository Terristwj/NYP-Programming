using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
namespace IT2605Prac05_BBS.DAL
{
    public class DalBooks
    {
        private String errMsg;
        DalDbConn dbConn = new DalDbConn();

        public DataSet GetBookDetails(int bookId)
        {
            StringBuilder sql;
            SqlDataAdapter da;
            DataSet booksData;

            SqlConnection conn = dbConn.GetConnection();
            booksData = new DataSet();
            sql = new StringBuilder();
            sql.AppendLine("SELECT b.*, a.firstName, a.lastName, p.name, i.filename");
            sql.AppendLine("FROM books b");
            sql.AppendLine("INNER JOIN author a ON a.id = b.authorId");
            sql.AppendLine("INNER JOIN publisher p ON p.id = b.publisherId");
            sql.AppendLine("LEFT OUTER JOIN images i ON i.id = b.bookCoverId");
            sql.AppendLine("WHERE b.id = @paraid");

            try
            {
                da = new SqlDataAdapter(sql.ToString(), conn);
                da.SelectCommand.Parameters.AddWithValue("paraid", bookId);
                da.Fill(booksData);
            }
            catch (Exception ex)
            {
                errMsg = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            return booksData;
        }

        public DataSet GetAll()
        {
            StringBuilder sql;
            SqlDataAdapter da;
            DataSet booksData;

            SqlConnection conn = dbConn.GetConnection();
            booksData = new DataSet();
            sql = new StringBuilder();
            sql.AppendLine("SELECT b.*, a.firstName, a.lastName, p.name, i.filename");
            sql.AppendLine("FROM books b");
            sql.AppendLine("INNER JOIN author a ON a.id = b.authorId");
            sql.AppendLine("INNER JOIN publisher p ON p.id = b.publisherId");
            sql.AppendLine("LEFT OUTER JOIN images i ON i.id = b.bookCoverId");

            try
            {
                da = new SqlDataAdapter(sql.ToString(), conn);
                da.Fill(booksData);
            }
            catch (Exception ex)
            {
                errMsg = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            return booksData;
        }


        public int InsertBook(String title, String author, String publisher, String isbn, Double price, Double rrp)
        {
            
            StringBuilder sql;
            SqlCommand sqlCmd;
            int result;

            result = 0;
             
            sql = new StringBuilder();
            sql.AppendLine("INSERT INTO books (title, author, publisher, isbn, price, rrp)");
            sql.AppendLine(" "); 
            sql.AppendLine("VALUES (@title, @author, @publisher, @isbn, @price, @rrp)");
            SqlConnection conn = dbConn.GetConnection();
            try
            {
                sqlCmd = new SqlCommand(sql.ToString(), conn);
                sqlCmd.Parameters.AddWithValue("@title", title);
                sqlCmd.Parameters.AddWithValue("@author", author);
                sqlCmd.Parameters.AddWithValue("@publisher", publisher);
                sqlCmd.Parameters.AddWithValue("@isbn", isbn);
                sqlCmd.Parameters.AddWithValue("@price", price);
                sqlCmd.Parameters.AddWithValue("@rrp", rrp);
                result = sqlCmd.ExecuteNonQuery();
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


        public int UpdateBook(int id, String title, String author, String publisher, String isbn, Double price, Double rrp)
        {
           
            StringBuilder sql;
            SqlCommand sqlCmd;
            int result;

            result = 0;

             
            sql = new StringBuilder();
            sql.AppendLine("UPDATE books");
            sql.AppendLine(" ");    
            sql.AppendLine("SET title=@title, author=@author, publisher=@publisher, isbn=@isbn, price=@price, rrp=@rrp");
            sql.AppendLine(" "); 
            sql.AppendLine("WHERE id=@id");
            SqlConnection conn = dbConn.GetConnection();
            try
            {
                sqlCmd = new SqlCommand(sql.ToString(), conn);
                sqlCmd.Parameters.AddWithValue("@id", id);
                sqlCmd.Parameters.AddWithValue("@title", title);
                sqlCmd.Parameters.AddWithValue("@author", author);
                sqlCmd.Parameters.AddWithValue("@publisher", publisher);
                sqlCmd.Parameters.AddWithValue("@isbn", isbn);
                sqlCmd.Parameters.AddWithValue("@price", price);
                sqlCmd.Parameters.AddWithValue("@rrp", rrp);
                result = sqlCmd.ExecuteNonQuery();
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

        public int DeleteBook(int id)
        {
            
            StringBuilder sql;
            SqlCommand sqlCmd;
            int result;

            result = 0;

         
            sql = new StringBuilder();
            sql.AppendLine("DELETE FROM books");
            sql.AppendLine(" "); 
            sql.AppendLine("WHERE id=@id");
            SqlConnection conn = dbConn.GetConnection();
            try
            {
                conn.Open();
                sqlCmd = new SqlCommand(sql.ToString(), conn);
                sqlCmd.Parameters.AddWithValue("@id", id);
                result = sqlCmd.ExecuteNonQuery();
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
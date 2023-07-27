using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer
{
    public class Product
    {
        private string _connStr = Properties.Settings.Default.DBConnStr;
        private decimal _prodID = 0;
        private string _prodName = string.Empty;
        private string _prodDesc = ""; // this is another way to specify empty string
        private decimal _unitPrice = 0;
        private string _prodImage = "";
        private int _stockLevel = 0;
        private string _isbn = string.Empty;
        private int _reorderPts = 0;
        private int _reorderQty = 0;
        private string _reorderStatus = string.Empty;

        // Default constructor
        public Product()
        {
        }

        // Constructor that take in all data required to build a Product object
        public Product(decimal prodID, string prodName, string prodDesc,
                       decimal unitPrice, string prodImage, int stockLevel, 
                       string isbn, int reorderPts, int reorderQty, string reorderStatus)
        {
            _prodID = prodID;
            _prodName = prodName;
            _prodDesc = prodDesc;
            _unitPrice = unitPrice;
            _prodImage = prodImage;
            _stockLevel = stockLevel;
            _isbn = isbn;
            _reorderPts = reorderPts;
            _reorderQty= reorderQty;
            _reorderStatus = reorderStatus;
        }

        // Constructor that take in all except product ID
        public Product(string prodName, string prodDesc,
               decimal unitPrice, string prodImage, int stockLevel, string isbn ,
               int reorderPts, int reorderQty, string reorderStatus)
            : this(0, prodName, prodDesc, unitPrice, prodImage, stockLevel, isbn,
                  reorderPts, reorderQty, reorderStatus)
        {
        }

        // Constructor that take in only Product ID. The other attributes will be set to 0 or empty.
        public Product(decimal prodID)
            : this(prodID, "", "", 0, "", 0,"", 0, 0,"")
        {
        }
        // Constructor that take in only Product ISBN. The other attributes will be set to 0 or empty.

        // Get/Set the attributes of the Product object.
        // Note the attribute name (e.g. Product_ID) is same as the actual database field name.
        // This is for ease of referencing.
        public decimal Product_ID
        {
            get { return _prodID; }
            set { _prodID = value; }
        }
        public string Product_Name
        {
            get { return _prodName; }
            set { _prodName = value; }
        }
        public string Product_Desc
        {
            get { return _prodDesc; }
            set { _prodDesc = value; }
        }
        public decimal Unit_Price
        {
            get { return _unitPrice; }
            set { _unitPrice = value; }
        }
        public string Product_Image
        {
            get { return _prodImage; }
            set { _prodImage = value; }
        }
        public int Stock_Level
        {
            get { return _stockLevel; }
            set { _stockLevel = value; }
        }
        public string Product_ISBN
        {
            get { return _isbn; }
            set { _isbn = value; }
        }
        public int Reorder_Point
        {
            get { return _reorderPts; }
            set { _reorderPts = value; }
        }
        public int Reorder_Qty
        {
            get { return _reorderQty; }
            set { _reorderQty = value; }
        }
        public string Reorder_Status
        {
            get { return _reorderStatus; }
            set { _reorderStatus = value; }
        }

        /// <summary>
        /// This method retrieve details of the product from database table Product.
        /// It return a Product object.
        /// </summary>
        /// <param name="prodID">Product ID</param>
        /// <returns></returns>
        public Product getProduct(decimal prodID)
        {
            Product prodDetail = null;

            string prod_Name, prod_Desc, Prod_Image,isbn;
            decimal unit_Price;
            int stock_Level;
            int reorder_Pts;
            int reorder_Qty;
            String reorder_Status;

            string queryStr = "SELECT * FROM Product WHERE Product_ID = @ProdID";
     
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@ProdID", prodID);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                prod_Name = dr["Product_Name"].ToString();
                prod_Desc = dr["Product_Desc"].ToString();
                Prod_Image = dr["Product_Image"].ToString();
                unit_Price = decimal.Parse(dr["Unit_Price"].ToString());
                stock_Level = int.Parse(dr["Stock_Level"].ToString());
                isbn = dr["ISBN"].ToString();
                reorder_Pts = int.Parse(dr["ReorderPts"].ToString());
                reorder_Qty = int.Parse(dr["ReorderQty"].ToString());
                reorder_Status = dr["ReorderStatus"].ToString();
                prodDetail = new Product(prodID, prod_Name, prod_Desc, unit_Price, Prod_Image, stock_Level, isbn, reorder_Pts, reorder_Qty, reorder_Status);
            }
            else
            {
                prodDetail = null;
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return prodDetail;
        }

       /// <summary>
        /// This method retrieval all products from Product database table.
        /// The Product object is stored in a list and return to calling program.
        /// </summary>
        /// <returns></returns>
        public List<Product> getProductAll()
        {
            List<Product> prodAll = new List<Product>();

            string prod_Name, prod_Desc, Prod_Image,isbn;
            decimal prod_ID, unit_Price;
            int stock_Level;
            int reorder_Pts;
            int reorder_Qty;
            String reorder_Status;

            string queryStr = "SELECT * FROM Product Order By Product_Name";

            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                prod_ID = decimal.Parse(dr["Product_ID"].ToString());
                prod_Name = dr["Product_Name"].ToString();
                prod_Desc = dr["Product_Desc"].ToString();
                Prod_Image = dr["Product_Image"].ToString();
                unit_Price = decimal.Parse(dr["Unit_Price"].ToString());
                stock_Level = int.Parse(dr["Stock_Level"].ToString());
                isbn = dr["ISBN"].ToString();
                reorder_Pts = int.Parse(dr["ReorderPts"].ToString());
                reorder_Qty = int.Parse(dr["ReorderQty"].ToString());
                reorder_Status = dr["ReorderStatus"].ToString();

                prodAll.Add(new Product(prod_ID, prod_Name, prod_Desc, unit_Price, Prod_Image, stock_Level,isbn,reorder_Pts, reorder_Qty, reorder_Status));
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return prodAll;
        }

        public void updateProductRO(decimal prodID, int cartqty)
        {
            String queryStr = "UPDATE Product SET ReorderStatus='Pending DO' ";
            queryStr += ", Stock_Level = Stock_Level - @cartqty ";
            queryStr += "Where Product_ID = @ProdID";

            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@ProdID", prodID);
            cmd.Parameters.AddWithValue("@cartqty", cartqty);
            conn.Open();
            cmd.ExecuteNonQuery();
        }
 
    }
}

    

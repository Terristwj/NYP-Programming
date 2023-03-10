using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Product
/// </summary>
public class Product
{

    //private string _connStr = Properties.Settings.Default.DBConnStr;

    //System Configuration ConnectionStringSettings _connstr;
    string _connStr = ConfigurationManager.ConnectionStrings["HealthDBContext"].ConnectionString;
    private string _prodID = null;
    private string _prodName = string.Empty;
    private string _prodDesc = ""; // this is another way to specify empty string
    private decimal _unitPrice = 0;
    private string _prodImage = "";
    private int _stockLevel = 0;

    // Default constructor
    public Product()
    {
    }

    // Constructor that take in all data required to build a Product object
    public Product(string prodID, string prodName, string prodDesc,
                   decimal unitPrice, string prodImage, int stockLevel)
    {
        _prodID = prodID;
        _prodName = prodName;
        _prodDesc = prodDesc;
        _unitPrice = unitPrice;
        _prodImage = prodImage;
        _stockLevel = stockLevel;
    }

    // Constructor that take in all except product ID
    public Product(string prodName, string prodDesc,
           decimal unitPrice, string prodImage, int stockLevel)
        : this(null, prodName, prodDesc, unitPrice, prodImage, stockLevel)
    {
    }

    // Constructor that take in only Product ID. The other attributes will be set to 0 or empty.
    public Product(string prodID)
        : this(prodID, "", "", 0, "", 0)
    {
    }

    // Get/Set the attributes of the Product object.
    // Note the attribute name (e.g. Product_ID) is same as the actual database field name.
    // This is for ease of referencing.
    public string Product_ID
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



    //Below as the Class methods for some DB operations. 
    //We will revisit these section in our next practical

    //public Product getProduct(decimal prodID)
    //{

    //}

    //public List<Product> getProductAll()
    //{

    //}

    //public int ProductInsert()
    //{

    //}//end Insert

    //public int ProductDelete(decimal ID)
    //{

    //}//end Delete

    //public int ProductUpdate(string pId, string pName, decimal pUnitPrice)
    //{

    //}//end Update

    public Product getProduct(string prodID)
    {
        Product prodDetail = null;

        string prod_Name, prod_Desc, Prod_Image;
        decimal unit_Price;
        int stock_Level;

        string queryStr = "SELECT * FROM Products WHERE Product_ID = @ProdID";
        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@ProdID", prodID);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        //Check if there are any resultsets
        if (dr.Read())
        {
            prod_Name = dr["Product_Name"].ToString();
            prod_Desc = dr["Product_Desc"].ToString();
            Prod_Image = dr["Product_Image"].ToString();
            unit_Price = decimal.Parse(dr["Unit_Price"].ToString());
            stock_Level = int.Parse(dr["Stock_Level"].ToString());
            prodDetail = new Product(prodID, prod_Name, prod_Desc, unit_Price, Prod_Image, stock_Level);
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

    public List<Product> getProductAll()
    {
        List<Product> prodList = new List<Product>();

        string prod_Name, prod_Desc, Prod_Image, prod_ID;
        decimal unit_Price;
        int stock_Level;

        string queryStr = "SELECT * FROM Products Order By Product_Name";

        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        
        //Continue to read the resultsets row by row if not the end
        while (dr.Read())
        {
            prod_ID = dr["Product_ID"].ToString();
            prod_Name = dr["Product_Name"].ToString();
            prod_Desc = dr["Product_Desc"].ToString();
            Prod_Image = dr["Product_Image"].ToString();
            unit_Price = decimal.Parse(dr["Unit_Price"].ToString());
            stock_Level = int.Parse(dr["Stock_Level"].ToString());
            Product a = new Product(prod_ID, prod_Name, prod_Desc, unit_Price, Prod_Image, stock_Level);
            prodList.Add(a);
        }

        conn.Close();
        dr.Close();
        dr.Dispose();

        return prodList;
    }
}
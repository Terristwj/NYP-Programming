using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Product
/// </summary>
public class Product
{

    //private string _connStr = Properties.Settings.Default.DBConnStr;
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


}
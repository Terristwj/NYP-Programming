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

	//
	// TODO: Add constructor logic here
	//
	static string connStr = ConfigurationManager.ConnectionStrings["Database"].ConnectionString;

	private string _prodID = null;
	private string _prodName = string.Empty;
	private string _prodDesc = "";
	private double _unitPrice = 0;
	private string _prodImage = "";
	private int _stockLevel = 0;

	//Default Constructor
	public Product()
	{

	}
	public Product(string prodID, string prodName, string prodDesc,
																							double unitPrice, string prodImage, int stockLevel)
	{
		_prodID = prodID;
		_prodName = prodName;
		_prodDesc = prodDesc;
		_unitPrice = unitPrice;
		_prodImage = prodImage;
		_stockLevel = stockLevel;
	}

	public Product(string prodName, string prodDesc, double unitPrice, string prodImage, int stockLevel) : this(null, prodName, prodDesc, unitPrice, prodImage, stockLevel)
	{
	}

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
	public double Unit_Price
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

	public static List<Product> getProductAll()
	{
		List<Product> prodList = new List<Product>();

		string prod_Name, prod_Desc, Prod_Image, prod_ID;
		double unit_Price;
		int stock_Level;

		string queryStr = "SELECT * FROM Product Order By Product_Name";

		SqlConnection conn = new SqlConnection(connStr);
		SqlCommand cmd = new SqlCommand(queryStr, conn);

		conn.Open();
		SqlDataReader dr = cmd.ExecuteReader();

		while (dr.Read())
		{
			prod_ID = dr["Product_ID"].ToString();
			prod_Name = dr["Product_Name"].ToString();
			prod_Desc = dr["Product_Desc"].ToString();
			Prod_Image = dr["Product_Image"].ToString();
			unit_Price = Convert.ToDouble(dr["Unit_Price"].ToString());
			stock_Level = int.Parse(dr["Stock_Level"].ToString());
			Product a = new Product(prod_ID, prod_Name, prod_Desc, unit_Price, Prod_Image, stock_Level);
			prodList.Add(a);
		}

		conn.Close();
		dr.Close();
		dr.Dispose();

		return prodList;
	}
	public int ProductInsert()
	{
		int result = 0;
		string queryStr = "INSERT INTO Product(Product_ID,Product_Name, Product_Desc, Unit_Price, Product_Image,Stock_Level)"
						+ "values (@Product_ID,@Product_Name, @Product_Desc, @Unit_Price, @Product_Image,@Stock_Level)";
		//+ "values (@Product_ID, @Product_Name, @Product_Desc, @Unit_Price, @Product_Image,@Stock_Level)";
		SqlConnection conn = new SqlConnection(connStr);
		SqlCommand cmd = new SqlCommand(queryStr, conn);
		cmd.Parameters.AddWithValue("@Product_ID", this.Product_ID);
		cmd.Parameters.AddWithValue("@Product_Name", this.Product_Name);
		cmd.Parameters.AddWithValue("@Product_Desc", this.Product_Desc);
		cmd.Parameters.AddWithValue("@Unit_Price", this.Unit_Price);
		cmd.Parameters.AddWithValue("@Product_Image", this.Product_Image);
		cmd.Parameters.AddWithValue("@Stock_Level", this.Stock_Level);
		conn.Open();
		result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
		conn.Close();
		return result;
	}



}

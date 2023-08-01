using BitzBytez.codes.DAL;
using BitzBytez.codes.Entities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BitzBytez.codes.DAL
{
    public class ProductDA
    {

        private static string connStr = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

        public static List<Product> getAllProducts()
        {
            List<Product> prods = new List<Product>();
            string queryStr = "SELECT * FROM Product;";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            setQuery(queryStr);

            while (dr.Read())
            {
                prods.Add(new Product(int.Parse(dr["prodID"].ToString()), dr["prodName"].ToString(), dr["prodDesc"].ToString(), dr["prodType"].ToString(), null, double.Parse(dr["baseprice"].ToString())));
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return prods;
        }

        public static Product getProduct(int prodID)
        {
            string selectAdditionalConfiguration = "";
            string additionalInnerJoinStatements = "";

            int noOfConfigs = getNoOfCategories(prodID);

            if (noOfConfigs > 1)
            {
                for (int i = 2; i <= noOfConfigs; i++)
                {
                    selectAdditionalConfiguration += "pc" + i + ".config, ";
                    additionalInnerJoinStatements += "LEFT JOIN productconfiguration pc" + i + " on pcc.config" + i + " = pc" + i + ".configid ";
                }
            }

            string queryStr = "SELECT p.prodID, p.prodName, p.prodDesc, p.prodType, p.noOfConfigCombo, p.configurationCategories, p.noOfCategories, p.baseprice, " +
                    "pc1.config, " + selectAdditionalConfiguration + "pcc.quantity, pcc.comboid FROM product p " +
                        "INNER JOIN productconfiguration pc1 ON p.prodid = pc1.prodid " +
                        "INNER JOIN productconfigcombo pcc ON pcc.config1 = pc1.configid "
                        + additionalInnerJoinStatements
                        + "WHERE p.prodID = @pid;";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@pid", prodID);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            Product prod = null;

            setQuery(queryStr);

            if (dr.Read())
            {
                prod = new Product(int.Parse(dr["prodID"].ToString()), dr["prodName"].ToString(), dr["prodDesc"].ToString(), dr["prodType"].ToString(), null, double.Parse(dr["baseprice"].ToString()));

            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return prod;
        }

        public static List<Product> searchForProducts(string product)
        {
            List<Product> prods = new List<Product>();

            string queryStr = "SELECT * FROM Product p INNER JOIN ProductConfiguration pc ON p.prodID = pc.prodID WHERE "
                                   + "prodName LIKE '%" + product + "%' OR "
                                   + "prodDesc LIKE '%" + product + "%' OR "
                                   + "prodType LIKE '%" + product + "%' OR "
                                   + "prodName LIKE '%" + product + "%' OR "
                                   + "config LIKE '%" + product + "%';";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@pt", product);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                if (prods.Count == 0)
                {
                    prods.Add(new Product(int.Parse(dr["prodID"].ToString()), dr["prodName"].ToString(), dr["prodDesc"].ToString(), dr["prodType"].ToString(), null, double.Parse(dr["baseprice"].ToString())));
                }
                else
                {
                    int i = 0;
                    foreach (Product p in prods.ToList())
                    {
                        if (p.Id == int.Parse(dr["prodID"].ToString()))
                        {
                            i++;
                        }
                    }

                    if (i == 0)
                    {
                        prods.Add(new Product(int.Parse(dr["prodID"].ToString()), dr["prodName"].ToString(), dr["prodDesc"].ToString(), dr["prodType"].ToString(), null, double.Parse(dr["baseprice"].ToString())));
                    }
                }
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return prods;
        }

        public static List<Product> getProductsBasedOnCategory(string category)
        {
            List<Product> prods = new List<Product>();

            string queryStr = "SELECT * FROM Product WHERE prodType LIKE @pt;";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@pt", category);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                prods.Add(new Product(int.Parse(dr["prodID"].ToString()), dr["prodName"].ToString(), dr["prodDesc"].ToString(), dr["prodType"].ToString(), null, double.Parse(dr["baseprice"].ToString())));
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return prods;
        }

        public static Product fillCategories(Product p)
        {
            List<string> cats = new List<string>();

            string queryStr = "SELECT DISTINCT configCategory FROM ProductConfiguration where prodID = @pid";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@pid", p.Id);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                cats.Add(dr["configCategory"].ToString());
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return null;
        }

        public static int getNoOfCategories(int prodID)
        {
            int no = 0;
            string queryStr = "SELECT noOfCategories FROM Product where prodID = @pid";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@pid", prodID);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                no = int.Parse(dr["noOfCategories"].ToString());
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return no;
        }

        public static List<string> getCategories(int prodID)
        {
            List<string> categories = new List<string>();

            string queryStr = "SELECT DISTINCT configCategory FROM ProductConfiguration where prodID = @pid";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@pid", prodID);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                categories.Add(dr["configCategory"].ToString());
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return categories;
        }

        public static List<ProductConfiguration> getConfigurationsFromCategory(string category, int prodid)
        {
            List<ProductConfiguration> configs = new List<ProductConfiguration>();

            string queryStr = "select configID, config, displayType from productconfiguration where configCategory = @cat and prodid = @pid;";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@cat", category);
            cmd.Parameters.AddWithValue("@pid", prodid);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                configs.Add(new ProductConfiguration(int.Parse(dr["configID"].ToString()), dr["config"].ToString(), prodid, dr["displayType"].ToString()));
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return configs;
        }

        public static List<string> getProductImages(int prodid)
        {
            List<string> imgs = new List<string>();

            string queryStr = "select url from productphoto where prodid = @pid;";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@pid", prodid);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                imgs.Add(dr["url"].ToString());
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return imgs;
        }

        public static List<string> getProductImages(string productName)
        {
            List<string> imgs = new List<string>();

            string queryStr = "select url from productphoto where prodid in (select prodID from Product where prodName LIKE '%" + productName + "%');";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                imgs.Add(dr["url"].ToString());
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return imgs;
        }

        public static ProductConfigCombo getConfigComboInfo(List<int> configids)
        {

            string queryStr_start = "select * from productconfigcombo where ";
            string queryStr_inColumn = " in (config1, config2, config3, config4) AND ";
            string queryStr_lastInColumn = " in (config1, config2, config3, config4);";

            string queryStr = "";

            queryStr += queryStr_start;

            for (int i = 0; i < configids.Count; i++)
            {
                if (i == configids.Count - 1)
                {
                    queryStr += configids[i] + queryStr_lastInColumn;
                }
                else
                {
                    queryStr += configids[i] + queryStr_inColumn;
                }
            }

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            ProductConfigCombo c = null;

            if (dr.Read())
            {
                c = new ProductConfigCombo(int.Parse(dr["comboID"].ToString()), int.Parse(dr["prodID"].ToString()), int.Parse(dr["quantity"].ToString()), double.Parse(dr["price"].ToString()));
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return c;
        }

        public static double getLowestProductPrice(int productID)
        {

            string queryStr = "SELECT MIN(price) as price FROM ProductConfigCombo where prodID = @pid";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@pid", productID);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            double price = 0;
            if (dr.Read())
            {
                price = double.Parse(dr["price"].ToString());
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return price;
        }

        private static string querySTR = "";

        public static void setQuery(string str)
        {
            querySTR = str;
        }

        public static string getQuery()
        {
            return querySTR;
        }

        public static int addProduct(Product p)
        {
            string queryStr = "INSERT INTO Product (prodName, prodDesc, prodType) VALUES (@n, @d, @t); SELECT SCOPE_IDENTITY()";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@n", p.Name);
            cmd.Parameters.AddWithValue("@d", p.Desc);
            cmd.Parameters.AddWithValue("@t", p.Type);
            conn.Open();

            int newId = Convert.ToInt32(cmd.ExecuteScalar());

            if (newId > 0)
            {
                foreach (string url in p.ImgUrls)
                {
                    addProductImages(newId, url);
                }
            }

            conn.Close();

            return newId;
        }

        public static int addProductConfiguration(int productID, ProductConfiguration pc)
        {

            string queryStr = "INSERT INTO ProductConfiguration (prodID, configCategory, displayType, config) VALUES (@pid, @cc, @dt, @c)";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@pid", productID);
            cmd.Parameters.AddWithValue("@cc", pc.ConfigurationCategory);
            cmd.Parameters.AddWithValue("@dt", pc.DisplayType);
            cmd.Parameters.AddWithValue("@c", pc.Config);
            conn.Open();

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        public static int addProductImages(int productID, string photoUrl)
        {
            string queryStr = "INSERT INTO ProductPhoto (prodID, url) VALUES (@p, @u)";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@p", productID);
            cmd.Parameters.AddWithValue("@u", photoUrl);
            conn.Open();

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        public static int addProductConfigCombo(int productID, ProductConfigCombo pcc)
        {

            string queryStr = "INSERT INTO ProductConfigCombo ";

            string insertStr = "(prodID, ";
            string valStr = "(@pid, ";

            if (pcc.Config1 != null)
            {
                insertStr += "config1";
                valStr += "@c1";
            }

            if (pcc.Config2 != null)
            {
                insertStr += ", config2";
                valStr += ", @c2";
            }

            if (pcc.Config3 != null)
            {
                insertStr += ", config3";
                valStr += ", @c3";
            }

            if (pcc.Config4 != null)
            {
                insertStr += ", config4";
                valStr += ", @c4";
            }

            insertStr += ", quantity, price) VALUES";
            valStr += ", @qty, @p)";

            queryStr += insertStr;
            queryStr += valStr;

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);

            if (pcc.Config1 != null)
            {

                int id = getProductConfigurationID(productID, pcc.Config1);
                if (id > 0)
                {
                    cmd.Parameters.AddWithValue("@c1", id);
                }
            }

            if (pcc.Config2 != null)
            {

                int id = getProductConfigurationID(productID, pcc.Config2);
                if (id > 0)
                {
                    cmd.Parameters.AddWithValue("@c2", id);
                }
            }

            if (pcc.Config3 != null)
            {

                int id = getProductConfigurationID(productID, pcc.Config3);
                if (id > 0)
                {
                    cmd.Parameters.AddWithValue("@c3", id);
                }
            }

            if (pcc.Config4 != null)
            {

                int id = getProductConfigurationID(productID, pcc.Config4);
                if (id > 0)
                {
                    cmd.Parameters.AddWithValue("@c4", id);
                }
            }

            cmd.Parameters.AddWithValue("@pid", productID);
            cmd.Parameters.AddWithValue("@qty", pcc.Quantity);
            cmd.Parameters.AddWithValue("@p", pcc.Price);

            conn.Open();

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        public static int updateProduct_full(int productID)
        {
            int ncc = getNoOfConfigCombo(productID);
            List<string> cats = getCategories(productID);
            int nc = cats.Count;
            string cc = "";

            foreach (string category in cats)
            {
                cc += "," + category;
            }

            cc = cc.Substring(1, cc.Length - 1);

            string queryStr = "UPDATE Product SET noOfConfigCombo = @ncc, configurationCategories = @cc, noOfCategories = @nc, basePrice = 0 WHERE prodID = @pid";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@ncc", ncc);
            cmd.Parameters.AddWithValue("@cc", cc);
            cmd.Parameters.AddWithValue("@nc", nc);
            cmd.Parameters.AddWithValue("@pid", productID);

            conn.Open();

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        private static int getNoOfConfigCombo(int productID)
        {
            string queryStr = "SELECT COUNT(*) FROM ProductConfigCombo WHERE prodid = @pid;";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@pid", productID);
            conn.Open();

            int result = Convert.ToInt32(cmd.ExecuteScalar());

            conn.Close();

            return result;
        }

        public static int getProductConfigurationID(int productID, string config)
        {
            string queryStr = "SELECT configID FROM ProductConfiguration WHERE prodID = @pid AND config = '" + config + "'";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@pid", productID);
            //cmd.Parameters.AddWithValue("@conf", config);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            int id = 0;
            if (dr.Read())
            {
                id = int.Parse(dr["configID"].ToString());
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return id;
        }

        public static int getProductID_withConfigComboID(int comboID)
        {
            string queryStr = "SELECT prodID FROM ProductConfigCombo WHERE comboID = @cid";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@cid", comboID);
            //cmd.Parameters.AddWithValue("@conf", config);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            int id = 0;
            if (dr.Read())
            {
                id = int.Parse(dr["prodID"].ToString());
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return id;
        }

        public static int insertWarrantyInfo()
        {

            return 0;
        }

        public static int addWarrantyInfo(string manufacturer, string productType, double warrantyPeriod, string warrantyRegURL, string contactInfo)
        {
            string queryStr = "INSERT INTO WarrantyInfo (manufacturer, productType, warrantyPeriod, warrantyRegistrationURL, contactInfo) VALUES (@m, @p, @wp, @wru, @c)";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@m", manufacturer);
            cmd.Parameters.AddWithValue("@p", productType);
            cmd.Parameters.AddWithValue("@wp", warrantyPeriod);
            cmd.Parameters.AddWithValue("@wru", warrantyRegURL);
            cmd.Parameters.AddWithValue("@c", contactInfo);
            conn.Open();

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        public static List<WarrantyInfo> getWarrantyInfo(string manufacturer, string componentType)
        {
            List<WarrantyInfo> infoList = new List<WarrantyInfo>();
            string queryStr = "SELECT * FROM WarrantyInfo WHERE manufacturer LIKE '" + manufacturer + "' AND productType = '" + componentType + "'";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            //cmd.Parameters.AddWithValue("@m", manufacturer);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                infoList.Add(new WarrantyInfo(int.Parse(dr["id"].ToString()), dr["manufacturer"].ToString(), dr["productType"].ToString(), double.Parse(dr["warrantyPeriod"].ToString()), dr["warrantyRegistrationURL"].ToString(), dr["contactInfo"].ToString()));
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return infoList;
        }

        public static List<string> getManufacturers()
        {
            List<string> m = new List<string>();
            string queryStr = "SELECT * FROM Manufacturer";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                m.Add(dr["manufacturer"].ToString());
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return m;
        }


        public static List<string> getComponents()
        {
            List<string> m = new List<string>();
            string queryStr = "SELECT * FROM Component";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                m.Add(dr["component"].ToString());
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return m;
        }

        public static List<string> getAllProductVariations(string productName)
        {
            List<string> toReturn = new List<string>();

            string queryStr = "SELECT CONCAT(pc1.config, ' ', pc2.config, ' ', pc3.config, ' ', pc4.config) as itemName FROM Product p " +

                                "INNER JOIN ProductConfigCombo pcc ON pcc.prodID = p.prodID " +

                                "LEFT JOIN ProductConfiguration pc1 ON pc1.configID = pcc.config1 " +

                                "LEFT JOIN ProductConfiguration pc2 on pc2.configID = pcc.config2 " +

                                "LEFT JOIN ProductConfiguration pc3 on pc3.configID = pcc.config3 " +

                                "LEFT JOIN ProductConfiguration pc4 on pc4.configID = pcc.config4 " +

                                "WHERE p.prodName LIKE '" + productName + "';";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                if (!toReturn.Contains(dr["itemName"].ToString()))
                {
                    toReturn.Add(dr["itemName"].ToString());
                }
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return toReturn;
        }

        public static List<string> getAllProductNames(string componentType, string manufacturer)
        {
            List<string> toReturn = new List<string>();

            string queryStr = "SELECT prodName FROM Product WHERE prodType LIKE '" + componentType + "' AND prodName LIKE '%" + manufacturer + "%';";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                toReturn.Add(dr["prodName"].ToString());
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return toReturn;
        }

        public static int createNewBTOPC(int customerID, string dateBuilt)
        {
            string queryStr = "INSERT INTO BtoPc (customerID, dateBuilt) VALUES (@id, @db);  SELECT SCOPE_IDENTITY();";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@id", customerID);
            cmd.Parameters.AddWithValue("@db", dateBuilt);
            conn.Open();

            int rowID = Convert.ToInt32(cmd.ExecuteScalar());

            conn.Close();

            return rowID;

        }

        public static int insertIndividualComponentWarranty(int btoPcID, string productName, string regDate, string serialNo, int warrantyInfoID)
        {
            string queryStr = "INSERT INTO ProductWarranty (btoPcID, prodName, registrationDate, serialNumber, warrantyInfoID) VALUES (@pcID, @pn, @rd, @sn, @wid);";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@pn", productName);
            cmd.Parameters.AddWithValue("@rd", regDate);
            cmd.Parameters.AddWithValue("@sn", serialNo);
            cmd.Parameters.AddWithValue("@wid", warrantyInfoID);
            cmd.Parameters.AddWithValue("@pcID", btoPcID);
            conn.Open();

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        public static int getWarrantyInfoID(string info)
        {
            string queryStr = "SELECT id FROM WarrantyInfo WHERE CONCAT(manufacturer, ' - ', productType, ' (', warrantyPeriod, ' years)') LIKE '" + info + "'";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            int id = 0;

            if (dr.Read())
            {
                id = int.Parse(dr["id"].ToString());
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return id;
        }

        public static List<FullComponentWarrantyDetails> getAllWarrantyInfoForAllComponents(int btoPcID)
        {
            List<FullComponentWarrantyDetails> list = new List<FullComponentWarrantyDetails>();
            string queryStr = "SELECT * FROM ProductWarranty pw INNER JOIN WarrantyInfo wi ON pw.warrantyInfoID = wi.id INNER JOIN BtoPc ON pw.btoPcID = BtoPc.id WHERE BtoPc.id = @id";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@id", btoPcID);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                list.Add(
                    new FullComponentWarrantyDetails(
                        int.Parse(dr["id"].ToString()),
                        dr["prodName"].ToString(),
                        DateTime.Parse(dr["registrationDate"].ToString()),
                        dr["serialNumber"].ToString(),
                        dr["manufacturer"].ToString(),
                        dr["productType"].ToString(),
                        double.Parse(dr["warrantyPeriod"].ToString()),
                        dr["warrantyRegistrationURL"].ToString(),
                        dr["contactInfo"].ToString()
                    )
                );
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return list;
        }

        public static List<string> getBtoPcBuiltDates(int customerID)
        {
            List<string> dates = new List<string>();
            string queryStr = "SELECT DISTINCT dateBuilt FROM BtoPc WHERE customerID = @cid";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@cid", customerID);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                dates.Add(DateTime.Parse(dr["dateBuilt"].ToString()).ToShortDateString());
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return dates;
        }

        public static List<int> getBtoPcIDs(int customerID, string date)
        {
            List<int> IDs = new List<int>();
            string queryStr = "SELECT id FROM BtoPc WHERE customerID = @cid AND dateBuilt = '" + date + "'";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@cid", customerID);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                IDs.Add(int.Parse(dr["id"].ToString()));
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return IDs;
        }

        public static int deleteProduct(string productName)
        {
            string queryStr =
            "DELETE FROM ProductPhoto " +
                "WHERE prodID IN " +
                "(SELECT prodID FROM Product WHERE prodName = " +
                    "'" + productName + "'); " +

            "DELETE FROM CartItem " +
                "WHERE comboID IN " +


                "(SELECT comboID FROM ProductConfigCombo WHERE prodID IN " +
                    "(SELECT prodID FROM Product WHERE prodName = " +
                    "'" + productName + "')); " +

            "DELETE FROM ProductConfigCombo " +
                "WHERE prodID IN " +

                "(SELECT prodID FROM Product WHERE prodName = " +
                    "'" + productName + "'); " +

            "DELETE FROM ProductConfiguration " +
                "WHERE prodID IN " +

                "(SELECT prodID FROM Product WHERE prodName = " +
                    "'" + productName + "'); " +

            "DELETE FROM Product " +
                "WHERE prodID IN " +

                "(SELECT prodID FROM Product WHERE prodName = " +
                    "'" + productName + "'); ";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            conn.Open();

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return 0;
        }
    }
}
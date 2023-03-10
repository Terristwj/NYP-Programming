using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using IT2605Prac05_ACME.DAL;

namespace IT2605Prac05_ACME.BLL
{
    public class BllRetailCatalog
    {
        private Double calculateRetailPrice(Double rrp)
        {
            Double retailPrice;
            // we reduce the rpp by 5% and use Math.Round to round up the result to 2 decimal places.
            retailPrice = Math.Round(rrp * 0.95, 2);
            return retailPrice;
        }
        public DataSet getRetailBooksList()
        {
            DalBetterBookSupplier dal;
            DataSet dataSetBooksList;
            DataTable dt;

            Double rrp;
            dal = new DalBetterBookSupplier();
            dataSetBooksList = dal.GetBooks();

            // Business Logic
            // Acme Book Shop wants to offer the books at 5% below RRP, so we need to write
            // code here to create a new column in the data and fill it with the new price.
            //
            // 1. Get a reeference to the Data Table
            dt = dataSetBooksList.Tables[0];
            // 2. Add a new column
            dt.Columns.Add("RetailPrice", typeof(double));
            // 3. Check table is not empty
            if (dt.Rows.Count != 0)
            {
                // 4. Loop through each row, calculate the retail price 
                // and store into the new column
                foreach(DataRow dr in dt.Rows)
                {
                    // Get RRP
                    rrp = Convert.ToDouble(dr["rrp"]);
                    // Calculate retail price and store in new column
                    dr["RetailPrice"] = calculateRetailPrice(rrp);

                }

            }
            return dataSetBooksList;
        }

        public DataSet getRetailBookDetails(int bookId)
        {
            DalBetterBookSupplier dal;
            DataSet dataSetBooksList;
            DataTable dt;

            Double rrp;
            dal = new DalBetterBookSupplier();
            dataSetBooksList = dal.GetBookDetails(bookId);

            // Business Logic
            // Acme Book Shop wants to offer the books at 5% below RRP, so we need to write
            // code here to create a new column in the data and fill it with the new price.
            //
            // 1. Get a reeference to the Data Table
            dt = dataSetBooksList.Tables[0];
            // 2. Add a new column
            dt.Columns.Add("RetailPrice", typeof(double));
            // 3. Check table is not empty
            if (dt.Rows.Count != 0)
            {
                // 4. Loop through each row, calculate the retail price 
                // and store into the new column
                foreach (DataRow dr in dt.Rows)
                {
                    // Get RRP
                    rrp = Convert.ToDouble(dr["rrp"]);
                    // Calculate retail price and store in new column
                    dr["RetailPrice"] = calculateRetailPrice(rrp);

                }

            }
            return dataSetBooksList;
        }
    }
    

}
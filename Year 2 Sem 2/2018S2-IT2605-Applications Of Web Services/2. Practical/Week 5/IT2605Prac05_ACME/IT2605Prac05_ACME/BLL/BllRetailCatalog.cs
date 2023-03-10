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

            //Get reference and put into Data Table
            dt = dataSetBooksList.Tables[0];

            //Add column into Data Table
            dt.Columns.Add("RetailPrice", typeof(double));

            //Check table not empty
            if (dt.Rows.Count != 0)
            {
                //Lopp through each row to caluclate the retail price and store into the new column
                foreach (DataRow dr in dt.Rows)
                {
                    //Get RRP (Readjusted Retail Price? I forgot)
                    rrp = Convert.ToDouble(dr["rrp"]);

                    //Calculate retail price and store in new column
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

            //Get reference and put into Data Table
            dt = dataSetBooksList.Tables[0];

            //Add column into Data Table
            dt.Columns.Add("RetailPrice", typeof(double));

            //Check table not empty
            if (dt.Rows.Count != 0)
            {
                //Lopp through each row to caluclate the retail price and store into the new column
                foreach (DataRow dr in dt.Rows)
                {
                    //Get RRP
                    rrp = Convert.ToDouble(dr["rrp"]);

                    //Calculate retail price and store in new column
                    dr["RetailPrice"] = calculateRetailPrice(rrp);
                }
            }

            return dataSetBooksList;
        }
    }
}
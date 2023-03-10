using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using RedStoreWeb.DAL;

namespace RedStoreWeb.BLL
{
    public class BLL_WsSales
    {
        public DataSet getAllSales()
        {
            DAL_WsSales redStore = new DAL_WsSales();
            DataSet ds = redStore.GetAllSales();

            return ds;
        }

        public DataSet getSalesByStaff(string staffID)
        {
            DAL_WsSales redStore = new DAL_WsSales();
            DataSet ds = redStore.GetSalesByStaff(staffID);

            return ds;
        }

        public DataSet getSalesByStoreID(string StoreId, string budgetRate)
        {
            double YTDSales;
            double bonus;

            DAL_WsSales redStore = new DAL_WsSales();
            DataSet ds = redStore.GetAllSales();

            DataTable dt = ds.Tables[0];

            dt.Columns.Add("Bonus", typeof(Double));
            if (dt.Rows.Count != 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    YTDSales = Convert.ToDouble(dr["YTDSales"]);
                    bonus = YTDSales * Convert.ToDouble(budgetRate);
                    dr["Bonus"] = bonus;
                }
            }

            for (int i =dt.Rows.Count -1; i >= 0; i--)
            {
                DataRow dr = dt.Rows[i];
                if (!dr["StoreId"].ToString().Equals(StoreId))
                    dr.Delete();
            }

            return ds;
        }

        public Boolean checkStoreId(string StoreId)
        {
            Boolean exist = false;

            DAL_WsSales redStore = new DAL_WsSales();
            DataSet ds = redStore.GetAllSales();

            DataTable dt = ds.Tables[0];


            foreach (DataRow dr in dt.Rows)
            {
                if (StoreId.Equals(dr["StoreId"].ToString()))
                {
                    exist = true;
                }
            }

            return exist;
        }
    }
}
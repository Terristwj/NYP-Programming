using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using RedStoreWeb.SvcRedStore;

namespace RedStoreWeb.DAL
{
    public class DAL_WsSales
    {
        public DataSet GetAllSales()
        {
            WsSalesClient redStore = new WsSalesClient();
            return redStore.getAllSales();
        }

        public DataSet GetSalesByStaff(string staffID)
        {
            WsSalesClient redStore = new WsSalesClient();
            return redStore.getSalesByStaff(staffID);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using RedStoreService.DAL;


namespace RedStoreService.BLL
{
    public class BLLSales
    {
        public DataSet GetAllSales()
        {
            DalSales dataLayerSales = new  DalSales();
            return dataLayerSales.GetAllSales();
        }

        public DataSet GetSalesByStaff(string staffID)
        {
            DalSales dataLayerSales = new DalSales();
            return dataLayerSales.GetSalesByStaff(staffID);
        }
    }
}
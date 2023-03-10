using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using RedStoreService.BLL;

namespace RedStoreService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "WsSales" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select WsSales.svc or WsSales.svc.cs at the Solution Explorer and start debugging.
    public class WsSales : IWsSales
    {
        public DataSet getAllSales()
        {
            BLLSales sales = new BLLSales();
            return sales.GetAllSales();
        }
        
        public DataSet getSalesByStaff(string StaffID)
        {
            BLLSales sales = new BLLSales();
            return sales.GetSalesByStaff(StaffID);
        }
    }
}

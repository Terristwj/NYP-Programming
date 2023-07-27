using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections.Generic;
using IT2605Prac05_BBS.DAL;

namespace IT2605Prac05_BBS.BLL
{
    public class ProcessOrders
    {
        public int VerifyOrders(String customerid, List<Order> obj)
        {
            DalOrders dataLayerOrders = new DalOrders();
            return dataLayerOrders.CreateOrder(customerid, obj);
        }
    }
}
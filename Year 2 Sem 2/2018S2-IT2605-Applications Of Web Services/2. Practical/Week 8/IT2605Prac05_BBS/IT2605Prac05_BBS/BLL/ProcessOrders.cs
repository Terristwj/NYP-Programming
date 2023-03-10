using System;
using System.Collections.Generic;
using System.Collections; 
using System.Linq;
using System.Web;
using IT2605Prac05_BBS.DLL;

namespace IT2605Prac05_BBS.BLL
{
    public class ProcessOrders
    {
       public int VerifyOrders(String customerid,   List<Order> obj)
       
        {

            DalOrders dataLayerOrders = new DalOrders();

            return dataLayerOrders.CreateOrder(customerid, obj);
        }

    
    }

}
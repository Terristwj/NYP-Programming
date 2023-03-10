﻿using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data;

namespace IT2605Prac05_BBS
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IWsBookCatalog" in both code and config file together.
    [ServiceContract]
    public interface IWsBookCatalog
    {
        [OperationContract]
        MsgContractResponseDataSet GetBooks(MsgContractRequestGetBooks req);

        [OperationContract]
        MsgContractResponseDataSet GetBookDetails(MsgContractRequestGetBookDetails req);

        [OperationContract]
        int CreateOrders(String customerid, List<Order> bookOrder);
    }
    [DataContract]
    public class Order
    {
        [DataMember]
        public String ordBookisbn { get; set; }

        [DataMember]
        public int ordBookQty { get; set; }
  
    }

}

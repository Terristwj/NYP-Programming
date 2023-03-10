using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace IT2605Prac05_BBS.DAL
{
    [DataContract]
    public class Order
    {
        [DataMember]
        public String ordBookisbn { get; set; }

        [DataMember]
        public int ordBookQty { get; set; }

    }
}
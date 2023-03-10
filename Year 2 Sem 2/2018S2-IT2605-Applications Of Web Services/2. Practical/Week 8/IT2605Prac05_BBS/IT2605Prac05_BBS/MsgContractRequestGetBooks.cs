using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ServiceModel;

namespace IT2605Prac05_BBS
{
    [MessageContract]
    public class MsgContractRequestGetBooks
    {
        [MessageHeader]
        public string user;
        [MessageHeader]
        public string password;
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Web;

namespace IT2605Prac05_BBS
{
    [MessageContract]
    public class MsgContractRequestGetBookDetails
    {
        [MessageHeader]
        public string user;
        [MessageHeader]
        public string password;

        [MessageBodyMember]
        public int bookId;
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ServiceModel;
using System.Data;

namespace IT2605Prac05_BBS
{
    [MessageContract]
    public class MsgContractResponseDataSet
    {
        [MessageBodyMember]
        public DataSet results;
    }
}
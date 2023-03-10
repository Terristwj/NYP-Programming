using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace NYP
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IWsNYP" in both code and config file together.
    [ServiceContract]
    public interface IWsNYP
    {
        [OperationContract]
        DataSet GetRegistration(int OSEP_ID);
    }
}

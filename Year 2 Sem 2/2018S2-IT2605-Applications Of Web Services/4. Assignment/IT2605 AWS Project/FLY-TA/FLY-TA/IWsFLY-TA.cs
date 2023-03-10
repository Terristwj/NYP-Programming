using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace FLY_TA
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IWsFLY_TA" in both code and config file together.
    [ServiceContract]
    public interface IWsFLY_TA
    {
        [OperationContract]
        DataSet GetOSEPs();

        [OperationContract]
        DataSet GetOSEPDetails(int OSEP_ID);

        [OperationContract]
        int UpdateOSEP(int OSEP_ID, int noRegistered);
    }
}

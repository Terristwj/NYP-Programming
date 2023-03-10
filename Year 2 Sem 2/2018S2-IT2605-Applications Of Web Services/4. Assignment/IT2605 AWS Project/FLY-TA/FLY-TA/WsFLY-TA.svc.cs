using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace FLY_TA
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "WsFLY_TA" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select WsFLY-TA.svc or WsFLY-TA.svc.cs at the Solution Explorer and start debugging.
    public class WsFLY_TA : IWsFLY_TA
    {
        public DataSet GetOSEPs()
        {
            FLY_TA.BLL.BLL_OSEPList BLL_OSEPs = new FLY_TA.BLL.BLL_OSEPList();
            return BLL_OSEPs.GetOSEPs();
        }

        public DataSet GetOSEPDetails(int OSEP_ID)
        {
            FLY_TA.BLL.BLL_OSEPList BLL_OSEP;
            BLL_OSEP = new FLY_TA.BLL.BLL_OSEPList();
            return BLL_OSEP.GetOSEPDetails(OSEP_ID);
        }

        public int UpdateOSEP(int OSEP_ID, int noRegistered)
        {
            FLY_TA.BLL.BLL_OSEPList BLL_OSEP;
            BLL_OSEP = new FLY_TA.BLL.BLL_OSEPList();
            return BLL_OSEP.UpdateOSEP(OSEP_ID, noRegistered);
        }
    }
}

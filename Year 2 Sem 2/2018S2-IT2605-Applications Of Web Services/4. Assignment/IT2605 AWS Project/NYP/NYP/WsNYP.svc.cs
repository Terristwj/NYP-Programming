using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace NYP
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "WsNYP" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select WsNYP.svc or WsNYP.svc.cs at the Solution Explorer and start debugging.
    public class WsNYP : IWsNYP
    {
        public DataSet GetRegistration(int OSEP_ID)
        {
            NYP.BLL.BLL_RegistrationList BLL_Registrations;
            BLL_Registrations = new NYP.BLL.BLL_RegistrationList();
            return BLL_Registrations.GetRegistrations(OSEP_ID);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using NYP.FLY_TA_svc;

namespace NYP.DAL
{
    public class DAL_FLY_TA
    {
        public DataSet GetOSEPs()
        {
            WsFLY_TAClient FLY_TAClient;
            FLY_TAClient = new WsFLY_TAClient();
            return FLY_TAClient.GetOSEPs();
        }

        public DataSet GetOSEPDetails(int OSEP_ID)
        {
            WsFLY_TAClient FLY_TAClient;
            FLY_TAClient = new WsFLY_TAClient();
            return FLY_TAClient.GetOSEPDetails(OSEP_ID);
        }

        public void updateOSEP(int OSEP_ID, int noRegistered)
        {
            WsFLY_TAClient FLY_TAClient;
            FLY_TAClient = new WsFLY_TAClient();
            FLY_TAClient.UpdateOSEP(OSEP_ID, noRegistered);
        }
    }
}
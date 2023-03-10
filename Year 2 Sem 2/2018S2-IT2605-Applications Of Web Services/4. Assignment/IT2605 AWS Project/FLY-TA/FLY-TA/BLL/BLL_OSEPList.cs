using FLY_TA.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FLY_TA.BLL
{
    public class BLL_OSEPList
    {
        public DataSet GetOSEPs()
        {
            DAL_OSEPs dataLayerOSEP = new DAL_OSEPs();
            return dataLayerOSEP.GetAll();
        }

        public DataSet GetOSEPDetails(int OSEP_ID)
        {
            DAL_OSEPs dataLayerOSEP = new DAL_OSEPs();
            return dataLayerOSEP.GetOSEPDetails(OSEP_ID);
        }

        public int UpdateOSEP(int OSEP_ID, int noRegistered)
        {
            DAL_OSEPs dataLayerOSEP = new DAL_OSEPs();
            return dataLayerOSEP.UpdateOSEP(OSEP_ID, noRegistered);
        }
    }
}
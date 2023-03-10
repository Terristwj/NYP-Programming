using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FLY_TA.BLL
{
    public class BLL_OSEPs
    {
        public void insertOSEP(string title, string description, string duration, string accommodationType, int Quota, int Fee)
        {
            OSEP OSEP = new OSEP();
            OSEP.insertOSEP(title, description, duration, accommodationType, Quota, Fee);
        }

        public DataSet BindOSEPList()
        {
            OSEP OSEP = new OSEP();
            return OSEP.BindOSEPList();
        }
    }
}
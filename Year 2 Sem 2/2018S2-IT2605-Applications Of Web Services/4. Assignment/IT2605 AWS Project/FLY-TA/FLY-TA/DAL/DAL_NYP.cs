using FLY_TA.NYP_svc;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FLY_TA.DAL
{
    public class DAL_NYP
    {
        public DataSet GetRegistrations(int OSEP_ID)
        {
            WsNYPClient NYPClient = new WsNYPClient();
            return NYPClient.GetRegistration(OSEP_ID);
        }
    }
}
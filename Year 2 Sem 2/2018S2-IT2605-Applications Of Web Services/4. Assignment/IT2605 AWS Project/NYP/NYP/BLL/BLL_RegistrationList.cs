using NYP.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace NYP.BLL
{
    public class BLL_RegistrationList
    {
        public DataSet GetRegistrations(int OSEP_ID)
        {
            DAL_Registrations dataLayerRegistrations;

            dataLayerRegistrations = new DAL_Registrations();
            return dataLayerRegistrations.GetAll(OSEP_ID);
        }
    }
}
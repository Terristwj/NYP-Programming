using FLY_TA.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FLY_TA.BLL
{
    public class BLL_RegistrationList
    {
        public DataSet GetRegistrationList(int OSEP_ID)
        {
            DAL_NYP dal = new DAL_NYP();
            return dal.GetRegistrations(OSEP_ID);
        }
    }
}
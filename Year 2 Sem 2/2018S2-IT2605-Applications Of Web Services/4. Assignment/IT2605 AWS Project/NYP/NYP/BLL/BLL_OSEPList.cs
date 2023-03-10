using NYP.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace NYP.BLL
{
    public class BLL_OSEPList
    {
        private int calculateSeatsLeft(int quota, int noRegistered)
        {
            int seatsLeft = quota - noRegistered;
            return seatsLeft;
        }

        public DataSet getOSEPList()
        {
            DAL_FLY_TA dal;
            dal = new DAL_FLY_TA();
            DataTable dt;
            DataSet dataSetOSEPList;
            int quota;
            int noRegistered;
            dataSetOSEPList = dal.GetOSEPs();

            dt = dataSetOSEPList.Tables[0];
            dt.Columns.Add("SeatsLeft", typeof(int));
            if (dt.Rows.Count != 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    quota = Convert.ToInt32(dr["Quota"]);
                    noRegistered = Convert.ToInt32(dr["No_Of_Registered"]);
                    dr["SeatsLeft"] = calculateSeatsLeft(quota, noRegistered);
                }
            }

            return dataSetOSEPList;
        }
        public DataSet getOSEPList_Available()
        {
            DataSet ds = new DataSet();
            ds = getOSEPList();

            DataTable dt;
            dt = ds.Tables[0];

            for (int i = dt.Rows.Count - 1; i >= 0; i--)
            {
                DataRow dr = dt.Rows[i];
                if (Convert.ToInt32(dr["SeatsLeft"].ToString()) == 0)
                    dr.Delete();
            }
            dt.AcceptChanges();

            return ds;
        }

        public DataSet getOSEPDetails(int OSEP_ID)
        {
            DAL_FLY_TA dal;
            DataSet dataSetOSEPList;
            DataTable dt;
            dal = new DAL_FLY_TA();
            dataSetOSEPList = dal.GetOSEPDetails(OSEP_ID);
            int quota;
            int noRegistered;

            dt = dataSetOSEPList.Tables[0];
            dt.Columns.Add("SeatsLeft", typeof(int));
            if (dt.Rows.Count != 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    quota = Convert.ToInt32(dr["Quota"]);
                    noRegistered = Convert.ToInt32(dr["No_Of_Registered"]);
                    dr["SeatsLeft"] = calculateSeatsLeft(quota, noRegistered);
                }
            }

            return dataSetOSEPList;
        }

        public void updateOSEP(int OSEP_ID, int noRegistered)
        {
            DAL_FLY_TA dal;
            dal = new DAL_FLY_TA();
            dal.updateOSEP(OSEP_ID, noRegistered);
        }
    }
}
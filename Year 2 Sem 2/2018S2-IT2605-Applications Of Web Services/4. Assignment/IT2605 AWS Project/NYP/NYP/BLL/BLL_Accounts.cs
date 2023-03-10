using NYP.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace NYP.BLL
{
    public class BLL_Accounts
    {
        public Boolean checkAccount(string adminNo, string name)
        {
            Boolean check = false;

            Registration account = new Registration();
            DataSet accounts = account.getAll();

            DataTable dt = new DataTable();  
            dt = accounts.Tables[0];                             // Connect DT to DS

            
            foreach (DataRow dr in dt.Rows)
            {
                if (adminNo.Equals(dr["Admin_No"].ToString()) && name.Equals(dr["Name"].ToString()))
                {
                    check = true;
                }
            }

            return check;
        }

        public string getUserID(string adminNo)
        {
            Registration registration = new Registration();
            DataSet account = registration.getAccountID(adminNo);

            DataTable dt = new DataTable();
            dt = account.Tables[0];                             // Connect DT to DS

            string userID = dt.Rows[0]["Id"].ToString();
            return userID;
        }

        public string getName(string id)
        {
            Registration registration = new Registration();
            DataSet account = registration.getAccountName(id);

            DataTable dt = new DataTable();
            dt = account.Tables[0];                             // Connect DT to DS

            string name = dt.Rows[0]["Name"].ToString();
            return name;
        }

        public string getOSEP(string id)
        {
            Registration registration = new Registration();
            DataSet account = registration.getOSEP(id);

            DataTable dt = new DataTable();
            dt = account.Tables[0];                             // Connect DT to DS

            string OSEP = "";
            if (dt.Rows[0]["OSEP_ID"] == DBNull.Value)
            {
                OSEP = "Not Registered";
            }
            else
            {
                OSEP = dt.Rows[0]["OSEP_ID"].ToString();
            }
            return OSEP;
        }

        public void updateOSEP(int OSEP_ID, int id)
        {
            Registration registration = new Registration();
            registration.updateOSEP(OSEP_ID, id);
        }

    }
}
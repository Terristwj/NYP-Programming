using IT2605Prac05_BBS.DLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IT2605Prac05_BBS.BLL
{
    public class ValidateRetailer
    {
        public Boolean isValidUser(String userid, String userpw)
        {
            DalRetailer dlRetailer;

            dlRetailer = new DalRetailer();
            return dlRetailer.isValidUser(userid, userpw);
        }
        public Boolean isAppUser(String userid )
        {
            DalRetailer dlRetailer;

            dlRetailer = new DalRetailer();
            return dlRetailer.isAppUser(userid);
        }

    }
}
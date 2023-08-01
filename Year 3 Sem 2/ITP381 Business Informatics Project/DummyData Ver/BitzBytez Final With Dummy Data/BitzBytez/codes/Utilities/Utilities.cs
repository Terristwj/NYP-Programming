using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BitzBytez.codes.Utilities
{
    public class Utilities
    {
        public static List<int> ID_Splitter(string rawdata)
        {
            List<int> nos = new List<int>();
            List<int> IDs = new List<int>();

            for (int i = 0; i < rawdata.Length; i++)
            {
                if (rawdata[i] == '.')
                {
                    nos.Add(i);
                }
            }

            for (int i = 0; i < nos.Count(); i++)
            {
                if (i == 0)
                {
                    //results += rawdata.Substring(0, nos[i]) + " ";
                    IDs.Add(int.Parse(rawdata.Substring(0, nos[i])));
                }
                else
                {
                    //results += rawdata.Substring(nos[i - 1] + 1, nos[i] - nos[i - 1] - 1) + " ";
                    IDs.Add(int.Parse(rawdata.Substring(nos[i - 1] + 1, nos[i] - nos[i - 1] - 1)));
                }
            }

            return IDs;
        }
    }
}
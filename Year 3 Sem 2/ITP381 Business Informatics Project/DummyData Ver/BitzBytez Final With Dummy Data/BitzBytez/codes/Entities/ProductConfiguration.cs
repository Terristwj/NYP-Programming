using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BitzBytez.codes.Entities
{
    public class ProductConfiguration
    {
        int configID, prodID;
        string config, displayType, configurationCategory;

        public ProductConfiguration(int configid, string configuration, int prodid, string display_type)
        {
            this.ConfigID = configid;
            this.ProdID = prodid;
            this.Config = configuration;
            this.displayType = display_type;
        }

        public ProductConfiguration(string configuration, string configurationCat, string display_type)
        {
            this.Config = configuration;
            this.displayType = display_type;
            this.configurationCategory = configurationCat;
        }

        public int ConfigID
        {
            get
            {
                return configID;
            }

            set
            {
                configID = value;
            }
        }

        public int ProdID
        {
            get
            {
                return prodID;
            }

            set
            {
                prodID = value;
            }
        }

        public string Config
        {
            get
            {
                return config;
            }

            set
            {
                config = value;
            }
        }

        public string DisplayType
        {
            get
            {
                return displayType;
            }

            set
            {
                displayType = value;
            }
        }

        public string ConfigurationCategory
        {
            get
            {
                return configurationCategory;
            }

            set
            {
                configurationCategory = value;
            }
        }
    }
}
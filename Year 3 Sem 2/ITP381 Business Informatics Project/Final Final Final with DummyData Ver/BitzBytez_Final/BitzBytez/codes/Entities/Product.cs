using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BitzBytez.codes.Entities
{
    public class Product
    {
        private int id;
        private string name;
        private string desc;
        private string type;
        private List<string> configurationCategories, imgUrls;
        private double basePrice;
        private List<CategoryPair> configPairs;
        public Product(int ID, string Name, string Desc, string Type, List<string> ConfigCategories, double BasePrice)
        {
            this.id = ID;
            this.name = Name;
            this.desc = Desc;
            this.type = Type;
            this.configurationCategories = ConfigCategories;
            this.basePrice = BasePrice;
        }

        public Product(int ID, string Name, string Desc, string Type, double BasePrice, List<CategoryPair> ConfigCategoryPairs, List<string> imageUrls)
        {
            this.id = ID;
            this.name = Name;
            this.desc = Desc;
            this.type = Type;
            this.ConfigPairs = ConfigCategoryPairs;
            this.basePrice = BasePrice;
            this.ImgUrls = imageUrls;
        }

        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        public string Name
        {
            get
            {
                return name;
            }

            set
            {
                name = value;
            }
        }

        public string Desc
        {
            get
            {
                return desc;
            }

            set
            {
                desc = value;
            }
        }

        public string Type
        {
            get
            {
                return type;
            }

            set
            {
                type = value;
            }
        }

        public List<string> ConfigurationCategories
        {
            get
            {
                return configurationCategories;
            }

            set
            {
                configurationCategories = value;
            }
        }

        public double BasePrice
        {
            get
            {
                return basePrice;
            }

            set
            {
                basePrice = value;
            }
        }

        public List<CategoryPair> ConfigPairs
        {
            get
            {
                return configPairs;
            }

            set
            {
                configPairs = value;
            }
        }

        public List<string> ImgUrls
        {
            get
            {
                return imgUrls;
            }

            set
            {
                imgUrls = value;
            }
        }
    }
}
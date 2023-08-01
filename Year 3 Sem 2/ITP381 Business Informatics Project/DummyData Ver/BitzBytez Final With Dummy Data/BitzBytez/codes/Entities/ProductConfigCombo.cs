using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BitzBytez.codes.Entities
{
    public class ProductConfigCombo
    {
        int comboID, prodID, quantity;
        double price;
        string config1, config2, config3, config4;

        public ProductConfigCombo(int comboid, int prodid, int qty, double price_)
        {
            this.comboID = comboid;
            this.prodID = prodid;
            this.quantity = qty;
            this.price = price_;
        }

        public ProductConfigCombo(string config1, string config2, string config3, string config4, int qty, double price_)
        {
            this.config1 = config1;
            this.config2 = config2;
            this.config3 = config3;
            this.config4 = config4;
            this.quantity = qty;
            this.price = price_;
        }
        
        public int ComboID
        {
            get
            {
                return comboID;
            }

            set
            {
                comboID = value;
            }
        }

        public double Price
        {
            get
            {
                return price;
            }

            set
            {
                price = value;
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

        public int Quantity
        {
            get
            {
                return quantity;
            }

            set
            {
                quantity = value;
            }
        }

        public string Config1
        {
            get
            {
                return config1;
            }

            set
            {
                config1 = value;
            }
        }

        public string Config2
        {
            get
            {
                return config2;
            }

            set
            {
                config2 = value;
            }
        }

        public string Config3
        {
            get
            {
                return config3;
            }

            set
            {
                config3 = value;
            }
        }

        public string Config4
        {
            get
            {
                return config4;
            }

            set
            {
                config4 = value;
            }
        }
    }
}
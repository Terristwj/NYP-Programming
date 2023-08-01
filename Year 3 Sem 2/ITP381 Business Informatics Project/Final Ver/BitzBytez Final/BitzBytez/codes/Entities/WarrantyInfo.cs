using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BitzBytez.codes.Entities
{
    public class WarrantyInfo
    {
        private int id;
        private double warrantyPeriod;
        private string manufacturer, warrantyRegistrationURL, contactInfo, productType;
        public WarrantyInfo(int id, string manufacturer, string productType, double warrantyPeriod, string regURL, string contactInfo)
        {
            this.Id = id;
            this.WarrantyPeriod = warrantyPeriod;
            this.Manufacturer = manufacturer;
            this.WarrantyRegistrationURL = regURL;
            this.ContactInfo = contactInfo;
            this.ProductType = productType;
        }

        public string ContactInfo
        {
            get
            {
                return contactInfo;
            }

            set
            {
                contactInfo = value;
            }
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

        public string Manufacturer
        {
            get
            {
                return manufacturer;
            }

            set
            {
                manufacturer = value;
            }
        }

        public string ProductType
        {
            get
            {
                return productType;
            }

            set
            {
                productType = value;
            }
        }

        public double WarrantyPeriod
        {
            get
            {
                return warrantyPeriod;
            }

            set
            {
                warrantyPeriod = value;
            }
        }

        public string WarrantyRegistrationURL
        {
            get
            {
                return warrantyRegistrationURL;
            }

            set
            {
                warrantyRegistrationURL = value;
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BitzBytez.codes.Entities
{
    public class FullComponentWarrantyDetails
    {
        int productWarrantyID;
        string productName, serialNo, manufacturer, productType, warrantyRegistrationURL, contactInformation;
        DateTime registrationDate;
        double warrantyPeriod;

        public int ProductWarrantyID
        {
            get
            {
                return productWarrantyID;
            }

            set
            {
                productWarrantyID = value;
            }
        }

        public DateTime RegistrationDate
        {
            get
            {
                return registrationDate;
            }

            set
            {
                registrationDate = value;
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

        public string ProductName
        {
            get
            {
                return productName;
            }

            set
            {
                productName = value;
            }
        }

        public string SerialNo
        {
            get
            {
                return serialNo;
            }

            set
            {
                serialNo = value;
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

        public string ContactInformation
        {
            get
            {
                return contactInformation;
            }

            set
            {
                contactInformation = value;
            }
        }

        public FullComponentWarrantyDetails(
                int pwID, 
                string productName,
                DateTime regDate,
                string serialNumber,
                string manufacturer,
                string productType,
                double warrantyPeriod,
                string warrantyRegURL,
                string contactInfo
            )
        {
            this.ProductWarrantyID = pwID;
            this.ProductName = productName;
            this.SerialNo = serialNumber;
            this.Manufacturer = manufacturer;
            this.ProductType = productType;
            this.WarrantyPeriod = warrantyPeriod;
            this.WarrantyRegistrationURL = warrantyRegURL;
            this.ContactInformation = contactInfo;
            this.RegistrationDate = regDate;
        }
    }
}
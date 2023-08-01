using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BitzBytez.codes.Entities
{
    public class ComponentWarrantyDetails
    {
        private string datebuilt, component, manufacturer, product, variation, serialNumber, registerDate, warrantyType;
        private int warrantyInfoID;

        public ComponentWarrantyDetails(
            string datebuilt, 
            string component, 
            string manufacturer,
            string product, 
            string variation,
            int warrantyInfoID, 
            string warrantyType,
            string serialNumber,
            string registerDate)
        {
            this.Datebuilt = datebuilt;
            this.Component = component;
            this.Manufacturer = manufacturer;
            this.Product = product;
            this.Variation = variation;
            this.warrantyInfoID = warrantyInfoID;
            this.SerialNumber = serialNumber;
            this.RegisterDate = registerDate;
            this.warrantyType = warrantyType;
        }

        public string Component
        {
            get
            {
                return component;
            }

            set
            {
                component = value;
            }
        }

        public string Datebuilt
        {
            get
            {
                return datebuilt;
            }

            set
            {
                datebuilt = value;
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

        public string Product
        {
            get
            {
                return product;
            }

            set
            {
                product = value;
            }
        }

        public string RegisterDate
        {
            get
            {
                return registerDate;
            }

            set
            {
                registerDate = value;
            }
        }

        public string SerialNumber
        {
            get
            {
                return serialNumber;
            }

            set
            {
                serialNumber = value;
            }
        }

        public string Variation
        {
            get
            {
                return variation;
            }

            set
            {
                variation = value;
            }
        }

        public int WarrantyInfoID
        {
            get
            {
                return warrantyInfoID;
            }

            set
            {
                warrantyInfoID = value;
            }
        }

        public string WarrantyType
        {
            get
            {
                return warrantyType;
            }

            set
            {
                warrantyType = value;
            }
        }
    }
}
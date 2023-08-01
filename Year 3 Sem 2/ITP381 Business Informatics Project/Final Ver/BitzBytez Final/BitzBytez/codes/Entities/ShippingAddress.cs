using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BitzBytez.codes.Entities
{
    public class ShippingAddress
    {
        private string addressLine1, addressLine2, country, fullName, stateProvinceRegion, city;
        private int postalCode, id, customerID;

        public ShippingAddress()
        {

        }
        public ShippingAddress(int ID, int custID, int pCode, string add1, string add2, string country, string fullName, string statePR, string city)
        {
            this.AddressLine1 = add1;
            this.AddressLine2 = add2;
            this.Country = country;
            this.FullName = fullName;
            this.StateProvinceRegion = statePR;
            this.City = city;
            this.PostalCode = pCode;
            this.Id = ID;
            this.CustomerID = custID;
        }

        public string AddressLine1
        {
            get
            {
                return addressLine1;
            }

            set
            {
                addressLine1 = value;
            }
        }

        public string AddressLine2
        {
            get
            {
                return addressLine2;
            }

            set
            {
                addressLine2 = value;
            }
        }

        public string City
        {
            get
            {
                return city;
            }

            set
            {
                city = value;
            }
        }

        public string Country
        {
            get
            {
                return country;
            }

            set
            {
                country = value;
            }
        }

        public int CustomerID
        {
            get
            {
                return customerID;
            }

            set
            {
                customerID = value;
            }
        }

        public string FullName
        {
            get
            {
                return fullName;
            }

            set
            {
                fullName = value;
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

        public int PostalCode
        {
            get
            {
                return postalCode;
            }

            set
            {
                postalCode = value;
            }
        }

        public string StateProvinceRegion
        {
            get
            {
                return stateProvinceRegion;
            }

            set
            {
                stateProvinceRegion = value;
            }
        }
    }
}
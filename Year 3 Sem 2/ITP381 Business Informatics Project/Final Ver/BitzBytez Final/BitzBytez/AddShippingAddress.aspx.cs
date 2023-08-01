using BitzBytez.codes.DAL;
using BitzBytez.codes.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzBytez
{
    public partial class AddShippingAddress : System.Web.UI.Page
    {
        int userID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateCountries();
            }

            if (Session["userID"] != null)
            {
                userID = Convert.ToInt16(Session["userID"]);
            }
        }

        private void populateCountries()
        {
            ddl_country.Items.Insert(0, "");
            ddl_country.Items.Insert(1, "Singapore");
        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {
            if (
                tb_fullName.Text != "" &&
                tb_addressLine1.Text != "" &&
                tb_postalCode.Text != "" &&
                ddl_country.SelectedValue != "" &&
                userID > 0)
            {
                ShippingAddress a = new ShippingAddress();

                a.FullName = tb_fullName.Text;
                a.AddressLine1 = tb_addressLine1.Text;
                a.PostalCode = int.Parse(tb_postalCode.Text);
                a.Country = ddl_country.SelectedValue;

                if (tb_addressLine2.Text != "")
                {
                    a.AddressLine2 = tb_addressLine2.Text;
                }

                if (tb_city.Text != "")
                {
                    a.City = tb_city.Text;
                }

                if (tb_stateProvinceRegion.Text != "")
                {
                    a.StateProvinceRegion = tb_stateProvinceRegion.Text;
                }

                ShippingAddressDA.addShippingAddress(userID, a);
            }
        }
    }
}
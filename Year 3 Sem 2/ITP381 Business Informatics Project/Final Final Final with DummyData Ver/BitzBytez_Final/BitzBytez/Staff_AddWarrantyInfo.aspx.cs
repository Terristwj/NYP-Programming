using BitzBytez.codes.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzBytez
{
    public partial class Staff_AddWarrantyInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateDDL();
            }
        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {
            if (
                tb_contactInfo.Text.Trim() != "" &&
                ddl_manufacturer.SelectedValue.Trim() != "" &&
                ddl_componentType.SelectedValue.Trim() != "" &&
                tb_regLink.Text.Trim() != "" &&
                tb_warrantyPeriod.Text.Trim() != ""
                )
            {
                if (ProductDA.addWarrantyInfo(ddl_manufacturer.SelectedValue.Trim(), ddl_componentType.SelectedValue.Trim(), double.Parse(tb_warrantyPeriod.Text.Trim()), tb_regLink.Text.Trim(), tb_contactInfo.Text.Trim()) == 1)
                {
                    tb_contactInfo.Text = "";
                    ddl_manufacturer.SelectedIndex = 0;
                    ddl_componentType.SelectedIndex = 0;
                    tb_regLink.Text = "";
                    tb_warrantyPeriod.Text = "";

                    status.Style.Add("color", "darkgreen");
                    status.InnerHtml = "Information added! Please feel free to add more warranty information.";
                }
            } else
            {
                status.Style.Add("color", "red");
                status.InnerHtml = "Please ensure all fields are filled.";
            }
        }

        private void populateDDL()
        {

            List<string> componentTypes = ProductDA.getComponents();
            List<string> manufacturers = ProductDA.getManufacturers();

            componentTypes.Sort();
            manufacturers.Sort();

            for (int i = 0; i < componentTypes.Count; i++)
            {
                ddl_componentType.Items.Insert(i, componentTypes[i]);
            }

            for (int i = 0; i < manufacturers.Count; i++)
            {
                ddl_manufacturer.Items.Insert(i, manufacturers[i]);
            }
        }
    }
}
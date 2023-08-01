using BitzBytez.codes.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzBytez
{
    public partial class AddProductConfiguration : System.Web.UI.Page
    {
        private Product prod = null;
        private List<ProductConfiguration> configList = new List<ProductConfiguration>();
        private List<CategoryPair> configCats = new List<CategoryPair>();

        protected void Page_Load(object sender, EventArgs e)
        {
            btn_AddCombo.Visible = false;
            if (Session["newProduct"] != null)
            {
                prod = Session["newProduct"] as Product;
                configCats = prod.ConfigPairs;

                if (Session["configList"] != null)
                {
                    configList = Session["configList"] as List<ProductConfiguration>;
                }

                if (!IsPostBack)
                {
                    populateDDLs();
                }
            }
        }

        private void populateDDLs()
        {
            if (configCats.Count > 0)
            {
                ddl_ConfigCategory.Items.Clear();
                ddl_ConfigCategory.Items.Insert(0, "");
                for (int i = 0; i < configCats.Count; i++)
                {
                    ddl_ConfigCategory.Items.Insert((i + 1), configCats[i].Category);
                }
            }
        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {
            if (tb_Config.Text != "" && ddl_ConfigCategory.Text != "")
            {
                string selectedDisType = "";
                foreach (CategoryPair cp in configCats)
                {
                    if (cp.Category == ddl_ConfigCategory.Text)
                    {
                        selectedDisType = cp.DisplayType;
                    }
                }
                configList.Add(new ProductConfiguration(tb_Config.Text, ddl_ConfigCategory.Text, selectedDisType));
                Session["configList"] = configList;

                printList(configList);

                tb_Config.Text = "";
                ddl_ConfigCategory.SelectedIndex = 0;

                btn_AddCombo.Visible = true;
            }
            else
            {
                status.Style.Add("color", "red");
                status.InnerHtml = "Please ensure all fields are filled.";
            }
        }

        protected void btn_AddCombo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Staff_AddProductConfigCombo.aspx");
        }

        private void printList(List<ProductConfiguration> pc)
        {
            status.Style.Add("color", "darkgreen");

            string innerhtml = "";

            for (int i = 0; i < pc.Count; i++)
            {
                innerhtml += i + ". " + pc[i].Config + " - " + pc[i].ConfigurationCategory + " - " + pc[i].DisplayType + "\n";
            }

            status.InnerHtml = innerhtml;
        }
    }
}
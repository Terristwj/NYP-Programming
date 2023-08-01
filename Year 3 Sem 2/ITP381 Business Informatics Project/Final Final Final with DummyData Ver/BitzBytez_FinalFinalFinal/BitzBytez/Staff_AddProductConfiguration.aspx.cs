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
                if (i % 2 == 0)
                {
                    innerhtml += "<strong>" + (i + 1) + "</strong>. " + pc[i].Config + " - " + pc[i].ConfigurationCategory + " - " + pc[i].DisplayType + "<br>";
                } else
                {
                    innerhtml += "<strong>" + (i + 1) + "</strong>. " + pc[i].Config + " - " + pc[i].ConfigurationCategory + " - " + pc[i].DisplayType + "&emsp;";
                }

            }

            status.InnerHtml = innerhtml;
        }

        protected void btn_populateCat1_Click(object sender, EventArgs e)
        {
            ddl_ConfigCategory.SelectedIndex = 2;
            tb_Config.Text = "P1 Mini ATX";
        }

        protected void btn_populateCat2_Click(object sender, EventArgs e)
        {
            ddl_ConfigCategory.SelectedIndex = 2;
            tb_Config.Text = "P3 ATX";
        }

        protected void btn_populateCat3_Click(object sender, EventArgs e)
        {
            ddl_ConfigCategory.SelectedIndex = 2;
            tb_Config.Text = "Core P5 TG";
        }

        protected void btn_populateCat4_Click(object sender, EventArgs e)
        {
            ddl_ConfigCategory.SelectedIndex = 2;
            tb_Config.Text = "Core P7 TG";
        }

        protected void btn_populateCat5_Click(object sender, EventArgs e)
        {
            ddl_ConfigCategory.SelectedIndex = 1;
            tb_Config.Text = "black";
        }

        protected void btn_populateCat6_Click(object sender, EventArgs e)
        {
            ddl_ConfigCategory.SelectedIndex = 1;
            tb_Config.Text = "red";
        }

        protected void btn_populateCat7_Click(object sender, EventArgs e)
        {
            ddl_ConfigCategory.SelectedIndex = 1;
            tb_Config.Text = "white";
        }

        protected void btn_clear_Click(object sender, EventArgs e)
        {
            ddl_ConfigCategory.SelectedIndex = 0;
            tb_Config.Text = "";

            Session["configList"] = new List<ProductConfiguration>();
            status.InnerHtml = "";
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            ProductDA.deleteProduct("Thermaltake Core P1/P3/P5/P7 ATX Tempered Glass Gaming Computer Case Chassis, Open Frame Panoramic Viewing, Glass Wall-Mount, Riser Cable Included");
        }
    }
}
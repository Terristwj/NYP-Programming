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
    public partial class AddProductConfigCombo : System.Web.UI.Page
    {
        List<ProductConfiguration> configList;
        List<ProductConfigCombo> prodcc = new List<ProductConfigCombo>();

        protected void Page_Load(object sender, EventArgs e)
        {
            div_Done.Visible = false;

            if (Session["configList"] != null)
            {
                configList = Session["configList"] as List<ProductConfiguration>;
            }

            if (Session["prodcc"] != null)
            {
                prodcc = Session["prodcc"] as List<ProductConfigCombo>;
            }

            if (!IsPostBack)
            {
                populateDDLs();
            }
        }

        private void populateDDLs()
        {
            ddl_config1.Items.Insert(0, "");
            ddl_config2.Items.Insert(0, "");
            ddl_config3.Items.Insert(0, "");
            ddl_config4.Items.Insert(0, "");

            for (int i = 0; i < configList.Count; i++)
            {
                ddl_config1.Items.Insert((i + 1), configList[i].Config);
                ddl_config2.Items.Insert((i + 1), configList[i].Config);
                ddl_config3.Items.Insert((i + 1), configList[i].Config);
                ddl_config4.Items.Insert((i + 1), configList[i].Config);
            }
        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {
            ProductConfigCombo combo = new ProductConfigCombo(null, null, null, null, 0, 0);

            if (ddl_config1.SelectedValue != "" && int.Parse(tb_quantity.Text) > 0 && double.Parse(tb_price.Text) > 0)
            {
                combo.Config1 = ddl_config1.SelectedValue;
                combo.Quantity = int.Parse(tb_quantity.Text);
                combo.Price = double.Parse(tb_price.Text);
                

                if (ddl_config2.SelectedValue != "")
                {
                    combo.Config2 = ddl_config2.SelectedValue;

                    if (ddl_config3.SelectedValue != "")
                    {
                        combo.Config3 = ddl_config3.SelectedValue;

                        if (ddl_config4.SelectedValue != "")
                        {
                            combo.Config4 = ddl_config4.SelectedValue;
                        }
                    }
                }

                prodcc.Add(combo);
                Session["prodcc"] = prodcc;
                div_Done.Visible = true;

                ddl_config1.SelectedIndex = 0;
                ddl_config2.SelectedIndex = 0;
                ddl_config3.SelectedIndex = 0;
                ddl_config4.SelectedIndex = 0;
                tb_price.Text = "";
                tb_quantity.Text = "";

                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Added! Count: " + prodcc.Count + "');", true);

            } else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please ensure all fields are filled.');", true);
            }
            
        }

        protected void btn_Done_Click(object sender, EventArgs e)
        {
            int newProductID = ProductDA.addProduct(Session["newProduct"] as Product);

            int result = 0;
            int result1 = 0;

            List<ProductConfigCombo> test = Session["prodcc"] as List<ProductConfigCombo>;
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + test.Count + "');", true);

            foreach (ProductConfiguration pc in Session["configList"] as List<ProductConfiguration>)
            {
                result = ProductDA.addProductConfiguration(newProductID, pc);
            }

            if (result > 0)
            {
                foreach (ProductConfigCombo pcc in Session["prodcc"] as List<ProductConfigCombo>)
                {
                    result1 = ProductDA.addProductConfigCombo(newProductID, pcc);
                }
            }

            if (result1 > 0)
            {
                ProductDA.updateProduct_full(newProductID);
            }


            //List<ProductConfigCombo> pccs = Session["prodcc"] as List<ProductConfigCombo>;

            //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + pccs[0].Config1 + ".');", true);

        }
    }
}
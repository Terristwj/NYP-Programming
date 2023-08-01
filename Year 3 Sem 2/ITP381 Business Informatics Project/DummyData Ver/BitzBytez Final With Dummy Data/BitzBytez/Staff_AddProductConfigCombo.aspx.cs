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
                string innerhtml = "";

                for (int i = 0; i < prodcc.Count; i++)
                {
                    innerhtml += (i+1) + ". " + prodcc[i].Config1 + " " + prodcc[i].Config2 + " " + prodcc[i].Config3 + " " + prodcc[i].Config4 + " - Price: " + prodcc[i].Price + ". Quantity: " + prodcc[i].Quantity + "<br>";
                }

                status.InnerHtml = innerhtml;

                Session["prodcc"] = prodcc;
                div_Done.Visible = true;

                ddl_config1.SelectedIndex = 0;
                ddl_config2.SelectedIndex = 0;
                ddl_config3.SelectedIndex = 0;
                ddl_config4.SelectedIndex = 0;
                tb_price.Text = "";
                tb_quantity.Text = "";

                //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Added! Count: " + prodcc.Count + "');", true);

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please ensure all fields are filled.');", true);
            }

        }

        protected void btn_Done_Click(object sender, EventArgs e)
        {
            int newProductID = ProductDA.addProduct(Session["newProduct"] as Product);

            int result = 0;
            int result1 = 0;

            List<ProductConfigCombo> list = Session["prodcc"] as List<ProductConfigCombo>;
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + list.Count + "');", true);

            foreach (ProductConfiguration pc in Session["configList"] as List<ProductConfiguration>)
            {
                result = ProductDA.addProductConfiguration(newProductID, pc);
            }

            if (result > 0)
            {
                foreach (ProductConfigCombo pcc in list)
                {
                    if (ProductDA.addProductConfigCombo(newProductID, pcc) > 0) {
                        result1++;
                    }
                }
            }

            if (result1 == list.Count)
            {
                ProductDA.updateProduct_full(newProductID);
                Session["prodcc"] = null;
                Response.Redirect("Staff_Dashboard.aspx");
            }


            //List<ProductConfigCombo> pccs = Session["prodcc"] as List<ProductConfigCombo>;

            //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + pccs[0].Config1 + ".');", true);

        }

        protected void btn_populateCombo1_Click(object sender, EventArgs e)
        {
            ddl_config1.SelectedIndex = 3;
            ddl_config2.SelectedIndex = 5;
            tb_quantity.Text = "10";
            tb_price.Text = "455.60";
        }

        protected void btn_populateCombo2_Click(object sender, EventArgs e)
        {
            ddl_config1.SelectedIndex = 4;
            ddl_config2.SelectedIndex = 5;
            tb_quantity.Text = "10";
            tb_price.Text = "578";
        }

        protected void btn_populateCombo3_Click(object sender, EventArgs e)
        {
            ddl_config1.SelectedIndex = 2;
            ddl_config2.SelectedIndex = 5;
            tb_quantity.Text = "10";
            tb_price.Text = "340";
        }

        protected void btn_populateCombo4_Click(object sender, EventArgs e)
        {
            ddl_config1.SelectedIndex = 1;
            ddl_config2.SelectedIndex = 5;
            tb_quantity.Text = "10";
            tb_price.Text = "512.90";
        }

        protected void btn_populateCombo5_Click(object sender, EventArgs e)
        {
            ddl_config1.SelectedIndex = 2;
            ddl_config2.SelectedIndex = 7;
            tb_quantity.Text = "10";
            tb_price.Text = "309";
        }

        protected void btn_populateCombo6_Click(object sender, EventArgs e)
        {
            ddl_config1.SelectedIndex = 2;
            ddl_config2.SelectedIndex = 6;
            tb_quantity.Text = "10";
            tb_price.Text = "222.90";
        }

        protected void btn_clear_Click(object sender, EventArgs e)
        {
            tb_price.Text = "";
            tb_quantity.Text = "";

            ddl_config1.SelectedIndex = 0;
            ddl_config2.SelectedIndex = 0;
            ddl_config3.SelectedIndex = 0;
            ddl_config4.SelectedIndex = 0;
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            ProductDA.deleteProduct("Thermaltake Core P1/P3/P5/P7 ATX Tempered Glass Gaming Computer Case Chassis, Open Frame Panoramic Viewing, Glass Wall-Mount, Riser Cable Included");
        }

    }
}
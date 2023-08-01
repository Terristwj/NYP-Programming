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
    public partial class Staff_AddBuiltPCWarrantyInfo : System.Web.UI.Page
    {

        List<ComponentWarrantyDetails> list = new List<ComponentWarrantyDetails>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateDDL();

                ddl_productName.Enabled = false;
                ddl_variation.Enabled = false;
                ddl_warrantyType.Enabled = false;
            }

            if (Session["ComponentWarrantyDetails"] != null)
            {
                list = Session["ComponentWarrantyDetails"] as List<ComponentWarrantyDetails>;
                //if (list.Count > 0)
                //{
                //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "enableBtn()", true);
                //} else
                //{
                //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "disableBtn()", true);
                //}

            }
        }

        private void populateDDL()
        {
            List<string> componentTypes = ProductDA.getComponents();
            List<string> manufacturers = ProductDA.getManufacturers();

            componentTypes.Sort();
            manufacturers.Sort();

            ddl_componentType.Items.Insert(0, "");
            ddl_manufacturer.Items.Insert(0, "");
            ddl_productName.Items.Insert(0, "");
            ddl_variation.Items.Insert(0, "");

            for (int i = 1; i <= componentTypes.Count; i++)
            {
                ddl_componentType.Items.Insert(i, componentTypes[i - 1]);
            }

            for (int i = 1; i <= manufacturers.Count; i++)
            {
                ddl_manufacturer.Items.Insert(i, manufacturers[i - 1]);
            }

        }

        private void populateWarrantyType_and_Names(List<WarrantyInfo> list, List<string> productNames)
        {

            ddl_warrantyType.Items.Clear();
            ddl_productName.Items.Clear();
            ddl_variation.Items.Clear();

            if (list.Count > 0)
            {
                ddl_warrantyType.Items.Insert(0, "");
                for (int i = 0; i < list.Count; i++)
                {
                    ddl_warrantyType.Items.Insert(i + 1, list[i].Manufacturer + " - " + list[i].ProductType + " (" + String.Format("{0:0.0}", list[i].WarrantyPeriod) + " years)");
                }
                ddl_warrantyType.Enabled = true;

            }
            else
            {
                ddl_warrantyType.Items.Clear();
                ddl_warrantyType.Enabled = false;
            }



            if (productNames.Count > 0)
            {
                ddl_productName.Items.Insert(0, "");
                for (int i = 0; i < productNames.Count; i++)
                {
                    ddl_productName.Items.Insert(i + 1, productNames[i]);
                }

                ddl_productName.Enabled = true;
            }
            else
            {
                ddl_productName.Items.Clear();
                ddl_productName.Enabled = false;
            }

        }

        private void populateProductVariations(List<string> productVariations)
        {

            if (productVariations.Count > 0)
            {
                ddl_variation.Items.Clear();

                ddl_variation.Items.Insert(0, "");
                for (int i = 0; i < productVariations.Count; i++)
                {
                    ddl_variation.Items.Insert(i + 1, productVariations[i]);
                }

                ddl_variation.Enabled = true;
            }
            else
            {
                ddl_variation.Items.Clear();
                ddl_variation.Enabled = false;
            }
        }

        protected void ddl_componentType_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_warrantyType.Items.Clear();
            ddl_productName.Items.Clear();

            string selectedManufacturer = ddl_manufacturer.SelectedValue;
            string selectedComponentType = ddl_componentType.SelectedValue;

            if (selectedManufacturer != "" && selectedComponentType != "")
            {
                List<WarrantyInfo> list = ProductDA.getWarrantyInfo(selectedManufacturer, selectedComponentType);
                List<string> names = ProductDA.getAllProductNames(selectedComponentType, selectedManufacturer);

                populateWarrantyType_and_Names(list, names);
            }

        }

        protected void ddl_manufacturer_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_warrantyType.Items.Clear();
            ddl_productName.Items.Clear();

            string selectedManufacturer = ddl_manufacturer.SelectedValue;
            string selectedComponentType = ddl_componentType.SelectedValue;

            if (selectedManufacturer != "" && selectedComponentType != "")
            {
                List<WarrantyInfo> list = ProductDA.getWarrantyInfo(selectedManufacturer, selectedComponentType);
                List<string> names = ProductDA.getAllProductNames(selectedComponentType, selectedManufacturer);

                populateWarrantyType_and_Names(list, names);
            }

        }

        protected void ddl_productName_SelectedIndexChanged(object sender, EventArgs e)
        {
            string prodName = ddl_productName.Text;

            if (ddl_productName.Text != "")
            {

                List<string> variations = ProductDA.getAllProductVariations(prodName);

                if (variations.Count > 0)
                {
                    for (int i = 0; i < variations.Count; i++)
                    {
                        populateProductVariations(variations);
                    }
                }
            }


        }

        protected void gv_Customers_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedRow = gv_Customers.SelectedIndex;
            GridViewRow row = gv_Customers.Rows[selectedRow];

            string customerEmail = gv_Customers.Rows[row.RowIndex].Cells[0].Text;

            selectedCustomer.InnerHtml = "You have selected " + customerEmail + " (" + gv_Customers.SelectedValue.ToString() + ").";
            selectedCustomer.Style.Add("color", "darkgreen");
            selectedCustomer.Style.Add("font-style", "italic");

            Session["selectedCustomer"] = gv_Customers.SelectedValue;
        }

        protected void btn_Search_Click(object sender, EventArgs e)
        {
            if (tb_CustomerSearch.Text.Trim() != "")
            {
                string text = tb_CustomerSearch.Text.Trim();

                gv_Customers.DataSource = Account.searchForAccount(text);
                gv_Customers.DataBind();

                Account.closeConnection();
            }
        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {
            string dateBuilt = tb_dateBuilt.Text;
            string component = ddl_componentType.SelectedValue;
            string manufacturer = ddl_manufacturer.SelectedValue;
            string product = ddl_productName.SelectedValue;
            string variation = ddl_variation.SelectedValue;
            int warrantyInfoID = ProductDA.getWarrantyInfoID(ddl_warrantyType.SelectedValue);
            string serialNo = tb_serialNo.Text;
            string regDate = dp_regDate.Text;

            if (dateBuilt != "" &&
                component != "" &&
                manufacturer != "" &&
                product != "" &&
                variation != "" &&
                warrantyInfoID > 0 &&
                serialNo != "" &&
                regDate != "")
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Input all valid')", true);
                int i = 0;
                foreach (ComponentWarrantyDetails cwd in list)
                {
                    if (cwd.Component == component)
                    {
                        i++;
                    }
                }

                if (i == 0)
                {
                    list.Add(new ComponentWarrantyDetails(
                                        dateBuilt,
                                        component,
                                        manufacturer,
                                        product,
                                        variation,
                                        warrantyInfoID,
                                        ddl_warrantyType.SelectedValue,
                                        serialNo,
                                        regDate
                                    ));
                }
                else
                {
                    result.InnerHtml = component + " can only be added once.";
                    result.Style.Add("color", "red");
                }
                
                Session["ComponentWarrantyDetails"] = list;
                gv_addedWarrantyDetails.Visible = true;
                gv_addedWarrantyDetails.DataSource = list;
                gv_addedWarrantyDetails.DataBind();

            }
        }

        protected void gv_addedWarrantyDetails_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gv_addedWarrantyDetails.SelectedRow;
            string a = gv_addedWarrantyDetails.Rows[row.RowIndex].Cells[0].Text;
            result.InnerHtml = a;
        }

        protected void gv_addedWarrantyDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)gv_addedWarrantyDetails.Rows[e.RowIndex];
            string component = gv_addedWarrantyDetails.Rows[row.RowIndex].Cells[0].Text;

            removeComponentAndItsWarranty(component);

        }

        protected void bindGv_addedWarrantyDetails()
        {
            if (Session["ComponentWarrantyDetails"] != null)
            {
                list = Session["ComponentWarrantyDetails"] as List<ComponentWarrantyDetails>;

                if (list != null)
                {
                    gv_addedWarrantyDetails.DataSource = list;
                    gv_addedWarrantyDetails.DataBind();
                    updatePanel.Update();
                }
            }
        }

        private void removeComponentAndItsWarranty(string component)
        {
            foreach (ComponentWarrantyDetails cwd in list.ToList())
            {
                if (cwd.Component == component)
                {
                    list.Remove(cwd);

                    if (list.Count > 0)
                    {
                        Session["ComponentWarrantyDetails"] = list;
                        gv_addedWarrantyDetails.Visible = true;
                        bindGv_addedWarrantyDetails();
                    } else
                    {
                        Session["ComponentWarrantyDetails"] = null;
                        gv_addedWarrantyDetails.Visible = false;
                    }
                }
            }
        }

        protected void btn_Done_Click(object sender, EventArgs e)
        {
            list = Session["ComponentWarrantyDetails"] as List<ComponentWarrantyDetails>;
            result.InnerHtml = "";
            int itemsAdded = 0;
            if (list.Count > 0)
            {
                if (tb_dateBuilt.Text != "")
                {
                    int customerID = Convert.ToInt32(Session["selectedCustomer"]);
                    int newID = ProductDA.createNewBTOPC(customerID, tb_dateBuilt.Text);

                    if (newID > 0)
                    {
                        foreach (ComponentWarrantyDetails cwd in list)
                        {
                            if (ProductDA.insertIndividualComponentWarranty(newID, cwd.Product + " - " + cwd.Variation, cwd.RegisterDate, cwd.SerialNumber, cwd.WarrantyInfoID) > 0)
                            {
                                result.Style.Add("color", "darkgreen");
                                result.InnerHtml += "Added warranty details for " + cwd.Product + " - " + cwd.Variation + "<br>";
                                itemsAdded++;
                            }
                        }

                        if (itemsAdded == list.Count)
                        {
                            Session["ComponentWarrantyDetails"] = null;
                            Response.Redirect("Staff_Dashboard.aspx");
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Information added!')", true);
                    }
                }
            }
        }
    }
}